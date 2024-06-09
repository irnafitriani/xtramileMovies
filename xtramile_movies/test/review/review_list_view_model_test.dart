import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';
import 'package:xtramile_movies/src/modul/review/service/review_service.dart';
import 'package:xtramile_movies/src/modul/review/viewmodel/review_list_view_model.dart';

import '../test_helper.mocks.dart';

void main() {
  final mockReviewService = MockReviewService();
  late ReviewListViewModel reviewListViewModel;
  final GetIt getIt = GetIt.instance;

  setUp(() {
    reviewListViewModel = ReviewListViewModel(mockReviewService);
  });

  setUpAll(() async {
    getIt.reset();
    getIt.registerSingleton<ReviewService>(MockReviewService());
  });

  group(' review list view model test', () {
    test('initial state is correct', () {
      expect(reviewListViewModel.value,
          const ReviewList(id: 0, page: 0, results: [], totalPages: null, totalResults: null));
    });

    test('loadUserReviewList updates state correctly on success', () async {
      final reviewJson = {
        "author": "MovieGuys",
        "author_details": {"name": "", "username": "MovieGuys", "avatar_path": null, "rating": 5.0},
        "content":
            "Under Paris is rather moronic French Jaws wannabe. \r\n\r\nWhilst this production is loaded down with the predictable woke tropes I've come to expect from Netflix productions, what really caught my attention was how idiotically implausible the story is. \r\n\r\nIn the opening scene a group of male divers is tasked with investigating predation at a oceanic rubbish site, that's ensnared dolphins and other dead, sea life.  Sharks soon turn up leading to the presence of a terrifyingly large female shark, the scientific group have been monitoring.Inexplicably the shark has essentially doubled in size, leading their all knowing female boss to ask the divers to take \"a sample\" from the monster for study, rather than following the sane and reasonable path of fleeing in terror. Predictably the shark doesn't take this treatment too well and eats the divers. At this point our intrepid female lead having just witnessed the horrific attacks on monitors, dives into the water, to confront the monster with a spear gun, that would hardly scare a large Tuna. \r\n\r\nWithout spoiling things for those who want to watch this, it doesn't get any better from here on in. Really if you are going to make a film of this kind, is it truly that hard to make it, at least, a little believable? \r\n\r\nThe acting is alright, as are the action sequences but the sense of \"terror\" found in Jaws is largely absent. The key ingredient that drives, what is essentially a monster movie, forward. \r\n\r\nIn summary, sinks beneath its own unbelievable story and  bland exposition. If you really want a oceanic monster film, try Jaws instead.",
        "created_at": "2024-06-06T04:04:11.380Z",
        "id": "6661353b8345e2cf91adcd34",
        "updated_at": "2024-06-06T23:14:48.964Z",
        "url": "https://www.themoviedb.org/review/6661353b8345e2cf91adcd34"
      };
      final reviews = ReviewList(
        id: 1,
        page: 1,
        results: [Review.fromJson(reviewJson)],
        totalPages: 1,
        totalResults: 2,
      );

      when(mockReviewService.fetchUserReviews(any, page: 1)).thenAnswer((_) async => reviews);

      await reviewListViewModel.loadUserReviewList(1, reset: true);

      expect(
        reviewListViewModel.value.results.length,
        reviews.results.length,
      );
      verify(mockReviewService.fetchUserReviews(1, page: 1)).called(1);
    });

    test('loadUserReviewList handles error correctly', () async {
      when(mockReviewService.fetchUserReviews(any, page: anyNamed('page')))
          .thenThrow(Exception('Failed to load reviews'));

      await reviewListViewModel.loadUserReviewList(1, reset: true);

      expect(
        reviewListViewModel.value,
        const ReviewList(
            showLoading: false, id: null, page: 0, results: [], totalPages: null, totalResults: null),
      );
      verify(mockReviewService.fetchUserReviews(1, page: 1)).called(1);
    });

    test('fetchMoreMovies loads additional reviews correctly', () async {
      final firstReviewJson = {
        "author": "MovieGuys",
        "author_details": {"name": "", "username": "MovieGuys", "avatar_path": null, "rating": 5.0},
        "content":
            "Under Paris is rather moronic French Jaws wannabe. \r\n\r\nWhilst this production is loaded down with the predictable woke tropes I've come to expect from Netflix productions, what really caught my attention was how idiotically implausible the story is. \r\n\r\nIn the opening scene a group of male divers is tasked with investigating predation at a oceanic rubbish site, that's ensnared dolphins and other dead, sea life.  Sharks soon turn up leading to the presence of a terrifyingly large female shark, the scientific group have been monitoring.Inexplicably the shark has essentially doubled in size, leading their all knowing female boss to ask the divers to take \"a sample\" from the monster for study, rather than following the sane and reasonable path of fleeing in terror. Predictably the shark doesn't take this treatment too well and eats the divers. At this point our intrepid female lead having just witnessed the horrific attacks on monitors, dives into the water, to confront the monster with a spear gun, that would hardly scare a large Tuna. \r\n\r\nWithout spoiling things for those who want to watch this, it doesn't get any better from here on in. Really if you are going to make a film of this kind, is it truly that hard to make it, at least, a little believable? \r\n\r\nThe acting is alright, as are the action sequences but the sense of \"terror\" found in Jaws is largely absent. The key ingredient that drives, what is essentially a monster movie, forward. \r\n\r\nIn summary, sinks beneath its own unbelievable story and  bland exposition. If you really want a oceanic monster film, try Jaws instead.",
        "created_at": "2024-06-06T04:04:11.380Z",
        "id": "6661353b8345e2cf91adcd34",
        "updated_at": "2024-06-06T23:14:48.964Z",
        "url": "https://www.themoviedb.org/review/6661353b8345e2cf91adcd34"
      };

      final secondReviewJson = {
        "author": "MovieGuys2",
        "author_details": {"name": "", "username": "MovieGuys", "avatar_path": null, "rating": 5.0},
        "content":
            "Under Paris is rather moronic French Jaws wannabe. \r\n\r\nWhilst this production is loaded down with the predictable woke tropes I've come to expect from Netflix productions, what really caught my attention was how idiotically implausible the story is. \r\n\r\nIn the opening scene a group of male divers is tasked with investigating predation at a oceanic rubbish site, that's ensnared dolphins and other dead, sea life.  Sharks soon turn up leading to the presence of a terrifyingly large female shark, the scientific group have been monitoring.Inexplicably the shark has essentially doubled in size, leading their all knowing female boss to ask the divers to take \"a sample\" from the monster for study, rather than following the sane and reasonable path of fleeing in terror. Predictably the shark doesn't take this treatment too well and eats the divers. At this point our intrepid female lead having just witnessed the horrific attacks on monitors, dives into the water, to confront the monster with a spear gun, that would hardly scare a large Tuna. \r\n\r\nWithout spoiling things for those who want to watch this, it doesn't get any better from here on in. Really if you are going to make a film of this kind, is it truly that hard to make it, at least, a little believable? \r\n\r\nThe acting is alright, as are the action sequences but the sense of \"terror\" found in Jaws is largely absent. The key ingredient that drives, what is essentially a monster movie, forward. \r\n\r\nIn summary, sinks beneath its own unbelievable story and  bland exposition. If you really want a oceanic monster film, try Jaws instead.",
        "created_at": "2024-06-06T04:04:11.380Z",
        "id": "6661353b8345e2cf91adcd34",
        "updated_at": "2024-06-06T23:14:48.964Z",
        "url": "https://www.themoviedb.org/review/6661353b8345e2cf91adcd34"
      };
      final firstPageReviews = ReviewList(
        id: 1,
        page: 1,
        results: [Review.fromJson(firstReviewJson)],
        totalPages: 2,
        totalResults: 2,
      );

      final secondPageReviews = ReviewList(
        id: 1,
        page: 2,
        results: [Review.fromJson(secondReviewJson)],
        totalPages: 2,
        totalResults: 2,
      );

      when(mockReviewService.fetchUserReviews(any, page: 1))
          .thenAnswer((_) async => firstPageReviews);
      when(mockReviewService.fetchUserReviews(any, page: 2))
          .thenAnswer((_) async => secondPageReviews);

      await reviewListViewModel.loadUserReviewList(1, reset: true);
      await reviewListViewModel.fetchMoreMovies(1);

      expect(reviewListViewModel.value.totalPages, 2);

      verify(mockReviewService.fetchUserReviews(1, page: 1)).called(1);
      verify(mockReviewService.fetchUserReviews(1, page: 2)).called(1);
    });
  });
}
