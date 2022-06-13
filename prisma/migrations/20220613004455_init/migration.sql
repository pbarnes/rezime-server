-- CreateTable
CREATE TABLE "Technology" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "companyName" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "startDate" BIGINT NOT NULL,
    "endDate" BIGINT NOT NULL
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Duty" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Education" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "school" TEXT NOT NULL,
    "graduationDate" BIGINT NOT NULL,
    "degree" TEXT NOT NULL,
    "discipline" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_DutyToTechnology" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL,
    CONSTRAINT "_DutyToTechnology_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToTechnology_B_fkey" FOREIGN KEY ("B") REFERENCES "Technology" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_DutyToTag" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL,
    CONSTRAINT "_DutyToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_DutyToExperience" (
    "A" BIGINT NOT NULL,
    "B" BIGINT NOT NULL,
    CONSTRAINT "_DutyToExperience_A_fkey" FOREIGN KEY ("A") REFERENCES "Duty" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DutyToExperience_B_fkey" FOREIGN KEY ("B") REFERENCES "Experience" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_DutyToTechnology_AB_unique" ON "_DutyToTechnology"("A", "B");

-- CreateIndex
CREATE INDEX "_DutyToTechnology_B_index" ON "_DutyToTechnology"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DutyToTag_AB_unique" ON "_DutyToTag"("A", "B");

-- CreateIndex
CREATE INDEX "_DutyToTag_B_index" ON "_DutyToTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DutyToExperience_AB_unique" ON "_DutyToExperience"("A", "B");

-- CreateIndex
CREATE INDEX "_DutyToExperience_B_index" ON "_DutyToExperience"("B");
