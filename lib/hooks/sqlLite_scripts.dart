const String CREATE_USER_TABLE_SCRIPT = """
        CREATE TABLE easy_user (
          user_id TEXT PRIMARY KEY,
          name TEXT NOT NULL,
          email TEXT UNIQUE NOT NULL,
          password TEXT NOT NULL,
          user_type TEXT CHECK(user_type IN ('Cliente', 'Prestador')) NOT NULL
        )""";

const String DATABASE_NAME = "EasyDB";
