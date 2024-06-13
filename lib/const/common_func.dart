import 'dart:convert';

import 'package:hive/hive.dart';

import '../env.dart';

bool isMobile(width)=> width< 850; 
bool isTablet(width)=> width < 1100 && width>= 850;
bool isDesktop(width)=> width>= 1200; 

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
  var storage = Hive.box(storageSCM);
  return storage.get(key);
}
setHive(String key, String? value) {
  var storage = Hive.box(storageSCM);
  return storage.put(key, value);
}
String stringToBase64(data){
  return base64Encode(utf8.encode(data));
}
String base64ToString(encodedData){
  return utf8.decode(base64.decode(encodedData));
}