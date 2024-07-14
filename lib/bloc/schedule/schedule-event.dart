abstract class ScheduleEvent {}

class SaveScheduleEvent extends ScheduleEvent {
  final String title;
  final String descriptions;

  SaveScheduleEvent({required this.title, required this.descriptions});
}

class SetScheduleEvent extends ScheduleEvent {}

class DeleteScheduleEvent extends ScheduleEvent {
  final int index;

  DeleteScheduleEvent({required this.index});
}
