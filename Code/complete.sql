create database police2;
USE  police2;
CREATE TABLE citizen(
	user_id int NOT NULL,
    password varchar(50),
    aadhar_no int,
    first_name varchar(20),
    last_name varchar(10),
    contact_no varchar(15),
    email varchar(20),
    house_no varchar(10),
    locality varchar(20),
    city varchar(20),
    district varchar(20),
    state varchar(20),
    postal_code varchar(10),
    
    PRIMARY KEY (user_id)
);
CREATE TABLE fir(
	fir_id varchar(10),
    suspect_name varchar(20),
    contact_no varchar(15),
    gender varchar(5),
    address varchar(50),
   place_of_incident varchar(50),
   date_and_time varchar(20),
   brief varchar(100),
   user_id int,
  
    
    PRIMARY KEY (fir_id),
    FOREIGN KEY (user_id) references citizen(user_id)
    
);
CREATE TABLE official(
	official_id varchar(10) not null,
    password varchar(50),
	official_name varchar(20),
    contact_no varchar(15),
    email varchar(20),
    post varchar(20),
    
    PRIMARY KEY (official_id)
);
CREATE TABLE permission(
	permission_id varchar(10) not null,
    subject varchar(50),
	no_of_person int,
    date_and_time varchar(15),
    brief varchar(50),
    post varchar(20),
    official_id varchar(10) not null,
    user_id int NOT NULL,
    
    PRIMARY KEY (permission_id),
    FOREIGN KEY (user_id) REFERENCES citizen(user_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);
CREATE TABLE challan(
	challan_no varchar(10) not null,
    dl_number varchar(10),
	vehicle_type varchar(20),
    vehicle_no varchar(15),
    date_and_time varchar(15),
    violation varchar(20),
    payment_status varchar(20),
    fine_amount varchar(10) not null,
    user_id int NOT NULL,
     official_id varchar(10) not null,
    
    PRIMARY KEY (challan_no),
    FOREIGN KEY (user_id) REFERENCES citizen(user_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);

CREATE TABLE weapon(
	weapon_id varchar(10) not null,
    no_of_bullets varchar(20),
	quantity varchar(20),
    description varchar(50),
   official_id varchar(10) not null,
    
    PRIMARY KEY (weapon_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);
CREATE TABLE vehicle(
	vehicle_id varchar(10) not null,
    vehicle_no varchar(20),
	vehicle_type varchar(20),
    description varchar(50),
   official_id varchar(10) not null,
    
    PRIMARY KEY (vehicle_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);





