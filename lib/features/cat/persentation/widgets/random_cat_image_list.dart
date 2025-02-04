import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/bloc/catImage/cat_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:shimmer/shimmer.dart';

class RandomCatImageList extends StatefulWidget {
  const RandomCatImageList({super.key});

  @override
  State<RandomCatImageList> createState() => _RandomCatImageListState();
}

class _RandomCatImageListState extends State<RandomCatImageList> {
  @override
  void initState() {
    super.initState();
    context.read<CatImageBloc>().add(GetCatImageEvent(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatImageBloc, CatImageState>(
      builder: (context, state) {
        if (state is CatImageLoaded) {
          final catList = state.catImage;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FlutterCarousel(
              options: FlutterCarouselOptions(
                height: 350.0,
                showIndicator: true,
                autoPlay: true,
                slideIndicator: CircularSlideIndicator(),
              ),
              items: catList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            i.url,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, event) {
                              if (event == null) return child;
                              return Center(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: const CircularProgressIndicator()),
                              );
                            },
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          );
        } else if (state is CatImageFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is CatImageLoading) {
          return FlutterCarousel(
            options: FlutterCarouselOptions(
              height: 350.0,
              showIndicator: true,
              autoPlay: true,
              slideIndicator: CircularSlideIndicator(),
            ),
            items: List.generate(
              10,
              (index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: FlutterCarousel(
              options: FlutterCarouselOptions(
                height: 350.0,
                showIndicator: true,
                autoPlay: true,
                slideIndicator: CircularSlideIndicator(),
              ),
              items: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
