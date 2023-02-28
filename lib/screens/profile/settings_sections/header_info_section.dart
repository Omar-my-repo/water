import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderInfoSection extends StatelessWidget {
  const HeaderInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/person_avatar.jpg',
                    ),
                    fit: BoxFit.fill),
              )),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.hello,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'عمر محمد',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.blueAccent),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'الريان - الرياض',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontSize: 14, height: 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
