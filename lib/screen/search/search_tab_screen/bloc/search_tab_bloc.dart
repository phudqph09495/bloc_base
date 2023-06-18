import 'dart:convert';

import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_event.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/api.dart';
import '../../../../model/service_model.dart';

class SearchTabBloc extends Bloc<SearchTabEvent, SearchTabState> {
  SearchTabBloc() : super(InitialState());

  @override
  Stream<SearchTabState> mapEventToState(SearchTabEvent event) async* {
    if (event is GetDataSearchTabEvent) {
      try {
        yield LoadingState();
        print(state);
        // Map<String, dynamic> req = {};
        // req['id'] = event.id;
        // req['password'] = event.password;
        //  var res = await Api.postAsync(
        //   endPoint: ApiPath.login,
        //   req: req,
        //   isToken: false,
        // );
        var res = await Api.postAsync(
          endPoint: 'api/nailart/getAll',
          req: {
            "sign": "1626882716.28d5083cef23bf5c8b867d267969e5ad7d720f42",
            "app_id": "vWxXencr53KF2t4YjqWGmRjVd7kP15V2U3SN",
            "page": 1
          },
        );
        print(res['status']);

        if (res['code'] == 200) {
          if (res['data'].isNotEmpty) {
            ServiceModel serviceModel = ServiceModel.fromJson(res);
            yield LoadSuccessState(serviceModel);
          } else {
            yield DataEmptyState();
          }
        } else {
          yield LoadFailState(error: res['errors']['login'] ?? "Lỗi kết nối");
        }
      } on DioError catch (e) {
        yield LoadFailState(error: e.error.error);
      } catch (e) {
        print(e);
        yield LoadFailState(error: e.toString());
      }
    }
  }
}
