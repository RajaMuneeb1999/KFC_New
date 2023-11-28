import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../size_confiq.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const bottomBar(),
      ),
    );
  }

  @override
  State<bottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<bottomBar> {
  final _isHours = true;
  bool isOnDuty = false;
  bool isOnBreak = false;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
    onChange: (value) => debugPrint('onChange $value'),
    onChangeRawSecond: (value) => debugPrint('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => debugPrint('onChangeRawMinute $value'),
    onStopped: () {
      debugPrint('onStopped');
    },
    onEnded: () {
      debugPrint('onEnded');
    },
  );

  final StopWatchTimer _breakTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    // presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
    onChange: (value) => debugPrint('onChange $value'),
    onChangeRawSecond: (value) => debugPrint('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => debugPrint('onChangeRawMinute $value'),
    onStopped: () {
      debugPrint('onStopped');
    },
    onEnded: () {
      debugPrint('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        debugPrint('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime
        .listen((value) => debugPrint('minuteTime $value'));
    _stopWatchTimer.secondTime
        .listen((value) => debugPrint('secondTime $value'));
    _stopWatchTimer.records.listen((value) => debugPrint('records $value'));
    _stopWatchTimer.fetchStopped
        .listen((value) => debugPrint('stopped from stream'));
    _stopWatchTimer.fetchEnded
        .listen((value) => debugPrint('ended from stream'));

    //for break
    _breakTimer.rawTime.listen((value) =>
        debugPrint('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _breakTimer.minuteTime.listen((value) => debugPrint('minuteTime $value'));
    _breakTimer.secondTime.listen((value) => debugPrint('secondTime $value'));
    _breakTimer.records.listen((value) => debugPrint('records $value'));
    _breakTimer.fetchStopped
        .listen((value) => debugPrint('stopped from stream'));
    _breakTimer.fetchEnded.listen((value) => debugPrint('ended from stream'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
    await _breakTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(179, 173, 173, 173),
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.white70,
            //     // Color(0xffda1d24),
            //     // Color(0xff84262c),
            //   ],
            // ),
            ),
        height: SizeConfig.screenHeight * 0.065,
        padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(15),
            getProportionateScreenHeight(2),
            getProportionateScreenWidth(15),
            getProportionateScreenHeight(2)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
                child: isOnDuty == true
                    ? Column(
                        children: [
                          Image.asset("assets/26/duty.png"),
                          Row(
                            children: [
                              StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data!;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value,
                                          hours: _isHours);
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        displayTime.toString(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(children: [
                        Image.asset("assets/26/duty.png"),
                        const Text("Start Duty")
                      ]),
                onTap: () {
                  debugPrint("pressed");
                  _breakTimer.onStopTimer();
                  setState(() {
                    isOnDuty = !isOnDuty;
                  });
                  if (isOnDuty == true) {
                    _stopWatchTimer.onStartTimer();
                    //  httpServices.addBranchRiderOnlineOfflineLog("5");
                  } else {
                    _stopWatchTimer.onResetTimer();
                    //   httpServices.addBranchRiderOnlineOfflineLog("1");
                  }
                }),
            GestureDetector(
                child: isOnBreak == false
                    ? Column(
                        children: [
                          Image.asset("assets/26/break.png"),
                          Row(
                            children: [
                              StreamBuilder<int>(
                                stream: _breakTimer.rawTime,
                                initialData: _breakTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data!;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value,
                                          hours: _isHours);
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        displayTime.toString(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(children: [
                        Image.asset("assets/26/break.png"),
                        const Text("Break")
                      ]),
                onTap: () {
                  _stopWatchTimer.onStopTimer();

                  setState(() {
                    isOnBreak = !isOnBreak;
                  });

                  if (isOnBreak == false) {
                    _breakTimer.onStartTimer();
                    //  httpServices.addBranchRiderOnlineOfflineLog("2");
                  } else {
                    _breakTimer.onResetTimer();
                    //  httpServices.addBranchRiderOnlineOfflineLog("5");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
