import 'dart:convert';
import 'package:http/http.dart' as http;

class OfferPackage {
  final String id;
  final int packageId;
  final String name;
  final String technicalName;
  final String icon;

  OfferPackage({
    required this.id,
    required this.packageId,
    required this.name,
    required this.technicalName,
    required this.icon,
  });

  factory OfferPackage.fromJson(Map<String, dynamic> json) {
    return OfferPackage(
      id: json['id'] as String,
      packageId: json['packageId'] as int,
      name: json['clearName'] as String,
      technicalName: json['technicalName'] as String,
      icon: 'https://images.justwatch.com${json['icon']}',
    );
  }
}

class GenresTranslations {
  final genreList = {
    "eur": {
      "id": "Z2V8MTg=",
      "shortName": "eur",
      "translation": "Made in Europe",
      "slug": "made-in-europe",
    },
    "act": {
      "id": "Z2V8MQ==",
      "shortName": "act",
      "translation": "Action & Adventure",
      "slug": "action-and-adventure",
    },
    "crm": {
      "id": "Z2V8NA==",
      "shortName": "crm",
      "translation": "Crime",
      "slug": "crime",
    },
    "doc": {
      "id": "Z2V8NQ==",
      "shortName": "doc",
      "translation": "Documentary",
      "slug": "documentary",
    },
    "hst": {
      "id": "Z2V8OA==",
      "shortName": "hst",
      "translation": "History",
      "slug": "history",
    },
    "msc": {
      "id": "Z2V8MTE=",
      "shortName": "msc",
      "translation": "Music & Musical",
      "slug": "music-and-musical",
    },
    "rma": {
      "id": "Z2V8MTM=",
      "shortName": "rma",
      "translation": "Romance",
      "slug": "romance",
    },
    "cmy": {
      "id": "Z2V8Mw==",
      "shortName": "cmy",
      "translation": "Comedy",
      "slug": "comedy",
    },
    "drm": {
      "id": "Z2V8Ng==",
      "shortName": "drm",
      "translation": "Drama",
      "slug": "drama",
    },
    "hrr": {
      "id": "Z2V8OQ==",
      "shortName": "hrr",
      "translation": "Horror",
      "slug": "horror",
    },
    "scf": {
      "id": "Z2V8MTQ=",
      "shortName": "scf",
      "translation": "Science-Fiction",
      "slug": "science-fiction",
    },
    "wsn": {
      "id": "Z2V8MTc=",
      "shortName": "wsn",
      "translation": "Western",
      "slug": "western",
    },
    "ani": {
      "id": "Z2V8Mg==",
      "shortName": "ani",
      "translation": "Animation",
      "slug": "animation",
    },
    "fnt": {
      "id": "Z2V8Nw==",
      "shortName": "fnt",
      "translation": "Fantasy",
      "slug": "fantasy",
    },
    "trl": {
      "id": "Z2V8MTI=",
      "shortName": "trl",
      "translation": "Mystery & Thriller",
      "slug": "mystery-and-thriller",
    },
    "spt": {
      "id": "Z2V8MTU=",
      "shortName": "spt",
      "translation": "Sport",
      "slug": "sport",
    },
    "fml": {
      "id": "Z2V8MTA=",
      "shortName": "fml",
      "translation": "Kids & Family",
      "slug": "kids-and-family",
    },
    "war": {
      "id": "Z2V8MTY=",
      "shortName": "war",
      "translation": "War & Military",
      "slug": "war-and-military",
    },
    "rly": {
      "id": "Z2V8MjM=",
      "shortName": "rly",
      "translation": "Reality TV",
      "slug": "reality-tv",
    },
  };
}

class Offer {
  final String id;
  final String monetizationType;
  final String presentationType;
  final String? priceString;
  final double? priceValue;
  final String priceCurrency;
  final double? lastChangeRetailPriceValue;
  final String type;
  final OfferPackage package;
  final String url;
  final int? elementCount;
  final String? availableTo;
  final String? deeplinkRoku;
  final List<String> subtitleLanguages;
  final List<String> videoTechnology;
  final List<String> audioTechnology;
  final List<String> audioLanguages;

