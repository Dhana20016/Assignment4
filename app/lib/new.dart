import 'package:flutter/material.dart';
import 'dashboard.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Learning English...',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DashboardScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: StadiumBorder(),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DashboardScreen()));
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: StadiumBorder(),
                ),
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
