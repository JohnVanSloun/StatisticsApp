import 'package:flutter/material.dart';

import '../models/form_data.dart';
import '../models/data_collection.dart';

class PopupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final FormData formData = FormData();

  Widget _buildPopupForm(BuildContext context) {
    return AlertDialog(
      title: Text('New Data'),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter a Title';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  formData.title = value;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Categorical X-Axis Data (csv)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please add comma seperated data.';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  formData.xValues = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Quantitative Y-Axis Data (csv)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please add comma seperated data.';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  formData.yValues = value;
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
                    _formKey.currentState!.save();
                    DataCollection.addData(formData);
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit Data'),
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
