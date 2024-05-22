import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../salon_screen/cubit/cubit.dart';
import '../salon_screen/cubit/state.dart';
import 'widget/booking.dart';
import 'widget/booking_card.dart';
import 'widget/booking_hour.dart';
class BookScreen extends StatelessWidget {
  const BookScreen({super.key,required this.map,required this.idShop,required this.shopName});
  final Map ? map;
  final String ? idShop;
  final String ? shopName;

  @override
  Widget build(BuildContext context) {
    SalonCubit cubit=SalonCubit.get(context);
    cubit.getProfile();
    double height=MediaQuery.of(context).size.height;
    cubit.hoursList(map);
    return Scaffold(
      body: BlocBuilder<SalonCubit,SalonManeState>(
    builder: (context,state) {
      return  Padding(
            padding:  EdgeInsets.only(top: height*.125),
            child: SingleChildScrollView(
              child: Column(
                children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: cubit.date,
                calendarStyle:const CalendarStyle(
                  disabledDecoration: BoxDecoration(
                    color:  Color(0xff00a3ad),
                  ),
                  selectedDecoration:  BoxDecoration(
                    color:  Color(0xff00a3ad),
                    shape: BoxShape.circle,
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(cubit.date, day);
                },
                onDaySelected: (selectedDay, focusedDay){
                    cubit.addDateCubit(selectedDay);
                },
              ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 10,
                    ),
                  ),
                   BookingHour(map: map!),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 10,
                    ),
                  ),
                  BookingCard(mapCard: map!,mapUser: cubit.mapProfile),
                   Booking(map:map!,idShop:idShop!,shopName:shopName),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
