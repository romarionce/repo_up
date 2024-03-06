// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:repo_up/app/data/repository/product_repository.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository;

  final _products = ProductListResponse.loading().obs;
  HomeController(this._productRepository);

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    _products.value = ProductListResponse.loading();
    _products.value = await _productRepository.getProducts();
  }

  ProductListResponse get products => _products.value;
}
