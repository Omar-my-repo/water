import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeProductItem extends StatefulWidget {
  // Product product;

  // HomeProductItem(this.product);

  @override
  State<HomeProductItem> createState() => _HomeProductItemState();
}

class _HomeProductItemState extends State<HomeProductItem> {
  @override
  Widget build(BuildContext context) {
    print('====PRODUCT ITEM SCREEN=====');

    return Card(
      elevation: 6,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/Loading_icon.gif'),
                    image: NetworkImage(
                        'https://www.seekpng.com/png/detail/5-50833_water-png-drinking-water-bottle-png.png'),
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
                Positioned(
                  top: 4,
                  left: 4,
                  child: InkWell(
                    onTap: () async {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.black12)),
                      child: const Icon(Icons.add_shopping_cart_rounded),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(
                  'زجاجة مياه معدنيه سعة واحد لتر',
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontFamily: 'Tajawal', height: 1),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '20',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontFamily: 'Tajawal', height: 1),
                    ),
                    SizedBox(width: 1),
                    Text(AppLocalizations.of(context)!.rial,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontFamily: 'Tajawal', height: 1)),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          )
        ],
      ),
    );
  }
}
