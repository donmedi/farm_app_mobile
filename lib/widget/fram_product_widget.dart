import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmProductWidget extends StatelessWidget {
  Function handleProduceChange;
  String selectedProduce;
  FarmProductWidget(
      {super.key,
      required this.handleProduceChange,
      required this.selectedProduce});

  List<Map<String, dynamic>> _produceList = [
    {'name': '1 tuber of yam', 'price': '5000'},
    {'name': '1 sack of rice', 'price': '10000'},
    {'name': '1 bag of beans', 'price': '8000'},
    {'name': '10 ears of corn', 'price': '2000'},
    {'name': '20 tomatoes', 'price': '1500'},
    {'name': '10 kg of cassava', 'price': '6000'},
    {'name': '5 kg of potatoes', 'price': '3000'},
    {'name': '50 oranges', 'price': '2500'},
    {'name': '20 apples', 'price': '4000'},
    {'name': '1 crate of eggs', 'price': '3500'},
  ];

  // String _selectedProduce = '1 tuber of yam';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(24.sp).copyWith(bottom: 5),
            child: Text(
              'Select Farm Produce',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _produceList.length,
            itemBuilder: (context, index) {
              final produce = _produceList[index];
              return RadioListTile<String>(
                title: Text('${produce['name']} = NGN${produce['price']}'),
                value: produce['name'],
                groupValue: selectedProduce,
                onChanged: (e) {
                  log('selected $e');
                  handleProduceChange(produce['name'], produce['price']);
                },
                visualDensity: VisualDensity.compact,
              );
            },
          ),
        ],
      ),
    );
  }
}
