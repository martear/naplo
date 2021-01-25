import 'dart:convert';

import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/data/models/lesson.dart';

class TimetableSync {
  List<Lesson> lessons = [];
  DateTime from;
  DateTime to;

  Future<bool> sync() async {
    if (!app.debugUser) {
      List<Lesson> _lessons;
      _lessons = await app.user.kreta.getLessons(from, to);

      if (_lessons == null) {
        await app.user.kreta.refreshLogin();
        _lessons = await app.user.kreta.getLessons(from, to);
      }

      if (_lessons != null) {
        lessons = _lessons;

        await app.user.storage.delete("kreta_lessons");

        await Future.forEach(_lessons, (lesson) async {
          if (lesson.json != null &&
              from.isBefore(DateTime.now()) &&
              to.isAfter(DateTime.now())) {
            await app.user.storage.insert("kreta_lessons", {
              "json": jsonEncode(lesson.json),
            });
          }
        });
      } else {
        lessons = [];
        await app.user.storage.delete("kreta_lessons");
      }

      return _lessons != null;
    } else {
      //data[0] = Dummy.lessons;
      return true;
    }
  }

  delete() {
    lessons = [];
  }
}
