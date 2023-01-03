import 'package:finesse/components/appbar/k_app_bar.dart';
import 'package:finesse/components/card/report_card.dart';
import 'package:finesse/components/shimmer/k_shimmer.dart';
import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/profile/controller/profile_controller.dart';
import 'package:finesse/src/features/profile/state/profile_state.dart';
import 'package:finesse/styles/k_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportList extends StatefulWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final reportState = ref.watch(reportProvider);
        return Scaffold(
          backgroundColor: KColor.appBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: KAppBar(checkTitle: true, title: 'Report List'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (reportState is LoadingState) ...[const KLoading(shimmerHeight: 123)],
                  if (reportState is FetchReportSuccessState) ...[
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reportState.reportModel?.data.data.length,
                      itemBuilder: (ctx, index) {
                        return ReportCard(
                          id: reportState.reportModel?.data.data[index].id.toString(),
                          date: createDate(reportState.reportModel?.data.data[index].createdAt.toString(), 0),
                          reason: reportState.reportModel?.data.data[index].reason,
                          img: reportState.reportModel?.data.data[index].image,
                        );
                      },
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String createDate(String? date, int? index) {
    List dates = date!.split(" ");
    return dates[index!];
  }

  String imageData(String? image, int? index) {
    index = image?.indexOf(":");
    List data = [image?.substring(0, index).trim(), image?.substring(index! + 1).trim()];
    print(data[0]);
    print(data[1]);
    return data[index!];
  }
}
