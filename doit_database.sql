-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Dim 09 Novembre 2014 à 01:49
-- Version du serveur :  5.5.38
-- Version de PHP :  5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `doit`
--
CREATE DATABASE IF NOT EXISTS `doit` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `doit`;

-- --------------------------------------------------------

--
-- Structure de la table `doit_list`
--

CREATE TABLE `doit_list` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `doit_task`
--

CREATE TABLE `doit_task` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `state` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deadline` timestamp NULL DEFAULT NULL,
  `notification` int(1) NOT NULL DEFAULT '0',
  `color` varchar(7) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `doit_user`
--

CREATE TABLE `doit_user` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(56) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `doit_list`
--
ALTER TABLE `doit_list`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doit_task`
--
ALTER TABLE `doit_task`
 ADD PRIMARY KEY (`id`), ADD KEY `owner_id` (`owner_id`);

--
-- Index pour la table `doit_user`
--
ALTER TABLE `doit_user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `doit_list`
--
ALTER TABLE `doit_list`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `doit_task`
--
ALTER TABLE `doit_task`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `doit_user`
--
ALTER TABLE `doit_user`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `doit_task`
--
ALTER TABLE `doit_task`
ADD CONSTRAINT `doit_task_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `doit_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
