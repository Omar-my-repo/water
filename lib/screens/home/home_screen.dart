import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/screens/home/home_category_item.dart';
import 'package:water/screens/home/home_product_item.dart';
import 'package:water/screens/product_details/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridview = true;

  @override
  Widget build(BuildContext context) {
    print('===========IM IN HOME Screen');
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.home),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontFamily: 'Tajawal'),
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.category,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontFamily: 'Tajawal'),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: HomeCategoryItem(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.products,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontFamily: 'Tajawal'),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isGridview = !isGridview;
                          });
                        },
                        icon: isGridview
                            ? const Icon(Icons.menu)
                            : const Icon(Icons.dashboard))
                  ],
                ),
                Visibility(
                  visible: isGridview,
                  replacement: SizedBox(
                    width: double.infinity,
                    child: testWidget(),
                  ),
                  child: GridView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: .70,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(ProductDetails.routeName);
                        },
                        child: HomeProductItem(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget testWidget() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .45,
        viewportFraction: .7,
        //نسبة الصوره م عرض الشاشه1 يعني العرض كله
        // initialPage: 0,
        enableInfiniteScroll: true,
        // reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // //onPageChanged: onPageChanged,
        // scrollDirection: Axis.horizontal,
      ),
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          color: Colors.grey[300],
        );
      },
    );
  }
}
