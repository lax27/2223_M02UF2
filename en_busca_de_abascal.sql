DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS weapon;
DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS armours_types;

DROP TABLE IF EXISTS characters_weapons;

CREATE TABLE materials(
  id_material int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  material VARCHAR(16),
  color CHAR(6),
  cost FLOAT 
);

INSERT INTO materials(material,color,cost) 
VALUES	("obsidiana", "000000", 40),
		("madera", "ddeeaa", 10),
		("carne", "ffff00", 5),
        ("pana", "ffdddd" , 50),
        ("goma sagrada", "ffffff", 10000),
        ("piedra", "cccccc", 1),
        ("cuero", "ddddaa", 20),
        ("bandera españa", "ESPAÑA", 2030),
        ("plumas de angel", "ffffff", 10000),
        ("materia oscura", "000000", 10000),
        ("hueso", "ffdddd", 10),
        ("agua", "000ff", 1),
        ("lava", "ff0000", 500);
        
 
CREATE TABLE weapons_materials ( 
  id_weapon_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_weapons INT UNSIGNED,
  id_material INT UNSIGNED,
  FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
  FOREIGN KEY (id_material) REFERENCES materials(id_material)
);




CREATE TABLE armours_materials(
id_armours_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_armours INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_armours) REFERENCES armours(id_armours),
FOREIGN KEY (id_material) REFERENCES materials(id_material) 
);



CREATE TABLE items_types(
  id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  types VARCHAR(24),
  descripcion TEXT,
  icon CHAR(24)
);
INSERT INTO items_types(types,descripcion,icon) 
VALUES("comida", "se come", "comida.png"),
	("pocion", "te cura", "pocion.png"),
	("tesoro", "$_$", "tesoro.png");
        
CREATE TABLE weapons_types(
  id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  types VARCHAR(24),
  descripcion TEXT,
  icon CHAR(24)
    );
INSERT INTO weapons_types(types,descripcion,icon) 
VALUES("melee", "cuerpo a cuerpo", "mele.png"),
		("Range", "Distancia", "range.png"),
		("magic", "distancia", "magia.png");



CREATE TABLE weapon(
    id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(16),
    grip INT,
    durability INT,
    distance FLOAT,
    quality INT,
    physic_attack FLOAT,
    physic_defense FLOAT,
    magic_attack FLOAT,
    magic_defense FLOAT,
    descripcion TEXT,
    lvl INT,
    lvl_min INT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY(id_weapon_type) REFERENCES weapons_types(id_weapon_type)
    );

    INSERT INTO weapons(weapon,grip,durability,distance,quality,physic_defense,physic_attack,magic_attack,magic_defense,descripcion,lvl,lvl_min,id_weapon_type)
	VALUES 	("brazo bebe",1,2,3,4,5,6,7,8,"aa",1,2,1),
		("brazo de alien",1,2,3,4,5,6,7,8,"bb",1,2,3),
        	("brazo z",1,2,3,4,5,6,7,8,"cc",1,2,2);
        
CREATE TABLE armours_types(
  id_armours_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  types VARCHAR(24),
  descripcion TEXT,
  icon CHAR(24)
    );
INSERT INTO armours_types(types,descripcion,icon) 
VALUES("peto", "pal pexito", "peto.png"),
	("traje", "pal cuerpesito", "traje.png"),
	("casco", "pa' la cabesa", "casco.png");





CREATE TABLE items( 
id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   item VARCHAR(24),
    consumible BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT,
    weight FLOAT,
    `usage` INT,
    fusionalbe BOOLEAN,
    width FLOAT,
    height FLOAT,
    durability INT,
    description TEXT,
    disassamble BOOLEAN,
    id_item_type INT UNSIGNED,
	FOREIGN KEY(id_item_type) REFERENCES items_types (id_item_type)
);




INSERT INTO items (item, consumible, cost, `key`, rarity, weight, `usage`, fusionalbe, width, height, durability, description, disassamble, id_item_type) 
VALUES("queso",true,50,false,3,20,true,true, 0.1 , 0.1,3,"queso que sabe a beso",false,1), 
		("carne de zombi",true,20,false,2,40,true,true,0.3,0.3,1,"esto huele mal",false,1),
        ("fragment escarlata",true,500,false,45,10000,true,true,0.5,0.25,-1,"piedra rara de un volcan",false,2);



CREATE TABLE characters_weapons(
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED,
    id_weapon INT UNSIGNED,
    FOREIGN KEY(id_character) REFERENCES characters(id_character),
    FOREIGN KEY(id_weapon) REFERENCES weapon(id_weapon)
    );



CREATE TABLE characters_weapons(
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED,
    id_weapon INT UNSIGNED,
    FOREIGN KEY(id_character) REFERENCES characters(id_character),
    FOREIGN KEY(id_weapon) REFERENCES weapon(id_weapon)
    );
    
    INSERT INTO characters_weapons (id_character,id_weapon) VALUES (1,1),(4,1);
    
    
    
    



		
        