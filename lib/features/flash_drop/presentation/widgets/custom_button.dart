import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickeee/core/painters/ring_painter.dart';

class HoldToSecureButton extends StatefulWidget {
  const HoldToSecureButton({super.key});

  @override
  State<HoldToSecureButton> createState() => _HoldToSecureButtonState();
}

class _HoldToSecureButtonState extends State<HoldToSecureButton>
    with TickerProviderStateMixin {
  late AnimationController progressController;
  late AnimationController successController;

  bool isHolding = false;
  bool isLoading = false;
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();

    progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onHoldComplete();
      }
    });
  }

  void _onHoldStart() {
    if (isSuccess || isLoading) {
      return;
    }
    isHolding = true;

    progressController.stop();
    progressController.forward();

    setState(() {}); 
  }

  void _onHoldEnd() {
    if (!isHolding) return;

    isHolding = false;

    if (!progressController.isCompleted) {
      progressController.reverse(); 
    }
  }

  Future<void> _onHoldComplete() async {
    setState(() {
      isHolding = false;
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      isSuccess = true;
    });

    successController.forward();
  }

  @override
  void dispose() {
    progressController.dispose();
    successController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onHoldStart(),
      onTapUp: (_) => _onHoldEnd(),
      onTapCancel: _onHoldEnd,
      child: AnimatedBuilder(
        animation: progressController,
        builder: (context, child) {
          return Container(
            height: 60.h,
            width: 180.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF22b720),
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(color: Colors.white24),
            ),
            child: isHolding
                ? CustomPaint(
                    painter: RingPainter(progressController.value),
                    child: SizedBox(height: 50.h, width: 160.w),
                  )
                : _buildContent(),
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(strokeWidth: 2.w, color: Colors.white),
      );
    }

    if (isSuccess) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: successController,
          curve: Curves.elasticOut,
        ),
        child: Icon(Icons.check, color: Colors.white),
      );
    }

    return const Text(
      "Hold to Secure",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}
