// Search for titles
import 'package:justwatch_unofficial/justwatch_unofficial.dart';

Future<List<MediaEntry>> search(title) async {
  final results = await JustWatchClient.search(
    title: title,
    country: 'IN',
    language: 'en',
    count: 5,
    bestOnly: false,
  );
  return results;
}

Future<MediaEntry?> movieDetails(movieNodeID) async {
  final details = await JustWatchClient.details(
    nodeId: movieNodeID,
    country: "IN",
    bestOnly: false,
    language: "en",
  );
  return details;
}

Future<Map<String, List<Offer>>> offersForCountries(movieNodeID) {
  final offers = JustWatchClient.offersForCountries(
    nodeId: movieNodeID,
    countries: {'IN', 'US', 'GB', 'DE'},
    language: 'en',
    bestOnly: false,
  );
  return offers;
}

void main() async {
  final results = await search('Avatar The Last Airbender');
  for (var media in results) {
    print('Title: ${media.genres}');
  }

  // final details = await movieDetails('ts83993');
  // for (var genre in details!.genres) {
  //   print('Genre: ${genre.toString()}');
  // }

  // final offers = await offersForCountries('ts83993');
  // print(offers);
}
