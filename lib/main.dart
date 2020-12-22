import 'package:barcode_scanner_example/page/barcode_create_page.dart';
import 'package:barcode_scanner_example/page/barcode_scan_page.dart';
import 'package:barcode_scanner_example/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Barcode Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Create Barcode',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BarcodeCreatePage(),
                )),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                text: 'Scan Barcode',
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BarcodeScanPage(),
                )),
              ),
            ],
          ),
        ),
      );
}
