import 'package:deliveryapp/modules/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../widgets/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController(text: '+977 ');
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile No',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'OTP will be sent on this number.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                // initialValue: '+977',
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: blueColor, width: 1)),
                  contentPadding: EdgeInsets.all(8),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Phone number";
                  } else if (phoneController.text.length < 15) {
                    return "Enter valid Phone number";
                  }
                },
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
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Terms and conditions ',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 14,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('Terms and conditions'),
                          ),
                          TextSpan(
                            text:
                                'and confirms that you\'ve read and acknowledged the ',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Privacy Policy ',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 14,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('Privacy Policy'),
                          ),
                          TextSpan(
                            text: 'of Borzo PVT ltd.',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
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
                      if (_formKey.currentState!.validate()) {
                        Utils.showSnackBar('Verify with Otp', blueColor,
                            MediaQuery.of(context).size.height - 100);
                        Navigator.pushNamed(context, 'verifyOtpScreen',
                            arguments: {
                              'phoneNumber': phoneController.text,
                            });
                      } else {
                        Utils.showSnackBar('Invalid phone ', Colors.red,
                            MediaQuery.of(context).size.height - 100);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
