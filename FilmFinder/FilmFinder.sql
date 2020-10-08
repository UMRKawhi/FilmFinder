SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- TABLE ABOUT ADMIN

DROP TABLE IF EXISTS "admin";
CREATE TABLE "admin" (
    "id" INT(11) NOT NULL AUTO_INCREMENT,
    "name" VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "password" VARCHAR(100) CHARACTER SET utf8mb4 COLLARE utf8mb4_general_ci DEFAULT NULL,
    "create_time" DATETIME(0) DEFAULT NULL,
    PRIMARY KEY ("id") USING BTREE,
    UNIQUE INDEX "name"("name") USING BTREE,
    INDEX `ix_admin_create_time`(`create_time`) USING BTREE
)   ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- INSERT DEFAULT ADMIN
-- user name: admin password:admin
INSERT INTO "admin" VALUES (1, "admin", "admin", "2020-10-08 09:14:2");

-- Table structure for adminlog
DROP TABLE IF EXISTS "adminlog";
CREATE TABLE "adminlog" (
    "id" int(11) NOT NULL AUTO_INCREMENT,
    "admin_id" int(11) DEFAULT NULL,
    "ip" VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "login_time" datetime(0) DEFAULT NULL,
    PRIMARY KEY("id") USING BTREE,
    INDEX "admin_id" ("admin_id") USING BTREE,
    INDEX "ix_admin_create_time"("login_time") USING BTREE,
    CONSTRAINT "adminlog_ibfk_1" FOREIGN KEY("admin_id") REFERENCES "admin"("id") ON DELETE RESTRICT ON UPDATE RESTRICT 
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;


-- Table structure about cast
DROP TABLE IF EXISTS "cast";
CREATE TABLE "cast"(
    "id" int(11) NOT NULL AUTO_INCREMENT,
    "first_name" VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "second_name" VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "name" VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "email" VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "phone" VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    "face" VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY("id") USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;





