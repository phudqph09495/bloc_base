abstract class EventBloc {}

class LoadMoreEvent extends EventBloc {
  String id;
  int limit, page;
  bool cleanList, loadMore;
  String? sort;

  LoadMoreEvent({
    this.id = '',
    this.cleanList = false,
    this.limit = 0,
    this.page = 1,
    this.loadMore = false,
    this.sort,
  });
}

class GetData extends EventBloc {
  int limit, page;
  bool cleanList, loadMore;
  String param;
  String type;
  String year;
  String month;

  GetData({
    this.cleanList = false,
    this.limit = 20,
    this.page = 1,
    this.loadMore = false,
    this.param = '',
    this.type = '',
    this.year = '',
    this.month = '',
  });
}

class LoginApp extends EventBloc {
  String id;
  String password;

  LoginApp({
    required this.id,
    required this.password,
  });
}
