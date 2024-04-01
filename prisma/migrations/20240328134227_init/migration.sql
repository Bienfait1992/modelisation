-- CreateTable
CREATE TABLE "machines" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Tag" TEXT NOT NULL,
    "Modele" TEXT NOT NULL,
    "Fabriquant" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Apprenant" (
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
    CONSTRAINT "Apprenant_code_cohorteId_fkey" FOREIGN KEY ("code_cohorteId") REFERENCES "Cohorte" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Session" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Id_session" TEXT NOT NULL,
    "cohorteId" INTEGER NOT NULL,
    "Annee" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "Ville" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Cohorte" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Code_cohorte" INTEGER NOT NULL,
    "Description" TEXT NOT NULL,
    "code_sessionId" INTEGER NOT NULL,
    CONSTRAINT "Cohorte_code_sessionId_fkey" FOREIGN KEY ("code_sessionId") REFERENCES "Session" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Coaches" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Matricule_coach" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,
    "Nom" TEXT NOT NULL,
    "Postnom" TEXT NOT NULL,
    "Date_de_naissance" DATETIME NOT NULL,
    "Adresse" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Telephone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Coaching" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "coachesId" INTEGER NOT NULL,
    "cohorteId" INTEGER NOT NULL,
    CONSTRAINT "Coaching_coachesId_fkey" FOREIGN KEY ("coachesId") REFERENCES "Coaches" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Coaching_cohorteId_fkey" FOREIGN KEY ("cohorteId") REFERENCES "Cohorte" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "machines_Tag_key" ON "machines"("Tag");

-- CreateIndex
CREATE UNIQUE INDEX "Apprenant_Matricule_key" ON "Apprenant"("Matricule");

-- CreateIndex
CREATE UNIQUE INDEX "Session_Id_session_key" ON "Session"("Id_session");

-- CreateIndex
CREATE UNIQUE INDEX "Cohorte_Code_cohorte_key" ON "Cohorte"("Code_cohorte");

-- CreateIndex
CREATE UNIQUE INDEX "Coaches_Matricule_coach_key" ON "Coaches"("Matricule_coach");
