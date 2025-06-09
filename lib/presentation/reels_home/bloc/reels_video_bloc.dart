import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ulearna/presentation/reels_home/data/models/reel_video_response_model.dart';
import 'package:ulearna/presentation/reels_home/data/repository/reel_video_repo.dart';

part 'reels_video_event.dart';
part 'reels_video_state.dart';

class ReelsVideoBloc extends Bloc<ReelsVideoEvent, ReelsVideoState> {
  final ReelVideoRepo reelVideoRepo;
  int currentPage = 1;
  bool hasMore = true;
  bool isFetching = false;
  List<Reel> allReels = [];

  ReelsVideoBloc({required this.reelVideoRepo}) : super(ReelsVideoInitial()) {
    on<ReelsVideoData>(_getReelsVideos);
  }

  Future<void> _getReelsVideos(ReelsVideoData event, Emitter<ReelsVideoState> emit) async {
    if (isFetching || !hasMore) return;

    isFetching = true;

    if (event.page == 1) {
      emit(ReelsVideoLoading());
      allReels.clear();
    }

    try {
      final response = await reelVideoRepo.getReelVideo(page: event.page);
      final newReels = response?.reelsdata.data ?? [];

      allReels.addAll(newReels);
      currentPage = event.page;
      hasMore = newReels.isNotEmpty;

      emit(ReelsVideoLoaded(
        response: response!,
        allReels: List<Reel>.from(allReels),
        currentPage: currentPage,
        hasMore: hasMore,
      ));
    } catch (e) {
      emit(ReelVideoError(e.toString()));
    } finally {
      isFetching = false;
    }
  }
}
