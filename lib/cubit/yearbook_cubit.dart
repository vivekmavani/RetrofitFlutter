import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meta/meta.dart';
import 'package:taskretofitpicsy/cubi.dart';
import 'package:taskretofitpicsy/network/apiservice/api_service.dart';
import 'package:taskretofitpicsy/network/model/allmodel.dart';
part 'yearbook_state.dart';

class YearbookCubit extends Cubit<YearbookState> {
  YearbookCubit() : super(YearbookInitial());

   fetchyearbook() async*{
    ApiService(dio.Dio(), 'http://www.demoaws.picsy.in/api').fetchAlbum().then((bookResponses) {
      emit(YearbookLoading(bookResponses : bookResponses));
    }
    );
  }
}
