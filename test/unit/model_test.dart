import 'package:flutter_test/flutter_test.dart';
import 'package:productify/data/datasource/remote/model/response/product/product_response.dart';
import 'package:productify/data/datasource/remote/model/response/rating/rating_response.dart';
import 'package:productify/data/mapper/product/product_response_mapper.dart';
import 'package:productify/domain/model/product/product.dart';

void main() {
  group('Product and Rating Model JSON Serialization & Mapping Unit Tests', () {
    test('RatingResponse.fromJson correctly parses json', () {
      final json = {'rate': 4.5, 'count': 120};
      final response = RatingResponse.fromJson(json);

      expect(response.rate, 4.5);
      expect(response.count, 120);
    });

    test('ProductResponse.fromJson correctly parses json', () {
      final json = {
        'id': 1,
        'title': 'Test Product',
        'price': 99.99,
        'description': 'Test Description',
        'category': 'Test Category',
        'image': 'https://example.com/image.png',
        'rating': {'rate': 4.5, 'count': 120},
      };

      final response = ProductResponse.fromJson(json);

      expect(response.id, 1);
      expect(response.title, 'Test Product');
      expect(response.price, 99.99);
      expect(response.description, 'Test Description');
      expect(response.category, 'Test Category');
      expect(response.image, 'https://example.com/image.png');
      expect(response.rating.rate, 4.5);
      expect(response.rating.count, 120);
    });

    test('toDomain() successfully maps response models to domain entities', () {
      const response = ProductResponse(
        id: 1,
        title: 'Test Product',
        price: 99.99,
        description: 'Test Description',
        category: 'Test Category',
        image: 'https://example.com/image.png',
        rating: RatingResponse(rate: 4.5, count: 120),
      );

      final domain = response.toDomain();

      expect(domain, isA<Product>());
      expect(domain.id, 1);
      expect(domain.title, 'Test Product');
      expect(domain.price, 99.99);
      expect(domain.description, 'Test Description');
      expect(domain.category, 'Test Category');
      expect(domain.image, 'https://example.com/image.png');
      expect(domain.rating.rate, 4.5);
      expect(domain.rating.count, 120);
    });
  });
}
