import 'package:deliveryapp/modules/constants.dart';
import 'package:deliveryapp/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController(text: '+977');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
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
              'Mobile No',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'OTP will be sent on this number.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextfield(
              hint: 'Phone number',
              controller: phoneController,
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By registering or signing in you acept the ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        TextSpan(
                          text: 'Terms and conditions ',
                          style: TextStyle(
                            color: blueColor,
                            fontSize: 15,
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => print('Terms and conditions'),
                        ),
                        TextSpan(
                          text:
                              'and confirms that you\'ve read and acknowledged the ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(
                            color: blueColor,
                            fontSize: 15,
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => print('Privacy Policy'),
                        ),
                        TextSpan(
                          text: 'of Borzo PVT ltd.',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.shade400,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      minimumSize: Size(65, 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'verifyOtpScreen', arguments: {
                      'phoneNumber': phoneController.text,
                    });
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
