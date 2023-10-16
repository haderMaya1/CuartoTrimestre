use master
CREATE DATABASE DB_complete2
ON
(NAME = DB_complete_data1,
FILENAME = 'C:\sql\data1\DB_complete_data.mdf',

SIZE = 15,
MAXSIZE = 200,
FILEGROWTH = 20
),

(NAME = DB_complete_data2,
FILENAME = 'C:\sql\data1\DB_complete_data.ndf',

SIZE = 10,
MAXSIZE = 80,
FILEGROWTH = 2
)
LOG ON
(NAME = DB_complete_log1,
FILENAME = 'C:\sql\data1\DB_complete_log.ldf',

SIZE = 10,
MAXSIZE = 70,
FILEGROWTH = 5%
)
GO