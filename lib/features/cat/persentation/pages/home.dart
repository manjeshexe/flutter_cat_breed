import 'package:cat/features/cat/persentation/pages/bread_page.dart';
import 'package:cat/features/cat/persentation/pages/cat_image_page.dart';
import 'package:cat/features/cat/persentation/pages/search_page.dart';
import 'package:cat/features/cat/persentation/widgets/bread_list.dart';
import 'package:cat/features/cat/persentation/widgets/custom_app_bar.dart';
import 'package:cat/features/cat/persentation/widgets/custom_search_bar.dart';
import 'package:cat/features/cat/persentation/widgets/random_cat_image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SingleChildScrollView(
      child: Column(
        children: [
          CustomSearchBar(),
          RandomCatImageList(),
          BreadList(),
        ],
      ),
    ),
    SearchPage(),
    BreadPage(),
    CatImagePage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0 ? CustomAppBar() : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.amber[600],
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.cat),
              label: 'Breed',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.book_image),
              label: 'Image',
            )
          ]),
    );
  }
}
