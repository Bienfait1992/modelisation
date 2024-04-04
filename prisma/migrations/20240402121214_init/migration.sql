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
    "Date_de_naissance" TEXT NOT NULL,
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
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
