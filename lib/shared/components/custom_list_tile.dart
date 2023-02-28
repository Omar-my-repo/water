import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  Icon leading;
  String title;

  CustomListTile({required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
