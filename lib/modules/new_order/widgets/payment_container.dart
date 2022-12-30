import 'package:deliveryapp/widgets/custom_textfield.dart';
import 'package:deliveryapp/widgets/custom_textfieldAdditionalService.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PaymentContainer extends StatefulWidget {
  const PaymentContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  String selectedMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Promocode',
              //   style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       color: Colors.grey,
              //       fontSize: 20),
              // ),
              Expanded(
                  // width: MediaQuery.of(context).size.width / 5,
                  child: CustomTextfieldAdditionalService(hint: 'Promocode')),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isDismissible: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Wrap(
                            runSpacing: 20,
                            children: [
                              Text(
                                'Payment methods',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setModalState(() {
                                    selectedMethod = 'Cash';
                                  });
                                  setState(() {
                                    selectedMethod = 'Cash';
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.payments_outlined),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Cash',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    selectedMethod == 'Cash'
                                        ? Icon(
                                            Icons.done,
                                            color: Colors.red,
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setModalState(() {
                                    selectedMethod = 'Credit Card';
                                  });
                                  setState(() {
                                    selectedMethod = 'Credit Card';
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.credit_card),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Credit Card',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    selectedMethod == 'Credit Card'
                                        ? Icon(
                                            Icons.done,
                                            color: Colors.red,
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                child: Text('Done',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.grey.shade200,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    minimumSize: Size(double.infinity, 50)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedMethod == 'Cash'
                        ? Row(
                            children: [
                              Icon(Icons.payments_outlined),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Credit Card',
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          ),
                    Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
