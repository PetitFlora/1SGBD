DROP TABLE ABSANCE;
DROP TABLE NOTE;
DROP TABLE HISTORIQUE_PROMOTION;
DROP TABLE ENSEIGNE;
DROP TABLE PROMOTION;
DROP TABLE ETUDIANT;
DROP TABLE MATIERE;
DROP TABLE ENSEIGNANT;

CREATE TABLE ENSEIGNANT
(
    ID number PRIMARY KEY,
    Nom varchar2(255) NOT NULL,
    Prenom varchar2(255) NOT NULL,
    Email varchar2(255) NOT NULL UNIQUE,
    DateEntree date DEFAULT SYSDATE NOT NULL
);

CREATE TABLE MATIERE
(
    ID number PRIMARY KEY,
    Nom varchar2(255) NOT NULL
);

CREATE TABLE ENSEIGNE
(
    IdEnseignant number NOT NULL,
    IdMatiere number NOT NULL,

    PRIMARY KEY (IdEnseignant, IdMatiere)
    FOREIGN KEY (IdEnseignant) REFERENCES ENSEIGNANT(ID),
    FOREIGN KEY (IdMatiere) REFERENCES MATIERE(ID)
);

CREATE TABLE ETUDIANT
(
    ID number PRIMARY KEY,
    Nom varchar2(255) NOT NULL,
    Prenom varchar2(255) NOT NULL,
    Email varchar2(255) NOT NULL UNIQUE
);

CREATE TABLE PROMOTION
(
    ID number PRIMARY KEY,
    AnneeScolaire varchar2(9) NOT NULL,
    NiveauEtude varchar2(255)
);

CREATE TABLE HISTORIQUE_PROMOTION
(
    IdPromotion number NOT NULL,
    IdEtudiant number NOT NULL,

    PRIMARY KEY (IdPromotion, IdEtudiant),
    FOREIGN KEY (IdPromotion) REFERENCES PROMOTION(ID),
    FOREIGN KEY (IdEtudiant) REFERENCES ETUDIANT(ID)
);

CREATE TABLE NOTE
(
    ID number PRIMARY KEY,
    IdEtudiant number NOT NULL,
    IdEnseignant number NOT NULL,
    IdMatiere number NOT NULL,
    Note number NOT NULL,
    DatePublication date DEFAULT SYSDATE NOT NULL,

    FOREIGN KEY (IdEtudiant) REFERENCES ETUDIANT(ID),
    FOREIGN KEY (IdEnseignant) REFERENCES ENSEIGNANT(ID),
    FOREIGN KEY (IdMatiere) REFERENCES MATIERE(ID)
);

CREATE TABLE ABSANCE
(
    ID number PRIMARY KEY,
    IdEtudiant number NOT NULL,
    DateAbsance date NOT NULL,
    MinutesAbsance number NOT NULL,
    Justification varchar2(255),

    FOREIGN KEY (IdEtudiant) REFERENCES ETUDIANT(ID)
);