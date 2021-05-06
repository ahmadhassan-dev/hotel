import 'package:flutter/material.dart';
import 'package:hotel/src/widgets/text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart' show DateFormat;

class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  String _selectedDate = '';
  String _dateCount = '';
  String _start = '';
  String _end = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _start =
            DateFormat.yMMMMd('en_US').format(args.value.startDate).toString();
        _end = DateFormat.yMMMMd('en_US')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20,
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Column(
                        children: [
                          new MyText(
                            title: "From",
                            isDull: true,
                            isBold: true,
                          ),
                          new MyText(
                            title: "$_start",
                            isBold: true,
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[300],
                      width: 1,
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Column(
                        children: [
                          new MyText(
                            title: "To",
                            isDull: true,
                            isBold: true,
                          ),
                          new MyText(
                            title: "$_end",
                            isBold: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SfDateRangePicker(
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
              ),
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3))),
              selectionColor: Colors.lightBlue[300],
              selectionShape: DateRangePickerSelectionShape.circle,
              startRangeSelectionColor: Colors.lightBlue[300],
              rangeSelectionColor: Colors.lightBlue[100],
              endRangeSelectionColor: Colors.lightBlue[300],
            ),
            PhysicalModel(
              color: Colors.black,
              elevation: 15,
              shape: BoxShape.circle,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[300],
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        25,
                      ),
                    )),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 30,
                child: Center(
                  child: new Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
