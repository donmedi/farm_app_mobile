import 'package:farm_loan_app/layout/custom_button.dart';
import 'package:farm_loan_app/layout/custom_form_input.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/cutomBottomSheet.dart';
import 'package:farm_loan_app/widget/branch_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FarmDeliveryInfo extends StatefulWidget {
  const FarmDeliveryInfo({super.key});

  @override
  State<FarmDeliveryInfo> createState() => _FarmDeliveryInfoState();
}

class _FarmDeliveryInfoState extends State<FarmDeliveryInfo> {
  TextEditingController _date = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _numberOfProduce = TextEditingController();
  // TextEditingController +

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Card Information',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {
                  CustomRouters.routePop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(FeatherIcons.x),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomFormInput(
              label: 'Delivery Date',
              controller: _date,
              valText: '',
              placeHolder: 'Delivery Date',
              callBack: (e) {}),
          SizedBox(
            height: 15.h,
          ),
          CustomFormDisabledInput(
              label: 'Branch',
              controller: _branch,
              valText: '',
              placeHolder: 'Which branch you want to deliver to?',
              callBack: () {
                customBottomSheet(
                    context,
                    BranchDeliveryWidget(
                        handleAddressChange: (e) {
                          setState(() {
                            _branch.text = e;
                          });
                          CustomRouters.routePop(context);
                        },
                        selectedProduce: _branch.text));
              }),
          SizedBox(
            height: 15.h,
          ),
          CustomFormInput(
              label: 'Number of Produce',
              controller: _numberOfProduce,
              valText: '',
              placeHolder: 'Number of Produce',
              callBack: (e) {}),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 35.h,
          ),
          CustomPrimaryButton(
              title: 'Submit',
              callBack: () {
                CustomRouters.routePop(context);
                CustomRouters.routePop(context);

                successModalMinimal(context, 'Delivery Repayment Successfully');
              }),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
