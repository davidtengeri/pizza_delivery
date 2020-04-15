import 'package:flutter/material.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';

class AddressFormDialog extends StatefulWidget {
  @override
  _AddressFormDialogState createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Creates a dialog
    return SimpleDialog(
      title: Container(
        child:
            Text(PizzaDeliveryLocalizations.of(context).addAddressDialogTitle),
        alignment: Alignment.center,
      ),
      contentPadding: EdgeInsets.all(10),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: PizzaDeliveryLocalizations.of(context).city,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return PizzaDeliveryLocalizations.of(context)
                        .mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: PizzaDeliveryLocalizations.of(context).street,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return PizzaDeliveryLocalizations.of(context)
                        .mandatoryField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _houseNumberController,
                decoration: InputDecoration(
                  labelText: PizzaDeliveryLocalizations.of(context).houseNumber,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return PizzaDeliveryLocalizations.of(context)
                        .mandatoryField;
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(PizzaDeliveryLocalizations.of(context).cancel),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop(
                          Address(
                              city: _cityController.value.text,
                              street: _streetController.value.text,
                              houseNumber: _houseNumberController.value.text),
                        );
                      }
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text(PizzaDeliveryLocalizations.of(context).save),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
