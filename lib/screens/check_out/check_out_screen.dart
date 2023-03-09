import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/screens/check_out_address/check_out_address.dart';
import 'package:water/screens/cart/success_order.dart';
import 'package:water/shared/components/main_button.dart';

class CheckOutScreen extends StatelessWidget {
  static const String routeName = 'CheckOutScreen';

  @override
  Widget build(BuildContext context) {
    String paymentMethod = "cash";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.shipping_address,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontFamily: 'Tajawal'),
            ),
            Card(
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عمر محمد',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CheckOutAddress.routeName);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.change,
                              style: TextStyle(color: Colors.red[300]),
                            )),
                      ],
                    ),
                    Text(
                      '12213 شارع العليا، العليا،',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text('الرياض - السعوديه',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              AppLocalizations.of(context)!.payment_method,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontFamily: 'Tajawal'),
            ),
            const SizedBox(height: 10),
            RadioListTile(
              title: Text(AppLocalizations.of(context)!.cash_payment),
              activeColor: Theme.of(context).colorScheme.primary,
              value: "cash",
              groupValue: paymentMethod,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text(AppLocalizations.of(context)!.credit_payment),
              value: "credit",
              groupValue: paymentMethod,
              subtitle: Text(AppLocalizations.of(context)!.not_available),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.order_price,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const Spacer(),
                      Text('250',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 20)),
                      const SizedBox(width: 2),
                      Text(AppLocalizations.of(context)!.rial,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 13))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.delivery_price,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const Spacer(),
                      Text(AppLocalizations.of(context)!.free,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w400)),
                      const SizedBox(width: 2),
                      //Text('ريال',style:Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.summary,
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
                          .pushNamed(SuccessOrder.routeName);
                    },
                    text: AppLocalizations.of(context)!.submit_order,
                  )
                ]),
          )),
    );
  }
}
