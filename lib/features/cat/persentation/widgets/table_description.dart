import 'package:flutter/material.dart';

class TableDescription extends StatelessWidget {
  const TableDescription({super.key, required this.text, required this.value});
  final String text;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                text,
              ),
            ),
            SizedBox(width: 20),
            Row(
              children: List.generate(value, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber[600],
                      shape: BoxShape.rectangle,
                    ),
                    height: 10,
                    width: 30,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
