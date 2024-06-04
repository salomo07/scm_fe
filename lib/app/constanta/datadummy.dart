import 'package:flutter/material.dart';

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