String freya = """
  CREATE TABLE FREYA (
    id INTEGER PRIMARY KEY,
    login TEXT,
    password TEXT,
    pin TEXT,
    userId TEXT
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
    nationalIdentifier TEXT,
    sexName TEXT,
    sex TEXT,
    locale TEXT,
    birthDate TEXT,
    timeZone TEXT,
    language TEXT,
    _instanceName TEXT
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


