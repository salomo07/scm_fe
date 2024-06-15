import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';


class CustomPlutoGrid extends StatelessWidget {
  const CustomPlutoGrid({super.key,this.height=300, required this.onRowChecked, required this.onLoaded,this.data,required this.listRow,required this.listColumn});
  final void Function(PlutoGridOnRowCheckedEvent event) onRowChecked;
  final void Function(PlutoGridOnLoadedEvent event) onLoaded;
  // ignore: prefer_typing_uninitialized_variables
  final data;
  final dynamic listRow;
  final dynamic listColumn;
  final double height;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      child: PlutoGrid(
        columns: listColumn,
        rows:listRow,
        rowColorCallback: (rowColorContext) {
          if (rowColorContext.rowIdx % 2 != 0) {
            return Colors.white;
          }
          return const Color.fromARGB(226, 231, 231, 231);
        },
        onRowChecked: onRowChecked,
        onLoaded: onLoaded,
        configuration: const PlutoGridConfiguration(
          scrollbar: PlutoGridScrollbarConfig(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.invertedStylus,
              PointerDeviceKind.unknown,
            },
          ),
          columnSize: PlutoGridColumnSizeConfig(
            autoSizeMode: PlutoAutoSizeMode.scale,
          )
        )
      ),
    );
  }
  
}