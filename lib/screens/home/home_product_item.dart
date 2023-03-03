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
        side: BorderSide(
          color: Colors.black12,
          //width: 1,
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
                  child: Image.asset(
                    'assets/images/water-bottle.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: InkWell(
                    onTap: () async {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black12)),
                      child: Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
                      .copyWith(height: 1),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '20',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'Tajawal',
                          height: 1,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(width: 1),
                    Text(AppLocalizations.of(context)!.rial,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            fontFamily: 'Tajawal',
                            height: 1,
                            color: Theme.of(context).colorScheme.onPrimary)),
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
