import 'package:flutter/material.dart';

class PopupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PopupForm();

  Widget _buildPopupForm(BuildContext context) {
    return AlertDialog(
      title: Text('New Data'),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupForm(context));
      },
    );
  }
}
