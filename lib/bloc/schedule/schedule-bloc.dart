import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanny_organizer/database/adapter/hive_adapter.dart';
import 'package:nanny_organizer/bloc/schedule/schedule-event.dart';
import 'package:nanny_organizer/bloc/schedule/schedule-state.dart';
import 'package:nanny_organizer/components/calendar_custom.dart';
import 'package:nanny_organizer/database/database.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  bool isActive = false;
  Color? colorButton = Color.fromRGBO(241, 246, 255, 1);
  Color? colorBorder = Color.fromRGBO(188, 188, 227, 1);
  Color? colorText = Color.fromRGBO(188, 188, 227, 1);
  List<Map<String, dynamic>> card = [
    {
      'number': '',
      'time': '',
      'name': '',
      'discriptions': '',
    }
  ];
  ScheduleBloc() : super(InitialScheduleState()) {}

  _onSave(SaveScheduleEvent event, Emitter emit) {
    card.forEach(
      (element) {
        if (element.entries.every((element) => element.value != '' && element.value != null))
          scheduleBox.add(
            ScheduleDB(
              id: element['number'] - 1,
              time: element['time'],
              name: element['name'],
              discriptions: element['discriptions'],
              dateTime: date,
            ),
          );
      },
    );
    isActive = card.first.entries.every((element) => element.value != '');
    if (colorBorder == card.first.entries.every((element) => element.value != '')) {
      colorBorder = Colors.transparent;
      colorText = Color.fromRGBO(12, 22, 84, 1);
      colorButton = Color.fromRGBO(88, 255, 227, 1);
    }
  }
}
