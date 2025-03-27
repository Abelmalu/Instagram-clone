import 'dart:math';
import 'package:chapasdk/chapasdk.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        var r = Random();

        const chars =
            'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
        String transactionRef =
            List.generate(10, (index) => chars[r.nextInt(chars.length)]).join();

        ///
        ///
        ///
        ///
        ///
        Chapa.paymentParameters(
          context: context, // context
          publicKey: 'CHAPUBK_TEST-bE5SJ764BOpsws2ARXPvpdYzoMJ9aP2a',
          currency: 'ETB',
          amount: '1',
          email: 'fetan@chapa.co',
          phone: '0900112233',
          firstName: 'Abel',
          nativeCheckout: true,
          lastName: 'Malu',
          txRef: transactionRef,
          title: 'Test Payment',
          desc: 'Text Payment',
          namedRouteFallBack: "",
          showPaymentMethodsOnGridView: true,
          availablePaymentMethods: [
            'mpesa',
            'cbebirr',
            'telebirr',
            'ebirr',
          ],
          onPaymentFinished: (message, reference, amount) {
            Navigator.pop(context);
          },
        );
      },
      child: const Text(
        'Proceed to Pay',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
