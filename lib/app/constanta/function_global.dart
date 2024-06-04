import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:scm_fe/app/constanta/env.dart';
import 'package:scm_fe/app/constanta/text_style.dart';
import 'package:scm_fe/app/routes/pages.dart';
import "package:universal_html/html.dart" as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:intl/intl.dart';
import 'package:cryptography/cryptography.dart';

import 'variable.dart';


getUrlMenu(String menuId) {
  switch (menuId) {
    case "MNU0000":
      return Paths.dashboard;
    case "MNU0008":
      return Paths.profile;
    default:
      return Paths.notfound;
  }
}

getIconMenu(String menuId) {
  switch (menuId) {
    case "MNU0001":
      return Icons.settings_applications;
    case "MNU0006":
      return Icons.menu_book;
    case "MNU0005":
      return Icons.inventory_2;
    case "MNU0004":
      return Icons.leaderboard;
    case "MNU0003":
      return Icons.local_grocery_store;
    case "MNU0002":
      return Icons.query_stats;
    case "MNU0000":
      return Icons.dashboard;
    case "MNU0008":
      return Icons.contacts;
    default:
      return Icons.favorite;
  }
}

final currencyFormatter = NumberFormat("#,##0", "id_ID");
final currencyFormatterDouble = NumberFormat("#,##0.0", "id_ID");

Future<DateTime?> showDatePickerScroll(
    Function(DateTime) onDateTimeChanged, DateTime? initDate) async {
  DateTime startDate = DateTime.now().subtract(const Duration(days: 50 * 365));
  DateTime twelveYearsAgo =
      DateTime.now().subtract(const Duration(days: 12 * 365));
  var datePicked = await DatePicker.showSimpleDatePicker(
    Get.context!,
    initialDate: initDate ?? DateTime.now(),
    firstDate: startDate,
    lastDate: twelveYearsAgo,
    dateFormat: "dd-MMMM-yyyy",
    locale: DateTimePickerLocale.id,
    looping: true,
  );
  onDateTimeChanged(datePicked!);
  return datePicked;
}

configPlutoGrid() => PlutoGridStyleConfig(
      iconColor: defaultColor,
      gridBorderColor: Colors.transparent,
      columnTextStyle: poppinsTextFont.copyWith(
        fontSize: 12,
        color: whiteColor,
        fontWeight: FontWeight.w400,
      ),
      borderColor: Colors.transparent,
      evenRowColor: greyColor,
      oddRowColor: whiteColor,
      gridBackgroundColor: Colors.transparent,
      rowColor: whiteColor,
      cellTextStyle: poppinsTextFont.copyWith(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );

Future<Uint8List> compresImage(Uint8List bytes) async {
  var result = await FlutterImageCompress.compressWithList(
    bytes,
  );

  return result;
}

final moneyFormat = NumberFormat("###,###,###", "id_ID");

void exportToExcelFromJson(String jsonString, String month, String year) {
  try {
    var sheetName = 'LabaRugi ($month-$year)';
    var excel = Excel.createExcel();
    var jsonList = jsonDecode(jsonString) as List<dynamic>;

    Sheet sheetObject = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    // Tambahkan header berdasarkan kunci JSON
    if (jsonList.isNotEmpty) {
      var headers = jsonList.first.keys.toList();
      sheetObject.appendRow(headers);
    }

    // Tambahkan data ke Excel
    for (var json in jsonList) {
      var data = json.values.toList();
      sheetObject.appendRow(data);
    }

    saveExcel(excel.encode()!, sheetName);
  } catch (e) {
    rethrow;
  }
}

Future<void> saveExcel(excelBytes, sheetName) async {
  final blob = html.Blob([excelBytes]);

  // Buat URL objek dari blob
  final url = html.Url.createObjectUrlFromBlob(blob);

  // Buat anchor element untuk mengunduh file
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "$sheetName.xlsx");

  // Klik anchor element untuk mengunduh file
  anchor.click();

  // Hapus URL objek setelah proses selesai
  html.Url.revokeObjectUrl(url);
}




getToken() {
  var storage = Hive.box(storageSCM);
  return storage.get(keyToken);
}
saveToken(String? value) {
  var storage = Hive.box(storageSCM);
  return storage.put(keyToken, value);
}
removeToken() {
  var storagePartner = Hive.box(storageSCM);
  return storagePartner.delete(keyToken);
}
getHive(String key) {
  var storagePartner = Hive.box(storageSCM);
  return storagePartner.get(key);
}

setHive(String key, String? value) {
  var storagePartner = Hive.box(storageSCM);
  return storagePartner.put(key, value);
}

removeHive(String key) {
  var storagePartner = Hive.box(storageSCM);
  return storagePartner.delete(key);
}

Future<String> encryptDataLocal(String plaintext) async {
  final algorithm = AesGcm.with256bits();
  final secretKeyBytes = utf8.encode(encryptKey);
  final secretKey = SecretKey(secretKeyBytes);
  final nonce = algorithm.newNonce();

  final secretBox = await algorithm.encrypt(
    utf8.encode(plaintext),
    secretKey: secretKey,
    nonce: nonce,
  );

  final ciphertextBase64 = base64.encode(secretBox.cipherText);
  final nonceBase64 = base64.encode(nonce);
  final macBase64 = base64.encode(secretBox.mac.bytes);

  final encryptedData = jsonEncode({
    'ciphertext': ciphertextBase64,
    'nonce': nonceBase64,
    'mac': macBase64,
  });

  return encryptedData;
}

Future<String> decryptDataLocal(String encryptedData) async {
  final algorithm = AesGcm.with256bits();
  final secretKeyBytes = utf8.encode(encryptKey);
  final secretKey = SecretKey(secretKeyBytes);

  final Map<String, dynamic> data = jsonDecode(encryptedData);
  final ciphertext = base64.decode(data['ciphertext']);
  final nonce = base64.decode(data['nonce']);
  final mac = base64.decode(data['mac']);

  final secretBox = SecretBox(
    ciphertext,
    nonce: nonce,
    mac: Mac(mac),
  );

  final clearText = await algorithm.decrypt(
    secretBox,
    secretKey: secretKey,
  );

  return utf8.decode(clearText);
}