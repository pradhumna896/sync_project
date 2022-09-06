import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/custom_button.dart';
// import '../../../Dawners/lib/helper/custom_text.dart';
import '../components/custom_text.dart';
import '../helper/constants.dart';
import '../provider/app_controller.dart';

class CustomTableCalender extends StatefulWidget {
  const CustomTableCalender({Key? key}) : super(key: key);

  @override
  State<CustomTableCalender> createState() => _CustomTableCalenderState();
}

class _CustomTableCalenderState extends State<CustomTableCalender> {
  var chosenDate = DateTime.now();
  var focusedYear = DateTime.now();

  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(56),
          CustomText(
              title: "Birthday",
              fontWeight: FontWeight.w400,
              color: kBlackColor,
              fontSize: 14),
          TableCalendar(
            // calendarFormat: _calendarFormat,
            // onFormatChanged: (format) {
            //   setState(() {
            //     _calendarFormat = format;
            //   });
            // },

            onDaySelected: (
              date,
              events,
            ) {
              provider.chosenDate = date;
              selectedDate = DateFormat('dd-MM-yyyy').format(date);

              provider.setDOB(selectedDate!);

              setState(() {
                chosenDate = date;
              });
            },
            calendarStyle: const CalendarStyle(
                todayDecoration:
                    BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                  color: kPrimaryColor,
                )),
            calendarFormat: CalendarFormat.month,
            daysOfWeekVisible: false,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.now(),
            currentDay: chosenDate,
          ),
          Gap(30),
          CustomButton(
              title: "Save",
              onclick: () {
                bool age = isAdult2(selectedDate!);
                print(age);
                Navigator.pop(context);
              }),
          Gap(30),
        ],
      ),
    );
  }

  bool isAdult2(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }
}
