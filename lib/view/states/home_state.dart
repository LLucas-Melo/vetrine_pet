// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../models/produto.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateSuccess extends HomeState {
  final List<Produto> products;
  HomeStateSuccess({
    required this.products,
  });
}

class HomeStateError extends HomeState {
  final String error;
  HomeStateError({
    required this.error,
  });
}

class HomeStateLoading extends HomeState {}
