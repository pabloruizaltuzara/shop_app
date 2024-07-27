


import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_shop/features/products/domain/entities/product.dart';

class ProductMapper{

  static jsonToEntity(Map<String, dynamic> json)=>Product(
    id: json['id'] ,
    title: json['title'], 
    price: double.parse(json['price'].toString()),
    description: json['description'], 
    slug: json['slug'], 
    stock:json['stock'], 
    sizes: List<String>.from(json['sizes'].map((size)=>size)), 
    gender: json["gender"],
    tags: List<String>.from(json['tags'].map((tag)=>tag)), 
    images: List<String>.from(
      (json['images'] as List).map((image) {
        final imageUrl = image is Map<String, dynamic> ? image['url']?.toString() : image.toString();
        return imageUrl!.startsWith('http')
          ? imageUrl
          : '${Environment.apiUrl}/files/product/$imageUrl';
      })
    ),

    user: UserMapper.userJsonToEntity(json['user'])
  );

}

