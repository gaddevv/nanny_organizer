import 'package:flutter/material.dart';

abstract class ScheduleEvent {}

class SaveScheduleEvent extends ScheduleEvent {
  final int number;
  final Function()? addCard;
  final Function()? openTimer;
  TextEditingController? controller;
  final Function(String)? onChangedTime;
  final Function(String)? onChangedName;
  final Function(String)? onChangedDiscription;

  SaveScheduleEvent(
    this.number,
    this.addCard,
    this.openTimer,
    this.onChangedTime,
    this.onChangedName,
    this.onChangedDiscription,
  );
}

class SetScheduleEvent extends ScheduleEvent {}

class DeleteScheduleEvent extends ScheduleEvent {
  final int index;

  DeleteScheduleEvent({required this.index});
}
