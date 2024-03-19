import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Date of Birth'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      // Show date picker or custom date selection widget
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: 'Male',
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    // Update selected gender
                  });
                },
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  // Handle registration logic
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
