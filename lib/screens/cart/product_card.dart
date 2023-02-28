import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water/providers/main_providers/language_provider.dart';
import 'package:water/screens/product_details/product_details.dart';

class ProductCard extends StatelessWidget {
  Function() onPressed;

  ProductCard(this.onPressed);

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(ProductDetails.routeName),
      child: SizedBox(
        width: double.infinity,
        height: 140,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 130,
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const SizedBox(width: 135),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'زجاجة مياه سعر واحد لتر',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontFamily: 'Tajawal',
                                                fontWeight: FontWeight.w600,
                                                height: 1.2),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.clear,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    const SizedBox(width: 4),
                                    const Text('4'),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                    const Spacer(),
                                    const Text('50'),
                                    Text(AppLocalizations.of(context)!.rial)
                                  ],
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 15,
              right: languageProvider.language == 'ar' ? 15 : null,
              left: languageProvider.language == 'en' ? 15 : null,
              child: SizedBox(
                width: 120,
                // color: Colors.red,
                height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/Loading_icon.gif'),
                    image: NetworkImage(
                        'https://www.festamachine.com/wp-content/uploads/2022/06/Bottled-water-768x576.jpg'),
                    placeholderFit: BoxFit.cover,
                    imageErrorBuilder: (context, _, __) {
                      return Center(
                          child: Text(
                        'Opps, image cant be loaded, check internet',
                        textAlign: TextAlign.center,
                      ));
                    },
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
