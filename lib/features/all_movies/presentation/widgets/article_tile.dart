import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/movies_list.dart';

class MovieWidget extends StatelessWidget {
  final MoviesListEntity? movies;
  final bool? isRemovable;
  final void Function(MoviesListEntity movies)? onRemove;
  final void Function(MoviesListEntity movies)? onMoviePressed;

  const MovieWidget({
    Key? key,
    this.movies,
    this.onMoviePressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: '$moviesBaseImgUrl${movies!.posterPath}',
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
            ));
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              movies!.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: AutoSizeText(
                  movies!.overview ?? '',
                  maxLines: 3,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                 Icons.star,
                  size: 16,
                    color: Colors.yellow,
                ),
                const SizedBox(width: 4),
                Text(
                  movies!.voteAverage!.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            // Datetime
            Row(
              children: [
                const Text(
                  'Released on:',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  movies!.releaseDate!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onMoviePressed != null) {
      onMoviePressed!(movies!);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(movies!);
    }
  }
}