  Offer({
    required this.id,
    required this.monetizationType,
    required this.presentationType,
    this.priceString,
    this.priceValue,
    required this.priceCurrency,
    this.lastChangeRetailPriceValue,
    required this.type,
    required this.package,
    required this.url,
    this.elementCount,
    this.availableTo,
    this.deeplinkRoku,
    required this.subtitleLanguages,
    required this.videoTechnology,
    required this.audioTechnology,
    required this.audioLanguages,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] as String,
      monetizationType: json['monetizationType'] as String,
      presentationType: json['presentationType'] as String,
      priceString: json['retailPrice'] as String?,
      priceValue: (json['retailPriceValue'] as num?)?.toDouble(),
      priceCurrency: json['currency'] as String,
      lastChangeRetailPriceValue:
          (json['lastChangeRetailPriceValue'] as num?)?.toDouble(),
      type: json['type'] as String,
      package: OfferPackage.fromJson(json['package'] as Map<String, dynamic>),
      url: json['standardWebURL'] as String,
      elementCount: json['elementCount'] as int?,
      availableTo: json['availableTo'] as String?,
      deeplinkRoku: json['deeplinkRoku'] as String?,
      subtitleLanguages: List<String>.from(json['subtitleLanguages'] ?? []),
      videoTechnology: List<String>.from(json['videoTechnology'] ?? []),
      audioTechnology: List<String>.from(json['audioTechnology'] ?? []),
      audioLanguages: List<String>.from(json['audioLanguages'] ?? []),
    );
  }
}

class Scoring {
  final double? imdbScore;
  final int? imdbVotes;
  final double? tmdbPopularity;
  final double? tmdbScore;
  final int? tomatometer;
  final bool? certifiedFresh;
  final double? jwRating;

  Scoring({
    this.imdbScore,
    this.imdbVotes,
    this.tmdbPopularity,
    this.tmdbScore,
    this.tomatometer,
    this.certifiedFresh,
    this.jwRating,
  });

  factory Scoring.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Scoring();
    return Scoring(
      imdbScore: (json['imdbScore'] as num?)?.toDouble(),
      imdbVotes: json['imdbVotes'] as int?,
      tmdbPopularity: (json['tmdbPopularity'] as num?)?.toDouble(),
      tmdbScore: (json['tmdbScore'] as num?)?.toDouble(),
      tomatometer: json['tomatoMeter'] as int?,
      certifiedFresh: json['certifiedFresh'] as bool?,
      jwRating: (json['jwRating'] as num?)?.toDouble(),
    );
  }
}

class Interactions {
  final int? likes;
  final int? dislikes;

  Interactions({this.likes, this.dislikes});

  factory Interactions.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Interactions();
    return Interactions(
      likes: json['likelistAdditions'] as int?,
      dislikes: json['dislikelistAdditions'] as int?,
    );
  }
}

class StreamingCharts {
  final int rank;
  final String trend;
  final int trendDifference;
  final int topRank;
  final int daysInTop3;
  final int daysInTop10;
  final int daysInTop100;
  final int daysInTop1000;
  final String updated;

  StreamingCharts({
    required this.rank,
    required this.trend,
    required this.trendDifference,
    required this.topRank,
    required this.daysInTop3,
    required this.daysInTop10,
    required this.daysInTop100,
    required this.daysInTop1000,
    required this.updated,
  });

  factory StreamingCharts.fromJson(Map<String, dynamic> json) {
    return StreamingCharts(
      rank: json['rank'] as int,
      trend: json['trend'] as String,
      trendDifference: json['trendDifference'] as int,
      topRank: json['topRank'] as int,
      daysInTop3: json['daysInTop3'] as int,
      daysInTop10: json['daysInTop10'] as int,
      daysInTop100: json['daysInTop100'] as int,
      daysInTop1000: json['daysInTop1000'] as int,
      updated: json['updatedAt'] as String,
    );
  }
}

