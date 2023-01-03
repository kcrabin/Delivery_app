import 'package:flutter/material.dart';

class ServiceInformation extends StatefulWidget {
  const ServiceInformation({super.key});
  @override
  State<ServiceInformation> createState() => _ServiceInformationState();
}

class _ServiceInformationState extends State<ServiceInformation> {
  List generalInfo = [
    'Courier waiting period at addresses',
    'Wish to contact us?',
    'Do you need a report for your management?',
    'Please note',
  ];
  List normalText = [
    'Waiting period up to 15 minutes is free of charge. Next each additional 15 minutes will be charged at Rs 50',
    'Our Live Chat Support will be happy to answer your queries.',
    'The courier will not leave receipts for orders paid in cash. You can view your order history in your profile. You can print it out and fill in the route details (the courier will sign it).',
    'You must provide the receipt signed by the courier to claim for a refund from Brozo.in',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'General information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: generalInfo.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    generalInfo[index],
                    style: titleStyle(),
                  ),
                ),
                Text(
                  normalText[index],
                  style: textStyle(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 12,
    );
  }
}
