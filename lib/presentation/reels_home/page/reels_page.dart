import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ulearna/presentation/reels_home/bloc/reels_video_bloc.dart';
import 'package:ulearna/presentation/reels_home/data/repository/reel_video_repo.dart';
import 'package:ulearna/presentation/reels_home/widgets/widgets.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ReelsVideoBloc(reelVideoRepo: ReelVideoRepo());

        WidgetsBinding.instance.addPostFrameCallback((_) {
          bloc.add(ReelsVideoData(page: 1));
        });
        return bloc;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              children: [
                TopBar(
                  title: "Ulerna",
                  profileImageUrl: "",
                  onProfileTap: () {},
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: BlocBuilder<ReelsVideoBloc, ReelsVideoState>(
                    builder: (context, state) {
                      if (state is ReelsVideoLoading && state is! ReelsVideoLoaded) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is ReelVideoError) {
                        return Center(child: Text("Error: ${state.message}"));
                      }

                      if (state is ReelsVideoLoaded) {
                        final videos = state.allReels;
                        return NotificationListener<ScrollNotification>(
                          onNotification: (scrollInfo) {
                            if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200 && state.hasMore) {
                              context.read<ReelsVideoBloc>().add(ReelsVideoData(page: state.currentPage + 1));
                            }
                            return false;
                          },
                          child: ListView.separated(
                            itemCount: videos.length,
                            separatorBuilder: (context, index) => const Divider(),
                            itemBuilder: (context, i) {
                              final video = videos[i];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: ReelCard(
                                  thumbnailUrl: video.thumbCdnUrl,
                                  profileImage: video.user.profilePictureCdn,
                                  username: video.user.username ?? "",
                                  description: video.description ?? "No description",
                                  categoryLabel: video.category.title,
                                  views: video.totalViews,
                                  likes: video.totalLikes,
                                  comments: video.totalComments,
                                ),
                              );
                            },
                          ),
                        );
                      }

                      return const Center(child: Text("No data found"));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
