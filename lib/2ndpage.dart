import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/student%20pending%20payment/apiservices.dart';
import 'package:qrcode/student%20pending%20payment/model.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  final selectedIndexes = [];
  bool isCheckSelected = false;

  // List sympotms = [];
  // var isSelected = [false, false];
  // var estateRooms = ["Double Suite", "Family suite"];
  // List falses = [];
  // List items = [];
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // Barcode? barcode;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = true;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: stdpendingpaymnetsjson(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  Stdpendingpaymentsmodel list = snapshot.data;
                  print("this is it yeah ${list.data!.pendingFees!.length}");
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        print(
                            "this is it  damn ${list.data!.pendingFees![index].feeName}");
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Checkbox(
                                  value: selectedIndexes.contains(index),
                                  onChanged: (value) {
                                    isKeyboardShowing = false;
                                    print(isKeyboardShowing);
                                    if (selectedIndexes.contains(index)) {
                                      selectedIndexes.remove(index); // unselect
                                    } else {
                                      isKeyboardShowing = false;
                                      selectedIndexes.add(index); // select
                                    }
                                    setState(() {
                                      isKeyboardShowing = false;
                                    });
                                  },
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.black,
                                ),
                              ],
                            ),
                            TextField(
                              keyboardType: isKeyboardShowing
                                  ? TextInputType.none
                                  : TextInputType.datetime,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                hintText: "Enter Fine amount",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: list.data!.pendingFees!.length,
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
