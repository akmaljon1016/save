import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:save/main.dart';

class ImageSave extends StatefulWidget {
  final Box imageBox;

  const ImageSave({Key? key, required this.imageBox}) : super(key: key);

  @override
  State<ImageSave> createState() => _ImageSaveState();
}

class _ImageSaveState extends State<ImageSave> {
  TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Save"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Image url"),
            ),
            MaterialButton(
              onPressed: () {
                imageBox.add(txtController.value.text);
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
