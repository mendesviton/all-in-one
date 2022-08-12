import 'package:intl/intl.dart';

String formatDate(String data) {
  DateTime? datetime = DateTime.tryParse(data);

  if (datetime != null) {
    return DateFormat.yMMMd('pt_BR').format(datetime);
  } else {
    return 'Data desconhecida';
  }
}
