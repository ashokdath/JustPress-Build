import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';



// class ControlledAnimation<T> extends StatefulWidget {
//   // final Playback playback;
//   final Animatable<T> tween;
//   final Curve curve;
//   final Duration duration;
//   final Duration delay;
//   final Widget Function(BuildContext buildContext, T animatedValue) builder;
//   final Widget Function(BuildContext, Widget child, T animatedValue)
//   builderWithChild;
//   final Widget child;
//   final AnimationStatusListener animationControllerStatusListener;
//   final double startPosition;
//
//   ControlledAnimation(
//       {
//         // this.playback = Playback.PLAY_FORWARD,
//         this.tween,
//         this.curve = Curves.linear,
//         this.duration,
//         this.delay,
//         this.builder,
//         this.builderWithChild,
//         this.child,
//         this.animationControllerStatusListener,
//         this.startPosition = 0.0,
//         Key key})
//       : assert(duration != null,
//   "Please set property duration. Example: Duration(milliseconds: 500)"),
//         assert(tween != null,
//         "Please set property tween. Example: Tween(from: 0.0, to: 100.0)"),
//         // assert(
//         // (builderWithChild != null && child != null && builder == null) ||
//         //     (builder != null && builderWithChild == null && child == null),
//         // "Either use just builder and keep buildWithChild and child null. "
//         //     "Or keep builder null and set a builderWithChild and a child."),
//         assert(
//         startPosition >= 0 && startPosition <= 1,
//         "The property startPosition "
//             "must have a value between 0.0 and 1.0."),
//         super(key: key);
//
//   @override
//   _ControlledAnimationState<T> createState() => _ControlledAnimationState<T>();
// }
//
// class _ControlledAnimationState<T> extends State<ControlledAnimation<T>>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<T> _animation;
//   bool _isDisposed = false;
//   bool _waitForDelay = true;
//   // bool _isCurrentlyMirroring = false;
//
//   @override
//   void initState() {
//     _controller = AnimationController(vsync: this, duration: widget.duration)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..value = widget.startPosition;
//
//     _animation = widget.tween
//         .chain(CurveTween(curve: widget.curve))
//         .animate(_controller);
//
//     if (widget.animationControllerStatusListener != null) {
//       _controller.addStatusListener(widget.animationControllerStatusListener);
//     }
//
//     initialize();
//     super.initState();
//   }
//
//   void initialize() async {
//     if (widget.delay != null) {
//       await Future.delayed(widget.delay);
//     }
//     _waitForDelay = false;
//     // executeInstruction();
//   }
//
//   // @override
//   // void didUpdateWidget(ControlledAnimation<T> oldWidget) {
//   //   _controller.duration = widget.duration;
//   //
//   //   _animation = widget.tween
//   //       .chain(CurveTween(curve: widget.curve))
//   //       .animate(_controller);
//   //
//   //   // executeInstruction();
//   //   super.didUpdateWidget(oldWidget);
//   // }
//
//   // void executeInstruction() async {
//   //   if (_isDisposed || _waitForDelay) {
//   //     return;
//   //   }
//   //
//   //   if (widget.playback == Playback.PAUSE) {
//   //     _controller.stop();
//   //   }
//   //   if (widget.playback == Playback.PLAY_FORWARD) {
//   //     _controller.forward();
//   //   }
//   //   if (widget.playback == Playback.PLAY_REVERSE) {
//   //     _controller.reverse();
//   //   }
//   //   if (widget.playback == Playback.START_OVER_FORWARD) {
//   //     _controller.forward(from: 0.0);
//   //   }
//   //   if (widget.playback == Playback.START_OVER_REVERSE) {
//   //     _controller.reverse(from: 1.0);
//   //   }
//   //   if (widget.playback == Playback.LOOP) {
//   //     _controller.repeat();
//   //   }
//   //   if (widget.playback == Playback.MIRROR && !_isCurrentlyMirroring) {
//   //     _isCurrentlyMirroring = true;
//   //     _controller.repeat(reverse: true);
//   //   }
//   //
//   //   if (widget.playback != Playback.MIRROR) {
//   //     _isCurrentlyMirroring = false;
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.builder != null) {
//       return widget.builder(context, _animation.value);
//     } else if (widget.builderWithChild != null && widget.child != null) {
//       return widget.builderWithChild(context, widget.child, _animation.value);
//     }
//     return Container();
//   }
//
//   @override
//   void dispose() {
//     _isDisposed = true;
//     _controller.dispose();
//     super.dispose();
//   }
// }


class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 200), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (100 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]),
            child: child
        ),
      ),
    );
  }
}