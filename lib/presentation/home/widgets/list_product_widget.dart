import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 9 / 10.5,
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Gap(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apple Fuji',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Rp 50.000',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        );
      },
      itemCount: 8,
    );
  }
}
