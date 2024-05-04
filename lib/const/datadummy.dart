
import 'package:flutter/material.dart';
var dataRole=[
  {
    "_id":"qweqweqwe",
    "name":"Admin Gudang",
    "code":"ADG",
    "desc":"Ini penjelasan dari Role, bisa dijelaskan access apa saja yang boleh"
  }
];
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
        "path": "/administrator/role",
      },
      {
        "idMenu": "submenu005",
        "label": "Administrator User",
        "iconCode":"administrator",
        "path": "/administrator/user",
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