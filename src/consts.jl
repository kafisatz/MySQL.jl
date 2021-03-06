using Compat

# The field_type in the MYSQL_FIELD object that directly maps to native MYSQL types
@compat const MYSQL_TYPE_DECIMAL     = Int32(0)
@compat const MYSQL_TYPE_TINY        = Int32(1)
@compat const MYSQL_TYPE_SHORT       = Int32(2)
@compat const MYSQL_TYPE_LONG        = Int32(3)
@compat const MYSQL_TYPE_FLOAT       = Int32(4)
@compat const MYSQL_TYPE_DOUBLE      = Int32(5)
@compat const MYSQL_TYPE_NULL        = Int32(6)
@compat const MYSQL_TYPE_TIMESTAMP   = Int32(7)
@compat const MYSQL_TYPE_LONGLONG    = Int32(8)
@compat const MYSQL_TYPE_INT24       = Int32(9)
@compat const MYSQL_TYPE_DATE        = Int32(10)
@compat const MYSQL_TYPE_TIME        = Int32(11)
@compat const MYSQL_TYPE_DATETIME    = Int32(12)
@compat const MYSQL_TYPE_YEAR        = Int32(13)
@compat const MYSQL_TYPE_NEWDATE     = Int32(14)
@compat const MYSQL_TYPE_VARCHAR     = Int32(15)
@compat const MYSQL_TYPE_BIT         = Int32(16)
@compat const MYSQL_TYPE_NEWDECIMAL  = Int32(246)
@compat const MYSQL_TYPE_ENUM        = Int32(247)
@compat const MYSQL_TYPE_SET         = Int32(248)
@compat const MYSQL_TYPE_TINY_BLOB   = Int32(249)
@compat const MYSQL_TYPE_MEDIUM_BLOB = Int32(250)
@compat const MYSQL_TYPE_LONG_BLOB   = Int32(251)
@compat const MYSQL_TYPE_BLOB        = Int32(252)
@compat const MYSQL_TYPE_VAR_STRING  = Int32(253)
@compat const MYSQL_TYPE_STRING      = Int32(254)
@compat const MYSQL_TYPE_GEOMETRY    = Int32(255)

export MYSQL_TYPE_DECIMAL,
       MYSQL_TYPE_TINY,
       MYSQL_TYPE_SHORT,
       MYSQL_TYPE_LONG,
       MYSQL_TYPE_FLOAT,
       MYSQL_TYPE_DOUBLE,
       MYSQL_TYPE_NULL,
       MYSQL_TYPE_TIMESTAMP,
       MYSQL_TYPE_LONGLONG,
       MYSQL_TYPE_INT24,
       MYSQL_TYPE_DATE,
       MYSQL_TYPE_TIME,
       MYSQL_TYPE_DATETIME,
       MYSQL_TYPE_YEAR,
       MYSQL_TYPE_NEWDATE,
       MYSQL_TYPE_VARCHAR,
       MYSQL_TYPE_BIT,
       MYSQL_TYPE_NEWDECIMAL,
       MYSQL_TYPE_ENUM,
       MYSQL_TYPE_SET,
       MYSQL_TYPE_TINY_BLOB,
       MYSQL_TYPE_MEDIUM_BLOB,
       MYSQL_TYPE_LONG_BLOB,
       MYSQL_TYPE_BLOB,
       MYSQL_TYPE_VAR_STRING,
       MYSQL_TYPE_STRING,
       MYSQL_TYPE_GEOMETRY

# Constant indicating whether multiple statements in queries should be supported.
@compat const CLIENT_MULTI_STATEMENTS = UInt32( unsigned(1) << 16)

