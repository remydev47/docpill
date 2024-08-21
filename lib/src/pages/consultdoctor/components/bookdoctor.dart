import 'package:docpill/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookdoctorScreen extends StatefulWidget {
  const BookdoctorScreen({super.key});

  @override
  State<BookdoctorScreen> createState() => _BookdoctorScreenState();
}

class _BookdoctorScreenState extends State<BookdoctorScreen> {
   bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _doctorAppBar(),
      body: ListView(
        children: [
          _buildDoctorCard(
            imageUrl: R.ASSETS_IMAGES_DOC1_PNG,
            name: 'Dr. Savannah Nguyen',
            specialty: 'General Physician',
            experience: '5 Years Exp',
            rating: 4.5,
            availableNow: true,
            consultationFee: 50.99,
            onBookAppointment: () {
              // Navigate to the appointment booking screen
            },
          ),
          _buildDoctorCard(
            imageUrl: R.ASSETS_IMAGES_DOC2_PNG,
            name: 'Dr. Jhon Smith',
            specialty: 'General Physician',
            experience: '9 Years Exp',
            rating: 4.5,
            availableNow: true,
            consultationFee: 50.99,
            onBookAppointment: () {
              // Navigate to the appointment booking screen
            },
          ),
          _buildDoctorCard(
            imageUrl: R.ASSETS_IMAGES_DOC3_PNG,
            name: 'Dr. Maria Lexa',
            specialty: 'Optician',
            experience: '8 Years Exp',
            rating: 4.5,
            availableNow: true,
            consultationFee: 45.99,
            onBookAppointment: () {
              // Navigate to the appointment booking screen
            },
          ),
           _buildDoctorCard(
            imageUrl: R.ASSETS_IMAGES_DOC4_PNG,
            name: 'Dr. Mesuda Khan',
            specialty: 'General Physician',
            experience: '8 Years Exp',
            rating: 4.5,
            availableNow: true,
            consultationFee: 45.99,
            onBookAppointment: () {
              // Navigate to the appointment booking screen
            },
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _doctorAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => context.go('/consultdoctor'),
      ),
      title: _isSearching
          ? TextField(
              decoration: InputDecoration(
                hintText: 'Search Doctor....',
                border: InputBorder.none,
              ),
              autofocus: true,
            )
          : Text('Book a Doctor'),
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
        ),
        IconButton(
          icon: Badge(
            child: Icon(Icons.shopping_cart),
            label: Text('4'),
          ),
          onPressed: () => context.go('/cart'),
        ),
      ],
    );
  }
  Widget _buildDoctorCard({
    required String imageUrl,
    required String name,
    required String specialty,
    required String experience,
    required double rating,
    required bool availableNow,
    required double consultationFee,
    required VoidCallback onBookAppointment,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(specialty),
                  SizedBox(height: 4.0),
                  Text('$experience (${rating.toString()} Rating)'),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (availableNow)
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      'Available Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                SizedBox(height: 8.0),
                Text('\$${consultationFee.toStringAsFixed(2)}'),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: onBookAppointment,
                  child: Text('Book Appointment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}