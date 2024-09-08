import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoanListWidget extends StatelessWidget {
  Function handleAddressChange;
  String selectedProduce;
  LoanListWidget(
      {super.key,
      required this.handleAddressChange,
      required this.selectedProduce});

  // List _loanList = [];

  // String _selectedProduce = '1 tuber of yam';

  @override
  Widget build(BuildContext context) {
    List loanList = context.watch<DashboardServices>().outstandingHistory;

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
            itemCount: loanList.length,
            itemBuilder: (context, index) {
              final produce = loanList[index];
              return RadioListTile<String>(
                title: Text('${produce['outstanding']}'),
                value: produce['outstanding'].toString(),
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
