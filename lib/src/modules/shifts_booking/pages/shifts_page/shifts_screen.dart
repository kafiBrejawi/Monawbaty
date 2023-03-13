import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monawpaty/src/models/user.dart';

import '../../../../shared/styles/colors.dart';

class ShiftsScreen extends StatelessWidget {
  ShiftsScreen({super.key});

  List<String> tableShifts = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " "
  ];

  List<User> shiftsList = [];
  String? choice;
  String? selectedWeek;
  String? selectedTimeShift;
  String selectedDay = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 0.5 * size.height,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ChoiceChip(
                              label: const Text('إسعاف',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              selected: choice == 'اسعاف',
                              onSelected: (bool selected) async {},
                              selectedColor: primaryColor,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)))),
                      Expanded(
                          child: ChoiceChip(
                              label: const Text('عمليات',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              selected: choice == 'عمليات',
                              onSelected: (bool selected) async {},
                              selectedColor: primaryColor,
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0))))
                    ]),
                Container(
                    height: 6 * size.height,
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 15, right: 15),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                      isExpanded: true,
                      hint: const Text("اختر الأسبوع"),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      iconEnabledColor: primaryColor,
                      icon: const Icon(Icons.arrow_drop_down_circle),
                      items: [
                        'الأسبوع الأول',
                        'الأسبوع الثاني',
                        'الأسبوع الثالث',
                        'الأسبوع الرابع',
                        'الأسبوع الخامس',
                      ]
                          .map((v) => DropdownMenuItem(
                                value: v,
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      v,
                                      textAlign: TextAlign.center,
                                    )),
                              ))
                          .toList(),
                      onChanged: (val) async {},
                      value: selectedWeek,
                    ))),
                Container(
                    width: size.width,
                    margin: const EdgeInsets.all(5),
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const {
                        0: FractionColumnWidth(0.15),
                        1: FractionColumnWidth(0.283),
                        2: FractionColumnWidth(0.283),
                        3: FractionColumnWidth(0.283),
                      },
                      children: <TableRow>[
                        headerTableRow(),
                        tableRow(tableShifts[0], tableShifts[1], tableShifts[2],
                            tableShifts[3]),
                        tableRow(tableShifts[4], tableShifts[5], tableShifts[6],
                            tableShifts[7]),
                        tableRow(tableShifts[8], tableShifts[9],
                            tableShifts[10], tableShifts[11]),
                        tableRow(tableShifts[12], tableShifts[13],
                            tableShifts[14], tableShifts[15]),
                        tableRow(tableShifts[16], tableShifts[17],
                            tableShifts[18], tableShifts[19]),
                        tableRow(tableShifts[20], tableShifts[21],
                            tableShifts[22], tableShifts[23]),
                        tableRow(tableShifts[24], tableShifts[25],
                            tableShifts[26], tableShifts[27])
                      ],
                    )),
                SizedBox(
                  height: 0.25 * size.height,
                ),
                Row(children: [
                  IconButton(
                      icon: const Icon(FontAwesomeIcons.calendarDays),
                      color: Colors.grey,
                      iconSize: 37,
                      onPressed: () async {}),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: primaryColor, spreadRadius: 2),
                      ],
                    ),
                    height: 34,
                    width: 40,
                    child: Center(
                      child: Text(
                        selectedDay,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                      height: 40,
                      width: 125,
                      padding: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: primaryColor,
                              width: 2,
                              style: BorderStyle.solid)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          iconEnabledColor: Colors.black54,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          isExpanded: true,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          hint: const Text(
                            "اختر الفترة",
                            style: TextStyle(color: Colors.black),
                          ),
                          items: [
                            'الفترة الأولى',
                            'الفترة الثانية',
                            'الفترة الثالثة',
                          ]
                              .map((v) => DropdownMenuItem(
                                    value: v,
                                    child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          v,
                                          textAlign: TextAlign.center,
                                        )),
                                  ))
                              .toList(),
                          onChanged: (val) {},
                          value: selectedTimeShift,
                        ),
                      )),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>((_) {
                              return const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)));
                            }),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(80, 40),
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () {},
                          child: const Text('إضـافـة',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )),
                  )
                ]),
              ])),
        ));
  }
}

TableRow headerTableRow() {
  return const TableRow(children: <Widget>[
    Padding(
        padding: EdgeInsets.all(3),
        child: Text("التاريخ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ))),
    Padding(
        padding: EdgeInsets.all(3),
        child: Text("الفترة الأولى",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ))),
    Padding(
        padding: EdgeInsets.all(3),
        child: Text("الفترة الثانية",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ))),
    Padding(
        padding: EdgeInsets.all(3),
        child: Text("الفترة الثالثة",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ))),
  ]);
}

TableRow tableRow(String first, String second, String third, String forth) {
  Color getColor(String type) {
    if (type == "متاح") {
      return Colors.green;
    } else if (type == "حجزته مسبقا") {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  return TableRow(children: <Widget>[
    Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(first,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ))),
    Padding(
        padding: const EdgeInsets.all(3),
        child: Text(second,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: getColor(second),
            ))),
    Padding(
        padding: const EdgeInsets.all(3),
        child: Text(third,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: getColor(third),
            ))),
    Padding(
        padding: const EdgeInsets.all(3),
        child: Text(forth,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: getColor(forth),
            ))),
  ]);
}
