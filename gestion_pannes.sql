-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 12 mai 2024 à 17:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_pannes`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `numTel` varchar(15) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `nom`, `prenom`, `numTel`, `role`, `Email`, `mdp`) VALUES
(1, 'fares', 'bahloul', '87654321', 'admin', 'fares@gmail.com', '123'),
(8, 'ahmed', 'ahmed', '12345678', 'administrateur', 'ahmed@gmail.com', '123');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

CREATE TABLE `intervention` (
  `ID_Intervention` int(11) NOT NULL,
  `DateDeclaration` date NOT NULL,
  `Description` text NOT NULL,
  `ID_Utilisateur` int(11) DEFAULT NULL,
  `ID_Materiel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`ID_Intervention`, `DateDeclaration`, `Description`, `ID_Utilisateur`, `ID_Materiel`) VALUES
(71, '2024-01-24', 'panne clavier', 2, 4),
(72, '2024-01-24', 'panne ecran et clavier', 3, 5),
(74, '2024-01-24', 'panne clavier', 10, 11),
(84, '2024-01-24', 'test3', 5, 7),
(89, '2024-01-27', 'panne ecran et clavier', 4, 6),
(90, '2024-02-02', 'test', 9, 10),
(92, '2024-04-16', 'test', 2, 4),
(93, '2024-04-17', 'test', 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `ID_Materiel` int(11) NOT NULL,
  `Produit` varchar(50) NOT NULL,
  `Marque` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `NumSerie` varchar(50) NOT NULL,
  `DateMES` date NOT NULL,
  `Service` varchar(50) NOT NULL,
  `Statut` varchar(50) NOT NULL,
  `ID_Utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`ID_Materiel`, `Produit`, `Marque`, `model`, `NumSerie`, `DateMES`, `Service`, `Statut`, `ID_Utilisateur`) VALUES
(4, 'Imprimante ', 'HP ', 'LaserJet Pro M404dn.', '12345678', '2023-01-12', 'service2', 'En cours de réparation', 2),
(5, 'Ordinateur portable', 'Dell ', 'Dell XPS 13', '87654321', '2022-01-12', 'service3', 'En marche', 3),
(6, 'Ordinateur portable', 'Mac', 'MacBook Pro', '11223344', '2024-01-18', 'service4', 'En marche', 4),
(7, 'Ordinateur portable', 'Asus', 'Asus ROG Zephyrus G14', '22002200', '2024-01-18', 'service4', 'irréparable', 5),
(10, 'Ordinateur portable', 'lenovo', 'lenovo', '123456', '2024-01-23', 'informatique', 'En marche', 9),
(11, 'Ordinateur portable', 'dell', 'inspiron', '888888', '2024-01-23', 'informatique', 'En marche', 10);

-- --------------------------------------------------------

--
-- Structure de la table `ordretravail`
--

CREATE TABLE `ordretravail` (
  `ID_OT` int(11) NOT NULL,
  `DateDebut_OT` datetime NOT NULL,
  `DateDeCloture` datetime DEFAULT NULL,
  `DateReparation` datetime DEFAULT NULL,
  `NatureTravaux` text NOT NULL,
  `Observation` text DEFAULT NULL,
  `ID_Materiel` int(11) DEFAULT NULL,
  `ID_Intervention` int(11) DEFAULT NULL,
  `ID_Utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ordretravail`
--

INSERT INTO `ordretravail` (`ID_OT`, `DateDebut_OT`, `DateDeCloture`, `DateReparation`, `NatureTravaux`, `Observation`, `ID_Materiel`, `ID_Intervention`, `ID_Utilisateur`) VALUES
(46, '2024-01-25 00:00:00', '2024-01-25 00:00:00', '2024-01-25 00:00:00', 'Software', '\r\nll', 4, 71, 2),
(48, '2024-01-25 00:00:00', '2024-01-25 00:00:00', '2024-01-25 00:00:00', 'Hardware', 'mlkjh', 11, 74, 10),
(50, '2024-01-27 00:00:00', '2024-01-27 00:00:00', '2024-01-27 00:00:00', 'Hardware', 'observation', 6, 89, 4),
(51, '2024-01-26 00:00:00', '2024-01-27 00:00:00', '2024-01-28 00:00:00', 'Hardware', '.', 7, 84, 5),
(52, '2024-01-23 00:00:00', '2024-01-30 00:00:00', '2024-01-30 00:00:00', 'Hardware', 'test valider ', 5, 72, 3),
(54, '2024-04-16 00:00:00', '2024-04-16 00:00:00', '2024-04-16 00:00:00', 'Software', 'test', 4, 92, 2),
(55, '2024-04-17 00:00:00', '2024-04-17 00:00:00', '2024-04-17 00:00:00', 'Hardware', 'ddd', 10, 90, 9);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_Utilisateur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `numTel` varchar(15) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_Utilisateur`, `nom`, `prenom`, `numTel`, `role`, `Email`, `mdp`) VALUES
(2, 'hatem', 'labiath', '12345678', 'employé', 'hatem@gmail.com', ''),
(3, 'ali', 'ali', '12345678', 'employe', 'ali@gmail.com', ''),
(4, 'amin', 'amin', '11223344', 'employe', 'amin@gmail.com', ''),
(5, 'samir', 'samir', '55555555', 'employe', 'samir@gmail.com', ''),
(7, 'nouri', 'nouri', '56489723', 'technicien', 'nouri@gmail.com', '123'),
(9, 'labiath', 'hatem', '123', 'employe', 'labiadhhatem78@gmail.com', ''),
(10, 'bahloul', 'fares', '000000', 'employe', 'bahloulfares3@gmail.com', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`ID_Intervention`),
  ADD KEY `ID_Materiel` (`ID_Materiel`),
  ADD KEY `intervention_ibfk_1` (`ID_Utilisateur`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`ID_Materiel`),
  ADD KEY `ID_Utilisateur` (`ID_Utilisateur`);

--
-- Index pour la table `ordretravail`
--
ALTER TABLE `ordretravail`
  ADD PRIMARY KEY (`ID_OT`),
  ADD KEY `ID_Materiel` (`ID_Materiel`),
  ADD KEY `ID_Intervention` (`ID_Intervention`),
  ADD KEY `ID_Utilisateur` (`ID_Utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_Utilisateur`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `intervention`
--
ALTER TABLE `intervention`
  MODIFY `ID_Intervention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `ID_Materiel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `ordretravail`
--
ALTER TABLE `ordretravail`
  MODIFY `ID_OT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`ID_Utilisateur`) REFERENCES `utilisateur` (`ID_Utilisateur`),
  ADD CONSTRAINT `intervention_ibfk_2` FOREIGN KEY (`ID_Materiel`) REFERENCES `materiel` (`ID_Materiel`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`ID_Utilisateur`) REFERENCES `utilisateur` (`ID_Utilisateur`);

--
-- Contraintes pour la table `ordretravail`
--
ALTER TABLE `ordretravail`
  ADD CONSTRAINT `ordretravail_ibfk_1` FOREIGN KEY (`ID_Materiel`) REFERENCES `materiel` (`ID_Materiel`),
  ADD CONSTRAINT `ordretravail_ibfk_2` FOREIGN KEY (`ID_Intervention`) REFERENCES `intervention` (`ID_Intervention`),
  ADD CONSTRAINT `ordretravail_ibfk_3` FOREIGN KEY (`ID_Utilisateur`) REFERENCES `utilisateur` (`ID_Utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
