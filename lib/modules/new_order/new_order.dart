import 'package:deliveryapp/modules/new_order/widgets/pickup_point.dart';
import 'package:deliveryapp/widgets/custom_toogleswitch.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/utils.dart';
import '../constants.dart';
import 'widgets/delivery_bottomsheet.dart';
import 'widgets/delivery_point.dart';
import 'widgets/package_container.dart';
import 'widgets/payment_container.dart';
import 'widgets/schedule_bottomsheet.dart';
import 'widgets/top_container_button.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({super.key});

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final _formKey = GlobalKey<FormState>();

  PageController _pageController = PageController();

  List<TextEditingController> addressControllers = [];
  List<TextEditingController> timeControllers = [];
  List<TextEditingController> phoneControllers = [];
  List<TextEditingController> contactPersonControllers = [];
  List<TextEditingController> orderNumberControllers = [];

  List<DeliveryPoint> deliveryPoints = [];

  @override
  void initState() {
    super.initState();
    addNewDeliveryPoint(0);
  }

  void clearForm() {
    optimizeRoute = false;
    preferDeliveryBag = false;
    notifyBySMS = true;
    deliveryItemWeight = 'Up to 1 kg';

    deliveryPoints.clear();
    setState(() {
      addNewDeliveryPoint(0);
    });
  }

  void addNewDeliveryPoint(int index) {
    addressControllers.add(TextEditingController());
    timeControllers.add(TextEditingController());
    phoneControllers.add(TextEditingController());
    contactPersonControllers.add(TextEditingController());
    orderNumberControllers.add(TextEditingController());

    deliveryPoints.add(DeliveryPoint(
      controllers: [
        addressControllers[index],
        timeControllers[index],
        phoneControllers[index],
        orderNumberControllers[index],
      ],
      index: index,
      isScheduleClicked: scheduleContainerSelected,
      removePoints: removeDeliveryPoint,
    ));
    setState(() {});
  }

  bool? buyForMe = false;
  bool? cashOnDelivery = false;

  bool clickedAdditionalServices = false;
  bool clickeddeliveryAdditionalServices = false;

  int deliveryTapCount = 1;
  int scheduleTapCount = 0;

  // bool deliveryContainerSelected = true;
  bool scheduleContainerSelected = false;

  String deliveryItemWeight = 'Up to 1 kg';

  bool optimizeRoute = false;
  bool preferDeliveryBag = false;
  bool notifyBySMS = true;

  int index = 1;
  int? currentIndex;

  List<String> parcelWeights = [
    'Up to 1 kg',
    'Up to 5 kg',
    'Up to 10 kg',
    'Up to 15 kg',
    'Up to 20 kg'
  ];

  optimizeRouteToggle(bool newValue1) {
    setState(() {
      optimizeRoute = newValue1;
    });
  }

  deliveryBagToggle(bool newValue2) {
    setState(() {
      preferDeliveryBag = newValue2;
    });
  }

  notifyBySMSToggle(bool newValue3) {
    setState(() {
      notifyBySMS = newValue3;
    });
  }

  removeDeliveryPoint(int index) {
    if (deliveryPoints.length > 1) {
      setState(() {
        deliveryPoints.removeAt(index);
        for (int i = 0; i < deliveryPoints.length; i++) {
          deliveryPoints[i] = DeliveryPoint(
            controllers: deliveryPoints[i].controllers,
            index: i,
            isScheduleClicked: scheduleContainerSelected,
            removePoints: deliveryPoints[i].removePoints,
          );
        }
      });
      addressControllers[index].dispose();
      timeControllers[index].dispose();
      phoneControllers[index].dispose();
      orderNumberControllers[index].dispose();

      addressControllers.removeAt(index);
      timeControllers.removeAt(index);
      phoneControllers.removeAt(index);
      orderNumberControllers.removeAt(index);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "New order",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _formKey.currentState?.reset();
                clearForm();

                setState(() {});
              },
              child: const Text(
                'Clear',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.only(right: 10),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  scheduleContainerSelected = false;

                                  for (int i = 0;
                                      i < deliveryPoints.length;
                                      i++) {
                                    deliveryPoints[i] = DeliveryPoint(
                                      controllers:
                                          deliveryPoints[i].controllers,
                                      index: deliveryPoints[i].index,
                                      isScheduleClicked: false,
                                      removePoints:
                                          deliveryPoints[i].removePoints,
                                    );
                                  }

                                  deliveryTapCount = deliveryTapCount + 1;
                                  scheduleTapCount = 0;
                                });

                                if (scheduleContainerSelected == false &&
                                    deliveryTapCount >= 2) {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.close),
                                                ),
                                              ),
                                              Expanded(
                                                child: PageView.builder(
                                                    controller: _pageController,
                                                    physics:
                                                        AlwaysScrollableScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 2,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index == 0) {
                                                        return deliverBottomSheet();
                                                      } else {
                                                        return ScheduleBottomSheet();
                                                      }
                                                    }),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: SmoothPageIndicator(
                                                  controller: _pageController,
                                                  count: 2,
                                                  effect: ScrollingDotsEffect(
                                                      activeDotScale: 1,
                                                      activeDotColor: blueColor,
                                                      dotColor:
                                                          Colors.grey.shade300,
                                                      dotWidth: 10,
                                                      dotHeight: 10),
                                                  onDotClicked: (index) =>
                                                      _pageController
                                                          .animateToPage(index,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: Text('Confirm',
                                                    style: TextStyle(
                                                        fontSize: 18,
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
                                                    minimumSize: Size(
                                                        double.infinity, 50)),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                }
                              },
                              child: TopContainerButton(
                                iconName: Icons.timer,
                                borderRadiusColor:
                                    scheduleContainerSelected == true
                                        ? Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.5)
                                        : Border.all(
                                            color: Colors.grey.shade200,
                                            width: 1.5),
                                circleAvatarColor:
                                    scheduleContainerSelected == true
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                containerColor:
                                    scheduleContainerSelected == true
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                containerName: 'Deliver Now',
                                iconColor: scheduleContainerSelected == true
                                    ? Colors.grey
                                    : blueColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // deliveryContainerSelected = false;
                                  scheduleContainerSelected = true;

                                  for (int i = 0;
                                      i < deliveryPoints.length;
                                      i++) {
                                    deliveryPoints[i] = DeliveryPoint(
                                      controllers:
                                          deliveryPoints[i].controllers,
                                      index: deliveryPoints[i].index,
                                      isScheduleClicked: true,
                                      removePoints:
                                          deliveryPoints[i].removePoints,
                                    );
                                  }

                                  scheduleTapCount = scheduleTapCount + 1;
                                  deliveryTapCount = 0;
                                });
                                if (scheduleContainerSelected == true &&
                                    scheduleTapCount >= 2) {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          Icon(Icons.close))),
                                              Expanded(
                                                child: PageView.builder(
                                                    controller: _pageController,
                                                    physics:
                                                        AlwaysScrollableScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: 2,
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index == 0) {
                                                        return ScheduleBottomSheet();
                                                      } else {
                                                        return deliverBottomSheet();
                                                      }
                                                    }),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: SmoothPageIndicator(
                                                  controller: _pageController,
                                                  count: 2,
                                                  effect: ScrollingDotsEffect(
                                                      activeDotScale: 1,
                                                      activeDotColor: blueColor,
                                                      dotColor:
                                                          Colors.grey.shade300,
                                                      dotWidth: 10,
                                                      dotHeight: 10),
                                                  onDotClicked: (index) =>
                                                      _pageController
                                                          .animateToPage(index,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                child: Text('Confirm',
                                                    style: TextStyle(
                                                        fontSize: 18,
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
                                                    minimumSize: Size(
                                                        double.infinity, 50)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                }
                              },
                              child: TopContainerButton(
                                iconName: Icons.calendar_month_outlined,
                                borderRadiusColor:
                                    scheduleContainerSelected == false
                                        ? Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.5)
                                        : Border.all(
                                            color: Colors.grey.shade200,
                                            width: 1.5),
                                circleAvatarColor:
                                    scheduleContainerSelected == false
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                containerColor:
                                    scheduleContainerSelected == false
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                containerName: 'Schedule',
                                iconColor: scheduleContainerSelected == false
                                    ? Colors.grey
                                    : blueColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      scheduleContainerSelected == false
                          ? Text(
                              'We will assign the nearest courier to pick-up and deliver as soon as possible.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            )
                          : Text(
                              'We will arrive at each address at specified times.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                      // const Text(
                      //   'and deliver as soon as possible.',
                      //   style: TextStyle(fontSize: 15, color: Colors.grey),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    isDismissible: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Wrap(
                                          runSpacing: 20,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Delivery options',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              title: Text(
                                                'Book a Courier',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              subtitle: Text(
                                                'Hyperlocal is km based tariff. It is the best option for short distance deliveries under 5 km.',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              trailing: Icon(
                                                Icons.done,
                                                color: blueColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'Book a Courier',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
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
                                                'Parcel weight',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      parcelWeights.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setModalState(() {
                                                            deliveryItemWeight =
                                                                parcelWeights[
                                                                    index];
                                                          });
                                                          setState(() {
                                                            deliveryItemWeight =
                                                                parcelWeights[
                                                                    index];
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              parcelWeights[
                                                                  index],
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                            deliveryItemWeight ==
                                                                    parcelWeights[
                                                                        index]
                                                                ? Icon(
                                                                    Icons.done,
                                                                    color:
                                                                        blueColor,
                                                                  )
                                                                : SizedBox(),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ),
                                        );
                                      });
                                    });
                              },
                              child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[200]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      deliveryItemWeight,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Hyperlocal is km based tariff. It is the best Option for short distance deliveries under 5 km.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      PickupPoint(
                          scheduleContainerClicked: scheduleContainerSelected),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: deliveryPoints.length,
                          itemBuilder: ((context, index) {
                            // print("this is inside listview $index");
                            return deliveryPoints[index];
                          })),

                      // const SizedBox(
                      //   height: 15,
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          addNewDeliveryPoint(deliveryPoints.length);
                          // print(currentIndex);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add Delivery Point',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      CustomToogle(
                          text: 'Optimize the route',
                          val: optimizeRoute,
                          onchangedMethod: optimizeRouteToggle),
                      SizedBox(
                        child: Divider(
                          color: Colors.grey.shade300,
                          // indent: 15,
                          thickness: 1,
                        ),
                      ),

                      const Text(
                        'Our algorithm will optimize the route points, ensuring the route is more convenient for the courier and cheaper for you. Use if particular sequence of route points does not matter.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Divider(
                    color: Colors.grey.shade200,
                    thickness: 15,
                  ),
                ),
                // SizedBox(
                //   height: 15,
                // ),
                PackageContainer(),
                SizedBox(
                  child: Divider(
                    color: Colors.grey.shade200,
                    thickness: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Additional Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomToogle(
                          text: 'Prefer Courier with Delivery bag',
                          val: preferDeliveryBag,
                          onchangedMethod: deliveryBagToggle),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomToogle(
                          text: 'Notify recipients by SMS',
                          val: notifyBySMS,
                          onchangedMethod: notifyBySMSToggle),
                    ],
                  ),
                ),
                SizedBox(
                  child: Divider(
                    color: Colors.grey.shade200,
                    thickness: 15,
                  ),
                ),
                PaymentContainer(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Text(
                      '₹ ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Text(
                      '45',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              useRootNavigator: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 15),
                                  child: Wrap(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Delivery Fee',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '₹ 45',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Create order',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 2.5, 50)),
                onPressed: () {
                  Utils.showSnackBar('Your order has been placed successfully',
                      blueColor, MediaQuery.of(context).size.height - 150);
                  Navigator.pushNamed(context, 'orderScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
