import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  HomeCategoryItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black45, width: 1)),
      child: Center(
        child: Text('مياه معدنيه',
            style: const TextStyle(letterSpacing: 1.2, fontSize: 12)),
      ),
    );
  }
}
