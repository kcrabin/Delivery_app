import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class ReportProblem extends StatefulWidget {
  const ReportProblem({super.key});

  @override
  State<ReportProblem> createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  TextEditingController reportController = TextEditingController();
  String issueType = 'Technical issue';

  final imagePicker = ImagePicker();
  bool hasReport = false;

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Report an issue',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: SizedBox(
                            child: Wrap(
                              spacing: MediaQuery.of(context).size.width,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      issueType = 'Technical issue';
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Technical issue',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      issueType = 'Other';
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Other',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      issueType,
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade300,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: reportController,
                maxLines: 7,
                decoration: InputDecoration(
                  errorText: hasReport == false
                      ? 'Please describe the problem to help us solve faster.'
                      : null,
                  hintText: 'Tell us what happened',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: blueColor, width: 1)),
                  contentPadding: EdgeInsets.all(8),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      hasReport = false;
                    });
                  } else {
                    setState(() {
                      hasReport = true;
                    });
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Do you want to upload a screenshot?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              // file == '' || file == null
              //     ?
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectImages();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.upload,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Upload'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 3),
                  itemCount: imageFileList!.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  imageFileList!.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.redAccent,
                              )),
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Text('Submit',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: blueColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                minimumSize: Size(double.infinity, 50)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}