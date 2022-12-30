import 'package:deliveryapp/widgets/custom_textfieldAdditionalService.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield.dart';
import '../../constants.dart';

class DeliveryPoint extends StatefulWidget {
  final List<TextEditingController> controllers;

  final int index;
  final bool isScheduleClicked;
  final Function removePoints;

  DeliveryPoint({
    super.key,
    required this.controllers,
    required this.index,
    required this.isScheduleClicked,
    required this.removePoints,
  });

  @override
  State<DeliveryPoint> createState() => _DeliveryPointState();
}

class _DeliveryPointState extends State<DeliveryPoint> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController orderNumberController = TextEditingController();

  bool cashOnDelivery = false;

  bool buyForMe = false;
  bool clickedAdditionalServices = false;

  String locationSelected = '';

  @override
  void dispose() {
    phoneController.dispose();
    contactPersonController.dispose();
    orderNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 12,
                child: Text(
                  (widget.index + 2).toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Delivery point',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22),
              ),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    // Container(
                    //   color: Colors.black,
                    //   width: 1,
                    //   height: 335,
                    // ),
                    SizedBox(
                      height: !clickedAdditionalServices ? 320 : 420,
                      child: VerticalDivider(
                        color: Colors.black,
                        width: 25,
                        indent: 15,
                        thickness: 2.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String location = await Navigator.pushNamed(
                              context, 'addressSelectionScreen', arguments: {
                            'addressPassed': locationSelected
                          }) as String;
                          // print('location in delivery_point $location');
                          setState(() {
                            locationSelected = location;
                          });
                        },
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    locationSelected == ''
                                        ? 'Address selected'
                                        : locationSelected,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.pin_drop_outlined,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Divider(
                          color: Colors.grey.shade300,
                          // indent: 15,
                          thickness: 1,
                        ),
                      ),
                      locationSelected == ''
                          ? Text(
                              'Mandatory field',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            )
                          : SizedBox(),
                      !widget.isScheduleClicked && locationSelected == ''
                          ? Container(
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blueColor.withOpacity(0.15)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: blueColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Enter the address to find out\nwhen the courier will arrive',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                      locationSelected != ''
                          ? SizedBox(
                              // height: 50,
                              child: CustomTextfield(
                              hint: 'How to reach',
                              inputAction: TextInputAction.next,
                              inputType: TextInputType.phone,
                            ))
                          : SizedBox(),
                      SizedBox(
                          // height: 50,
                          child: CustomTextfield(
                        hint: 'Phone number',
                        suffixIcon: Icons.person_outline_sharp,
                        inputType: TextInputType.phone,
                        controller: phoneController,
                      )),
                      widget.isScheduleClicked == true
                          ? SizedBox(
                              // height: 50,
                              child: CustomTextfieldAdditionalService(
                                hint: 'When to arrive at this address',
                                suffixIcon: Icons.access_time,
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.text,
                                controller: timeController,
                              ),
                            )
                          : SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              isDismissible: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setModalState) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 30, 20, 10),
                                      child: Wrap(
                                        runSpacing: 20,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Instruction for the courier',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    color: cashOnDelivery ==
                                                            false
                                                        ? Colors.grey.shade200
                                                        : Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Row(children: [
                                                  Checkbox(
                                                      // checkColor: Colors.red,
                                                      activeColor:
                                                          cashOnDelivery ==
                                                                  false
                                                              ? blueColor
                                                              : Colors.white,
                                                      checkColor:
                                                          cashOnDelivery == true
                                                              ? Colors.black
                                                              : Colors.white,
                                                      value:
                                                          this.cashOnDelivery,
                                                      onChanged: (bool? value) {
                                                        setModalState(() {
                                                          this.cashOnDelivery =
                                                              value!;
                                                        });
                                                        setState(() {
                                                          this.cashOnDelivery =
                                                              value!;
                                                        });
                                                      }),
                                                  Text(
                                                    'Collect cash on delivery',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .grey.shade500),
                                                  )
                                                ]),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Container(
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Row(children: [
                                                  Checkbox(

                                                      // checkColor: blueColor,
                                                      activeColor: blueColor,
                                                      value: buyForMe,
                                                      onChanged: (bool? value) {
                                                        setModalState(() {
                                                          buyForMe = value!;
                                                        });
                                                        setModalState(() {
                                                          buyForMe = value!;
                                                        });
                                                      }),
                                                  Text(
                                                    'Buy For Me',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .grey.shade500),
                                                  )
                                                ]),
                                              ),
                                            ],
                                          ),
                                          cashOnDelivery == true
                                              ? SizedBox(
                                                  child: CustomTextfield(
                                                    hint: 'Amount',
                                                    inputType:
                                                        TextInputType.number,
                                                  ),
                                                )
                                              : SizedBox(),
                                          cashOnDelivery == true
                                              ? SizedBox(
                                                  child: CustomTextfield(
                                                      hint:
                                                          'Card or wallet number'),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            child: CustomTextfield(
                                                hint:
                                                    'For example call in 30 minutes'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                            child: Text('Confirm',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white)),
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: blueColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(25),
                                                  ),
                                                ),
                                                minimumSize:
                                                    Size(double.infinity, 50)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.directions_run_rounded),
                                Text(
                                  'Instruction for the courier',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width / 3.99,
                            // ),
                            Icon(
                              Icons.expand_more_outlined,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'The courier will buy out the goods, recieve cash or carry out the instruction.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (clickedAdditionalServices == false) {
                            setState(() {
                              clickedAdditionalServices = true;
                            });
                          } else {
                            setState(() {
                              clickedAdditionalServices = false;
                            });
                          }
                        },
                        child: Row(
                          children: [
                            const Text(
                              'Additional services',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      clickedAdditionalServices == true
                          ? SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: CustomTextfieldAdditionalService(
                                      hint: 'Contact person',
                                      inputType: TextInputType.name,
                                      controller: contactPersonController,
                                    ),
                                  ),
                                  SizedBox(
                                    child: CustomTextfieldAdditionalService(
                                      hint: 'Your order number',
                                      inputType: TextInputType.name,
                                      controller: orderNumberController,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      if (widget.index > 0)
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    widget.removePoints(widget.index);
                                    // print(
                                    //     'is schedule chicked :${widget.isScheduleClicked}');
                                  },
                                  child: Text(
                                    'Remove address',
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
