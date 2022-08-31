import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/custom_button.dart';
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

            onDaySelected: (
                date,
                events,
                ) {
              provider.chosenDate = date;
              provider.setDOB(DateFormat('yyyy-MM-dd').format(date));
                setState(() {
                chosenDate = date;

                var birthDate = DateFormat('yyyy-MM-dd').format(date);

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
            focusedDay: chosenDate,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            currentDay: chosenDate,
          ),
          Gap(30),
          CustomButton(
              title: "Save",
              onclick: () {
                Navigator.pop(context);
              }),
          Gap(30),
        ],
      ),
    );
  }
}