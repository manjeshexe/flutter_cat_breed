import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/persentation/widgets/table_description.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class Detail extends StatefulWidget {
  const Detail({super.key, required this.catBreed});

  final CatBreed catBreed;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  
  @override
  Widget build(BuildContext context) {
    String img;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catBreed.name ?? "No Name",
            style: GoogleFonts.pacifico()),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Image.network(
                widget.catBreed.image?.url ?? "",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _CustomRowWidget(
                        label: "Origin", text: widget.catBreed.origin!),
                    _CustomRowWidget(
                      label: "Description",
                      text: widget.catBreed.description!,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TableDescription(
                            text: "Adaptability",
                            value: widget.catBreed.adaptability!,
                          ),
                          TableDescription(
                            text: "Affection Level",
                            value: widget.catBreed.affectionLevel!,
                          ),
                          TableDescription(
                            text: "Child Friendly",
                            value: widget.catBreed.childFriendly!,
                          ),
                          TableDescription(
                            text: "Dog Friendly",
                            value: widget.catBreed.dogFriendly!,
                          ),
                          TableDescription(
                            text: "Energy Level",
                            value: widget.catBreed.energyLevel ?? 0,
                          ),
                          TableDescription(
                            text: "Grooming",
                            value: widget.catBreed.grooming ?? 0,
                          ),
                          TableDescription(
                            text: "Grooming",
                            value: widget.catBreed.grooming ?? 0,
                          ),
                          TableDescription(
                            text: "Health Issues",
                            value: widget.catBreed.healthIssues ?? 0,
                          ),
                          TableDescription(
                            text: "Intelligence",
                            value: widget.catBreed.intelligence ?? 0,
                          ),
                          TableDescription(
                            text: "Shedding Level",
                            value: widget.catBreed.sheddingLevel ?? 0,
                          ),
                          TableDescription(
                            text: "Social Needs",
                            value: widget.catBreed.socialNeeds ?? 0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: LinkPreview(
                        enableAnimation: true,
                        onPreviewDataFetched: (data) {
                          setState(() {
                            img =
                                "https://www.hollywoodreporter.com/news/general-news/why-img-worldwide-is-being-400544/";
                          });
                        },
                        openOnPreviewImageTap:
                            true, // Pass the preview data from the state
                        text: widget.catBreed.wikipediaUrl!,
                        previewData: PreviewData(),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomRowWidget extends StatelessWidget {
  const _CustomRowWidget({
    super.key,
    required this.text,
    required this.label,
  });

  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Text(
              label,
              style: GoogleFonts.notoSansOsage(),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
