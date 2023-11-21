import '../repository/home_repository.dart';
/*
* api dan kelayotgan datalar boycha malum bir logikalarni yozb iwlatwmz mn.
* yani datalarni qayta iwlaw qismi
* Right -> success qism
* Left -> error qism
*
* */
// class CurrencyUseCase extends UseCase<List<CurrencyEntity>, CurrencyParams> {
//   CurrencyUseCase(this.repository);
//
//   final HomeRepository repository;
//
//   @override
//   Future<Either<Failure, List<CurrencyEntity>>> call(CurrencyParams params) async {
//     final List<CurrencyEntity> sortedList = [];
//     final response = await repository.fetchCurrency();
//     for (final item in response.right) {
//       if (item.nbuCellPrice.isNotEmpty && item.nbuBuyPrice.isNotEmpty) {
//         sortedList.add(item);
//       }
//     }
//     return Right(sortedList);
//   }
// }
//
// class CurrencyPa rams {}