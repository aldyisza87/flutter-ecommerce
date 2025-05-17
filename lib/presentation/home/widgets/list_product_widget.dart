import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.65),
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shadowColor: Color(0xffee4d2d),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Hero(
                tag: 'img6.png',
                child: SizedBox(
                  width: 150,
                  child: Image.asset('assets/images/img6.png'),
                ),
              ),
              Gap(8),
              Text(
                'Rp200.000',
                style: TextStyle(
                  color: Color(0xffee4d2d),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Gap(8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Apple Fuji',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Gap(8),
              Divider(height: 2, color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('data'), Text('data')],
              )
            ],
          ),
        );
      },
      itemCount: 8,
    );
  }
}
