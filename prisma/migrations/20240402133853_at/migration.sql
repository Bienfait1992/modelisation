-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Coaches" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Matricule_coach" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Nom" TEXT NOT NULL,
    "Postnom" TEXT NOT NULL,
    "Date_de_naissance" TEXT NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Telephone" INTEGER NOT NULL
);
INSERT INTO "new_Coaches" ("Adresse", "Date_de_naissance", "Email", "Matricule_coach", "Nom", "Postnom", "Prenom", "Telephone", "id") SELECT "Adresse", "Date_de_naissance", "Email", "Matricule_coach", "Nom", "Postnom", "Prenom", "Telephone", "id" FROM "Coaches";
DROP TABLE "Coaches";
ALTER TABLE "new_Coaches" RENAME TO "Coaches";
CREATE UNIQUE INDEX "Coaches_Matricule_coach_key" ON "Coaches"("Matricule_coach");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
