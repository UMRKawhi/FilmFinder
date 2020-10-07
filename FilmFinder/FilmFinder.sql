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
INSERT INTO "admin" VALUES (1, 'admin', 'admin', '2020-10-08 09:14:23');



