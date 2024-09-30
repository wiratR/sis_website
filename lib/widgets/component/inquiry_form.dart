import 'package:flutter/material.dart';

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InquiryFormState createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Access the primary color from the app's theme
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header text for Inquiry Form
            Text(
              'Inquiry Form',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor, // Use primary color here
              ),
            ),
            const SizedBox(height: 16.0),
            // Body text for Inquiry Form instructions
            Text(
              'For more information. Please fill out your information. '
              'The staff will contact you back as soon as possible.',
              style: TextStyle(
                fontSize: 16,
                color: primaryColor, // Use primary color here
              ),
            ),
            const SizedBox(height: 24.0),
            // Name Input
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Email Input
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Company Name Input
            TextFormField(
              controller: _companyNameController,
              decoration: InputDecoration(
                labelText: 'Company Name',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your company name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Address Input
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Subject Input
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Message Input
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle:
                    TextStyle(color: primaryColor), // Use primary color here
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primaryColor), // Use primary color here
                ),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process the inquiry
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Inquiry submitted successfully')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Use primary color here
                foregroundColor: Colors.white, // Set text color to white
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyNameController.dispose();
    _addressController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
