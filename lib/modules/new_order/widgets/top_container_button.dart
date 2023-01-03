import 'package:flutter/material.dart';

class TopContainerButton extends StatelessWidget {
  Color containerColor;
  BoxBorder borderRadiusColor;
  Color iconColor;
  Color circleAvatarColor;
  IconData iconName;

  String containerName;

  TopContainerButton(
      {Key? key,
      required this.borderRadiusColor,
      required this.circleAvatarColor,
      required this.containerColor,
      required this.containerName,
      required this.iconName,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: containerColor,
        border: borderRadiusColor,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconName,
            color: iconColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            containerName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Row(
            children: [
              const Text(
                'from ₹ ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Text(
                '45',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 3,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: circleAvatarColor,
                  child: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 12,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
