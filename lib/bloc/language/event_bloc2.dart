abstract class EventBloc2 {}

class Language {
  String string1;
  String string2;

  Language({required String code})
      : string1 = code == 'en' ? 'Hello' : 'Chào',
        string2 = code == 'en' ? 'Good night' : 'Ngủ ngon';
}
class getLang extends EventBloc2{

}
class sangE extends EventBloc2{

}
class sangVM extends EventBloc2{

}
