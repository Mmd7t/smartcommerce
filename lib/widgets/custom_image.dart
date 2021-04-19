import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'logo.dart';

cachedNetworkImage(String mediaUrl,
    {width = 200.0,
    height = 150.0,
    radius: 0.0,
    topOnly: false,
    boxFit: BoxFit.cover}) {
  if (!mediaUrl.contains("https") && mediaUrl.contains("http")) {
    mediaUrl = mediaUrl.replaceAll("http", "https");
  } else if (!mediaUrl.contains("https") || mediaUrl != "") {
    mediaUrl = Constants.imageURL + mediaUrl;
  }
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomRight: topOnly ? Radius.circular(0) : Radius.circular(radius),
      bottomLeft: topOnly ? Radius.circular(0) : Radius.circular(radius),
    ),
    child: SizedBox(
      width: width,
      height: height,
      child: mediaUrl.contains(".svg")
          ? SvgPicture.network(
              mediaUrl,
              width: width,
              height: height,
              fit: boxFit,
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(20.0),
                child: circularProgress(context),
              ),
            )
          : CachedNetworkImage(
              fit: boxFit,
              imageUrl: mediaUrl,
              width: width,
              height: height,
              fadeInDuration: Duration(seconds: 1),
              placeholder: (context, url) {
                return Center(
                  child: circularProgress(context),
                );
              },
              errorWidget: (context, url, error) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/logo.jpeg"),
                );
              },
            ),
    ),
  );
}

nonCachedNetworkImage(String mediaUrl,
    {width = 200.0,
    height = 150.0,
    radius: 0.0,
    topOnly: false,
    boxFit: BoxFit.cover}) {
  if (!mediaUrl.contains("http") && mediaUrl != "") {
    mediaUrl = Constants.imageURL + mediaUrl;
  }
  print(mediaUrl);
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomRight: topOnly ? Radius.circular(0) : Radius.circular(radius),
      bottomLeft: topOnly ? Radius.circular(0) : Radius.circular(radius),
    ),
    child: SizedBox(
      width: width,
      height: height,
      child: mediaUrl.contains(".svg")
          ? SvgPicture.network(
              mediaUrl,
              width: width,
              height: height,
              fit: boxFit,
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(20.0),
                child: circularProgress(context),
              ),
            )
          : CachedNetworkImage(
              imageUrl: mediaUrl,
              fit: boxFit,
              width: width,
              height: height,
              placeholder: (context, url) {
                return Center(
                  child: circularProgress(context),
                );
              },
              errorWidget: (context, url, error) {
                return Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            ),
    ),
  );
}

cachedNetworkImageProvider(String mediaUrl, {width = 200.0, height = 150.0}) {
  if (!mediaUrl.contains("https") && mediaUrl.contains("http")) {
    mediaUrl = mediaUrl.replaceAll("http", "https");
  } else if (!mediaUrl.contains("https") || mediaUrl != "") {
    mediaUrl = Constants.imageURL + mediaUrl;
  } else {
    mediaUrl = mediaUrl.replaceAll("http", "https");
  }
  return CachedNetworkImageProvider(
    mediaUrl,
  );
}

itemImage(mediaUrl,
    {width = 200.0,
    height = 150.0,
    radius: 0.0,
    topOnly: false,
    fit: BoxFit.cover}) {
  if (!mediaUrl.contains("http") && mediaUrl != "") {
    mediaUrl = Constants.imageURL + mediaUrl;
  }
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomRight: topOnly ? Radius.circular(0) : Radius.circular(radius),
      bottomLeft: topOnly ? Radius.circular(0) : Radius.circular(radius),
    ),
    child: SizedBox(
      width: width,
      height: height,
      child: mediaUrl.contains(".svg")
          ? SvgPicture.network(
              mediaUrl,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(20.0),
                child: circularProgress(context),
              ),
            )
          : CachedNetworkImage(
              fit: fit,
              imageUrl: mediaUrl,
              width: width,
              height: height,
              placeholder: (context, url) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      linearProgress(),
                      Expanded(child: logoImage(height: null, width: width)),
                    ],
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Center(
                  child: Icon(Icons.error),
                );
              },
            ),
    ),
  );
}
