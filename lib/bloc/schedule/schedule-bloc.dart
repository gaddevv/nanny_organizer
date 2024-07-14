import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanny_organizer/bloc/schedule/schedule-event.dart';
import 'package:nanny_organizer/bloc/schedule/schedule-state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(InitialScheduleState()) {}
}
