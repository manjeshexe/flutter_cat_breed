import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: preferredSize.height,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's find a",
                      style: GoogleFonts.notoSansAdlam(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2,
                      )),
                  RichText(
                    text: TextSpan(
                      text: 'L',
                      style: GoogleFonts.pacifico(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ittle',
                          style: GoogleFonts.pacifico(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26),
                        ),
                        TextSpan(
                          text: ' F',
                          style: GoogleFonts.pacifico(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        TextSpan(
                            text: 'riend',
                            style: GoogleFonts.pacifico(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                style: ButtonStyle(
                  iconSize: WidgetStateProperty.all(20),
                  foregroundColor: WidgetStateProperty.all(Colors.blue),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.only(top: 16, bottom: 16)),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black12, width: 2),
                    ),
                  ),
                ),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedMenu04,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  // Handle search button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(140);
}
