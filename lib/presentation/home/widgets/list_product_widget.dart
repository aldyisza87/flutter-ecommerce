import 'package:flutter/material.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.65),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            color: Colors.amberAccent,
          ),
        );
      },
      itemCount: 8,
    );
  }
}
