import '../../domain/repository/home_repository.dart';
import '../data_source/data_source_remote/remote_data_source_abstract.dart';

// class HomeRepositoryImpl extends HomeRepository {
//   HomeRepositoryImpl({
//     required this.remoteDataSource,
//   });
//
//   final HomeRemoteDataSource remoteDataSource;
//
//   @override
//   Future<Either<Failure, List<CurrencyEntity>>> fetchCurrency() async {
//     try {
//       final response = await remoteDataSource.fetchCurrency();
//       return Right(
//         response.map((e) => e.toEntity()).toList(),
//       );
//     } on Exception catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }
// }