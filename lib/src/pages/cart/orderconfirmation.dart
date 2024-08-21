import 'package:docpill/commons/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Orderconfirmation extends StatefulWidget {
  const Orderconfirmation({super.key});

  @override
  State<Orderconfirmation> createState() => _OrderconfirmationState();
}

class _OrderconfirmationState extends State<Orderconfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //lottie
              Lottie.network(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                'https://lottie.host/0ccbfbba-fb2e-4bac-9f4b-2140f62dfeac/YeB0qZ27XK.json',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your order has been confirmed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Your Items has Been placed and Is on its way to being delivered',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Kolors.kPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Track Your order', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Kolors.kWhite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => context.go('/home'),
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
