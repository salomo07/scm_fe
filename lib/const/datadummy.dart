
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
    "idMenu": "000",
    "label": "Home",
    "iconCode":"home",
    "path": "/home",
  },
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
    "idMenu": "003",
    "label": "Contact",
    "iconCode":"contact",
    "path": "/home/contact",
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

var dataDetailProducts={
    "nama":"Asgaard sofa",
    "harga":"250,000.00",
    "rating":4,
    "review_count":5,
    "desc":"Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound.",
    "colors":["816DFA","000000","B88E2F"],
    "sku":"SS001",
    "size":["L","XL","XS"],
    "category":"Sofas",
    "images":[
      "/furniro/images/products/detail.png",
      "/furniro/images/products/detail2.png",
      "/furniro/images/products/mini3.png",
      "/furniro/images/products/detail.png"
    ],
    "tags":"Sofa, Chair, Home, Shop",
    "desc2":"Embodying the raw, wayward spirit of rock ‘n’ roll, the Kilburn portable active stereo speaker takes the unmistakable look and sound of Marshall, unplugs the chords, and takes the show on the road.\n\nWeighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound that is both articulate and pronounced. The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel.",
    "addInfo":"Embodying the raw, wayward spirit of rock ‘n’ roll, the Kilburn portable active stereo speaker takes the unmistakable look and sound of Marshall, unplugs the chords, and takes the show on the road.",
    "review":["Weighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound that is both articulate and pronounced. The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel."]
  };
  
Map<String, IconData> iconMap = {
  'home': Icons.dashboard,
  'dashboard': Icons.dashboard,
  'shop': Icons.shopify,
  'about': Icons.info_outline,
  'contact': Icons.perm_contact_cal,
  'transaction': Icons.attach_money_outlined,
  'settings': Icons.settings,
  'administrator': Icons.supervisor_account,
};