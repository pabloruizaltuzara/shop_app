import 'package:teslo_shop/features/products/domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<Product> createupdateProduct(Map<String, dynamic> productLike) {
    return datasource.createupdateProduct(productLike);
  }

  @override
  Future<Product> getProductById(String id) {
    return datasource.getProductById(id);
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    return datasource.getProductsByPage(limit:  limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProdductByTerm(String term) {
    return datasource.searchProdductByTerm(term);
  }
  
}
