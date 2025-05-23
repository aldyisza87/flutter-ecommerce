import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/common/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ecommerce/data/models/responses/list_product_response_model.dart';

class ProductRemoteDatasource {
  // Left = error  Right = success
  Future<Either<String, ListProductResponseModel>> getAllProduct() async {
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/products'),
    );

    if (response.statusCode == 200) {
      return Right(ListProductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('Proses gagal');
    }
  }
}
