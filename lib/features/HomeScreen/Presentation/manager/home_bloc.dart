import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/cashe/Shared_Pref.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/data_sources/RemotedDs/RemoteDsImpl.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/data_sources/RemotedDs/RemotedDs.dart';
import 'package:mustproject2shopify2/features/HomeScreen/data/repositories/HomeRepoImpl.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/use_cases/AddProductToWishList.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/use_cases/AddToCartUseCase.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/use_cases/GetCartProductsUseCase.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/use_cases/RemovefROMcART.dart';
import 'package:mustproject2shopify2/features/HomeScreen/domain/use_cases/SignOut_Use_Case.dart';

import '../../data/models/AddToCartModel.dart';

import '../../data/models/GetWishLIstModel.dart';
import '../../domain/entities/CartDataEntity.dart';
import '../../domain/entities/CategoryEntity.dart';

import '../../domain/entities/ProdEntity.dart';
import '../../domain/repositories/HomeRepo.dart';
import '../../domain/use_cases/GetFavoritsUserUseCase.dart';
import '../../domain/use_cases/Get_ALL_PRODUCTS_USE_CASE.dart';
import '../../domain/use_cases/HomeUseCase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  String? id;
  String? idrm;
  String? AddToWId;
  bool? bell;

  static HomeBloc get(context) => BlocProvider.of(context);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllCategoryEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        HomeUseCase homeUseCase = HomeUseCase(homeRepo);

        var res = await homeUseCase.call();
        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetCatError,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetCatSucsses,
                      CatDatas: r.data))
                });
      } else if (event is GetAllProductsEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));
        print(bell);

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        GetAllProductUseCase getAllProductUseCase =
            GetAllProductUseCase(homeRepo);

        var res = await getAllProductUseCase.call();
        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetProductError,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetProductSucsses,
                      Productss: r.data))
                });
      } else if (event is AddToCartEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        AddToCartUseCase addToCartUseCase = AddToCartUseCase(homeRepo);

        var res = await addToCartUseCase.call(id!);

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.AddCartErr,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.AddCartSucc,
                      Cartsss: r.data))
                });
      } else if (event is SignOutEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));
        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        SignOUtUseCase signOUtUseCase = SignOUtUseCase(homeRepo);

        try {
          signOUtUseCase.call();
          emit(state.CopyWith(
              homeScreenStates: HomeScreenState.SignOutSuccsses));
          // print(SharedPreff.sharedPreferences.get("token"));
        } catch (e) {
          emit(state.CopyWith(homeScreenStates: HomeScreenState.SignOutErr));
          throw Exception();
        }
      } else if (event is GetCartProdEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        GetCartProductsUseCase getCartProductsUseCase =
            GetCartProductsUseCase(homeRepo);

        var res = await getCartProductsUseCase.Call();

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetCartErr,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetCartSucces,
                      CartProdd: r.data))
                });
      } else if (event is RemoveItemEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        RemoveFromCartUseCase removeFromCartUseCase =
            RemoveFromCartUseCase(homeRepo);

        var res = await removeFromCartUseCase.call(idrm!);

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.RemErr, HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                    homeScreenStates: HomeScreenState.RemSucc,
                  ))
                });
      } else if (event is AddToWishListEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        AddToWishListUseCase addToWishListUseCase =
            AddToWishListUseCase(homeRepo);

        var res = await addToWishListUseCase.call(AddToWId!);

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.addToWishLIstEss,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                    homeScreenStates: HomeScreenState.addToWishLIstSucc,
                  ))
                });
      } else if (event is GetWishEvent) {
        emit(state.CopyWith(homeScreenStates: HomeScreenState.loading));

        ApiManager apiManager = ApiManager();
        HomeRemoteDs homeRemoteDs = HomeRemoteDsImpl(apiManager);

        HomeRepo homeRepo = HomeRepoImpl(homeRemoteDs);

        GetFavoritsUseCase getFavoritsUseCase = GetFavoritsUseCase(homeRepo);

        var res = await getFavoritsUseCase.Call();

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      homeScreenStates: HomeScreenState.GetWishErr,
                      HomeFails: l))
                },
            (r) => {
                  emit(state.CopyWith(
                    homeScreenStates: HomeScreenState.GetWishSucc,
                    WishLis: r.data,
                  ))
                });
      }
    });
  }
}
