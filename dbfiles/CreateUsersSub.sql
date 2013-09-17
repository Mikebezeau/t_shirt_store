-- G:\dbfiles\CreateUser.sql

DROP USER addemail@localhost;
DROP USER deleteemail@localhost;

CREATE USER addemail@localhost IDENTIFIED BY 'html1234';
GRANT SELECT, INSERT ON Subscription.Email TO addemail@localhost;

CREATE USER deleteemail@localhost IDENTIFIED BY 'html1234';
GRANT SELECT, DELETE ON Subscription.Email TO deleteemail@localhost;