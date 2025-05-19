import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/global_variables.dart';

class ListCategoryWidget extends StatelessWidget {
  const ListCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 80,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            );
          }),
    );
  }
}