class MediaEntry {
  final String entryId;
  final int objectId;
  final String objectType;
  final String title;
  final String url;
  final int releaseYear;
  final String releaseDate;
  final int runtimeMinutes;
  final String shortDescription;
  final List<String> genres;
  final String? imdbId;
  final String? tmdbId;
  final String? poster;
  final List<String> backdrops;
  final String? ageCertification;
  final Scoring? scoring;
  final Interactions? interactions;
  final StreamingCharts? streamingCharts;
  final List<Offer> offers;

  MediaEntry({
    required this.entryId,
    required this.objectId,
    required this.objectType,
    required this.title,
    required this.url,
    required this.releaseYear,
    required this.releaseDate,
    required this.runtimeMinutes,
    required this.shortDescription,
    required this.genres,
    this.imdbId,
    this.tmdbId,
    this.poster,
    required this.backdrops,
    this.ageCertification,
    this.scoring,
    this.interactions,
    this.streamingCharts,
    required this.offers,
  });

  factory MediaEntry.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as Map<String, dynamic>;
    final externalIds = content['externalIds'] as Map<String, dynamic>?;
    final offersJson = json['offers'] as List<dynamic>? ?? [];

    StreamingCharts? streamingCharts;
    final chartsEdges = (json['streamingCharts']?['edges'] as List<dynamic>?);
    if (chartsEdges != null && chartsEdges.isNotEmpty) {
      final chartInfo =
          chartsEdges.first['streamingChartInfo'] as Map<String, dynamic>?;
      if (chartInfo != null) {
        streamingCharts = StreamingCharts.fromJson(chartInfo);
      }
    }
    final genreTranslations = GenresTranslations();

    return MediaEntry(
      entryId: json['id'] as String,
      objectId: json['objectId'] as int,
      objectType: json['objectType'] as String,
      title: content['title'] as String,
      url: 'https://justwatch.com${content['fullPath']}',
      releaseYear: content['originalReleaseYear'] as int,
      releaseDate: content['originalReleaseDate'] as String,
      runtimeMinutes: content['runtime'] as int,
      shortDescription: content['shortDescription'] as String,
      genres:
          (content['genres'] as List<dynamic>)
              .map<String>(
                (g) =>
                    genreTranslations
                        .genreList[g['shortName']]?['translation'] ??
                    '',
              )
              .toList(),
      imdbId: externalIds?['imdbId'] as String?,
      tmdbId: externalIds?['tmdbId'] as String?,
      poster:
          content['posterUrl'] != null
              ? 'https://images.justwatch.com${content['posterUrl']}'
              : null,
      backdrops:
          (content['backdrops'] as List<dynamic>)
              .map<String>(
                (b) => 'https://images.justwatch.com${b['backdropUrl']}',
              )
              .toList(),
      ageCertification: content['ageCertification'] as String?,
      scoring: Scoring.fromJson(content['scoring'] as Map<String, dynamic>?),
      interactions: Interactions.fromJson(
        content['interactions'] as Map<String, dynamic>?,
      ),
      streamingCharts: streamingCharts,
      offers:
          offersJson
              .map((o) => Offer.fromJson(o as Map<String, dynamic>))
              .toList(),
    );
  }
}

class JustWatchClient {
  static const _graphqlApiUrl = 'https://apis.justwatch.com/graphql';

  static const _graphqlSearchQuery = r'''
query GetSearchTitles(
  $searchTitlesFilter: TitleFilter!,
  $country: Country!,
  $language: Language!,
  $first: Int!,
  $formatPoster: ImageFormat,
  $formatOfferIcon: ImageFormat,
  $profile: PosterProfile,
  $backdropProfile: BackdropProfile,
  $filter: OfferFilter!,
) {
  popularTitles(
    country: $country
    filter: $searchTitlesFilter
    first: $first
    sortBy: POPULAR
    sortRandomSeed: 0
  ) {
    edges {
      node {
        ...TitleDetails
        __typename
      }
      __typename
    }
    __typename
  }
}''';

