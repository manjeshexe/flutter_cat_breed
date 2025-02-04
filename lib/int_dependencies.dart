import 'package:cat/core/extra/bloc/search_bloc.dart';
import 'package:cat/features/cat/data/datasource/remote_datasource.dart';
import 'package:cat/features/cat/data/repositories/cat_repository_impl.dart';
import 'package:cat/features/cat/domain/repositories/cat_repository.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_breed_By_id_usecase.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_breed_usecase.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_image_usecase.dart';
import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/bloc/catImage/cat_image_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCat();
}

void _initCat() {
  // Datasource
  serviceLocator
    ..registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(
        dio: serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<CatRepository>(
      () => CatRepositoryImpl(
        catRemoteDataSource: serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(() => GetCatBreedUsecase(serviceLocator()))
    ..registerFactory(() => GetCatBreedByIdUsecase(serviceLocator()))
    ..registerFactory(() => GetCatImageUsecase(serviceLocator()))
    // Bloc
    ..registerLazySingleton(
      () => CatBloc(
        getCatBreedUsecase: serviceLocator(),
        getCatBreedByIdUsecase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => CatImageBloc(
        getCatImageUsecase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SearchBloc(getCatBreedUsecase: serviceLocator()),
    )

    // Dio
    ..registerLazySingleton(() => Dio());
}
