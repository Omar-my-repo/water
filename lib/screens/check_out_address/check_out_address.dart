import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/shared/components/custom_text_field.dart';

class CheckOutAddress extends StatelessWidget {
  static const String routeName = 'CheckOutAddress';
  final _newAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.change_address,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontFamily: 'Tajawal'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    //هنا المفروض اشوف اليسته ال راجعه واشوف منها اليدفولت
                    int selectedIndex = 1;
                    return Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red[300],
                                    ))
                              ],
                            ),
                            Text(
                              '4 شارع الريان - الرياض - السعودية',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            RadioListTile(
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              title: Text(
                                AppLocalizations.of(context)!
                                    .set_as_default_address,
                                style: TextStyle(fontSize: 16),
                              ),
                              contentPadding: EdgeInsets.zero,
                              value: index,
                              groupValue: selectedIndex,
                              onChanged: (value) {
                                //هنا هنادي ع الفيو موديل هيروح يعمل ابديت للديفولت/السيليكتيد
                                // في الفيربيز
                                selectedIndex = value!;
                                print('========$value');
                                print('========$selectedIndex');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),

      // floatingActionButton: SizedBox(
      //   width: 120,
      //   height: 45,
      //   child: MainButton(
      //     text: 'إضافة عنوان',
      //     txtSize: 14,
      //     onTap: (){
      //
      //     },
      //
      //   ),
      // ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.onPrimary),
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.add_new_address,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontFamily: 'Tajawal')),
                          SizedBox(height: 20),
                          Text(AppLocalizations.of(context)!.recipient_name),
                          CustomTextField(
                            controller: _newAddressController,
                            validator: (value) {},
                            hint: 'عمر محمد',
                          ),
                          SizedBox(height: 20),
                          Text(AppLocalizations.of(context)!.address),
                          CustomTextField(
                            controller: _newAddressController,
                            validator: (value) {},
                            hint: '12213 شارع العليا، العليا، الرياض',
                          ),
                        ],
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * .4,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary),
                              onPressed: () {},
                              child: Text(AppLocalizations.of(context)!.save)))
                    ],
                  ),
                );
              });
        },
        child: Text(AppLocalizations.of(context)!.add_new_address),
      ),
    );
  }
}