# Options to be passed to mysql_options API.
@compat const MYSQL_OPT_CONNECT_TIMEOUT = UInt32(0)
@compat const MYSQL_OPT_COMPRESS = UInt32(1)
@compat const MYSQL_OPT_NAMED_PIPE = UInt32(2)
@compat const MYSQL_INIT_COMMAND = UInt32(3)
@compat const MYSQL_READ_DEFAULT_FILE = UInt32(4)
@compat const MYSQL_READ_DEFAULT_GROUP = UInt32(5)
@compat const MYSQL_SET_CHARSET_DIR = UInt32(6)
@compat const MYSQL_SET_CHARSET_NAME = UInt32(7)
@compat const MYSQL_OPT_LOCAL_INFILE = UInt32(8)
@compat const MYSQL_OPT_PROTOCOL = UInt32(9)
@compat const MYSQL_SHARED_MEMORY_BASE_NAME = UInt32(10)
@compat const MYSQL_OPT_READ_TIMEOUT = UInt32(11)
@compat const MYSQL_OPT_WRITE_TIMEOUT = UInt32(12)
@compat const MYSQL_OPT_USE_RESULT = UInt32(13)
@compat const MYSQL_OPT_USE_REMOTE_CONNECTION = UInt32(14)
@compat const MYSQL_OPT_USE_EMBEDDED_CONNECTION = UInt32(15)
@compat const MYSQL_OPT_GUESS_CONNECTION = UInt32(16)
@compat const MYSQL_SET_CLIENT_IP = UInt32(17)
@compat const MYSQL_SECURE_AUTH = UInt32(18)
@compat const MYSQL_REPORT_DATA_TRUNCATION = UInt32(19)
@compat const MYSQL_OPT_RECONNECT = UInt32(20)
@compat const MYSQL_OPT_SSL_VERIFY_SERVER_CERT = UInt32(21)
@compat const MYSQL_PLUGIN_DIR = UInt32(22)
@compat const MYSQL_DEFAULT_AUTH = UInt32(23)
@compat const MYSQL_OPT_BIND = UInt32(24)
@compat const MYSQL_OPT_SSL_KEY = UInt32(25)
@compat const MYSQL_OPT_SSL_CERT = UInt32(26)
@compat const MYSQL_OPT_SSL_CA = UInt32(27)
@compat const MYSQL_OPT_SSL_CAPATH = UInt32(28)
@compat const MYSQL_OPT_SSL_CIPHER = UInt32(29)
@compat const MYSQL_OPT_SSL_CRL = UInt32(30)
@compat const MYSQL_OPT_SSL_CRLPATH = UInt32(31)
@compat const MYSQL_OPT_CONNECT_ATTR_RESET = UInt32(32)
@compat const MYSQL_OPT_CONNECT_ATTR_ADD = UInt32(33)
@compat const MYSQL_OPT_CONNECT_ATTR_DELETE = UInt32(34)
@compat const MYSQL_SERVER_PUBLIC_KEY = UInt32(35)
@compat const MYSQL_ENABLE_CLEARTEXT_PLUGIN = UInt32(36)
@compat const MYSQL_OPT_CAN_HANDLE_EXPIRED_PASSWORDS = UInt32(37)

export MYSQL_OPT_CONNECT_TIMEOUT,
       MYSQL_OPT_COMPRESS,
       MYSQL_OPT_NAMED_PIPE,
       MYSQL_INIT_COMMAND,
       MYSQL_READ_DEFAULT_FILE,
       MYSQL_READ_DEFAULT_GROUP,
       MYSQL_SET_CHARSET_DIR,
       MYSQL_SET_CHARSET_NAME,
       MYSQL_OPT_LOCAL_INFILE,
       MYSQL_OPT_PROTOCOL,
       MYSQL_SHARED_MEMORY_BASE_NAME,
       MYSQL_OPT_READ_TIMEOUT,
       MYSQL_OPT_WRITE_TIMEOUT,
       MYSQL_OPT_USE_RESULT,
       MYSQL_OPT_USE_REMOTE_CONNECTION,
       MYSQL_OPT_USE_EMBEDDED_CONNECTION,
       MYSQL_OPT_GUESS_CONNECTION,
       MYSQL_SET_CLIENT_IP,
       MYSQL_SECURE_AUTH,
       MYSQL_REPORT_DATA_TRUNCATION,
       MYSQL_OPT_RECONNECT,
       MYSQL_OPT_SSL_VERIFY_SERVER_CERT,
       MYSQL_PLUGIN_DIR,
       MYSQL_DEFAULT_AUTH,
       MYSQL_OPT_BIND,
       MYSQL_OPT_SSL_KEY,
       MYSQL_OPT_SSL_CERT,
       MYSQL_OPT_SSL_CA,
       MYSQL_OPT_SSL_CAPATH,
       MYSQL_OPT_SSL_CIPHER,
       MYSQL_OPT_SSL_CRL,
       MYSQL_OPT_SSL_CRLPATH,
       MYSQL_OPT_CONNECT_ATTR_RESET,
       MYSQL_OPT_CONNECT_ATTR_ADD,
       MYSQL_OPT_CONNECT_ATTR_DELETE,
       MYSQL_SERVER_PUBLIC_KEY,
       MYSQL_ENABLE_CLEARTEXT_PLUGIN,
       MYSQL_OPT_CAN_HANDLE_EXPIRED_PASSWORDS


const MYSQL_DATA_FRAME = 0
const MYSQL_ARRAY = 1

export MYSQL_DATA_FRAME, MYSQL_ARRAY

const MYSQL_TIMESTAMP_DATE     = 0
const MYSQL_TIMESTAMP_DATETIME = 1
const MYSQL_TIMESTAMP_TIME     = 2
