import 'package:filcnaplo/data/models/evaluation.dart';
import 'package:filcnaplo/data/models/message.dart';

enum PageType { home, evaluations, planner, messages, absences }

class PageContext {
  PageContext({this.messageType, this.evaluationType});

  MessageType messageType;
  EvaluationType evaluationType;
}
