import 'package:flutter/material.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/profile/address_card.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';

class ProfileForm extends StatefulWidget {
  final ProfileRepository repository;
  final ProfileModel profile;

  ProfileForm({Key key, this.repository, this.profile}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  // These controllers can be used to get the value entered into the input field
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.name ?? ''));
    _emailController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.email ?? ''));
    _phoneController = TextEditingController.fromValue(
        TextEditingValue(text: widget.profile.phone ?? ''));
  }

  void saveProfile(BuildContext context) async {
    await widget.repository.save(widget.profile);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(PizzaDeliveryLocalizations.of(context).profileSaved),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: PizzaDeliveryLocalizations.of(context).enterYourName,
                labelText: PizzaDeliveryLocalizations.of(context).name,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return PizzaDeliveryLocalizations.of(context).mandatoryField;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: PizzaDeliveryLocalizations.of(context).enterYourEmail,
                labelText: PizzaDeliveryLocalizations.of(context).email,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return PizzaDeliveryLocalizations.of(context).mandatoryField;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: PizzaDeliveryLocalizations.of(context).enterYourPhone,
                labelText: PizzaDeliveryLocalizations.of(context).phone,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return PizzaDeliveryLocalizations.of(context).mandatoryField;
                }
                return null;
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    widget.profile.name = _nameController?.value?.text;
                    widget.profile.email = _emailController?.value?.text;
                    widget.profile.phone = _phoneController?.value?.text;
                    saveProfile(context);
                  }
                },
                child: Text(PizzaDeliveryLocalizations.of(context).save),
              ),
            ),
            if (widget.profile.addresses.length > 0)
              ...widget.profile.addresses
                  .map((address) => AddressCard(address: address))
                  .toList()
          ],
        ),
      ),
    );
  }
}
