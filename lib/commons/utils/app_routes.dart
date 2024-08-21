// ignore_for_file: unused_element
import 'package:docpill/src/auth/views/login_screen.dart';
import 'package:docpill/src/pages/cart/cartpage.dart';
import 'package:docpill/src/pages/cart/orderconfirmation.dart';
import 'package:docpill/src/pages/consultdoctor/components/bookdoctor.dart';
import 'package:docpill/src/pages/consultdoctor/components/doctors_list.dart';
import 'package:docpill/src/pages/consultdoctor/consult_doctorscreen.dart';
import 'package:docpill/src/pages/products/products_page.dart';
import 'package:docpill/src/search/views/search_screen.dart';
import 'package:docpill/src/splashscreen/views/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:docpill/src/entrypoint/views/entrypoint.dart';

import '../../src/notifications/views/notification_page.dart';
import '../../src/onboarding/views/onboarding_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


final GoRouter _router = GoRouter(
   navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Entrypoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewsPage(),
    // ),
    // GoRoute(
    //   path: '/policy',
    //   builder: (context, state) => const PolicyPage(),
    // ),
    // GoRoute(
    //   path: '/verification',
    //   builder: (context, state) => const VerificationPage(),
    // ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/bookdoctor',
      builder: (context, state) => const BookdoctorScreen(),
    ),
    GoRoute(
      path: '/consultdoctor',
      builder: (context, state) => const ConsultDoctorscreen(),
    ),
    GoRoute(
      path: '/orderconfirmation',
      builder: (context, state) => const Orderconfirmation(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) =>  CartPage(),
    ),
    GoRoute(
      path: '/productspage',
      builder: (BuildContext context, GoRouterState state) =>  ProductsPage(),
    ),
    // GoRoute(
    //   path: '/help',
    //   builder: (context, state) => const HelpCenterPage(),
    // ),
    // GoRoute(
    //   path: '/orders',
    //   builder: (context, state) => const OrdersPage(),
    // ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => const RegistrationPage(),
    // ),
    // GoRoute(
    //   path: '/categories',
    //   builder: (context, state) => const CategoriesPage(),
    // ),
    //  GoRoute(
    //   path: '/category',
    //   builder: (context, state) => const CategoryPage(),
    // ),

    // GoRoute(
    //   path: '/addaddress',
    //   builder: (context, state) => const AddAddress(),
    // ),

    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const AddressesListPage(),
    // ),

     GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),

    //  GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),

    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),

    //   GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),

    //   GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),

    // GoRoute(
    //   path: '/product/:id',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final productId = state.pathParameters['id'];
    //     return ProductsPage(productId: productId.toString());
    //   },
    // ),
  ],
);

GoRouter get router => _router;
