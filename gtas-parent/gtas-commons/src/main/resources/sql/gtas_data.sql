-- ----------------------------
-- Roles
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Admin');
INSERT INTO `role` VALUES ('2', 'Manage Queries');
INSERT INTO `role` VALUES ('3', 'View Flight And Passenger');
INSERT INTO `role` VALUES ('4', 'Manage Watch List');
INSERT INTO `role` VALUES ('5', 'Manage Rules');
INSERT INTO `role` VALUES ('6', 'Test');

-- ----------------------------
-- Users
-- ----------------------------
-- password is 'password'
INSERT INTO `user` VALUES ('nsamha', 1,'Nael', 'Samha', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('jmclaughlin', 1,'Jim', 'McLaughlin', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('svempati', 1,'Srinivas', 'Vempati', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('jtang', 1,'Jeen', 'Tang', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('jtaylor',1, 'Jon', 'Taylor', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('mcopenhafer',1, 'Mike', 'Copenhafer', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('gtas',1, 'GTAS', 'Application User', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('admin',1, 'Admin', 'Admin', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');
INSERT INTO `user` VALUES ('test',1, 'test', 'test', '$2a$10$0rGc.QzA0MH7MM7OXqynJ.2Cnbdf9PiNk4ffi4ih6LSW3y21OkspG');

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('nsamha', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('jmclaughlin', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('svempati', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('jtang', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('jtaylor', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('mcopenhafer', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('admin', 1);
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES ('test', 1);

-- ----------------------------
-- Records of flight_direction
-- ----------------------------

INSERT INTO `flight_direction` VALUES (1,'I', 'Inbound');
INSERT INTO `flight_direction` VALUES (2,'O', 'Outbound');
INSERT INTO `flight_direction` VALUES (3,'C', 'Continuance');
INSERT INTO `flight_direction` VALUES (4,'A', 'Any');

-- ----------------------------
-- Records of app_configuration
-- ----------------------------
insert into app_configuration (opt, val, description) values('HOME_COUNTRY', 'USA', 'home country for the loader to determine incoming/outgoing flights');
insert into app_configuration (opt, val, description) values('ELASTIC_HOSTNAME','localhost','ElasticSearch hostname');
insert into app_configuration (opt, val, description) values('ELASTIC_PORT','9300','ElasticSearch port');
insert into app_configuration (opt, val, description) values('QUEUE', 'gtasQ', 'queue name for storing incoming messages');
insert into app_configuration (opt, val, description) values('UPLOAD_DIR', 'C:\\MESSAGE', 'directory for uploading files from UI');
insert into app_configuration (opt, val, description) values('HOURLY_ADJ','-5','Dashboard Time Adjustment');

-- ----------------------------
-- Records of dashboard_message_stats
-- ----------------------------

INSERT INTO `dashboard_message_stats` (`id`, `dt_modified`,`message_type`, `hour_1`, `hour_2`, `hour_3`, `hour_4`, `hour_5`, `hour_6`, `hour_7`, `hour_8`, `hour_9`, `hour_10`, `hour_11`, `hour_12`, `hour_13`, `hour_14`, `hour_15`, `hour_16`, `hour_17`, `hour_18`, `hour_19`, `hour_20`, `hour_21`, `hour_22`, `hour_23`, `hour_24`) VALUES
(1, CURRENT_TIMESTAMP, 'API', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO `dashboard_message_stats` (`id`, `dt_modified`,`message_type`, `hour_1`, `hour_2`, `hour_3`, `hour_4`, `hour_5`, `hour_6`, `hour_7`, `hour_8`, `hour_9`, `hour_10`, `hour_11`, `hour_12`, `hour_13`, `hour_14`, `hour_15`, `hour_16`, `hour_17`, `hour_18`, `hour_19`, `hour_20`, `hour_21`, `hour_22`, `hour_23`, `hour_24`) VALUES
(2, CURRENT_TIMESTAMP, 'PNR', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/*These 4 statuses are irremovable (though mutable) and must exist in some form in order to preserve the case management flow, with this order for ID purposes. */
insert into disposition_status(id, name, description) values(1, 'NEW', 'New Case');
insert into disposition_status(id, name, description) values(2, 'OPEN', 'Case is open');
insert into disposition_status(id, name, description) values(3, 'CLOSED', 'No action required');
insert into disposition_status(id, name, description) values(4, 'RE-OPEN', 'Re-opened case');
insert into disposition_status(id, name, description) values(5, 'PENDING CLOSURE','Case is pending closure');