import '../../models/produto.dart';

abstract class FavoriteState {}

class FavoriteStateInitial extends FavoriteState {}

class FavoriteStateSuccess extends FavoriteState {
  final List<Produto> products;
  FavoriteStateSuccess({
    required this.products,
  });
}

class FavoriteStateError extends FavoriteState {
  final String message;
  FavoriteStateError({
    required this.message,
  });
}

class FavoriteStateLoading extends FavoriteState {}

class FavoriteStateEmpty extends FavoriteState {}
