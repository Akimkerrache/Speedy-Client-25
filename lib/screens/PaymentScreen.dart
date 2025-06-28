import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../main.dart';
import '../../utils/Colors.dart';
import '../../utils/Common.dart';
import '../../utils/Constants.dart';
import '../../utils/Extensions/AppButtonWidget.dart';
import '../../utils/Extensions/app_common.dart';
import '../utils/Images.dart';

class PaymentScreen extends StatefulWidget {
  final int? amount;

  PaymentScreen({this.amount});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  bool isManualPayment = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    appStore.setLoading(false);
  }

  void _showManualPaymentConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow.withOpacity(0.9),
          contentPadding: EdgeInsets.all(2),
          title: Text(
            "Paiement en ligne",
            style: TextStyle(color: Colors.black),
          ),
          content: Container(
            width: double.maxFinite,
            height: 500,
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('https://payment.speedytdz.com'),
              ),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  javaScriptEnabled: true,
                ),
                android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Fermer",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language.payment,
          style: boldTextStyle(color: appTextPrimaryColorWhite),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isManualPayment = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isManualPayment ? primaryColor : Colors.grey,
                        width: isManualPayment ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          cibCart,
                          width: 60,
                          height: 40,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Paiement CIB / EDAHABIA',
                          style: boldTextStyle(size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Observer(builder: (context) {
            return Visibility(
              visible: appStore.isLoading,
              child: loaderWidget(),
            );
          }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: AppButtonWidget(
          text: language.pay,
          onTap: () {
            if (isManualPayment) {
              _showManualPaymentConfirmationDialog();
            }
          },
        ),
      ),
    );
  }
}