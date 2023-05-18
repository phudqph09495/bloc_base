import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../state_bloc.dart';
import 'event_bloc2.dart';

class BlocLang extends Bloc<EventBloc2, StateBloc> {
  BlocLang() : super(StateBloc());

  @override
  Stream<StateBloc> mapEventToState(EventBloc2 event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String type= prefs.getString('code')??'vi';
    if(event is getLang){
      Language language=Language(code: type);
        yield LoadSuccess(
          data: language
        );

    }
    if(event is sangE){
      type='en';
      prefs.setString('code', 'en');
yield LoadSuccess();
    }
    if(event is sangVn){
      type='vi';
      prefs.setString('code', 'vi');
      yield LoadSuccess();
    }
  }
}