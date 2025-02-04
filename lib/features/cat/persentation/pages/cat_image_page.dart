import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:cat/features/cat/persentation/bloc/catImage/cat_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CatImagePage extends StatefulWidget {
  const CatImagePage({super.key});

  @override
  State<CatImagePage> createState() => _CatImagePageState();
}

class _CatImagePageState extends State<CatImagePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CatImageBloc>().add(GetCatImageEvent(limit: 40));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatImageBloc, CatImageState>(
      builder: (context, state) {
        if (state is CatImageLoaded) {
          final catList = state.catImage;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder:
                  // ignore: unnecessary_null_comparison
                  (context, index) => catList[index].url != null
                      ? Image.network(catList[index].url!, fit: BoxFit.cover)
                      : Container(),
              itemCount: catList.length,
            ),
          );
        } else if (state is CatImageFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
