import 'package:intl/intl.dart';

import '../services/http_services.dart';


HttpServices httpServices = HttpServices();
final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('MM/dd/yyyy');
final String formattedDateNow = formatter.format(now);
final DateTime sevenDaysMinusNow =
    DateTime.now().subtract(const Duration(days: 7));
final String formatedSevenDaysMinusNow = formatter.format(sevenDaysMinusNow);
final DateTime thirtyDaysMinusNow =
    DateTime.now().subtract(const Duration(days: 30));
final String formatedThirtyDaysMinusNow = formatter.format(thirtyDaysMinusNow);
