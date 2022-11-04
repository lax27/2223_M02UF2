DROP TABLE IF EXISTS weapons_materials;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;

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




        CREATE TABLE weapons( 
   id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   weapon VARCHAR(24),
    grip INT,
    lvl INT,
    attack INT,
    defense INT,
    id_weapon_type INT UNSIGNED,
	FOREIGN KEY(id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);

INSERT INTO weapons (weapon,grip,lvl,attack,defense,id_weapon_type) 
VALUES("queso",1,2,3,4,1), 
		("carne de zombi",23,4,21,12,3),
        ("fragment escarlata",12,43,45,34,2);

        



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
  id_weapon INT UNSIGNED,
  id_material INT UNSIGNED,
  FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
  FOREIGN KEY (id_material) REFERENCES materials(id_material)
);
