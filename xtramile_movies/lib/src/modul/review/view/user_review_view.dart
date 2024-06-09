import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/base_view.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';
import 'package:xtramile_movies/src/modul/review/view/widgets/review_tile.dart';
import 'package:xtramile_movies/src/modul/review/viewmodel/review_list_view_model.dart';

@RoutePage()
class UserReviewView extends ViewModelScreenStfl {
  const UserReviewView(this.movieId, {super.key});
  final int movieId;

  @override
  UserReviewViewState createState() => UserReviewViewState();
}

class UserReviewViewState
    extends ViewModelScreenStflState<UserReviewView, ReviewListViewModel, ReviewList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    viewModel.init(widget.movieId);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      viewModel.fetchMoreMovies(widget.movieId);
    }
  }

  Future<void> _refreshReviewList() async {
    await viewModel.loadUserReviewList(widget.movieId, reset: true);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Reviews'),
      ),
      body: Selector<ReviewList, List<Review>>(
        selector: (_, data) => data.results,
        builder: (context, userReviews, _) {
          return RefreshIndicator(
              onRefresh: _refreshReviewList,
              child: userReviews.isEmpty
                  ? SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - kToolbarHeight,
                        child: const Center(
                          child: Text(
                            "There's no Review yet",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: userReviews.length,
                      itemBuilder: (context, index) {
                        if (index == userReviews.length) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ReviewTile(review: userReviews[index]);
                      },
                    ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
