class TasksData {
  static final List<String> easyTasks = [
    "Erkläre dein Lieblingsfilm, ohne den Titel zu nennen.",
    "Mach 3 Tiergeräusche in einer logischen Reihenfolge.",
    "Sag 5 Dinge, die du heute gegessen hast – rückwärts!",
    "Zeige 10 Sekunden lang dein bestes Gangnam Style.",
    "Nenne 10 Länder auf dem Mond (erfinde sie einfach!).",
    "Erzähle eine peinliche Geschichte aus deiner Kindheit.",
    "Tanze 20 Sekunden wie ein Robot!",
    "Nenne alle Bundesländer Deutschlands in 30 Sekunden.",
    "Zeige deine besten 5 Grimassen.",
    "Singe ein bekanntes Lied – aber alle Vokale fehlen.",
    "Erzähle einen Witz – aber ohne zu lachen!",
    "Zeige 10 Sekunden lang dein bestes Gangnam Style.",
    "Nenne 10 Dinge, die gelb sind – so schnell du kannst!",
    "Zeige dein bestes Katzenvideo-Nachahmen.",
    "Mache einen Fortnite-Tanz – in Sekunden!",
  ];

  static final List<String> mediumTasks = [
    "Erzähle die Handlung von Star Wars – als ob es ein Western wäre.",
    "Verwandele dich für 30 Sekunden in dein Lieblingstier.",
    "Sag 10 Dinge, die du ZU NIEMALS tun würdest – aber lüge nicht!",
    "Führe eine 30-Sekunden-Sportkommentator-Ansage zu deinem Frühstück durch.",
    "Erzähle eine tragische Geschichte – aber als Comedy.",
    "Spiele 20 Sekunden lang Geigen – ohne Geige!",
    "Zeige, wie eine Schneeflocke durch 4 Jahreszeiten fällt.",
    "Führe eine Produktwerbung für dein Handy durch.",
    "Erzähle, was passiert, wenn Quarks plötzlich tanzen würden.",
    "Zeige 5 Emotionen in 30 Sekunden – ohne zu sprechen!",
    "Verhalte dich wie ein Alien, das Pizza zum ersten Mal probiert.",
    "Erkläre TikTok einer Person aus 1820.",
    "Zeige ein Zeitraffer-Video von dir beim Essen – als Schnecke.",
    "Führe eine Nachrichtensendung durch – Thema: dein gestriges Mittagessen.",
    "Spiele ein Klaviersolo – auf imaginären Tasten auf deinem Oberschenkel.",
  ];

  static final List<String> crazyTasks = [
    "Du bist jetzt ein Rapper. Battle dich gegen einen unsichtbaren Gegner!",
    "Dein Handy ist ein Haustier. Zieh es spazieren und füttere es!",
    "Du bist eine Spinne, die lernen muss, wie man ein Netz baut – aber nur mit Nudeln!",
    "Führe ein Gespräch mit einem Kühlschrank – er ist dein bester Freund.",
    "Zeige, wie ein Fisch tanzen würde, wenn er sich verlaufen hätte.",
    "Du bist ein Stift. Beschreibe, wie dein Leben als Stift aussieht!",
    "Verkaufe dein Publikum einen unsichtbaren Kamel-Roboter.",
    "Du bist eine geheime Regierungsagentin – aber du musst alles vergessen.",
    "Zeige, wie ein Baum um Hilfe rufen würde (Ohne Worte!).",
    "Führe einen Kochkurs durch – Thema: Kochen mit geschlossenen Augen.",
    "Du bist eine Zeitmaschine. Zeige, wie du in die Vergangenheit reist!",
    "Erzähle die Handlung von Titanic – aber du bist ein Dinosaurier.",
    "Mache eine Tauschbörse – aber du handelst mit Emotionen!",
    "Zeige eine Dokustelle über eine Kaffeemaschine im Weltall.",
    "Du bist eine verirrte Kommode. Erzähle deine Lebensgeschichte!",
  ];

  static String getRandomTask() {
    final allTasks = [...easyTasks, ...mediumTasks, ...crazyTasks];
    allTasks.shuffle();
    return allTasks.first;
  }
}

