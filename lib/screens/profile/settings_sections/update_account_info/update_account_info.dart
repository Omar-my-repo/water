import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/shared/components/custom_list_tile.dart';
import 'package:water/shared/components/custom_text_field.dart';

class UpdateAccountInfo extends StatefulWidget {
  const UpdateAccountInfo({Key? key}) : super(key: key);

  @override
  State<UpdateAccountInfo> createState() => _UpdateAccountInfoState();
}

class _UpdateAccountInfoState extends State<UpdateAccountInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emialController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _lNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emialController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    title: const Text('Update Account Info'),
                    titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    content: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Text('First Name:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 14)),
                          const SizedBox(height: 2),
                          CustomTextField(
                            controller: _fNameController,
                            validator: (value) {},
                            hint: 'Omar',
                          ),
                          const SizedBox(height: 12),
                          Text('Last Name: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 14)),
                          const SizedBox(height: 2),
                          CustomTextField(
                            controller: _lNameController,
                            validator: (value) {},
                            hint: 'Muhammad',
                          ),
                          const SizedBox(height: 12),
                          const SizedBox(height: 2),
                          Text('Phone:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 14)),
                          const SizedBox(height: 2),
                          CustomTextField(
                            controller: _phoneController,
                            textInputType: TextInputType.phone,
                            validator: (value) {},
                            hint: '01234567890',
                          ),
                          const SizedBox(height: 12),
                          Text('Address:',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 14)),
                          const SizedBox(height: 2),
                          CustomTextField(
                              controller: _addressController,
                              validator: (value) {},
                              hint: 'Ryad'),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // if (_fNameController.text.isNotEmpty ||
                          //     _lNameController.text.isNotEmpty ||
                          //     _emialController.text.isNotEmpty ||
                          //     _addressController.text.isNotEmpty ||
                          //     (_phoneController.text.isNotEmpty &&
                          //         _phoneController.text.length != 11)) {}
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              });
        },
        child: CustomListTile(
          title: AppLocalizations.of(context)!.update_profile,
          leading: Icon(Icons.person),
        ));
  }
}
