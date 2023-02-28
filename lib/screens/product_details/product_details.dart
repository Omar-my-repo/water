import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water/providers/main_providers/language_provider.dart';

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
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ))
                  ],
                ),
                DraggableScrollableSheet(
                    minChildSize: .4,
                    maxChildSize: .7,
                    initialChildSize: .6,
                    builder: (context, scrollController) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 16),
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
                              Divider(
                                thickness: 3,
                                indent: 100,
                                endIndent: 100,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('زجاجة مياه سعة واحد لتر',
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith()),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.add_shopping_cart_rounded),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.add_cart,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline!
                                            .copyWith(height: .5),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                color: Colors.grey[300],
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
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
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  const Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Divider(thickness: 1),
                              const SizedBox(height: 20),
                              Text(AppLocalizations.of(context)!.similar_items,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.w700)),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 100,
                                      height: 120,
                                      color: Colors.grey[400],
                                    );
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
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                            '20',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(height: 1, color: Colors.black),
                          ),
                          SizedBox(width: 2),
                          Text(
                            AppLocalizations.of(context)!.rial,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(height: 1),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(double.infinity),
                          backgroundColor: Colors.black,
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
