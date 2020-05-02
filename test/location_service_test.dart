import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pizza_delivery/location_service.dart';
import 'package:pizza_delivery/profile/profile_repository.dart';

// Create a simple client based on the original HTTP Client
class MockClient extends Mock implements http.Client {}

void main() {
  group('LocationService', () {
    test('looks up the address', () async {
      final client = MockClient();

      var address =
          Address(city: 'Budapest', street: 'Váci út', houseNumber: '12');

      // Define what happens when we call the get method of the client.
      // It will return the given result when the method is called with this specific input.
      when(client.get(
              'https://nominatim.openstreetmap.org/search?format=json&counrty=Hungary&city=Budapest&street=12 Váci út'))
          .thenAnswer((_) async => http.Response(
              '[{"place_id":15976088,"licence":"Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright","osm_type":"node","osm_id":1468818748,"boundingbox":["47.5128019","47.5129019","19.057147","19.057247"],"lat":"47.5128519","lon":"19.057197","display_name":"12, Váci út, Újlipótváros, VI. kerület, Budapest, Közép-Magyarország, 1132, Magyarország","class":"place","type":"house","importance":0.42099999999999993}]',
              200));

      var result = await LocationService.find(address, httpClient: client);

      expect(result.latitude.toDouble(), closeTo(47.5128519, 0.000000001));
      expect(result.longitude.toDouble(), closeTo(19.057197, 0.000000001));
    });
  });
}
