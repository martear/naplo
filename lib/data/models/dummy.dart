import 'package:filcnaplo/data/models/event.dart';
import 'package:filcnaplo/data/models/homework.dart';
import 'package:filcnaplo/data/models/school.dart';
import 'package:filcnaplo/data/models/student.dart';
import 'package:filcnaplo/data/models/evaluation.dart';
import 'package:filcnaplo/data/models/subject.dart';
import 'package:filcnaplo/data/models/message.dart';
import 'package:filcnaplo/data/models/note.dart';
import 'package:filcnaplo/data/models/recipient.dart';
import 'package:filcnaplo/data/models/type.dart';
import 'package:filcnaplo/ui/pages/planner/timetable/day.dart';
import 'package:filcnaplo/ui/pages/planner/timetable/week.dart';

import 'exam.dart';
import 'lesson.dart';

class Dummy {
  static Student student = Student(
    "123",
    "Test User", // Student name
    School("0", "Test School", "Test"),
    DateTime.now(),
    "0",
    "Test Street 123",
    ["Test Parent"],
  );

  static List<Evaluation> evaluations = [
    Evaluation(
      "234512345",
      DateTime.now(),
      EvaluationValue(1, "One", "One", 200),
      "Test Teacher",
      "Test",
      EvaluationType.midYear,
      "",
      Subject("0", null, "English"),
      null,
      Type("0", "Test", "Test"),
      DateTime.now(),
      DateTime.now(),
      "Test",
    ),
    Evaluation(
      "100101110010",
      DateTime.now(),
      EvaluationValue(5, "Ötös", "Ötös", 100),
      "Teszttanár",
      "EzAzEnJegyem",
      EvaluationType.thirdQ,
      "",
      Subject("0", null, "English"),
      null,
      Type("0", "Test", "Test"),
      DateTime.now(),
      DateTime.now(),
      "Test",
    ),
    Evaluation(
      "123462",
      DateTime.now(),
      EvaluationValue(4, "Four", "Four", 100),
      "Test Teacher",
      "Test 2",
      EvaluationType.midYear,
      "",
      Subject("0", null, "English"),
      null,
      Type("0", "Test", "Test"),
      DateTime.now(),
      DateTime.now(),
      "Test",
    ),
    Evaluation(
      "234512346",
      DateTime.now(),
      EvaluationValue(1, "One", "One", 100),
      "Test Teacher 2",
      "Test 2",
      EvaluationType.midYear,
      "",
      Subject("1", null, "Grammar"),
      null,
      Type("0", "Test 2", "Test 2"),
      DateTime.now(),
      DateTime.now(),
      "exam 2",
    ),
    Evaluation(
      "2345123134",
      DateTime.now(),
      EvaluationValue(5, "Five", "Five", 50),
      "Test Teacher 3",
      "Test 3",
      EvaluationType.midYear,
      "",
      Subject("2", null, "Math"),
      null,
      Type("0", "Test 3", "Test 3"),
      DateTime.now(),
      DateTime.now(),
      "Test 3",
    ),
    Evaluation(
      "2345123134",
      DateTime.now(),
      EvaluationValue(5, "Five", "Five", 50),
      "Test Teacher 3",
      "Test 3",
      EvaluationType.midYear,
      "",
      Subject(
          "123", null, "Matematika kompetencianövelő masterclass okosoknak"),
      null,
      Type("0", "Test 3", "Test 3"),
      DateTime.now(),
      DateTime.now(),
      "Test 3",
    ),
  ];

  static List<Message> messages = [
    Message(
      123,
      1234,
      true,
      false,
      DateTime.now(),
      "Test User",
      "This is a test.",
      "Test",
      MessageType.inbox,
      [Recipient(0, '0', "Test Teacher", 0, null)],
      [],
    ),
    Message(
      132,
      12345,
      true,
      false,
      DateTime.now(),
      "Test User",
      "This is another test message.",
      "Test 2",
      MessageType.inbox,
      [
        Recipient(0, '0', "Test Teacher", 0, null),
        Recipient(1, '1', "Albert", 1, null)
      ],
      [],
    ),
  ];

