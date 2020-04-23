import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_delivery/cart_button.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/profile/add_address_button.dart';
import 'package:pizza_delivery/profile/profile_form.dart';
import 'package:pizza_delivery/profile/profile_picture.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileRepository repository;

  ProfileScreen({Key key, this.repository}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel _profile;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    var loadedProfile = await widget.repository.load();
    setState(() {
      _profile = loadedProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaDeliveryLocalizations.of(context).profileTitle),
        actions: <Widget>[CartButton()],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ProfilePicture(),
            if (_profile != null)
              Expanded(
                child: ProfileForm(
                  repository: widget.repository,
                  profile: _profile,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: AddAddressButton(
        onAddressSaved: loadProfile,
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileRepository>(
      builder: (context, repository, child) =>
          ProfileScreen(repository: repository),
    );
  }
}
