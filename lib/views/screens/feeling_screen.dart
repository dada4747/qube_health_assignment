import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qube_health_assignment/autolayou.dart';
import 'package:qube_health_assignment/constants/appcolor.dart';
import 'package:qube_health_assignment/constants/appicon.dart';
import 'package:qube_health_assignment/views/widgets/datePickerView.dart';
import '../../Model/UserFeelingModel.dart';
import '../../bloc/userfeeling_bloc.dart';
import '../../constants/utilities.dart';
import '../widgets/calender_date_widgets.dart';
import '../widgets/feeling_icon_widget.dart';
import '../widgets/feeling_list_widget.dart';
import '../widgets/vdo_decription.dart';
import '../widgets/youtubevdo_list.dart';

class FeelingHistory extends StatefulWidget {
  const FeelingHistory({Key? key}) : super(key: key);

  @override
  State<FeelingHistory> createState() => _FeelingHistoryState();
}

class _FeelingHistoryState extends State<FeelingHistory> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserfeelingBloc>(context).add(FetchUserFeeling());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserfeelingBloc, UserfeelingState>(
      builder: (context, state) {
        if (state is UserfeelingInitial) {}
        if (state is UserFeelingLoaded) {
          if (state.exception != null) {
            return const Scaffold(
                body: Center(child: Text("Something Went wrong")));
          }
          if (state.feelings != null) {
            late FeelingPercentage percentage;
            late List<FeelingList>? feelingList;
            late List<VideoArr> vdoArray = state.feelings!.data.videoArr;
            percentage = state.feelings!.data.feelingPercentage;
            feelingList = state.feelings!.data.feelingList;

            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    iconSize: 18,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                  leadingWidth: 40.0.s,
                  titleSpacing: 0.0.s,
                  centerTitle: true,
                  title: Container(
                    height: 24.0.s,
                    alignment: Alignment.center,
                    child: Text("Your Feelings History",
                        style: TextStyle(
                            fontFamily: "SFPro",
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0.s,
                            color: Colors.black)),
                  )),
              body: ListView(shrinkWrap: true, children: [
                Container(
                  height: 19.0.s,
                  margin: EdgeInsets.only(left: 20.0.s, top: 20.0.s),
                  child: Text(
                    "Your feelings from last 30 days",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "SFPro",
                        fontSize: 16.0.s),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 10, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeelingIconWidget(
                          moodIcon: AppIcon.energetic,
                          persent: percentage.energetic,
                          isDisable: isDisable(percentage.energetic ?? "0"),
                          type: "Energet"),
                      FeelingIconWidget(
                          moodIcon: AppIcon.sad,
                          persent: percentage.sad,
                          isDisable: isDisable(percentage.sad ?? "0"),
                          type: "Sad"),
                      FeelingIconWidget(
                          moodIcon: AppIcon.happy,
                          persent: percentage.happy,
                          isDisable: isDisable(percentage.happy ?? "0"),
                          type: "Happy"),
                      FeelingIconWidget(
                          moodIcon: AppIcon.angry,
                          persent: percentage.angry,
                          isDisable: isDisable(percentage.angry ?? "0"),
                          type: "Angry"),
                      FeelingIconWidget(
                          moodIcon: AppIcon.calm,
                          persent: percentage.calm,
                          isDisable: isDisable(percentage.calm ?? "0"),
                          type: "Calm"),
                      FeelingIconWidget(
                          moodIcon: AppIcon.bored,
                          persent: percentage.bored,
                          isDisable: isDisable(percentage.bored ?? "0"),
                          type: "Bored"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0.s),
                  child: Divider(
                    color: Colors.black,
                    height: 0.2.s,
                  ),
                ),
                const CalendarDate(),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20.0.s, left: 22.0.s, right: 22.0.s),
                  child: DatePicker(
                    DateTime.now(),
                    width: 40.0.s,
                    height: 70.0.s,
                    dateTextStyle: TextStyle(
                        fontFamily: "SFPro",
                        fontSize: 15.0.s,
                        fontWeight: FontWeight.w100),
                    dayTextStyle: TextStyle(
                      fontFamily: "SFPro",
                      fontSize: 15.0.s,
                      fontWeight: FontWeight.w100,
                    ),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.datePickerColor,
                    selectedTextColor: Colors.white,
                    daysCount: 30,
                    controller: DatePickerController(),
                    deactivatedColor: AppColors.disablColor,
                    onDateChange: (date) {
                      setState(() {
                        debugPrint(
                            "this is clidckde d on sdfoi:${date.day}-${date.month}-${date.year}");
                      });
                    },
                    monthTextStyle: TextStyle(
                      fontFamily: "SFPro",
                      fontSize: 15.0.s,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0.s),
                  child: Divider(
                    color: Colors.black,
                    height: 0.2.s,
                  ),
                ),
                Wrap(
                    children: List.generate(feelingList.length, (index) {
                  return FeelingListWidget(
                      feelingTime: convertTotime(
                          feelingList![index].submitTime.toString()),
                      mood: setMoodIcon(feelingList[index].feelingName!),
                      moodType: feelingList[index].feelingName!);
                })),
                Divider(
                  color: Colors.black,
                  height: 0.2.s,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 32.0.s,
                    left: 20.0.s,
                  ),
                  child: SizedBox(
                    // height: 18.0.s,
                    width: 220.0.s,
                    child: Text(
                      "You May Find This Interesting",
                      style: TextStyle(
                          fontFamily: "SFPro",
                          fontWeight: FontWeight.w100,
                          fontSize: 18.0.s),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                VideoDescriptionWidget(vdoArray: vdoArray),
                SizedBox(
                  height: 10.0.s,
                ),
                YouTubeVideosList(vdoArray: vdoArray),
              ]),
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
