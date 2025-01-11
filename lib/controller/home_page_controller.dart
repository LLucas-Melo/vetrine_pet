import 'package:flutter/widgets.dart';

import '../data/request_simulation.dart';

import '../view/states/home_state.dart';

class HomePageController extends ValueNotifier<HomeState> {
  HomePageController() : super(HomeStateInitial());

  getProducts() async {
    value = HomeStateLoading();
    final result = await getProdutos();
    value = HomeStateSuccess(products: result);
  }
}