  static const _graphqlDetailsFragment = r'''
fragment TitleDetails on MovieOrShow {
  id
  objectId
  objectType
  content(country: $country, language: $language) {
    title
    fullPath
    originalReleaseYear
    originalReleaseDate
    runtime
    shortDescription
    genres {
      shortName
      __typename
    }
    externalIds {
      imdbId
      tmdbId
      __typename
    }
    posterUrl(profile: $profile, format: $formatPoster)
    backdrops(profile: $backdropProfile, format: $formatPoster) {
      backdropUrl
      __typename
    }
    ageCertification
    scoring {
      imdbScore
      imdbVotes
      tmdbPopularity
      tmdbScore
      tomatoMeter
      certifiedFresh
      jwRating
      __typename
    }
    interactions {
      likelistAdditions
      dislikelistAdditions
      __typename
    }
    __typename
  }
  streamingCharts(country: $country) {
    edges {
      streamingChartInfo {
        rank
        trend
        trendDifference
        daysInTop3
        daysInTop10
        daysInTop100
        daysInTop1000
        topRank
        updatedAt
        __typename
      }
      __typename
    }
    __typename
  }
  offers(country: $country, platform: WEB, filter: $filter) {
    ...TitleOffer
  }
  __typename
}''';

  static const _graphqlOfferFragment = r'''
fragment TitleOffer on Offer {
  id
  monetizationType
  presentationType
  retailPrice(language: $language)
  retailPriceValue
  currency
  lastChangeRetailPriceValue
  type
  package {
    id
    packageId
    clearName
    technicalName
    icon(profile: S100, format: $formatOfferIcon)
    __typename
  }
  standardWebURL
  elementCount
  availableTo
  deeplinkRoku: deeplinkURL(platform: ROKU_OS)
  subtitleLanguages
  videoTechnology
  audioTechnology
  audioLanguages
  __typename
}''';

  static Map<String, dynamic> prepareSearchRequest(
    String title,
    String country,
    String language,
    int count,
    bool bestOnly,
  ) {
    _assertCountryCodeIsValid(country);
    return {
      'operationName': 'GetSearchTitles',
      'variables': {
        'first': count,
        'searchTitlesFilter': {'searchQuery': title},
        'language': language,
        'country': country.toUpperCase(),
        'formatPoster': 'JPG',
        'formatOfferIcon': 'PNG',
        'profile': 'S718',
        'backdropProfile': 'S1920',
        'filter': {'bestOnly': bestOnly},
      },
      'query':
          _graphqlSearchQuery + _graphqlDetailsFragment + _graphqlOfferFragment,
    };
  }

  static List<MediaEntry> parseSearchResponse(Map<String, dynamic> json) {
    final edges =
        (json['data']?['popularTitles']?['edges'] as List<dynamic>? ?? []);
    return edges
        .map(
          (edge) => MediaEntry.fromJson(edge['node'] as Map<String, dynamic>),
        )
        .toList();
  }

  static Map<String, dynamic> prepareDetailsRequest(
    String nodeId,
    String country,
    String language,
    bool bestOnly,
  ) {
    _assertCountryCodeIsValid(country);
    return {
      'operationName': 'GetTitleNode',
      'variables': {
        'nodeId': nodeId,
        'language': language,
        'country': country.toUpperCase(),
        'formatPoster': 'JPG',
        'formatOfferIcon': 'PNG',
        'profile': 'S718',
        'backdropProfile': 'S1920',
        'filter': {'bestOnly': bestOnly},
      },
      'query':
          _graphqlDetailsQuery +
          _graphqlDetailsFragment +
          _graphqlOfferFragment,
    };
  }

  static MediaEntry? parseDetailsResponse(Map<String, dynamic> json) {
    if (json.containsKey('errors')) return null;
    return MediaEntry.fromJson(json['data']?['node'] as Map<String, dynamic>);
  }

