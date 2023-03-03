import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  HomeCategoryItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(14),
      //     border: Border.all(color: Colors.black45, width: 1)),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black26,width: 1),
                  //borderRadius: BorderRadius.circular(12),

                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                  image: DecorationImage(
                    image: AssetImage('assets/images/water-bottle.png'),
                    // fit: BoxFit.fill
                  )),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Category Name',
            style: Theme.of(context).textTheme.caption!.copyWith(height: 1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
