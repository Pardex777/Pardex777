import 'package:dio/dio.dart';

class StripeService {
  StripeService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<String> createCheckoutSession({
    required String userId,
    required String email,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/stripe/create-checkout-session',
      data: <String, dynamic>{
        'user_id': userId,
        'email': email,
      },
    );

    return response.data?['checkout_url'] as String;
  }
}
