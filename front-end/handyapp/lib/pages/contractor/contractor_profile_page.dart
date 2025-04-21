import 'package:flutter/material.dart';

class ContractorProfilePage extends StatelessWidget {
  const ContractorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contractor Profile'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/profile_placeholder.png'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Name: John Doe',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Location: Syracuse, NY',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Experience: 5 years',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Specialty: Electrical & Plumbing',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Average Rating: 4.7/5',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
