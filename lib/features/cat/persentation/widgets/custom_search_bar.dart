import 'package:cat/core/extra/bloc/search_bloc.dart';
import 'package:cat/features/cat/data/datasource/remote_datasource.dart';
import 'package:cat/features/cat/persentation/bloc/cat/cat_bloc.dart';
import 'package:cat/features/cat/persentation/pages/detail.dart';
import 'package:cat/int_dependencies.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: DropDownSearchFormField(
                  debounceDuration: const Duration(milliseconds: 300),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Search here...',
                      prefixIcon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedSearch01,
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 30,
                        bottom: 8,
                        top: 8,
                        right: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    try {
                      RemoteDataSource remoteDataSource =
                          RemoteDataSourceImpl(dio: serviceLocator<Dio>());
                      final res = await remoteDataSource.getCatBreeds();
                      List<String> names =
                          res.map((e) => e.name!.toLowerCase()).toList();
                      return names.where(
                          (element) => element.contains(pattern.toLowerCase()));
                    } catch (e) {
                      rethrow;
                    }
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(suggestion),
                      ),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (suggestion) {
                    _nameController.text = suggestion;
                  },
                ),
              ),
            ),
            BlocListener<SearchBloc, SearchState>(
              listener: (context, state) {
                if (state is SearchLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Searching...')),
                  );
                } else if (state is SearchLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(catBreed: state.catBreed),
                    ),
                  );
                } else if (state is SearchError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${state.message}')),
                  );
                }
              },
              child: IconButton(
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    const Size(50, 50),
                  ),
                ).copyWith(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    context
                        .read<SearchBloc>()
                        .add(SearchEventChanged(_nameController.text));
                    _nameController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a search query'),
                      ),
                    );

                    // try {
                    //   // Fetch the cat breeds from your remote data source
                    //   RemoteDataSource remoteDataSource =
                    //       RemoteDataSourceImpl(dio: serviceLocator<Dio>());
                    //   final breeds = await remoteDataSource.getCatBreeds();

                    //   // Find the breed with the entered name
                    //   final selectedBreed = breeds.firstWhere(
                    //     (breed) =>
                    //         breed.name!.toLowerCase() ==
                    //         _nameController.text.toLowerCase(),
                    //     orElse: () => throw Exception('Breed not found'),
                    //   );

                    //   // Navigate to the detail page with the selected breed
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Detail(catBreed: selectedBreed),
                    //     ),
                    //   );
                    // } catch (e) {
                    //   // Handle errors (e.g., show a snackbar with the error message)
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Error: ${e.toString()}')),
                    //   );
                    // }

                    // final bloc = context.read<CatBloc>();
                    // bloc.add(SearchCatBreedEvent(query: _nameController.text));

                    // bloc.stream.listen((state) {
                    //   if (state is CatFailure) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text(state.message)),
                    //     );
                    //   } else if (state is SearchCatBreedLoaded) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => Detail(
                    //           catBreed: state.catBreed,
                    //         ),
                    //       ),
                    //     );
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //           content: Text('Please enter a search query')),
                    //     );
                    //   }
                    // });
                  }
                },
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearchList01,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
