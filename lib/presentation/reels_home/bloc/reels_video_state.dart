part of 'reels_video_bloc.dart';

@immutable
sealed class ReelsVideoState {}

final class ReelsVideoInitial extends ReelsVideoState {}

class ReelsVideoLoading extends ReelsVideoState {}

class ReelsVideoLoaded extends ReelsVideoState {
  final ReelVideoResponse response;
  final List<Reel> allReels;
  final int currentPage;
  final bool hasMore;

  ReelsVideoLoaded({
    required this.response,
    required this.allReels,
    required this.currentPage,
    required this.hasMore,
  });
}

class ReelVideoError extends ReelsVideoState {
  final String message;

  ReelVideoError(this.message);
}
