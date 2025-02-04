import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/pages/bread_page.dart';
import 'package:cat/features/cat/persentation/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class BreadList extends StatefulWidget {
  const BreadList({super.key});

  @override
  State<BreadList> createState() => _BreadListState();
}

class _BreadListState extends State<BreadList> {
  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(GetCatBreedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Breads",
                style: GoogleFonts.notoSansAdlam(fontSize: 22),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const BreadPage()));
                },
                child: Text(
                  "View all",
                  style: GoogleFonts.notoSansAdlam(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<CatBloc, CatState>(
            builder: (context, state) {
              if (state is CatLoaded) {
                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final catBreed = state.catBreeds[index];
                      final List<String> words = catBreed.name!.split(' ');

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Detail(catBreed: catBreed),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black.withAlpha(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(10),
                                      blurRadius: 20,
                                      offset: const Offset(10, 10),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            catBreed.image!.url,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      if (words.length > 1)
                                        Column(
                                          children: [
                                            Text(
                                              words[0],
                                              style: GoogleFonts.notoSansAdlam(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                textStyle: TextStyle(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              words[1],
                                              style: GoogleFonts.notoSansAdlam(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                textStyle: TextStyle(
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      else
                                        Text(
                                          catBreed.name!,
                                          style: GoogleFonts.notoSansAdlam(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state is CatLoaded ? state.catBreeds.length : 10,
                  ),
                );
              } else if (state is CatFailure) {
                return Center(child: Text(state.message));
              } else if (state is CatLoading) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        10,
                        (index) => _BreadCard(),
                        growable: true,
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _BreadCard() {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withAlpha(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 60,
                    height: 10,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 80,
                    height: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
