import 'package:flutter/material.dart';

import '../../constants.dart';

class deliverBottomSheet extends StatelessWidget {
  const deliverBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.timer,
          color: blueColor,
          size: 30,
        ),
        SizedBox(
          height: 10,
        ),
        const Text(
          'Deliver Now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'We will assign the nearest courier to pick-up and deliver as soon as possible.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text(
              'from ₹ ',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
            const Text(
              '45',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade200,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: blueColor.withOpacity(0.2),
              child: Icon(
                Icons.directions_run_rounded,
                size: 17,
                color: blueColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: blueColor.withOpacity(0.2),
              child: Icon(
                Icons.directions_bike,
                size: 17,
                color: blueColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Delivery by 2-wheelers or public transport.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade200,
        ),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey.shade300,
          child: Icon(
            Icons.scale,
            size: 15,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Up to 20 kg',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade200,
        ),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey.shade300,
          child: Icon(
            Icons.shield_outlined,
            size: 15,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'You can choose insurance amount.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}
