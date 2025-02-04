import 'package:cat/core/constant/app_constant.dart';
import 'package:cat/features/cat/data/model/cat_breed_model.dart';
import 'package:cat/features/cat/data/model/cat_image_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<CatBreedModel>> getCatBreeds();
  Future<CatBreedModel> getCatBreedById(String breedId);
  Future<List<CatImageModel>> getCatImages(int limit);
  Future<CatImageModel> getCatImageById(String imageId);
  Future<List<CatImageModel>> getCatImagesByBreed(String breedId, int limit);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<CatBreedModel> getCatBreedById(String breedId) async {
    try {
      final response = await dio.get(
        '${AppConstant.baseUrl}/v1/breeds/$breedId',
        options: Options(
          headers: {
            'x-api-key': AppConstant.apiKey,
          },
        ),
      );
      return CatBreedModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CatBreedModel>> getCatBreeds() async {
    try {
      final response = await dio.get(
        '${AppConstant.baseUrl}/v1/breeds',
        options: Options(
          headers: {
            'x-api-key': AppConstant.apiKey,
          },
        ),
      );
      return (response.data as List<dynamic>)
          .map((e) => CatBreedModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CatImageModel> getCatImageById(String imageId) async {
    try {
      final response = await dio.get(
        '${AppConstant.baseUrl}/v1/images/$imageId',
        options: Options(
          headers: {
            'x-api-key': AppConstant.apiKey,
          },
        ),
      );
      return CatImageModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CatImageModel>> getCatImages(int limit) async {
    try {
      final response = await dio.get(
        '${AppConstant.baseUrl}/v1/images/search?limit=$limit',
        options: Options(
          headers: {
            'x-api-key': AppConstant.apiKey,
          },
        ),
      );
      return (response.data as List)
          .map((e) => CatImageModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CatImageModel>> getCatImagesByBreed(
      String breedId, int limit) async {
    try {
      final response = await dio.get(
        '${AppConstant.baseUrl}/v1/images/search?limit=$limit&breed_id=$breedId',
        options: Options(
          headers: {
            'x-api-key': AppConstant.apiKey,
          },
        ),
      );
      return (response.data as List)
          .map((e) => CatImageModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
