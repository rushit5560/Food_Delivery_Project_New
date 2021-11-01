import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/delivery_option_screen_controller/delivery_option_screen_controller.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'delivery_option_screen_widgets.dart';

class DeliveryOptionScreen extends StatelessWidget {
  DeliveryOptionScreenController deliveryOptionScreenController
  = Get.put(DeliveryOptionScreenController());
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Delivery Option'),
      body: Column(
        children: [
          DeliveryAddressDetails(),
          TableCalender(),
          Expanded(
              child: SelectTimeModule(deliveryOptionScreenController: deliveryOptionScreenController),
          ),
        ],
      ),
    );
  }

}

class TableCalender extends StatefulWidget {
  // const TableCalender({Key? key}) : super(key: key);
  @override
  _TableCalenderState createState() => _TableCalenderState();
}
class _TableCalenderState extends State<TableCalender> {
  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(2020),
      lastDay: DateTime(2050),
      calendarFormat: format,
      rangeStartDay: DateTime.now(),

      onDaySelected: (DateTime selectDay, DateTime focusDay){
        setState(() {
          selectedDay = selectDay;
          focusedDay = focusDay;
        });
        print('\nselectedDay :: $selectedDay');
        print('focusedDay :: $focusedDay\n');
      },


      // Day Changed
      selectedDayPredicate: (DateTime date){
        return isSameDay(selectedDay, date);
      },
      // Style the Calender
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultTextStyle: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        weekendTextStyle: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        todayTextStyle: TextStyle(color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        defaultDecoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colorLightPink),
        weekendDecoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colorLightPink),
        todayDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
        selectedDecoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.colorDarkPink),
      ),
      // Week Style
      daysOfWeekStyle: DaysOfWeekStyle(
        // dowTextFormatter: (dowTextFormat, dynamic) {
        //   return DateFormat.E(locale).format(dowTextFormat)[0];
        // },
        decoration: BoxDecoration(color: AppColors.colorDarkPink),
        weekdayStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        weekendStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      // Month Style
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true,
      decoration: BoxDecoration(color: AppColors.colorDarkPink),
        titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        leftChevronIcon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        rightChevronIcon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}

