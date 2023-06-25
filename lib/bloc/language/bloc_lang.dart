import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../state_bloc.dart';
import 'event_bloc2.dart';

class BlocLanguage extends Bloc<EventBloc2, StateBloc> {
  BlocLanguage() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc2 event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String type = prefs.getString('code') ?? 'vi';
    if (event is GetLanguage) {
      Language language = Language(code: type);
      yield LoadSuccess(data: language);
    }
    if (event is ConvertToEngEvent) {
      type = 'en';
      prefs.setString('code', 'en');
      yield LoadSuccess();
    }
    if (event is ConvertToVNEvent) {
      type = 'vi';
      prefs.setString('code', 'vi');
      yield LoadSuccess();
    }
  }
}
