String admins = """
  CREATE TABLE TASKS (
   id TEXT PRIMARY KEY,
   userId TEXT,
   firstName TEXT,
   lastName TEXT,
   position TEXT,
   task TEXT
)
  """;

String timely = """
  CREATE TABLE TIMELY (
    id INTEGER PRIMARY KEY,
    login TEXT,
    password TEXT,
    pin TEXT,
    userId TEXT
  )
  """;

String savedAddress = """
  CREATE TABLE SAVED_ADDRESSES (
    id INTEGER PRIMARY KEY,
    address TEXT,
    type TEXT,
    personGroupId TEXT
  )
  """;

String test = """
  CREATE TABLE TESTS (
    id TEXT PRIMARY KEY,
    userId TEXT,
    test TEXT
  )
""";

String userInfo = """
  CREATE TABLE USERINFO (
    id TEXT PRIMARY KEY,
    login TEXT,
    name TEXT,
    firstName TEXT,
    middleName TEXT,
    lastName TEXT,
    position TEXT,
    email TEXT,
    sex TEXT,
    locale TEXT,
    birthDate TEXT,
    timeZone TEXT,
    language TEXT,
    _instanceName TEXT
  )
""";

String notification = """
  CREATE TABLE NOTIFICATION (
    id TEXT PRIMARY KEY,
    userId TEXT,
    notification TEXT
  )
""";

String requestList = """
  CREATE TABLE EVENTS (
    id TEXT PRIMARY KEY,
    userId TEXT,
    fromDate TEXT,
    toDate TEXT,
    comments TEXT,
    type TEXT,
    event TEXT
  )
""";

String news = """
  CREATE TABLE NEWS (
    id TEXT PRIMARY KEY,
    userId TEXT,
    type TEXT,
    news TEXT
  )
""";

String testingGraphic = """
  CREATE TABLE TESTING_GRAPHIC (
    id TEXT PRIMARY KEY,
    userId TEXT,
    graphic TEXT
  )
""";
