import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizza_delivery/location_service.dart';
import 'package:pizza_delivery/sql.dart';
import 'package:quiver/core.dart';
import 'package:sqflite/sqlite_api.dart';

class Address {
  int id;
  String city;
  String street;
  String houseNumber;
  LatLng latLng;

  Address({this.id, this.city, this.street, this.houseNumber, this.latLng});

  @override
  bool operator ==(Object value) =>
      value is Address &&
      value.city == city &&
      value.street == street &&
      value.houseNumber == houseNumber;

  @override
  int get hashCode => hash3(city, street, houseNumber);

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'city': city,
      'street': street,
      'houseNumber': houseNumber,
      'lat': latLng.latitude,
      'lng': latLng.longitude,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}

class ProfileModel {
  int id;
  String name;
  String phone;
  String email;
  List<Address> addresses = [];

  void addAddress(Address address) {
    addresses.add(address);
  }

  void removeAddress(Address address) {
    addresses.remove(address);
  }

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}

class ProfileRepository {
  final Sql sql;

  ProfileRepository({this.sql});

  Future<ProfileModel> load() async {
    ProfileModel model = ProfileModel();

    // Get a reference to the database
    final Database database = await sql.database;

    // Load 1 item from the profile table
    List<Map<String, dynamic>> result =
        await database.query('profile', limit: 1);

    if (result.length > 0) {
      // Grab the data if the Db has anything
      var data = result.first;
      model.id = data['id'];
      model.name = data['name'];
      model.phone = data['phone'];
      model.email = data['email'];

      model.addresses.addAll(await loadAllAddresses(sql));
    }
    return model;
  }

  Future<List<Address>> loadAllAddresses(Sql sql) async {
    final Database database = await sql.database;
    // Load all addresses from the addresses table
    final List<Map<String, dynamic>> result = await database.query(
      'addresses',
      orderBy: 'id DESC',
    );

    // Convert the map to Address object
    return List.generate(result.length, (i) {
      return Address(
        id: result[i]['id'],
        city: result[i]['city'],
        street: result[i]['street'],
        houseNumber: result[i]['houseNumber'],
        latLng: LatLng(result[i]['lat'] ?? SZEGED_LATLNG.latitude,
            result[i]['lng'] ?? SZEGED_LATLNG.longitude),
      );
    });
  }

  Future<void> save(ProfileModel profile) async {
    final Database database = await sql.database;
    // Insert into the database and replace with new content if it is already there
    profile.id = await database.insert('profile', profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    removeAllAddresses();
    profile.addresses.forEach((address) {
      addAddress(address);
    });
  }

  Future<void> addAddress(Address address) async {
    final Database database = await sql.database;
    address.id = await database.insert(
      'addresses',
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeAllAddresses() async {
    final Database database = await sql.database;
    database.delete('addresses');
  }

  Future<void> removeAddress(Address address) async {
    final Database database = await sql.database;
    database.delete(
      'addresses',
      where: 'id = ?',
      whereArgs: [address.id],
    );
  }
}
