import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';
import 'package:xtramile_movies/src/modul/review/service/review_service.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/model/network_response_model.dart';

import '../test_helper.mocks.dart';

void main() {
  late ReviewServiceImpl reviewService;
  final mockNetworkService = MockNetworkService();

  setUp(() {
    reviewService = ReviewServiceImpl(mockNetworkService);
  });

  group('fetchReviews', () {
    test('returns review list when the network call is successful', () async {
      const int movieId = 123;
      final Map<String, dynamic> response = {
        "id": 1001311,
        "page": 1,
        "results": [
          {
            "author": "MovieGuys",
            "author_details": {
              "name": "",
              "username": "MovieGuys",
              "avatar_path": null,
              "rating": 5.0
            },
            "content":
                "Under Paris is rather moronic French Jaws wannabe. \r\n\r\nWhilst this production is loaded down with the predictable woke tropes I've come to expect from Netflix productions, what really caught my attention was how idiotically implausible the story is. \r\n\r\nIn the opening scene a group of male divers is tasked with investigating predation at a oceanic rubbish site, that's ensnared dolphins and other dead, sea life.  Sharks soon turn up leading to the presence of a terrifyingly large female shark, the scientific group have been monitoring.Inexplicably the shark has essentially doubled in size, leading their all knowing female boss to ask the divers to take \"a sample\" from the monster for study, rather than following the sane and reasonable path of fleeing in terror. Predictably the shark doesn't take this treatment too well and eats the divers. At this point our intrepid female lead having just witnessed the horrific attacks on monitors, dives into the water, to confront the monster with a spear gun, that would hardly scare a large Tuna. \r\n\r\nWithout spoiling things for those who want to watch this, it doesn't get any better from here on in. Really if you are going to make a film of this kind, is it truly that hard to make it, at least, a little believable? \r\n\r\nThe acting is alright, as are the action sequences but the sense of \"terror\" found in Jaws is largely absent. The key ingredient that drives, what is essentially a monster movie, forward. \r\n\r\nIn summary, sinks beneath its own unbelievable story and  bland exposition. If you really want a oceanic monster film, try Jaws instead.",
            "created_at": "2024-06-06T04:04:11.380Z",
            "id": "6661353b8345e2cf91adcd34",
            "updated_at": "2024-06-06T23:14:48.964Z",
            "url": "https://www.themoviedb.org/review/6661353b8345e2cf91adcd34"
          }
        ],
        "total_pages": 1,
        "total_results": 1
      };

      final _ = NetworkRequest(
        path: '/movie/$movieId/reviews',
        queryParams: {'api_key': EnvironmentConfig.apiKey, 'page': 1},
        type: NetworkRequestType.get,
      );

      when(mockNetworkService.request(any, any))
          .thenAnswer((_) async => NetworkResponse<Map<String, dynamic>>.ok(response));

      final reviewList = await reviewService.fetchUserReviews(movieId);

      expect(reviewList, isA<ReviewList>());
      expect(reviewList!.results.length, 1);
    });

    test('returns null when the network call returns no data', () async {
      const int movieId = 123;

      when(mockNetworkService.request(any, any)).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>.noData('no data available'));

      final reviewList = await reviewService.fetchUserReviews(movieId);

      expect(reviewList, isNull);
    });

    test('throws an exception when the network call throws an error', () async {
      const int movieId = 123;

      when(mockNetworkService.request(any, any)).thenThrow(Exception('Network error'));

      expect(() => reviewService.fetchUserReviews(movieId), throwsException);
    });
  });
}
