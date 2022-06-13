-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Duty" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Duty" ("description", "id") SELECT "description", "id" FROM "Duty";
DROP TABLE "Duty";
ALTER TABLE "new_Duty" RENAME TO "Duty";
CREATE TABLE "new_Experience" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "companyName" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "startDate" BIGINT NOT NULL,
    "endDate" BIGINT
);
INSERT INTO "new_Experience" ("companyName", "endDate", "id", "position", "startDate") SELECT "companyName", "endDate", "id", "position", "startDate" FROM "Experience";
DROP TABLE "Experience";
ALTER TABLE "new_Experience" RENAME TO "Experience";
CREATE TABLE "new_Education" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "school" TEXT NOT NULL,
    "graduationDate" BIGINT NOT NULL,
    "degree" TEXT NOT NULL,
    "discipline" TEXT NOT NULL
);
INSERT INTO "new_Education" ("degree", "discipline", "graduationDate", "id", "school") SELECT "degree", "discipline", "graduationDate", "id", "school" FROM "Education";
DROP TABLE "Education";
ALTER TABLE "new_Education" RENAME TO "Education";
CREATE TABLE "new_Technology" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Technology" ("id", "name") SELECT "id", "name" FROM "Technology";
DROP TABLE "Technology";
ALTER TABLE "new_Technology" RENAME TO "Technology";
CREATE TABLE "new_Tag" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Tag" ("id", "name") SELECT "id", "name" FROM "Tag";
DROP TABLE "Tag";
ALTER TABLE "new_Tag" RENAME TO "Tag";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
