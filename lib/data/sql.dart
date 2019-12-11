String tasks = """
  CREATE TABLE TASKS (
   id TEXT PRIMARY KEY,
   userId TEXT,
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

String carOrder = """
  CREATE TABLE CAR_ORDER (
    id TEXT PRIMARY KEY, 
    _entityName TEXT, 
    REQUESTED_DATE TEXT, 
    FROM_ADDRESS TEXT, 
    TO_ADDRESS TEXT, 
    CREATE_DATE TEXT,
    status TEXT, 
    car_order TEXT
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

String assignment = """
  CREATE TABLE ASSIGNMENT (
    id TEXT PRIMARY KEY,
    assignment TEXT
  )
""";

String antropometry = """
  CREATE TABLE ANTROPOMETRY (
    id TEXT PRIMARY KEY,
    antropometry TEXT
  )
""";

String userInfo = """
  CREATE TABLE USERINFO (
    id TEXT PRIMARY KEY,
    login TEXT,
    name TEXT,
    firstName TEXT DEFAULT 'Test',
    middleName TEXT DEFAULT 'middleName',
    lastName TEXT DEFAULT 'lastName',
    position TEXT,
    email TEXT,
    timeZone TEXT,
    language TEXT,
    _instanceName TEXT,
    lang TEXT DEFAULT 'ru'
  )
""";

String notification = """
  CREATE TABLE NOTIFICATION (
    id TEXT PRIMARY KEY,
    userId TEXT,
    notification TEXT
  )
""";

String events = """
  CREATE TABLE EVENTS (
    id TEXT PRIMARY KEY,
    userId TEXT,
    event TEXT
  )
""";

String placement = """
  CREATE TABLE PLACEMENT (
    id TEXT PRIMARY KEY,
    userId TEXT,
    placement TEXT
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

String ppe = """
  CREATE TABLE PERONAL_PROTECTION (
    id TEXT PRIMARY KEY,
    userId TEXT,
    protection TEXT
  )
""";

String testingGraphic = """
  CREATE TABLE TESTING_GRAPHIC (
    id TEXT PRIMARY KEY,
    userId TEXT,
    graphic TEXT
  )
""";
