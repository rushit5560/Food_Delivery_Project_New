import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/controllers/delivery_option_screen_controller/delivery_option_screen_controller.dart';
import 'package:food_delivery/screens/payment_option_screen/payment_option_screen.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class DeliveryAddressDetails extends StatelessWidget {
  const DeliveryAddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery',
            textScaleFactor: 1.5,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address Details',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Change',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [

                  Container(
                    height: Get.height * 0.08,
                    width: Get.height * 0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 3
                      ),
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 45,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry 123456',
                            textScaleFactor: 0.9,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Lorem Ipsum is (123456)',
                            textScaleFactor: 0.9,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTimeModule extends StatelessWidget {
  DeliveryOptionScreenController deliveryOptionScreenController = Get.find<DeliveryOptionScreenController>();
  // SelectTimeModule({required this.deliveryOptionScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: deliveryOptionScreenController.timeList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 10/9
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(()=> PaymentOptionScreen());
            },
            child: Container(
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 15,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 85,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 15,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 85,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${deliveryOptionScreenController.timeList[index]}',
                                        textScaleFactor: 0.9,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Free',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.colorDarkPink,
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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