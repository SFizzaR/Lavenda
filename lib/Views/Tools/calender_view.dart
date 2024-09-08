import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  AnimatedEmojiData currentMood = AnimatedEmojis.smile; // Default mood
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 162, 130, 218), // Start color
              const Color.fromARGB(255, 202, 120, 216), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 300.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.3)),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay; // update the focused day
                  });
                },
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.purpleAccent[200],
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle:
                        TextStyle(color: Colors.white, fontSize: 15.sp),
                    selectedTextStyle:
                        TextStyle(color: Colors.white, fontSize: 15.sp),
                    defaultTextStyle:
                        TextStyle(color: Colors.white, fontSize: 15.sp),
                    outsideTextStyle:
                        TextStyle(color: Colors.white60, fontSize: 15.sp),
                    holidayTextStyle:
                        TextStyle(color: Colors.white70, fontSize: 15.sp),
                    weekendTextStyle:
                        TextStyle(color: Colors.white70, fontSize: 15.sp),
                    weekNumberTextStyle:
                        TextStyle(color: Colors.white, fontSize: 15.sp),
                    rangeEndTextStyle:
                        TextStyle(color: Colors.white54, fontSize: 15.sp),
                    rangeStartTextStyle:
                        TextStyle(color: Colors.white54, fontSize: 15.sp)),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: Colors.white, fontSize: 17.sp, height: 0.001),
                    weekendStyle: TextStyle(
                        color: Colors.white70, fontSize: 17.sp, height: 0.001)),
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) {
                    if (isSameDay(day, DateTime.now())) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                DateFormat.d().format(day),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          AnimatedEmoji(
                            currentMood,
                            size: 20.sp, // Adjust the size as needed
                          ),
                        ],
                      );
                    }
                    return null;
                  },
                ),
              ),
            )));
  }
}
