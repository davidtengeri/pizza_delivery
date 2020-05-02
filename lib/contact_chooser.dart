import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:pizza_delivery/cart_button.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';

class ContactChooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).chooseContact),
        actions: <Widget>[CartButton()],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: FutureBuilder<Iterable<Contact>>(
            future: ContactsService.getContacts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: snapshot.data.map((contact) {
                    return ListTile(
                      title: Text(contact.displayName),
                      onTap: () {
                        Navigator.pop(context, contact);
                      },
                    );
                  }).toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
