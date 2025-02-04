import 'package:cat/core/extra/bloc/search_bloc.dart';
import 'package:cat/features/cat/data/datasource/remote_datasource.dart';
import 'package:cat/features/cat/data/model/cat_breed_model.dart';
import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/bloc/catImage/cat_image_bloc.dart';
import 'package:cat/features/cat/persentation/pages/home.dart';
import 'package:cat/int_dependencies.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await initDependencies();
  // final dio = Dio();
  // RemoteDataSource remoteDataSource = RemoteDataSourceImpl(dio: dio);
  // List<CatBreedModel> res1 = await remoteDataSource.getCatBreeds();
  // CatImage res2 = await remoteDataSource.getCatImageById('0XYvRd7oD');
  // CatBreed res3 = await remoteDataSource.getCatBreedById('beng');
  // List<CatImage> res4 = await remoteDataSource.getCatImages(10);
  // List<CatImage> res5 = await remoteDataSource.getCatImagesByBreed('ocic', 10);
  // print(res1);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<CatBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<CatImageBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<SearchBloc>(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(GetCatBreedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
