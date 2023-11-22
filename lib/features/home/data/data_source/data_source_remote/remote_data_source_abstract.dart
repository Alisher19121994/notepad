

import 'package:notepad/features/home/data/global_models/models/notes.dart';

abstract class HomeRemoteDataSource{
  const HomeRemoteDataSource();

  //TODO: override qilishga majburlash uchun abstract qilib yozb olinyaptdi bu function

  Future<List<Notes>> fetchCurrency();
}