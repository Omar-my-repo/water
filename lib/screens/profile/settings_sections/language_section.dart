import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water/providers/main_providers/language_provider.dart';
import 'package:water/shared/components/custom_list_tile.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 200,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 3,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          //to avoid rebuild screen if language is same
                          if (languageProvider.language == 'en') {
                            languageProvider.changeLanguage('ar');
                            // Navigator.pop(context);

                          }
                        },
                        child: languageProvider.language == 'ar'
                            ? selectedLanguage('العربيه')
                            : unSelectedLanguage('العربيه'),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          if (languageProvider.language == 'ar') {
                            languageProvider.changeLanguage('en');
                            // Navigator.pop(context);

                          }
                        },
                        child: languageProvider.language == 'en'
                            ? selectedLanguage('English')
                            : unSelectedLanguage('English'),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: CustomListTile(
        title: AppLocalizations.of(context)!.language,
        leading: Icon(Icons.language),
      ),
    );
  }

  Widget selectedLanguage(String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: TextStyle(fontSize: 18),
        ),
        const Icon(
          Icons.check,
          color: Colors.orangeAccent,
          size: 26,
        )
      ],
    );
  }

  Widget unSelectedLanguage(String language) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        language,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
