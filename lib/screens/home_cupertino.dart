import 'package:flutter/cupertino.dart';

class HomeCupertino extends StatefulWidget {
  const HomeCupertino({super.key});

  @override
  State<HomeCupertino> createState() => _HomeCupertinoState();
}

class _HomeCupertinoState extends State<HomeCupertino> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Form Demo')),
        child: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CupertinoTextField(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    placeholder: 'Enter some text',
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: CupertinoButton(
                          child: Text('Submit'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showDialog();
                            }
                          }))
                ],
              )),
        ));
  }

  _showDialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Hello'),
                content: const Text('Submitting form'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Dismiss'),
                    onPressed: () {
                      Navigator.pop(context, 'Dismiss');
                    },
                  )
                ]));
  }
}
