import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield.dart';

class PackageContainer extends StatefulWidget {
  PackageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<PackageContainer> createState() => _PackageContainerState();
}

class _PackageContainerState extends State<PackageContainer> {
  TextEditingController goodsController = TextEditingController();

  List<String> items = [
    'Documents',
    'Goods',
    'Cloth',
    'Groceries',
    'Flower',
    'Cake'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Package',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(
            hint: 'What are you sending?',
            controller: goodsController,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            // width: 200,
            height: 40,
            child: ListView.builder(
                // itemExtent: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        goodsController.text = items[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Text(
                          items[index],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(
            hint: 'Parcel value',
            inputType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'We will compensate he value of lost items within three working days according to the rules. Maximum compensation - 50,000',
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfield(hint: 'Your phone'),
        ],
      ),
    );
  }
}
