abstract class SearchTabEvent {}

class LoadMoreEvent extends SearchTabEvent {
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

class GetDataSearchTabEvent extends SearchTabEvent {}

class LoginApp extends SearchTabEvent {
  String id;
  String password;

  LoginApp({
    required this.id,
    required this.password,
  });
}
