import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickeee/core/models/price_point.dart';
import 'package:quickeee/core/painters/chart_painter.dart';
import 'package:quickeee/core/utils/utils.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';
import 'package:quickeee/features/flash_drop/presentation/widgets/hold_to_secure_button.dart';

class LiveChart extends StatefulWidget {
  final String? name;
  final String? currency;
  final Stream<WatchUpdate> stream;

  const LiveChart({super.key, this.name, this.currency, required this.stream});

  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  final List<PricePoint> points = [];
  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    sub = widget.stream.listen((data) {
      setState(() {
        if (points.length > 100) {
          points.removeAt(0);
        }
        points.add(
          PricePoint(data.currentPrice ?? 0, data.remainingInventory ?? 0),
        );
      });
    });
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name ?? '',
                style: GoogleFonts.lato(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
              8.horizontalSpace,
              AnimatedSwitcher(
                duration: Duration(milliseconds: 800),
                child: Text(
                  '${Utils.tryFormatAmount(points.isEmpty ? 0 : points.last.price, currency: widget.currency)}',
                  style: GoogleFonts.lato(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Spacer(),

        SizedBox(
          height: 400.h,
          width: double.maxFinite,
          child: CustomPaint(painter: ChartPainter(points)),
        ),
        Spacer(),

        16.verticalSpace,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            24.horizontalSpace,
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Left in inventory',
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${Utils.tryFormatAmount(points.isEmpty ? 0 : points.last.remainingInventory)}',
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  HoldToSecureButton(),
                ],
              ),
            ),
            24.horizontalSpace,
          ],
        ),

        16.verticalSpace,
      ],
    );
  }
}
