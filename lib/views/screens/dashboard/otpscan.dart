import 'package:flutter/material.dart';
import 'package:oneauth/utilits/db/hive.dart';

import 'package:oneauth/views/screens/dashboard/main_dashboard.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class OtpScannner extends StatefulWidget {
  const OtpScannner({super.key});

  @override
  State<OtpScannner> createState() => _OtpScannnerState();
}

class _OtpScannnerState extends State<OtpScannner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  var bCode;
  QRViewController? controller;
  var storeData = [];

  ////**************************************************************************************** */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getingSaveId() async {
    var d = await HiveDB().fetchUserAccount("myAccount", "list");
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            result == null
                ? Container()
                : Expanded(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bCode[1].split('&')[0].toString()),
                  ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  ///****************************
  ///*  QR code view Creaed
  ///* ************************************************** */
  void _onQRViewCreated(QRViewController controller) async {
    var account;
    var decodeData;
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      setState(() {
        result = scanData;

        print(result!.code);
        bCode = result!.code.toString().split('=');
        account = bCode[0].split('?')[0].split('/')[3].toString();
        print("this test " + account.toString());
        decodeData = bCode[1].split('&')[0].toString();
        var alldecodeed = {"account": account, "key": decodeData};
        HiveDB().sotreUserAccount("myAccount", "list", alldecodeed, context);
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainDashboard()));
    });

    // routing o page main Dashboard
  }
}
