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
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //margin: ,
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'متجر مياه',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/logo.png')),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.category,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontFamily: 'Tajawal',
                                    color: Colors.black54),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 8,
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
                              .copyWith(
                                  fontFamily: 'Tajawal', color: Colors.black54),
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
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget testWidget() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .42,
        viewportFraction: .7,
        //نسبة الصوره م عرض الشاشه1 يعني العرض كله
        // initialPage: 0,
        enableInfiniteScroll: true,
        // reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // //onPageChanged: onPageChanged,
        // scrollDirection: Axis.horizontal,
      ),
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: HomeProductItem(),
        );
      },
    );
  }
}
