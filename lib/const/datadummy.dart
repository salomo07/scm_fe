
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
    "label": "Shop",
    "iconCode":"shop",
    "path": "/home/shop",
  },
  {
    "idMenu": "002",
    "label": "About",
    "iconCode":"about",
    "path": "/home/about",
  },
  {
    "idMenu": "005",
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
    "idMenu": "006",
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
  'shop': Icons.shopify,
  'about': Icons.info_outline,
  'transaction': Icons.attach_money_outlined,
  'settings': Icons.settings,
  'administrator': Icons.supervisor_account,
};