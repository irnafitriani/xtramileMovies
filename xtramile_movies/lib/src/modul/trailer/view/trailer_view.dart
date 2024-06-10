import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramile_movies/src/base_class/base_view.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';
import 'package:xtramile_movies/src/modul/trailer/viewmodel/trailer_view_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

@RoutePage()
class TrailerView extends ViewModelScreenStfl {
  const TrailerView(this.videoIds, this.movieTitle, {super.key});
  final List<String> videoIds;
  final String movieTitle;

  @override
  TrailerViewState createState() => TrailerViewState();
}

class TrailerViewState
    extends ViewModelScreenStflState<TrailerView, TrailerViewModel, TrailerList> {
  late final List<YoutubePlayerController> _controllers;
  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.videoIds.length,
      (index) => YoutubePlayerController.fromVideoId(
        videoId: widget.videoIds[index],
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: false),
      ),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieTitle),
      ),
      body: widget.videoIds.isEmpty
          ? const Center(
              child: Text(
                "No trailer yet",
                style: TextStyle(fontSize: 16.0),
              ),
            )
          : Selector<TrailerList, List<Trailer>>(
              selector: (_, data) => data.results,
              builder: (context, trailers, _) {
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    final controller = _controllers[index];

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: YoutubePlayer(
                          key: ObjectKey(controller),
                          aspectRatio: 16 / 9,
                          enableFullScreenOnVerticalDrag: false,
                          controller: controller
                            ..setFullScreenListener(
                              (_) async {
                                final videoData = await controller.videoData;
                                final startSeconds = await controller.currentTime;

                                final currentTime = await FullscreenYoutubePlayer.launch(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  videoId: videoData.videoId,
                                  startSeconds: startSeconds,
                                );

                                if (currentTime != null) {
                                  controller.seekTo(seconds: currentTime);
                                }
                              },
                            ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(height: 16),
                );
              },
            ),
    );
  }
}
