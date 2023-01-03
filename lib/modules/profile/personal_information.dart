import 'package:deliveryapp/widgets/custom_textfieldAdditionalService.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController surnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    surnameController.text = 'kc';
    firstnameController.text = 'Rabin';
    middlenameController.text = '';
    emailController.text = 'test@gmail.com';

    super.initState();
  }

  @override
  void dispose() {
    surnameController.dispose();
    firstnameController.dispose();
    middlenameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
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
        title: Text(
          'Personal details',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(children: [
          CustomTextfieldAdditionalService(
            hint: 'Surname',
            controller: surnameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfieldAdditionalService(
            hint: 'First name',
            controller: firstnameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfieldAdditionalService(
            hint: 'Middle name',
            controller: middlenameController,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextfieldAdditionalService(
            hint: 'Email for authorization',
            controller: emailController,
          ),
        ]),
      ),
    );
  }
}
