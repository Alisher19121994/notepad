import 'package:notepad/features/home/data/data_source/data_source_remote/remote_data_source_abstract.dart';
import 'package:notepad/features/home/data/global_models/models/notes.dart';

import '../../../../../core/error/exceptions.dart';

class HomeRemoteDataSourceImplement extends HomeRemoteDataSource{
  @override
  Future<List<Notes>> fetchCurrency() {
    // TODO: implement fetchCurrency
    throw UnimplementedError();
  }

 //const HomeRemoteDataSourceImplement(this.dio);

// final Dio dio;
//
// @override
// Future<List<Notes>?> fetchCurrency()async{
//   try{
//     final _response = await dio.get('https// ........');
//     if(_response.statuscode == 200 || _response.statuscode == 201){
//       final List json = _response.data as List;
//       return null;
//       //return json.map((e) => Notes.fromJson(e)).toList();
//     }else{
//       throw ServerException.fromJson(_response.data);
//     }
//   }on DioException catch(e){
//     throw ServerException.fromJson(e.response.data);
//   }on FormatException{
//     throw const ServerException(message: 'ERROR');
//   }
// }


}