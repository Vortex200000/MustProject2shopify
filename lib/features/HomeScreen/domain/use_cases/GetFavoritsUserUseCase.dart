import 'package:dartz/dartz.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/repositories/HomeRepo.dart';

import '../../data/models/GetWishLIstModel.dart';

class GetFavoritsUseCase {

HomeRepo homeRepo;


GetFavoritsUseCase(this.homeRepo);

Future<Either<Failures , GetWishLIstModel>>Call()=>homeRepo.getWish();

}