// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// import 'package:flutter/physics.dart';
// class CustomScrollPhysics extends ScrollPhysics {
//   /// Creates physics for a [PageView].
//   const CustomScrollPhysics({ ScrollPhysics? parent }) : super(parent: parent);
//
//   @override
//   CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return CustomScrollPhysics(parent: buildParent(ancestor));
//   }
//
//
//   @override
//   Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
//
//     final ScrollMetrics metrics = position ;
//
//     // Scenario 1:
//     // If we're out of range and not headed back in range, defer to the parent
//     // ballistics, which should put us back in range at the scrollable's boundary.
//     if ((velocity <= 0.0 && metrics.pixels <= metrics.minScrollExtent) ||
//         (velocity >= 0.0 && metrics.pixels >= metrics.maxScrollExtent)) {
//       return super.createBallisticSimulation(metrics, velocity);
//     }
//
//     // Create a test simulation to see where it would have ballistically fallen
//     // naturally without settling onto items.
//     final Simulation? testFrictionSimulation =
//     super.createBallisticSimulation(metrics, velocity);
//
//     // Scenario 2:
//     // If it was going to end up past the scroll extent, defer back to the
//     // parent physics' ballistics again which should put us on the scrollable's
//     // boundary.
//     if (testFrictionSimulation != null
//         && (testFrictionSimulation.x(double.infinity) == metrics.minScrollExtent
//             || testFrictionSimulation.x(double.infinity) == metrics.maxScrollExtent)) {
//       return super.createBallisticSimulation(metrics, velocity);
//     }
//
//     // From the natural final position, find the nearest item it should have
//     // settled to.
//     final int settlingItemIndex = _getItemFromOffset(
//       offset: testFrictionSimulation?.x(double.infinity) ?? metrics.pixels,
//       itemExtent: Get.width,
//       minScrollExtent: metrics.minScrollExtent,
//       maxScrollExtent: metrics.maxScrollExtent,
//     );
//
//     final double settlingPixels = settlingItemIndex * Get.width;
//
//     // Scenario 3:
//     // If there's no velocity and we're already at where we intend to land,
//     // do nothing.
//     if (velocity.abs() < tolerance.velocity
//         && (settlingPixels - metrics.pixels).abs() < tolerance.distance) {
//       return null;
//     }
//     // return SpringSimulation(
//     //   spring,
//     //   metrics.pixels,
//     //   settlingPixels,
//     //   velocity,
//     //   tolerance: tolerance,
//     // );
//     return FrictionSimulation.through(
//       metrics.pixels,
//       settlingPixels,
//       velocity,
//       tolerance.velocity * velocity.sign,
//     );
//     // Scenario 4:
//     // If we're going to end back at the same item because initial velocity
//     // is too low to break past it, use a spring simulation to get back.
//     // if (settlingItemIndex == metrics.itemIndex) {
//     //   return SpringSimulation(
//     //     spring,
//     //     metrics.pixels,
//     //     settlingPixels,
//     //     velocity,
//     //     tolerance: tolerance,
//     //   );
//     // }
//     //
//     // // Scenario 5:
//     // // Create a new friction simulation except the drag will be tweaked to land
//     // // exactly on the item closest to the natural stopping point.
//     // return FrictionSimulation.through(
//     //   metrics.pixels,
//     //   settlingPixels,
//     //   velocity,
//     //   tolerance.velocity * velocity.sign,
//     // );
//
//   }
// }
// int _getItemFromOffset({
//   required double offset,
//   required double itemExtent,
//   required double minScrollExtent,
//   required double maxScrollExtent,
// }) {
//   return (_clipOffsetToScrollableRange(offset, minScrollExtent, maxScrollExtent) / itemExtent).round();
// }
//
// double _clipOffsetToScrollableRange(
//     double offset,
//     double minScrollExtent,
//     double maxScrollExtent,
//     ) {
//   return math.min(math.max(offset, minScrollExtent), maxScrollExtent);
// }