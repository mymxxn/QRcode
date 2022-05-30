import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/2ndpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: Qrcode(),
  ));
}

class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  bool flash = true;
  final qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            //   Container(
            // child:
            buildQrView(context),
            //),
            Positioned(bottom: 100, child: buildresult()),
            Positioned(top: 20, child: buildcontrolsbuttons()),
            // SavestdeId.savestdid("${barcode?.code}"),
            //  Positioned(bottom: 40, child: Idnum()),

            barcode != null
                ? mmmm()
                // ?
                // Future.delayed(Duration.zero, () async {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             Secondpage(barcode: barcode!.code)))
                : damn()
          ],
        ),
      ),
    );
  }

  mmmm() {
    print("barcode ${barcode?.code}");
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Secondpage(barcode: barcode!.code)));
    return buildresult();
  }

  dynamic damn() {
    return Text("cfcfcfd");
  }

  Widget buildcontrolsbuttons() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {
                      flash = !flash;
                    });
                  },
                  icon: Icon(
                    flash ? Icons.flash_off : Icons.flash_on,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  icon: FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData != null) {
                        return const Icon(
                          Icons.cameraswitch,
                          size: 20,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ))
            ],
          ),
        ),
      );
  Widget buildresult() => Column(
        children: [
          Text(
            barcode != null ? 'Result: ${barcode!.code}' : "Scan QR Code!",
            maxLines: 3,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewcreated,
        overlay: QrScannerOverlayShape(
          // cutOutSize: MediaQuery.of(context).size.width * 0.5,
          borderWidth: 0,
          borderRadius: 10,
          overlayColor: Colors.white,
        ),
      );
  void onQRViewcreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          print(barcode.code);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Secondpage(
                        barcode: barcode.code,
                      )));
        }));
  }
}

class SavestdeId {
  static SharedPreferences? _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? savestdid(String stdid) {
    print("stdid $stdid");
    // var result = await _preferences?.setString();
    var result = _preferences?.setString("stdid", stdid);
    print("whatever $result");
    return result;
  }

  static getstdid() {
    return _preferences?.getString("stdid");
  }

  static delectstdId() async {
    var result = await _preferences?.remove("stdid");
    print(result);
  }
}
