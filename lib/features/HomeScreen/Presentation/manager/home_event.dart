part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetAllCategoryEvent extends HomeEvent{}

class GetAllProductsEvent extends HomeEvent{}

class AddToCartEvent extends HomeEvent{}

class SignOutEvent extends HomeEvent{}

class GetCartProdEvent extends HomeEvent{}

class RemoveItemEvent extends HomeEvent{}
class AddToWishListEvent extends HomeEvent{}
class GetWishEvent extends HomeEvent{}
class ChangeBellevent extends HomeEvent{}




