import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../salon_screen/cubit/cubit.dart';
import '../salon_screen/cubit/state.dart';
import 'widget/booking.dart';
import 'widget/booking_card.dart';
import 'widget/booking_hour.dart';
class BookScreen extends StatelessWidget {
  const BookScreen({super.key,required this.idService,required this.idShop});
  final String ? idShop;
  final String ? idService;
  @override
  Widget build(BuildContext context) {
    SalonCubit cubit=SalonCubit.get(context);
    cubit.bookingCubit(idShop!, idService!);
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<SalonCubit,SalonManeState>(
    builder: (context,state) {
      return state is EmptyStatusState || cubit.bookList.isEmpty ? const Center(child: CircularProgressIndicator(),) : Padding(
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
                   BookingHour(list: cubit.bookList[0]["time"]),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey.shade300,
                      height: 10,
                    ),
                  ),
                  BookingCard(mapCard: cubit.bookList[0]),
                   Booking(map:cubit.bookList[0]),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
