#テーブル設計

## users テーブル

| Column            | Type     | Options     |
|-------------------|----------|-------------|
| email             |string    |Null: false  |
| encrypted_password|string    |Null: false  |
| name              |string    |Null: false  |
| profile           |text      |Null: false  |
| occupation        |text      |Null: false  |
| position          |text      |Null: false  |


## prototypes テーブル

| Column            | Type     | Options                       |
|-------------------|----------|-------------------------------|
| title             |string    |Null: false                    |
| catch_copy        |text      |Null: false                    |
| concept           |text      |Null: false                    |
| user              |reference |Null: false foreign_key: true  |

## comments テーブル

| Column            | Type     | Options                      |
|-------------------|----------|------------------------------|
| content           |text      |Null: false                   |
| prototype         |reference |Null: false  foreign_key: true|
| user              |reference |Null: false  foreign_key: true|