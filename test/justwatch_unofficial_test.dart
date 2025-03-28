import 'package:justwatch_unofficial/justwatch_unofficial.dart';

Future<Map<String, Object?>> main() async {
  final results = await JustWatchClient.search(
    title: 'Avatar The Last Airbender',
  );

  // Get details for a specific title
  final details = await JustWatchClient.details(nodeId: 'ts83993');

  // Get offers for multiple countries
  final offers = await JustWatchClient.offersForCountries(
    nodeId: 'ts83993',
    countries: {'IN', 'US', 'GB', 'DE'},
  );

  return {'results': results, 'details': details, 'offers': offers};
}
