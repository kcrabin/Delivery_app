import 'package:deliveryapp/modules/constants.dart';
import 'package:deliveryapp/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  String phoneNumber = '0000000000';
  bool invalidOTP = true;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      phoneNumber = arguments['phoneNumber'];
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile No ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'OTP will be sent on this $phoneNumber',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.start,
              numberOfFields: 4,
              borderColor: Colors.grey.shade300,
              focusedBorderColor: blueColor,
              styles: [
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
              ],
              showFieldAsBox: false,
              borderWidth: 2.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {},
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                // print('this is typed verification code $verificationCode');
                if (verificationCode != '0000' ||
                    verificationCode.trim().length < 4) {
                  setState(() {
                    invalidOTP = true;
                  });
                } else {
                  setState(() {
                    invalidOTP = false;
                  });
                }
              },
            ),
            invalidOTP == true
                ? Text(
                    'Invalid OTP. Please try again or request a new one',
                    style: TextStyle(color: Colors.red),
                  )
                : SizedBox(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(color: blueColor, fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: blueColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      minimumSize: Size(65, 50)),
                  onPressed: () {
                    if (invalidOTP == false) {
                      Navigator.pushNamed(context, 'orderScreen');
                      Utils.showSnackBar('Registered successfully', blueColor,
                          MediaQuery.of(context).size.height - 150);
                    } else {
                      Utils.showSnackBar('Invalid OTP', Colors.red,
                          MediaQuery.of(context).size.height - 100);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
