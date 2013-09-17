create user 'shirtuser'@'localhost' identified by 'html1234';
grant all on store.* to 'shirtuser'@'localhost';


-- G:\dbfiles\CreateUsersStore.sql

DROP USER getShirts@localhost;

CREATE USER getShirts@localhost IDENTIFIED BY 'html1234';

GRANT EXECUTE ON PROCEDURE Store.getShirts TO getShirts@localhost;
GRANT EXECUTE ON PROCEDURE Store.getDetails TO getShirts@localhost;
GRANT EXECUTE ON PROCEDURE Store.getRecommended TO getShirts@localhost;

DROP USER addShirts@localhost;

CREATE USER addShirts@localhost IDENTIFIED BY 'html1234';

GRANT EXECUTE ON PROCEDURE Store.addCart TO addShirts@localhost;
GRANT EXECUTE ON PROCEDURE Store.getCart TO addShirts@localhost;
GRANT EXECUTE ON PROCEDURE Store.addShirt TO addShirts@localhost;