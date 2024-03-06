import 'package:repo_up/app/data/model/api_response/api_response.dart';
import 'package:repo_up/app/data/model/product/product.dart';
import 'package:repo_up/app/services/api_service.dart';

typedef ProductListResponse = ApiResponse<List<Product>>;
typedef JsonResponse = ApiResponse<dynamic>;

class ProductRepository {
  final ApiService _api;

  ProductRepository(this._api);

  Future<ProductListResponse> getProducts() async {
    JsonResponse data = await _api.get('products');

    return data.when(
        loading: () => ProductListResponse.loading(),
        success: (jsonData) {
          print('SUCCESS');
          print(jsonData);
          var productsJson = jsonData['products'] as List<dynamic>;
          var products =
              productsJson.map((json) => Product.fromJson(json)).toList();
          return ProductListResponse.success(products);
        },
        failed: (e, o) => ProductListResponse.failed(e, o));
  }
}
