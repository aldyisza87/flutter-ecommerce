import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/global_variables.dart';
import 'package:flutter_ecommerce/presentation/home/widgets/banner_widget.dart';
import 'package:flutter_ecommerce/presentation/home/widgets/list_category_widget.dart';
import 'package:flutter_ecommerce/presentation/home/widgets/list_product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  int _selectedIndex = 0;

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Color(0xffEE4D2D)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    child: TextFormField(
                      controller: searchController,
                      onFieldSubmitted: (_) {},
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: AlignmentDirectional.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: ListCategoryWidget()),
            BannerWidget(),
            Expanded(child: ListProductWidget())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_bag_rounded),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Cart'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_outline),
                label: 'Favorite'),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'Profile')
          ]),
    );
  }
}
