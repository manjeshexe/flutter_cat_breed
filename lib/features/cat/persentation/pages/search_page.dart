import 'package:cat/features/cat/persentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text("S E A R C H  B R E E D",
              style: GoogleFonts.notoSansAdlam(fontSize: 22)),
          SizedBox(height: 20),
          CustomSearchBar(),
        ],
      ),
    );
  }
}
