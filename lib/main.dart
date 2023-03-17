import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:save/image_save.dart';

late Box imageBox;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  imageBox = await Hive.openBox<String>("imageBox");
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: ValueListenableBuilder(
          valueListenable: imageBox.listenable(),
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: imageBox.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image.network(imageBox.getAt(index)),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSave(imageBox: imageBox)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
