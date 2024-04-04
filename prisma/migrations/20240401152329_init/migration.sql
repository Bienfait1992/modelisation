/*
  Warnings:

  - You are about to drop the `Cohorte` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `cohorteId` on the `Session` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Cohorte_Code_cohorte_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Cohorte";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "cohorte" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Code_cohorte" INTEGER NOT NULL,
    "Description" TEXT NOT NULL,
    "Id_sessionId" INTEGER NOT NULL,
    CONSTRAINT "cohorte_Id_sessionId_fkey" FOREIGN KEY ("Id_sessionId") REFERENCES "Session" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Apprenant" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Matricule" TEXT NOT NULL,
    "machinesId" INTEGER NOT NULL,
    "code_cohorteId" INTEGER NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Nom" TEXT NOT NULL,
    "Postnom" TEXT NOT NULL,
    "Date_de_naissance" DATETIME NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Telephone" INTEGER NOT NULL,
    CONSTRAINT "Apprenant_machinesId_fkey" FOREIGN KEY ("machinesId") REFERENCES "machines" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Apprenant_code_cohorteId_fkey" FOREIGN KEY ("code_cohorteId") REFERENCES "cohorte" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Apprenant" ("Adresse", "Date_de_naissance", "Email", "Matricule", "Nom", "Postnom", "Prenom", "Telephone", "code_cohorteId", "id", "machinesId") SELECT "Adresse", "Date_de_naissance", "Email", "Matricule", "Nom", "Postnom", "Prenom", "Telephone", "code_cohorteId", "id", "machinesId" FROM "Apprenant";
DROP TABLE "Apprenant";
ALTER TABLE "new_Apprenant" RENAME TO "Apprenant";
CREATE UNIQUE INDEX "Apprenant_Matricule_key" ON "Apprenant"("Matricule");
CREATE TABLE "new_Coaching" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "coachesId" INTEGER NOT NULL,
    "cohorteId" INTEGER NOT NULL,
    CONSTRAINT "Coaching_coachesId_fkey" FOREIGN KEY ("coachesId") REFERENCES "Coaches" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Coaching_cohorteId_fkey" FOREIGN KEY ("cohorteId") REFERENCES "cohorte" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Coaching" ("coachesId", "cohorteId", "id") SELECT "coachesId", "cohorteId", "id" FROM "Coaching";
DROP TABLE "Coaching";
ALTER TABLE "new_Coaching" RENAME TO "Coaching";
CREATE TABLE "new_Session" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Id_session" TEXT NOT NULL,
    "Annee" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Ville" TEXT NOT NULL
);
INSERT INTO "new_Session" ("Annee", "Id_session", "Type", "Ville", "id") SELECT "Annee", "Id_session", "Type", "Ville", "id" FROM "Session";
DROP TABLE "Session";
ALTER TABLE "new_Session" RENAME TO "Session";
CREATE UNIQUE INDEX "Session_Id_session_key" ON "Session"("Id_session");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "cohorte_Code_cohorte_key" ON "cohorte"("Code_cohorte");
