import 'package:flutter/material.dart';

import '../models/user.dart';

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'First Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _user.firstName = val!)),
                        TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Last Name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                            onSaved: (val) =>
                                setState(() => _user.lastName = val!)),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: const Text('Subscribe')),
                        SwitchListTile(
                          title: const Text('Monthly Newsletter'),
                          value: _user.newsletter,
                          onChanged: (bool value) {
                            setState(() => _user.newsletter = value);
                          },
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: const Text('Interests')),
                        CheckboxListTile(
                            title: const Text('Cooking'),
                            value: _user.passions[User.PassionCooking],
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  _user.passions[User.PassionCooking] = value;
                                }
                              });
                            }),
                        CheckboxListTile(
                            title: const Text('Hiking'),
                            value: _user.passions[User.PassionHiking],
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  _user.passions[User.PassionHiking] = value;
                                }
                              });
                            }),
                        CheckboxListTile(
                            title: const Text('Traveling'),
                            value: _user.passions[User.PassionTraveling],
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  _user.passions[User.PassionTraveling] = value;
                                }
                              });
                            }),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form!.validate()) {
                                form.save();
                                _user.save();
                                _showDialog();
                              }
                            },
                            child: Text('Save'),
                          ),
                        )
                      ],
                    ))),
          ),
        ));
  }

  _showDialog() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Submitting form")));
  }
}
