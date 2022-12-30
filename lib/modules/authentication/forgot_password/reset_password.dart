import 'package:flutter/material.dart';

import '../../../widgets/utils.dart';
import '../../constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
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
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your new password.',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: phoneController,
                // initialValue: '+977',
                decoration: InputDecoration(
                  labelText: 'New password',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: blueColor, width: 1)),
                  contentPadding: EdgeInsets.all(8),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter new password.";
                  } else if (phoneController.text.length < 6) {
                    return "Password cannot be less than 6 characters.";
                  }
                },
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: blueColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Utils.showSnackBar(
                          'Your password has been changed successfully.',
                          blueColor,
                          MediaQuery.of(context).size.height - 150);
                      Navigator.pushNamed(context, 'orderScreen');
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
