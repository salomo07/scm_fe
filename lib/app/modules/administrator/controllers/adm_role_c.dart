import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../../const/text_style.dart';

class AdministratorController extends GetxController {

  List<PlutoRow> generateRow(){
    List<PlutoRow> listRow=[];
      // for (int i = 0; i < [].length; i++) {
        listRow.add(
          PlutoRow(
            cells: {
              '_id': PlutoCell(value: '1'),
              'name': PlutoCell(value: ''),
              'code': PlutoCell(value: ''),
              'desc': PlutoCell(value: ''),
            },
          ),
        );
      // }
    return listRow;
  }

  List <PlutoColumn> generateColumn() {
    var listColumn = [
      PlutoColumn(
        minWidth: 50,
        enableContextMenu: false,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        title: '',
        backgroundColor: defaultColor.withOpacity(0.7),
        field: '_id',
        titleTextAlign: PlutoColumnTextAlign.start,
        titleSpan: TextSpan(
          children: [
            WidgetSpan(
              child: Center(child: Text('Id',style: poppinsTextFont.copyWith(color: whiteColor,fontSize: 16)),
              ),
            ),
          ],
        )
      ),
      PlutoColumn(
        minWidth: 50,
        enableContextMenu: false,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        title: '',
        backgroundColor: defaultColor.withOpacity(0.7),
        field: 'name',
        titleTextAlign: PlutoColumnTextAlign.start,
        titleSpan: TextSpan(
          children: [
            WidgetSpan(
              child: Center(child: Text('Name',style: poppinsTextFont.copyWith(color: whiteColor,fontSize: 16))),
            ),
          ],
        )
      ),
      PlutoColumn(
        minWidth: 50,
        enableContextMenu: false,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        title: '',
        backgroundColor: defaultColor.withOpacity(0.7),
        field: 'code',
        titleTextAlign: PlutoColumnTextAlign.start,
        titleSpan: TextSpan(
          children: [
            WidgetSpan(
              child: Center(child: Text('Code',style: poppinsTextFont.copyWith(color: whiteColor,fontSize: 16))),
            ),
          ],
        )
      ),
      PlutoColumn(
        minWidth: 50,
        enableContextMenu: false,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        title: '',
        backgroundColor: defaultColor.withOpacity(0.7),
        field: 'desc',
        titleTextAlign: PlutoColumnTextAlign.start,
        titleSpan: TextSpan(
          children: [
            WidgetSpan(
              child: Center(child: Text('Description',style: poppinsTextFont.copyWith(color: whiteColor,fontSize: 16))),
            ),
          ],
        )
      ),
    ];
    return listColumn;
  }
}
