import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreadPage extends StatefulWidget {
  const BreadPage({super.key});

  @override
  State<BreadPage> createState() => _BreadPageState();
}

class _BreadPageState extends State<BreadPage> {
  @override
  void initState() {
    super.initState();
    // Trigger the event to load cat breeds
    context.read<CatBloc>().add(GetCatBreedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BreadPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1,
                ),
                itemCount: state.catBreeds.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  final imageUrl = state.catBreeds[index].image;
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                Detail(catBreed: state.catBreeds[index]))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: imageUrl != null
                                ? DecorationImage(
                                    image: NetworkImage(imageUrl.url),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors
                                .grey.shade200, // Fallback color if no image
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.catBreeds[index].name ?? "No Name",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (state is CatFailure) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
