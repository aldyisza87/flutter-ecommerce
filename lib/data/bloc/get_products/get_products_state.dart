part of 'get_products_bloc.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsLoaded extends GetProductsState {
  ListProductResponseModel data;

  GetProductsLoaded({required this.data});
}

final class GetProductsError extends GetProductsState {}
