/*
  Warnings:

  - You are about to alter the column `A` on the `_DutyToExperience` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `B` on the `_DutyToExperience` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `Duty` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `Duty` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `Tag` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `Tag` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `Education` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `graduationDate` on the `Education` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `id` on the `Education` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `A` on the `_DutyToTag` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `B` on the `_DutyToTag` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `Experience` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `endDate` on the `Experience` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `id` on the `Experience` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `startDate` on the `Experience` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - The primary key for the `Technology` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `Technology` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `A` on the `_DutyToTechnology` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.
  - You are about to alter the column `B` on the `_DutyToTechnology` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new__DutyToExperience" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DutyToExperience_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToExperience_B_fkey" FOREIGN KEY ("B") REFERENCES "Experience" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new__DutyToExperience" ("A", "B") SELECT "A", "B" FROM "_DutyToExperience";
DROP TABLE "_DutyToExperience";
ALTER TABLE "new__DutyToExperience" RENAME TO "_DutyToExperience";
CREATE UNIQUE INDEX "_DutyToExperience_AB_unique" ON "_DutyToExperience"("A", "B");
CREATE INDEX "_DutyToExperience_B_index" ON "_DutyToExperience"("B");
CREATE TABLE "new_Duty" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Duty" ("description", "id") SELECT "description", "id" FROM "Duty";
DROP TABLE "Duty";
ALTER TABLE "new_Duty" RENAME TO "Duty";
CREATE TABLE "new_Tag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Tag" ("id", "name") SELECT "id", "name" FROM "Tag";
DROP TABLE "Tag";
ALTER TABLE "new_Tag" RENAME TO "Tag";
CREATE TABLE "new_Education" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "school" TEXT NOT NULL,
    "graduationDate" INTEGER NOT NULL,
    "degree" TEXT NOT NULL,
    "discipline" TEXT NOT NULL
);
INSERT INTO "new_Education" ("degree", "discipline", "graduationDate", "id", "school") SELECT "degree", "discipline", "graduationDate", "id", "school" FROM "Education";
DROP TABLE "Education";
ALTER TABLE "new_Education" RENAME TO "Education";
CREATE TABLE "new__DutyToTag" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DutyToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new__DutyToTag" ("A", "B") SELECT "A", "B" FROM "_DutyToTag";
DROP TABLE "_DutyToTag";
ALTER TABLE "new__DutyToTag" RENAME TO "_DutyToTag";
CREATE UNIQUE INDEX "_DutyToTag_AB_unique" ON "_DutyToTag"("A", "B");
CREATE INDEX "_DutyToTag_B_index" ON "_DutyToTag"("B");
CREATE TABLE "new_Experience" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "companyName" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "startDate" INTEGER NOT NULL,
    "endDate" INTEGER
);
INSERT INTO "new_Experience" ("companyName", "endDate", "id", "position", "startDate") SELECT "companyName", "endDate", "id", "position", "startDate" FROM "Experience";
DROP TABLE "Experience";
ALTER TABLE "new_Experience" RENAME TO "Experience";
CREATE TABLE "new_Technology" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Technology" ("id", "name") SELECT "id", "name" FROM "Technology";
DROP TABLE "Technology";
ALTER TABLE "new_Technology" RENAME TO "Technology";
CREATE TABLE "new__DutyToTechnology" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DutyToTechnology_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToTechnology_B_fkey" FOREIGN KEY ("B") REFERENCES "Technology" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new__DutyToTechnology" ("A", "B") SELECT "A", "B" FROM "_DutyToTechnology";
DROP TABLE "_DutyToTechnology";
ALTER TABLE "new__DutyToTechnology" RENAME TO "_DutyToTechnology";
CREATE UNIQUE INDEX "_DutyToTechnology_AB_unique" ON "_DutyToTechnology"("A", "B");
CREATE INDEX "_DutyToTechnology_B_index" ON "_DutyToTechnology"("B");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
