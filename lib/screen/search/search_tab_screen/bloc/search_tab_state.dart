import '../../../../model/service_model.dart';

class SearchTabState {}

class InitialState extends SearchTabState {}

class LoadingState extends SearchTabState {}

class DataEmptyState extends SearchTabState {}

class LoadSuccessState extends SearchTabState {
  final ServiceModel serviceModel;

  LoadSuccessState(this.serviceModel);
}

class LoadFailState extends SearchTabState {
  final String error;
  // dynamic data;
  final ServiceModel? data;
  LoadFailState({
    this.data,
    required this.error,
  });
}

class LoadFail2 extends SearchTabState {
  final String error;

  LoadFail2({
    required this.error,
  });
}

class LoadFail3 extends SearchTabState {
  final String error;

  LoadFail3({
    required this.error,
  });
}

class LoadFail4 extends SearchTabState {
  final String error;

  LoadFail4({
    required this.error,
  });
}

class LoadMore extends SearchTabState {}

class LoadMoreSucces extends SearchTabState {}
