import 'package:Commerce/src/features/profile/setting/bloc/setting_event.dart';
import 'package:Commerce/src/features/profile/setting/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<TriggerSettingEvent>(_triggerSettings);
  }

  void _triggerSettings(SettingEvent event, Emitter<SettingState> emit) {
    emit(SettingState());
  }
}
