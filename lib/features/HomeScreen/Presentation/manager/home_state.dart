part of 'home_bloc.dart';

enum HomeScreenState {
  Init,
  loading,
  GetCatError,
  GetCatSucsses,
  GetProductError,
  GetProductSucsses,
  AddCartErr,
  AddCartSucc,
  SignOutErr,
  SignOutSuccsses,
  GetCartErr,
  GetCartSucces,
  RemSucc,
  RemErr,
  addToWishLIstEss,
  addToWishLIstSucc,
  GetWishErr,
  GetWishSucc,
}

@immutable
class HomeState {
  HomeScreenState? homeScreenState;
  Failures? homeFail;
  List<DataEntity>? CatData;
  List<DataProdEntity>? Products;
  DataCart? Cartss;
  CartData? CarProd;
  List<DataWish>? wish;


  HomeState(
      {this.homeScreenState,
      this.homeFail,
      this.CatData,
      this.Products,
      this.Cartss,
      this.CarProd,
      this.wish,
   });

  HomeState CopyWith({
    HomeScreenState? homeScreenStates,
    Failures? HomeFails,
    List<DataEntity>? CatDatas,
    List<DataProdEntity>? Productss,
    DataCart? Cartsss,
    CartData? CartProdd,
    List<DataWish>? WishLis,

  }) {
    return HomeState(
      homeScreenState: homeScreenStates ?? homeScreenState,
      CatData: CatDatas ?? CatData,
      homeFail: HomeFails ?? homeFail,
      Products: Productss ?? Products,
      Cartss: Cartsss ?? Cartss,
      CarProd: CartProdd ?? CarProd,
      wish: WishLis ?? wish,

    );
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenState: HomeScreenState.Init);
}