  static Map<String, dynamic> prepareOffersForCountriesRequest(
    String nodeId,
    Set<String> countries,
    String language,
    bool bestOnly,
  ) {
    assert(
      countries.isNotEmpty,
      'Cannot prepare offers request without specified countries',
    );
    for (final country in countries) {
      _assertCountryCodeIsValid(country);
    }
    return {
      'operationName': 'GetTitleOffers',
      'variables': {
        'nodeId': nodeId,
        'language': language,
        'formatPoster': 'JPG',
        'formatOfferIcon': 'PNG',
        'profile': 'S718',
        'backdropProfile': 'S1920',
        'filter': {'bestOnly': bestOnly},
      },
      'query': _prepareOffersForCountriesQuery(countries),
    };
  }

  static Map<String, List<Offer>> parseOffersForCountriesResponse(
    Map<String, dynamic> json,
    Set<String> countries,
  ) {
    final offersNode = json['data']?['node'] as Map<String, dynamic>? ?? {};
    return Map.fromEntries(
      countries.map((country) {
        final countryKey = country.toUpperCase();
        final offers =
            (offersNode[countryKey] as List<dynamic>? ?? [])
                .map((o) => Offer.fromJson(o as Map<String, dynamic>))
                .toList();
        return MapEntry(country, offers);
      }),
    );
  }

  static Future<List<MediaEntry>> search({
    required String title,
    String country = 'US',
    String language = 'en',
    int count = 4,
    bool bestOnly = true,
  }) async {
    final request = prepareSearchRequest(
      title,
      country,
      language,
      count,
      bestOnly,
    );
    final response = await http.post(
      Uri.parse(_graphqlApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request),
    );
    if (response.statusCode != 200) {
      throw Exception('Request failed: ${response.statusCode}');
    }
    return parseSearchResponse(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  static Future<MediaEntry?> details({
    required String nodeId,
    String country = 'US',
    String language = 'en',
    bool bestOnly = true,
  }) async {
    final request = prepareDetailsRequest(nodeId, country, language, bestOnly);
    final response = await http.post(
      Uri.parse(_graphqlApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request),
    );
    if (response.statusCode != 200) {
      throw Exception('Request failed: ${response.statusCode}');
    }
    return parseDetailsResponse(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  static Future<Map<String, List<Offer>>> offersForCountries({
    required String nodeId,
    required Set<String> countries,
    String language = 'en',
    bool bestOnly = true,
  }) async {
    if (countries.isEmpty) return {};
    final request = prepareOffersForCountriesRequest(
      nodeId,
      countries,
      language,
      bestOnly,
    );
    final response = await http.post(
      Uri.parse(_graphqlApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request),
    );
    if (response.statusCode != 200) {
      throw Exception('Request failed: ${response.statusCode}');
    }
    return parseOffersForCountriesResponse(
      jsonDecode(response.body) as Map<String, dynamic>,
      countries,
    );
  }

  static const _graphqlDetailsQuery = r'''
query GetTitleNode(
  $nodeId: ID!,
  $language: Language!,
  $country: Country!,
  $formatPoster: ImageFormat,
  $formatOfferIcon: ImageFormat,
  $profile: PosterProfile,
  $backdropProfile: BackdropProfile,
  $filter: OfferFilter!,
) {
  node(id: $nodeId) {
    ...TitleDetails
    __typename
  }
  __typename
}''';

  static String _prepareOffersForCountriesQuery(Set<String> countries) {
    final entries = countries
        .map((c) {
          final code = c.toUpperCase();
          return '''
        $code: offers(country: $code, platform: WEB, filter: \$filter) {
          ...TitleOffer
          __typename
        }''';
        })
        .join('\n');

    return '''
query GetTitleOffers(
  \$nodeId: ID!,
  \$language: Language!,
  \$formatOfferIcon: ImageFormat,
  \$filter: OfferFilter!,
) {
  node(id: \$nodeId) {
    ... on MovieOrShow {
$entries
      __typename
    }
    __typename
  }
  __typename
}
$_graphqlOfferFragment''';
  }

  static void _assertCountryCodeIsValid(String code) {
    if (code.length != 2) {
      throw ArgumentError(
        'Invalid country code: $code, must be 2 characters long',
      );
    }
  }
}
