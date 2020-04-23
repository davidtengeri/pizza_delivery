import 'package:flutter/material.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/location_service.dart';
import 'package:pizza_delivery/profile/address_form_dialog.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';
import 'package:provider/provider.dart';

// Manages the address creation
class AddAddressButton extends StatelessWidget {
  final Function onAddressSaved;

  AddAddressButton({Key key, @required this.onAddressSaved}) : super(key: key);

  Future<void> _addAddress(BuildContext context) async {
    var address = await showDialog<Address>(
      context: context,
      builder: (BuildContext context) => AddressFormDialog(),
    );
    if (address != null) {
      // Get the repository through Provider
      var repository = Provider.of<ProfileRepository>(context, listen: false);
      // Get the latitude and longitude values for that address
      address.latLng = await LocationService.find(address);
      // Save the address into the DB
      await repository.addAddress(address);
      // Call the callback
      await onAddressSaved();
      // Show info to the user
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(PizzaDeliveryLocalizations.of(context).addressSaved),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _addAddress(context);
      },
      child: Icon(Icons.add),
    );
  }
}
