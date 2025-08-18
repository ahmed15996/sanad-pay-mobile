// import 'dart:async';
//
// import 'package:app_links/app_links.dart';
// import 'package:arthad/core/constants/api_constants.dart';
// import 'package:arthad/core/util/routing/routes.dart';
// import 'package:arthad/irthad_app.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../features/marketplace/data/arguments/product_details_arguments.dart';
// @lazySingleton
// class DeepLinkService {
//   late AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSubscription;
//
//   initAppLink() async {
//     _appLinks = AppLinks();
//
//     _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
//       if (uri.pathSegments.contains(ApiConstants.products)) {
//         final String productId = uri.pathSegments.last;
//         IrthadApp.appNavigatorKey.currentState?.pushNamed(
//             Routes.itemDetailsView,
//             arguments:
//                 ProductDetailsArguments(productId: int.parse(productId)));
//       }
//     }, onError: (err) {
//       _linkSubscription?.cancel();
//     }, onDone: () {
//       _linkSubscription?.cancel();
//     });
//   }
// }
