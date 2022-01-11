import 'package:akan_mobile/Globals/widgets/password_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String labelText;
  String hintText;
  TextEditingController controller;

  CustomTextField({this.labelText, this.hintText, this.controller});
  @override
  State<CustomTextField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<CustomTextField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildTextFormField(
              textFormEmailField: widget.controller,
              labelText: widget.labelText,
              hintText: widget.hintText,
            ),
          ],
        ));
  }
}

class buildTextFormField extends StatelessWidget {
  const buildTextFormField({
    Key key,
    TextEditingController textFormEmailField,
    String labelText,
    String hintText,
  })  : _textFormEmailField = textFormEmailField,
        _labelText = labelText,
        _hinText = hintText,
        super(key: key);

  final TextEditingController _textFormEmailField;
  final String _labelText;
  final String _hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textFormEmailField,
      validator: (value) =>
          (value ?? '').contains('@') ? null : 'Please fill text',
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: Theme.of(context).textTheme.caption?.copyWith(
            color: Theme.of(context).colorScheme.secondary, fontSize: 16),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        hintText: _hinText,
        hintStyle:
            Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
