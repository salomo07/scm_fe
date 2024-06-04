import 'package:flutter/material.dart';

const String keyToken = 'keyToken';
const String appName="Kuncir App";
const String errorRequiredMessage = "Silahkan isi kolom ini...";
var initialDate = DateTime.now().subtract(const Duration(days: 60 * 365));
var maximumDate = DateTime.now().subtract(const Duration(days: 12 * 365));
bool isMobile(width)=> width< 850; 
bool isTablet(width)=> width < 1100 && width>= 850;
bool isDesktop(width)=> width>= 1200; 
DateTime dateTimeNow = DateTime.now();

int getMonth(String value) {
  switch (value) {
    case "JANUARI":
      return 1;
    case "FEBRUARI":
      return 2;
    case "MARET":
      return 3;
    case "APRIL":
      return 4;
    case "MEI":
      return 5;
    case "JUNI":
      return 6;
    case "JULI":
      return 7;
    case "AGUSTUS":
      return 8;
    case "SEPTEMBER":
      return 9;
    case "OKTOBER":
      return 10;
    case "NOVEMBER":
      return 11;
    case "DESEMBER":
      return 12;
    default:
      return 1;
  }
}
var dataMenu=[
  {
    "idMenu": "001",
    "label": "Master",
    "iconCode":"master",
    "subMenu": [
      {
        "idMenu": "submenu001",
        "label": "Master Rack",
        "path": "/home/masterrack"
      },
      {
        "idMenu": "submenu002",
        "label": "Master User",
        "path": "/home/masteruser"
      }
    ]
  },
  {
    "idMenu": "002",
    "label": "Transaksi",
    "iconCode":"transaction",
    "subMenu": [
      {
        "idMenu": "submenu003",
        "label": "Transaksi Masuk",
        "path": "/home/www"
      }
    ]
  },
  {
    "idMenu": "003",
    "label": "Setting",
    "iconCode":"settings",
    "path": "/home/settings",
  },
  {
    "idMenu": "007",
    "label": "Administrator",
    "iconCode":"administrator",
    "subMenu": [
      {
        "idMenu": "submenu004",
        "label": "Administrator Role",
        "iconCode":"administrator",
        "path": "/home/administrator/role",
      },
      {
        "idMenu": "submenu005",
        "label": "Administrator User",
        "iconCode":"administrator",
        "path": "/home/administrator/user",
      }
    ],
  }
];

Map<String, IconData> iconMap = {
  'dashboard': Icons.dashboard,
  'master': Icons.storage,
  'transaction': Icons.attach_money_outlined,
  'settings': Icons.settings,
  'administrator': Icons.supervisor_account,
};

