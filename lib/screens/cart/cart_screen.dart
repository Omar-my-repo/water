import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/screens/cart/product_card.dart';
import 'package:water/screens/check_out/check_out_screen.dart';
import 'package:water/shared/components/main_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.cart,
                  style: Theme.of(context).textTheme.headline4),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return ProductCard(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: customBottomNavigationBar(),
      ),
    );
  }

  Widget customBottomNavigationBar() {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.total_price,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              Text('250',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 24)),
              const SizedBox(width: 2),
              Text(AppLocalizations.of(context)!.rial,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 13))
            ],
          ),
          MainButton(
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(CheckOutScreen.routeName);
            },
            text: AppLocalizations.of(context)!.check_out,
          )
        ]),
      ),
    );
  }
}
