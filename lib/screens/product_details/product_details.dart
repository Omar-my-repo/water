import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water/providers/main_providers/language_provider.dart';
import 'package:water/screens/home/home_product_item.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = 'productsDetails';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    FadeInImage(
                      placeholder:
                          const AssetImage('assets/images/Loading_icon.gif'),
                      image: NetworkImage(
                          'https://www.seekpng.com/png/detail/5-50833_water-png-drinking-water-bottle-png.png'),
                      height: MediaQuery.of(context).size.height * .6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 20,
                        right: languageProvider.language == 'ar' ? 10 : null,
                        left: languageProvider.language == 'en' ? 10 : null,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).colorScheme.primary,
                              size: 28,
                            ),
                          ),
                        ))
                  ],
                ),
                DraggableScrollableSheet(
                    minChildSize: .5,
                    maxChildSize: .7,
                    initialChildSize: .6,
                    builder: (context, scrollController) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            )),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6),
                              Divider(
                                thickness: 3,
                                indent: 100,
                                endIndent: 100,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                  'زجاجة مياه سعة واحد مياه سعة واحد مياه سعة واحد لتر',
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith()),
                              const SizedBox(height: 10),
                              Container(
                                color: Colors.grey[200],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                child: Text('مياه معدنيه',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.black54)),
                              ),

                              const SizedBox(height: 6),
                              const Divider(thickness: 1),
                              const SizedBox(height: 14),

                              Text(AppLocalizations.of(context)!.description,
                                  style:
                                      Theme.of(context).textTheme.titleMedium!),
                              const SizedBox(height: 10),
                              Text(
                                'زجاجة مياه معدنيه مصنوعه من البلاستيك الآمن وبجودة عالية تحفظ المياه صحية سعة واحد لتر ',
                                textAlign: TextAlign.right,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black54),
                              ),
                              const SizedBox(height: 6),
                              // Text('Price start with: 250LE',
                              //     style: TextStyle(color: Colors.black45)),
                              const SizedBox(height: 10),

                              const SizedBox(height: 20),
                              const Divider(thickness: 1),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .delivery_policy,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Divider(thickness: 1),
                              const SizedBox(height: 20),
                              Text(AppLocalizations.of(context)!.similar_items,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                height: 220,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width: 150,
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: HomeProductItem());
                                  },
                                ),
                              ),
                              const SizedBox(height: 40)
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 70,
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.price,
                          style: Theme.of(context).textTheme.caption),
                      Row(
                        children: [
                          Text(
                            '200',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(height: 1, color: Colors.black),
                          ),
                          SizedBox(width: 2),
                          Text(
                            AppLocalizations.of(context)!.rial,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(height: 1),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(double.infinity),
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_shopping_cart),
                          const SizedBox(width: 10),
                          Text(
                            AppLocalizations.of(context)!.add_to_cart,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
