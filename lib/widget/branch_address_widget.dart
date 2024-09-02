import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchDeliveryWidget extends StatelessWidget {
  Function handleAddressChange;
  String selectedProduce;
  BranchDeliveryWidget(
      {super.key,
      required this.handleAddressChange,
      required this.selectedProduce});

  List<Map<String, dynamic>> _produceList = [
    {'name': 'Ikeja branch', 'price': 'NGN5000'},
    {'name': 'Yaba Branch', 'price': 'NGN10000'},
    {'name': 'Isolo Branch', 'price': 'NGN8000'},
    {'name': 'Ibadan Branch', 'price': 'NGN2000'},
    {'name': 'Ilorin Kwara branch', 'price': 'NGN1500'},
    {'name': 'Abuja Branch', 'price': 'NGN6000'},
    {'name': 'Sapele branch', 'price': 'NGN3000'},
    {'name': 'Oshogbo branch', 'price': 'NGN2500'},
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
              'Select Branch For Delivery',
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
                title: Text('${produce['name']}'),
                value: produce['name'],
                groupValue: selectedProduce,
                onChanged: (e) {
                  handleAddressChange(e);
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