  static List<Note> notes = [
    Note(
      "0",
      "Test Note",
      DateTime.now(),
      DateTime.now(),
      "Test User",
      DateTime.now(),
      null,
      "This is a test note.",
      Type("", "", "ElektronikusUzenet"),
    ),
    Note(
      "0123",
      "Test Note 2",
      DateTime.now(),
      DateTime.now(),
      "Test User 2",
      DateTime.now(),
      null,
      """Sit aut veritatis perferendis et est iste. Distinctio eaque modi occaecati provident consequatur accusantium eum. Iusto aliquid sint sed qui et.

Blanditiis eos facilis adipisci laboriosam. Sunt at inventore molestiae est. Inventore et eaque cum recusandae ut asperiores. Quo magnam a quae corporis facilis dolorem aut dolore. Exercitationem esse et nesciunt adipisci consectetur rem quidem sint. Tempore quidem quia aliquid nostrum sunt fugit non molestias.

Amet magnam est ullam corporis esse autem. Tenetur facilis magnam a ea voluptas explicabo facilis. Laudantium et iste in distinctio nobis dolorem voluptatum. Aut quo aut natus rem.

Tenetur doloremque et repudiandae praesentium deleniti dolorem voluptatem dolor. Nostrum perspiciatis officia numquam aperiam voluptatem. Quasi quae adipisci sint vel perferendis aut. Dolor iure dicta omnis qui.

Eos enim voluptatem cum accusantium ut eius ut. At sequi aperiam rem. Sed nulla laudantium aliquid. Ut molestiae impedit fugiat eos modi sit. Neque et cum deserunt nulla vero omnis aut. Aut ab voluptatem commodi omnis similique.

Ab voluptas consequatur aperiam ut excepturi. Ullam aut consequatur cumque distinctio quia dicta ut. Placeat magnam aut dolores tenetur. Expedita ab sit nisi sunt explicabo. Eius eum ut ea libero molestiae omnis non.

Aut voluptate libero et assumenda neque error quo consequatur. Consequatur ea voluptatum et qui non ipsum. Ipsa voluptatem necessitatibus enim est qui. Quidem ullam est odit aut qui animi exercitationem aliquam.

Aut eius est qui dolore accusamus itaque. Expedita nostrum explicabo hic iure facere aut. Non et sunt alias nulla. Doloremque odio facilis at incidunt quo iure labore. Repellat temporibus voluptatem quidem dolor.

Ut occaecati distinctio iusto ut et voluptatem facere est. Adipisci consequuntur cupiditate ut quibusdam accusantium sapiente. Sit aut omnis minima quae consequatur quo nobis saepe. Repellendus harum sit nobis ipsam eos in tenetur. Ullam sit excepturi voluptatum. Magni assumenda perspiciatis dolorem commodi voluptas dignissimos voluptas.

Unde at soluta et adipisci eveniet optio. Est ad aut quo eum sit. Aut dolorem aperiam reiciendis itaque et iusto. Culpa quibusdam enim qui facere deleniti.""",
      Type("", "", "ElektronikusUzenet"),
    ),
  ];

  static List<Event> events = [
    Event(
      "2378123",
      DateTime.now(),
      DateTime.now(),
      "Test Event",
      "This is a test event.",
    ),
  ];

  static List<Recipient> recipients = [
    Recipient(0, "", "Test User 1", 0, null),
    Recipient(1, "", "Test User 2", 0, null),
    Recipient(2, "", "Test User 3", 0, null),
  ];

  static List<Exam> exams = [
    Exam(
        DateTime.now(),
        DateTime.now().add(Duration(minutes: 120)),
        Type("123", "Gyakorlati feladat", "Gyakorlati feladat"),
        6,
        "Alváselmélet",
        "Marika nénje",
        "Javítási lehetőség",
        null,
        "555"),
  ];

  static List<Lesson> lessons = [
    Lesson(
      Type("122455", "", ""),
      DateTime.now(),
      Subject("1231651", null, "Szolfézs"),
      "3",
      12,
      "Jozsa Neni legjobb spanja",
      "Jozsa Neni",
      true,
      DateTime.now(),
      DateTime.now().add(Duration(minutes: 45)),
      Type("51654537", "", ""),
      null,
      <Exam>[],
      "6153131",
      Type("51561", "", ""),
      "Le van irva",
      "Kisterem",
      "9. C",
      "Matekmatika - mi ez mi?",
    ),
    Lesson(
      Type("122455", "", ""),
      DateTime.now(),
      Subject("420", null, "Kémia"),
      "5",
      12,
      "",
      "Irma né",
      true,
      DateTime.now().add(Duration(minutes: 2 * 45)),
      DateTime.now().add(Duration(minutes: 3 * 45)),
      Type("51654537", "student presence type desc",
          "student presence type name"),
      null,
      <Exam>[],
      "6153132",
      Type("51561", "lesson type desc", "lesson type name"),
      "Le van irva",
      "Khémia",
      "9. C",
      "Matekmatika - mi ez mi?",
    ),
    Lesson(
      Type("122455", "", ""),
      DateTime.now(),
      Subject("1234", null, "Alváselmélet"),
      "0",
      12,
      "",
      "Marika Nénje",
      true,
      DateTime.now().add(Duration(minutes: 2 * 45)),
      DateTime.now().add(Duration(minutes: 3 * 45)),
      Type("51654537", "student presence type desc",
          "student presence type name"),
      "333",
      [
        "555",
      ],
      "6153133",
      Type("51561", "lesson type desc", "lesson type name"),
      "Bevezetés a tudatos álmodásba",
      "Hálószóbád",
      "9. C",
      "Név.",
    ),
  ];

  static Week week = Week([
    Day(
      date: DateTime.now(),
    )
  ]);

  static List<Homework> homework = [
    Homework(
        DateTime.now(),
        DateTime.now(),
        DateTime.now().add(Duration(days: 1)),
        true,
        false,
        "Lajosne Fekete Andras",
        "Pihend ki az iskolai faradalmakat",
        "Kvantumfizika",
        "",
        [],
        "24672456"),
    Homework(
        DateTime.now(),
        DateTime.now(),
        DateTime.now().add(Duration(days: 1)),
        true,
        false,
        "Marika Nénje",
        "Fordítsd meg a párnádat a hideg oldalára.",
        "Alváselmélet",
        "",
        [],
        "333"),
    Homework(
        DateTime.now().subtract(Duration(days: 1)),
        DateTime.now().subtract(Duration(days: 1)),
        DateTime.now().subtract(Duration(days: 1)),
        true,
        false,
        "Fekete Geza",
        "Vagj ki egy fat otthon, lakhelyedhez kozeli erdoben, a videot kuldd el TIMSZEN",
        "Faipari ismeretek",
        "",
        [],
        "24672456"),
  ];

  // k0sz boa
}
