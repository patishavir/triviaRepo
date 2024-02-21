import 'dart:convert';
import '../objects/question.dart';
import '../common/logging_utils.dart';

class QuestionsUtils {
 static const String _jsonString = """
[
{
"question":"איזו קבוצה זכתה הכי הרבה פעמים בגביע המדינה בכדורגל",
"qimage":"zehavi.jpg",
"correctanswerindex":3,
"answertext":"מכבי תל אביב זכתה בגביע המדינה בכדור רגל 18 פעמים. יותר מכל קבוצה אחרת",
"answer1":"הפועל תל אביב",
"answer2":"מכבי חיפה",
"answer3":"מכבי תל אביב",
"answer4":"ביתר ירושלים",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 20:44:001+0200",
"category":"sport",
"qid":5858509,
"aimage":"null"
},
{
"question":"מתי נוסדה בישראל הליגה לכדורגל",
"qimage":"",
"correctanswerindex":2,
"answertext":"הליגה לכדורגל נוסדה בתקופת המנדט הבריטי בשנת 1931",
"answer1":"בסוף שנות העשרים של המאה העשרים",
"answer2":"בתחילת שנות השלושים",
"answer3":"בסוף שנות השלושים",
"answer4":"בתחילת שנות הארבעים",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-10-28 20:55:038+0300",
"category":"sport",
"qid":15755966,
"aimage":""
},
{
"question":"היכן משחק עומר אצילי בעונה 2023-24",
"qimage":"",
"correctanswerindex":3,
"answertext":"עומר אצילי משחק בעונה 2023-24 באל עין מליגת העל באיחוד האמירויות",
"answer1":"קפריסין",
"answer2":"ספרד",
"answer3":"פורטוגל",
"answer4":"איחוד האמירויות",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 20:52:043+0200",
"category":"sport",
"qid":6380938,
"aimage":""
},
{
"question":"איזה קבוצה זכתה הכי הרבה פעמים באליפות הליגה בכדורגל",
"qimage":"",
"correctanswerindex":1,
"answertext":"מכבי תל אביב זכתה באליפות הליגה בכדורגל 23 פעמים. יותר מכל קבוצה אחרת.",
"answer1":"מכבי חיפה ",
"answer2":"הפועל תל אביב",
"answer3":"הפועל פתח תקווה",
"answer4":"מכבי תל אביב",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 20:40:004+0200",
"category":"sport",
"qid":5621490,
"aimage":""
},
{
"question":"מיהו מלך השערים של נבחרת ישראל בכדורגל",
"qimage":"",
"correctanswerindex":3,
"answertext":"ערן זהבי",
"answer1":"מוטל'ה שפיגלר",
"answer2":"יוסי בניון",
"answer3":"ערן זהבי",
"answer4":"שייע גלזר",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 17:26:021+0200",
"category":"sport",
"qid":93998146,
"aimage":"null"
},
{
"question":"איזו קבוצת כדורגל בישראל אף פעם לא ירדה ליגה",
"qimage":"",
"correctanswerindex":4,
"answertext":"מכבי תל אביב",
"answer1":"מכבי חיפה",
"answer2":"הפועל תל אביב",
"answer3":"ביתר ירושלים",
"answer4":"מכבי תל אביב",
"difficultylevel":3,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 18:32:034+0200",
"category":"sport",
"qid":97971759,
"aimage":"null"
},
{
"question":"מיהו מלך השערים של ליגת העל (שקמה בעונה 99/00)",
"qimage":"",
"correctanswerindex":4,
"answertext":"ערן זהבי",
"answer1":"אלון מזרחי",
"answer2":"אלירן עטר",
"answer3":"עומר אצילי",
"answer4":"ערן זהבי",
"difficultylevel":3,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 17:56:010+0200",
"category":"sport",
"qid":95787600,
"aimage":"null"
},
{
"question":"מיהו מלך השערים של הליגה הישראלית בכל הזמנים",
"qimage":"",
"correctanswerindex":1,
"answertext":"אלון מזרחי (האווירון)",
"answer1":"ערן זהבי",
"answer2":"יוסי בניון",
"answer3":"אלון מזרחי (האווירון)",
"answer4":"חיים רביבו",
"difficultylevel":3,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 18:25:059+0200",
"category":"sport",
"qid":97576917,
"aimage":"null"
},
{
"question":"באיזו קבוצה לא שיחק ערן זהבי",
"qimage":"",
"correctanswerindex":3,
"answertext":"עירוני אשדוד",
"answer1":"הפועל תל אביב",
"answer2":"פלרמו (מהליגה האיטלקית)",
"answer3":"עירוני אשדוד",
"answer4":"הפועל רמת השרון",
"difficultylevel":5,
"subject":"israeli-soccer",
"language":"HE",
"timestamp":"2023-11-20 20:32:043+0200",
"category":"sport",
"qid":5180482,
"aimage":""
}
]
    """;
 static List<Question> questionsList = [];

  static List<Question> questionsFromJson(String jsonArray) {
    final List<dynamic> dynamicList = jsonDecode(jsonArray);
    // LoggingUtils.writeLog(dynamicList.toString());
    Map<String, dynamic> map1 = dynamicList[0];
    List<Question> questionsList =
        List<Question>.from(dynamicList.map((x) => Question.fromJson(x)));
    LoggingUtils.writeLog("questionsFromJson has completed ...");
    return questionsList;
  }

  static Question getQuestion(int questionIndex) {
    if (questionsList.isEmpty) {
      questionsList = questionsFromJson(_jsonString);
      LoggingUtils.writeLog("getQuestion: printing  questionsList ...");
      for (Question question in questionsList) {
        LoggingUtils.writeLog(question.question);
      }
    }
    LoggingUtils.writeLog("getQuestion: return question number $questionIndex");
    return questionsList.elementAt(questionIndex);
  }
}