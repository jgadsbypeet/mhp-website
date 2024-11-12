/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pgklxwzmfqkgbwtbspgyteorltudniromlue` (`primaryOwnerId`),
  CONSTRAINT `fk_cmnrlekjddgusgpepydkbuliyqjxcdrpzvkc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pgklxwzmfqkgbwtbspgyteorltudniromlue` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ojvunihyvewqvocosyprpfltsrssgwjknfrp` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_hyycytccjgxnxnwuhynspddlghzkmsykaarz` (`dateRead`),
  KEY `fk_vlhzlffcfebzdolhjzxttvzagwffjxotkose` (`pluginId`),
  CONSTRAINT `fk_vlhzlffcfebzdolhjzxttvzagwffjxotkose` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zigtxxzagwcmgrloxlndfuxnqdtumgyhpthp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tdigrakmlksbgbyumnxjeioldcgjewuqfkkz` (`sessionId`,`volumeId`),
  KEY `idx_kwhhqllkzajawhlwyhucspgvawjshppawruu` (`volumeId`),
  CONSTRAINT `fk_czplacohnqnbmqhbujrywslgyqjecsubldrr` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dcwpjovsumsuzxgvmfdsrrowssyuvwjhrcep` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_frjhhrhvbdqyxftgukkmbfslieqhssbxijmo` (`filename`,`folderId`),
  KEY `idx_tbpecwaqjoscfarhvkoibzwnekspxnokpppx` (`folderId`),
  KEY `idx_rhitexiyuwqhmbzjzeqljfonztralaeqyhmj` (`volumeId`),
  KEY `fk_sefircqcfqwdhorojtnvlclnkaudvlgzxahv` (`uploaderId`),
  CONSTRAINT `fk_mwwujvhnsxgwfrfkggdrbmipcualmnbzrlax` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sefircqcfqwdhorojtnvlclnkaudvlgzxahv` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uqbvdympyyvcwfgzircqkhlscflxjlxlfeoz` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzfozndlyjcfaiqmgrzzemlcjukrvqhqmikw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text DEFAULT NULL,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_xifcbltzgynbijqeizbxffqsifhuwebbygiv` (`siteId`),
  CONSTRAINT `fk_lpkyeghxomfpvoleoswuoputkvgoxhkjqbgr` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xifcbltzgynbijqeizbxffqsifhuwebbygiv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_oauth_tokens`
--

DROP TABLE IF EXISTS `auth_oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_oauth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerHandle` varchar(255) NOT NULL,
  `providerType` varchar(255) NOT NULL,
  `tokenType` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `accessToken` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `expires` varchar(255) DEFAULT NULL,
  `refreshToken` text DEFAULT NULL,
  `resourceOwnerId` varchar(255) DEFAULT NULL,
  `values` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int(11) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dmdqeuvrvuvwfcfsqsrpybadzgycxulvsaqq` (`userId`),
  CONSTRAINT `fk_dmdqeuvrvuvwfcfsqsrpybadzgycxulvsaqq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qkcxreyfsqkbwowgsuquxzlzqwljvzdedmxs` (`groupId`),
  KEY `fk_lpeqlbrmibazpbwhwxbsfkbxvukotuznskhe` (`parentId`),
  CONSTRAINT `fk_lpeqlbrmibazpbwhwxbsfkbxvukotuznskhe` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lyvsbyzhsbodslfgrfaemqdikctyekxwrxec` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqmovnjsowhmzcmmccsnsvqpllnheeujseaj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uzrzgktgwbwvqwjpjymhqzehpiusjdgcwxfe` (`name`),
  KEY `idx_uscgrvmsfftduvxauiidedkpbsoeihzjwxki` (`handle`),
  KEY `idx_hmyrzuwpwmjyhwdnvclsfbbrwzntskimrxfb` (`structureId`),
  KEY `idx_oswsoengspuncppthdsapbpdxblqfwhwrccg` (`fieldLayoutId`),
  KEY `idx_qogzpugyxdomoxiezscbsdmiazbptufmskfy` (`dateDeleted`),
  CONSTRAINT `fk_cjisigmgbewvuymvpifbgnggqdkyktlhobaj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_prexipnzzarwhiklrlvvmvqsnexeqpwhhwky` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qjvsaildzwsyzspaeidflptcjcyyocyrvwnh` (`groupId`,`siteId`),
  KEY `idx_orguenknfzvzsxzvmjvnyqzggrlelmdygimx` (`siteId`),
  CONSTRAINT `fk_wejxkmulozavzpvshukvokejvtefziwstszn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ynisjelhyvahvfucbmlhudqtrvppywencfuv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_zfkaiiaikwzqjylhtmbwbxywzpitleefayrm` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_rnixcenpgvqyeprujxonxnlyibwysdgcjbuy` (`siteId`),
  KEY `fk_tcaqgokenhjhlukfuenjxxusrearbnxztevz` (`userId`),
  CONSTRAINT `fk_odjgrnbbivlienjraxuptdxwcmtuptncahye` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rnixcenpgvqyeprujxonxnlyibwysdgcjbuy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tcaqgokenhjhlukfuenjxxusrearbnxztevz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_fyyuhofezzrosptnysfsjpkojivqsnfgghvg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tudohaogdkttkevjjhcuzypaxepjhgwatzdl` (`siteId`),
  KEY `fk_ejronjpxejkcozhsxexnjuttfpnynseqisyv` (`fieldId`),
  KEY `fk_fsxlijntvwezpumimlmfeemrwjnyukhwpzab` (`userId`),
  CONSTRAINT `fk_ejronjpxejkcozhsxexnjuttfpnynseqisyv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fsxlijntvwezpumimlmfeemrwjnyukhwpzab` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_trkrskwyyeccqywozxpopglpficaoelhpvll` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tudohaogdkttkevjjhcuzypaxepjhgwatzdl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_maefzbmpvisajghbqmoaelvsqicpritgiedk` (`userId`),
  CONSTRAINT `fk_maefzbmpvisajghbqmoaelvsqicpritgiedk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`traces`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ievphpisisemyztvhlzzbxasgkrrccrdbkyh` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_nunduiuxjufckecporrrpaabitwysypnywca` (`creatorId`,`provisional`),
  KEY `idx_bdvrqplfnvcljppkxwxmkoecgbhmsddsrztc` (`saved`),
  KEY `fk_jnxvvvjhvwidjfzxhipqalhrsamhtjlnesde` (`canonicalId`),
  CONSTRAINT `fk_jnxvvvjhvwidjfzxhipqalhrsamhtjlnesde` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ybkaatnwjhqrkvhjantlqdmmhejzqsnwwfkq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_nlizwqixrxklvhygatgjcfalvmuvpplfiydn` (`elementId`,`timestamp`,`userId`),
  KEY `fk_hxvivbzqaytwttmwewwmgqukmcbflsebkzcs` (`userId`),
  KEY `fk_sgmiwazxyctrxrhsccycodtmocmbhvmsfllc` (`siteId`),
  KEY `fk_zrrdhdhqwwksoxsrlfpkhbnmidrfbjspnfrs` (`draftId`),
  CONSTRAINT `fk_hxvivbzqaytwttmwewwmgqukmcbflsebkzcs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sgmiwazxyctrxrhsccycodtmocmbhvmsfllc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yobcqsmulqqgjkaskhtjedrbsaizsxqpikta` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zrrdhdhqwwksoxsrlfpkhbnmidrfbjspnfrs` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xmgnwuxhxsrzwckpffkathmsmuqjpiojlhfp` (`dateDeleted`),
  KEY `idx_uwkaqcudnvccrfrswwvurumytnrdvmmfwcfi` (`fieldLayoutId`),
  KEY `idx_ekaxtvwsciozlnuxdizrtsdrmdfhsrahmyqj` (`type`),
  KEY `idx_zrfeqkivqyljdvutmlzauevxhiajbbingzlx` (`enabled`),
  KEY `idx_hymdyqxjftmmiflioefloukvzzxtwbvxiczb` (`canonicalId`),
  KEY `idx_lhxeqawepivixbzvdsgrfldbzvvakwihjocw` (`archived`,`dateCreated`),
  KEY `idx_ewvzmfjwxmvigisuntdurkxxmedqgqjoxrqu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_owiqsfamkuugnupmfzoyewiztoxibkchnlqo` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hwmmddcpeigxqkynvcapnlzeqwkkniraurok` (`draftId`),
  KEY `fk_egqqjfxfnbrjreweslvccnphwqrruakccbun` (`revisionId`),
  CONSTRAINT `fk_egqqjfxfnbrjreweslvccnphwqrruakccbun` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hwmmddcpeigxqkynvcapnlzeqwkkniraurok` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnfkqxicuufktoawtdpvuaunlaaibepfupmu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zkgagjjjpxkwrppgokcnkfynzklytwgelcat` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_iwlpxmadrtkiwqrvrwsdlqarfjwitzexhhuf` (`timestamp`),
  CONSTRAINT `fk_qnkcbuqyonhsyybmwrvclkrxaglykcimkokp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_vqrazzgyuvroglyherngfrermrpxxzlfxmws` (`ownerId`),
  CONSTRAINT `fk_mqpzutdluumdeygfswsecjhasbajbublcavh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vqrazzgyuvroglyherngfrermrpxxzlfxmws` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rjniowbvhbzevjksypjlwdenglxhithipbqc` (`elementId`,`siteId`),
  KEY `idx_mokrdcpkdlljfcdccbhkjqslqrtasnfqvwfa` (`siteId`),
  KEY `idx_pnczxbrbdfeqicnojrorcscygjmsrsterpdr` (`title`,`siteId`),
  KEY `idx_larwpqmzajqykpdlwveqgbhxrljfdqdscccz` (`slug`,`siteId`),
  KEY `idx_gwtkqzasxgpavwybdnmpuggeydnpoatwykma` (`enabled`),
  KEY `idx_zoiionaxvcmlcdxxytmcktaeeryjhbsoxlpo` (`uri`,`siteId`),
  CONSTRAINT `fk_abisgpkkdxixirdroxgfmnypfqwalxusmdcn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kpjzwfysrbebxavkfozvtewqyrmbazzreyuk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vqglollwvdmrnlqbgxwsvwnsoqdgylqrylzn` (`postDate`),
  KEY `idx_yymdgjvidwtzazwwztjhefdijycyypbrljnp` (`expiryDate`),
  KEY `idx_rzwaztotsnwmpmntdgkxaeawsvnkfhzmrips` (`sectionId`),
  KEY `idx_ybeaehsjgwfctnmexehsvhkpdrbwamyybxpl` (`typeId`),
  KEY `idx_bjvjuberxpxcbdyjarqawtwhgeugpfazourc` (`primaryOwnerId`),
  KEY `idx_ialmkvpzffcbzxcgdlfsgvjyvuufqxmpqofu` (`fieldId`),
  KEY `fk_kjvwmvzjwdpafolcwwuzrnptelopqubfgyae` (`parentId`),
  CONSTRAINT `fk_fnupbgisxrlbzlfidnanhcllhsxnjpuyofbc` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hlxbuweozuzyxstukqamjdtbjmtpnudftkbt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjvwmvzjwdpafolcwwuzrnptelopqubfgyae` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mghegzpqdfdisdtabqapceohocrhwmbcokdm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhnyshwxashttbkpqdjknzkthymowjiyavln` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztwquhjfvuoxlxpxpreeiovotmexaedzairh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_mmmfqokqomzadjohazohfrolibunirkgojrf` (`authorId`),
  KEY `idx_tkjhxzebpjufcouolvtcpszfywzqgsrzempi` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_lgagfugvtcsruqbxauvdmkqlztxorkvclcgh` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_njbwnmetlipsppiwfjfdlaqprxwayyiwszod` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT 1,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hbcnyvioyoazpnsgezirhwyyfyumusefrlla` (`fieldLayoutId`),
  KEY `idx_fgcqllccayiihhqlqjvvctcbmgfydarclztc` (`dateDeleted`),
  CONSTRAINT `fk_emiqivafyczgaabocbjdhpquwtunyyzlerbp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfcjnceamqvmihqqhmtuuhplfpejdbbflszm` (`dateDeleted`),
  KEY `idx_kdggimoxlbaqfvmdpcqqgflabvycfjypkafv` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gemphjltwclzevawvrtuahfadgwqxivazgmd` (`handle`,`context`),
  KEY `idx_sdipmyicyrrcrkdeqzfunbvcvvpajsbmqdcd` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_pages`
--

DROP TABLE IF EXISTS `formie_fieldlayout_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayout_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `label` text NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xggzzsrcwmfozeakdlexgtuygcabdpcfeyuf` (`layoutId`),
  CONSTRAINT `fk_ullfxlvezbntfvadmspejljcwzhprskwtkhl` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_rows`
--

DROP TABLE IF EXISTS `formie_fieldlayout_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayout_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iejicrsbacceebfwzpzhalcdppwxnhqziytr` (`layoutId`),
  KEY `idx_dypxuoapucpdwylctzioozdgtjtotapzabgr` (`pageId`),
  CONSTRAINT `fk_ejaiapcootrhcuqciocvuxswfoqkzezvadqz` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhsalumlhlviitcgvdbgkglqqriavixbrqdm` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayouts`
--

DROP TABLE IF EXISTS `formie_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fields`
--

DROP TABLE IF EXISTS `formie_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `rowId` int(11) NOT NULL,
  `syncId` int(11) DEFAULT NULL,
  `label` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vzvxssthhdrvyhxhgtvvjqgsdynfffjbfhde` (`layoutId`),
  KEY `idx_rtunngaompoojbfmsycvnfvjdzhpoukpyxrn` (`pageId`),
  KEY `idx_uyhfsgfuoyaiubghclycjdxwaufgdmdqvwos` (`rowId`),
  KEY `idx_dnxjpmglwtmryxlkzfvhryhwwilnusdrpxln` (`syncId`),
  KEY `idx_xpubiuvzvfmclurogdrryhyeopkepnjmzoyn` (`handle`),
  CONSTRAINT `fk_bixhjajdmgxnnzaqmiyyciemmxdxgduchsnh` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jtksfrxhpvzhmnxoiqbzzmnlahddxetkmxwb` FOREIGN KEY (`rowId`) REFERENCES `formie_fieldlayout_rows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ojjkqvihjvaayrliscdvpwnlmlfdnowxovna` FOREIGN KEY (`syncId`) REFERENCES `formie_fields` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tmbzzlhsepmtbdcmykyagqtzjiwqyijkzlvh` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `settings` mediumtext DEFAULT NULL,
  `layoutId` int(11) DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int(11) DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zrbslvguukmlyvruxeikgjtwdvkygvdcvgkc` (`layoutId`),
  KEY `idx_stwdrbdfbeaphziuklfykpbhfvwmfaxvppcv` (`templateId`),
  KEY `idx_mlgjhuozyzqprqclkbgktphpdbmrbylbzzwm` (`defaultStatusId`),
  KEY `idx_okljvjhtuskfazqjoeskqdfrgchbvhlwmiif` (`submitActionEntryId`),
  KEY `idx_xkvxcqmsylozmftpqyitafgjrfsdmhmphfjl` (`submitActionEntrySiteId`),
  CONSTRAINT `fk_irwtnjgmaladuofwkakaosaahigppxxdfwdm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msjsdjcombpqkxvimrjuobhdesajoxpecxtd` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_npjbiicggrvoioroywqoznivyinzjameeubv` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uyhkdkrjatvixpvfzmjukdgiaegnusneiawf` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vqqwhzwpqbuoutazdppiusbtgjacarptssgs` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_formtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT 1,
  `outputCssLayout` tinyint(1) DEFAULT 1,
  `outputCssTheme` tinyint(1) DEFAULT 1,
  `outputJsBase` tinyint(1) DEFAULT 1,
  `outputJsTheme` tinyint(1) DEFAULT 1,
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mxeadborohyqalkojaksmgbencpsegfqevxp` (`fieldLayoutId`),
  CONSTRAINT `fk_kicdwoezuhyiigmprhfzikkibmhijcvorkfk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` text DEFAULT NULL,
  `cache` longtext DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `templateId` int(11) DEFAULT NULL,
  `pdfTemplateId` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `subject` text DEFAULT NULL,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text DEFAULT NULL,
  `toConditions` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `replyTo` text DEFAULT NULL,
  `replyToName` text DEFAULT NULL,
  `from` text DEFAULT NULL,
  `fromName` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `attachFiles` tinyint(1) DEFAULT 1,
  `attachPdf` tinyint(1) DEFAULT 0,
  `attachAssets` text DEFAULT NULL,
  `enableConditions` tinyint(1) DEFAULT 0,
  `conditions` text DEFAULT NULL,
  `customSettings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dkkidnbfzyuvjdgqwpnwbhvoalvibjhnznjx` (`formId`),
  KEY `idx_csdplqgdfgddsamxmoyslgnawymabfgtornu` (`templateId`),
  KEY `fk_yzgsjqiaqwudnkcdkxefgimemaxhpnjgjeui` (`pdfTemplateId`),
  CONSTRAINT `fk_lzpoyhhtqfclxldulvatlaypxthgmccvyqyg` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pcsriywugxehxglgtgwyleswsywdcncscxax` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yzgsjqiaqwudnkcdkxefgimemaxhpnjgjeui` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ffpfuiwlcolumexwdgxanzxmvyysvlkxcmcl` (`integrationId`),
  KEY `idx_ygnohygyvsbisiczizdehxjrrcjuzporlgnh` (`fieldId`),
  KEY `idx_kfbsttzknfdvbadbzvigybxdismxanwoupib` (`reference`),
  KEY `fk_attafbhgvyafexwutssqtckxjyuovubefxnb` (`submissionId`),
  KEY `fk_sbfxdigyfywgjfrfzuvbjyezgctrktzexrok` (`subscriptionId`),
  CONSTRAINT `fk_attafbhgvyafexwutssqtckxjyuovubefxnb` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pmbvzrbnfctipgkymsplhsaluxaqryfbveco` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psqviynljjfqdgxjebvpuzercvbybcsjxuca` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sbfxdigyfywgjfrfzuvbjyezgctrktzexrok` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_swkitjmojlorgayqhiwccsuesgopnsitfidr` (`handle`),
  KEY `idx_dszljapixurapzmitrekkogdinbhnvwfzbyz` (`integrationId`),
  KEY `idx_kpiqqimygvjukdzaybvdtwjvpvrpzuchqpct` (`reference`),
  CONSTRAINT `fk_ffyxzwehqxfqfzoswmsdvlqsxptqewxhhvqp` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text DEFAULT NULL,
  `trialDays` int(11) NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT 1,
  `isSuspended` tinyint(1) NOT NULL DEFAULT 0,
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xaunghdqdxxhswxizgldkotffzuvfyxrorsf` (`integrationId`),
  KEY `idx_gsqukyywtzkngmxenuuludkshtiweqoutvhj` (`submissionId`),
  KEY `idx_llfyjtgxkgntxdmgzbfpduqvvrftayoviphf` (`fieldId`),
  KEY `idx_vbdohbjburctnproeyjeigodktglkhtrczza` (`planId`),
  KEY `idx_lbkzogfdzdramnwcqdxdqsvvomnevbonvoku` (`reference`),
  KEY `idx_qqjbjfpavorwjphgtbfkynjuaeszugfeqzuq` (`nextPaymentDate`),
  KEY `idx_galosnhayshyitqxtrbtgaipavpilfuwcojt` (`dateExpired`),
  KEY `idx_wsuqyrgjwzdrwhuxryrsjcabqzmbgwvgyusw` (`dateExpired`),
  CONSTRAINT `fk_abbnxrkynlptcdcxynvytmeyewhnqrbsgjef` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`),
  CONSTRAINT `fk_cghcfjjypyjnvsisaanotmnxwmvewhlxdygk` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`),
  CONSTRAINT `fk_dgltuxpercddipkcsmzuldvmbuzfonuaavty` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`),
  CONSTRAINT `fk_dsorqgzqzwlclqxcbvninhcogyqakgkesnhd` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_pdftemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zixtthhxhssqxnsqyihgnkvlzqlgwbcdeuwd` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_zkfrsypkaswtqqoniavevaxpeggxbpxbioow` (`sourceId`),
  KEY `idx_nvrhilbdfvvyytjswihnubgslxwxfbvropnx` (`targetId`),
  KEY `idx_jrmgjrigjwdzymxnkqbxlkzqvjarygbjcsau` (`sourceSiteId`),
  CONSTRAINT `fk_enrefyvaufpaynvkswylmvwkarghsiudmoau` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uwxhpwbnmusnltysmfakextbwuhmqraceaun` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ybwjgdfjihuvrdewzybjudffucbnklyoxkrp` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_sentnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `notificationId` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `to` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `replyTo` text DEFAULT NULL,
  `replyToName` text DEFAULT NULL,
  `from` text DEFAULT NULL,
  `fromName` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `htmlBody` mediumtext DEFAULT NULL,
  `info` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_kwvyronbqikgazpgvmmnyjvjimhieidzrtbw` (`formId`),
  KEY `fk_mrfoiqhvvmuqyjsmbmpoexgulhgjttbkqeqe` (`submissionId`),
  KEY `fk_vllbymovxapskdoasndmziyzuonzrclvaebs` (`notificationId`),
  CONSTRAINT `fk_kwvyronbqikgazpgvmmnyjvjimhieidzrtbw` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mrfoiqhvvmuqyjsmbmpoexgulhgjttbkqeqe` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qgvuftxrurnerjeuzsdrxdadnwnngpimuppl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vllbymovxapskdoasndmziyzuonzrclvaebs` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_stencils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fvjcretfswombdbzetkalatzuvcxwgezseti` (`templateId`),
  KEY `idx_wyxtmebdhzhkafsuvbrdvcbrzedgwvayxqhe` (`defaultStatusId`),
  CONSTRAINT `fk_gnlyhxkupzqbvlcxydnineggxbytahangmvc` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rkiwrfgpnbovuegcumjdzymqcptayroetxgf` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `formId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT 0,
  `isSpam` tinyint(1) DEFAULT 0,
  `spamReason` text DEFAULT NULL,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bawiyfrdteupcjfexcbkwnlxiemrwcuymqeo` (`formId`),
  KEY `idx_llrqipxhllpotnhxmepancnbgcuajvnntaff` (`statusId`),
  KEY `idx_nubfaqoxbptrcgialynuecgsxaonbdgdnaot` (`userId`),
  CONSTRAINT `fk_avzlabgifpvuveibfmyszfxkkxlczyxjvyha` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oflgnyvjqbhncfwxzrnmgnixehxzkvslyijo` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rnjnuqgzpxodyngdxcjixvimhugequmdwipd` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhucrgxsjtmjgtjkolmwntbohixhoogcfkop` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xltsxwekfpksbbcknzhkyrhrmgowjigufqfd` (`name`),
  KEY `idx_kuydidnixxxdjyfpvejrirzuebkhetjpykgu` (`handle`),
  KEY `idx_wvnrqdinorzldprmfxwcnkaftvwgbhnkgcjp` (`fieldLayoutId`),
  KEY `idx_gbdfmpfiggtywhsuyzlbcxfhduyoshtnhzji` (`sortOrder`),
  CONSTRAINT `fk_jecuzkzjjlgbjpfxnjoxbpeqrpwxaujjtljd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvbvkpwtozydlghoeyrdtvppksqbotquofvb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scope`)),
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_diifrgsiwjzupefxceawyeqwvsnnpqyjcjfn` (`accessToken`),
  UNIQUE KEY `idx_ulyydlitshqjhahqhwrmcfyjihkcnoqgnxjl` (`name`),
  KEY `fk_kuwnxmzphsxadbslkswqenxklxrpcwplwnzl` (`schemaId`),
  CONSTRAINT `fk_kuwnxmzphsxadbslkswqenxklxrpcwplwnzl` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_quymayepynglajjzsaycpkwipsbtfypvzibo` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfkxxhcsvwfihunkcmlgqytpgkbtlrwjheid` (`name`),
  KEY `idx_zopdapzfcenuckaarclqdiqrishofogmtyqx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knockknock_logins`
--

DROP TABLE IF EXISTS `knockknock_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knockknock_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipAddress` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `loginPath` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dfdiqpzhltrgvwkkuraebeprmeahcczgdlkj` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_plbmptodehbnfwgpvqaeijwxvjvksayvuemi` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fyimrofrqajtwiqhhqlftomjcllghsxidfiq` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_wkbcvjrwjacodiaddxlezxpgyzfrbxlpmosi` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aiichwadmqqjdusotdpdlnfruynshobwvjvm` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_xcpppygjxdsmmxakcjtjfrdfxgjaazvrupdl` (`sourceId`),
  KEY `idx_vulxwpioydsanirkaggkywujzsrudafrjxkg` (`targetId`),
  KEY `idx_hawbbgcjsnoabvtlqisoiwisezwlgtkodzmw` (`sourceSiteId`),
  CONSTRAINT `fk_anfbgsheuejdbpmbweebeumekfjabtrwtpwk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bfaptaflfncspmkdhxhniynhorusyllnjzpn` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hppqpclgpejukcbafezkoaqtpmctcziqftxq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pieyxybmbimwvojafysarxuzuiggzrffnflc` (`canonicalId`,`num`),
  KEY `fk_cgwjiwnlystbzioqpeuagtxkbbtdkpiuinwc` (`creatorId`),
  CONSTRAINT `fk_avlouwoywqwkmfvqcyhuckkmvozmesdktyxs` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cgwjiwnlystbzioqpeuagtxkbbtdkpiuinwc` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_zrrfnkmtaukvyjjvonbnemwqdxsfrdxnaqkn` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `maxAuthors` smallint(6) unsigned NOT NULL DEFAULT 1,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previewTargets`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_smeixkvkzocnzkbzjlnhjsrcmfvompuahkww` (`handle`),
  KEY `idx_gwvunmzwgmbjxekltserbaxwqlabyrzsohop` (`name`),
  KEY `idx_nfpfsgbljqayjxjfcjxxnglmsyfyobpqalbm` (`structureId`),
  KEY `idx_xmoafibbfeniqdmlntnfyelgtahovfhngjnf` (`dateDeleted`),
  CONSTRAINT `fk_odlmafbbhxlmrfxnueaixmjiktvllwccqqjs` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_eobdatwbhhheurprdzsvvktwlyrogsfxmtib` (`typeId`),
  CONSTRAINT `fk_eobdatwbhhheurprdzsvvktwlyrogsfxmtib` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_przscpijahjyeizydjqvzpmekayjgdhjaxsz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dyhshjnycubossadymdxapdvvayemowkhdrn` (`sectionId`,`siteId`),
  KEY `idx_ybzcawemjixuqfuslrfhfhwnysdhevqcnnci` (`siteId`),
  CONSTRAINT `fk_ntuskvkhqoxlxehpylcmkqhvzebfutynrtgd` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pyurackpxqzwbkiljalhxuoczagyssndxjar` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) NOT NULL DEFAULT '',
  `sourceId` int(11) DEFAULT NULL,
  `sourceName` varchar(255) NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) NOT NULL DEFAULT '',
  `sourceType` varchar(64) NOT NULL DEFAULT '',
  `typeId` int(11) DEFAULT NULL,
  `sourceTemplate` varchar(500) DEFAULT '',
  `sourceSiteId` int(11) DEFAULT NULL,
  `sourceAltSiteSettings` text DEFAULT NULL,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text DEFAULT NULL,
  `metaSiteVars` text DEFAULT NULL,
  `metaSitemapVars` text DEFAULT NULL,
  `metaContainers` text DEFAULT NULL,
  `redirectsContainer` text DEFAULT NULL,
  `frontendTemplatesContainer` text DEFAULT NULL,
  `metaBundleSettings` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owyewbrcwnkibfhuegonslyozincqduvmrah` (`sourceBundleType`),
  KEY `idx_eebqlsjeirmsebvokgwnlkpzzjofqpwsarop` (`sourceId`),
  KEY `idx_ydubcvxxqokbtuiquzikkluzgtpbazarayca` (`sourceSiteId`),
  KEY `idx_twhnqolqnspmnacugyobfqiozgzcquuunwrb` (`sourceHandle`),
  CONSTRAINT `fk_blompumgojifldaghpfhnktwduestmduxrui` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gceblttuzbpmztwdvelyvxgavzsytuvnizzo` (`uid`),
  KEY `idx_mfpqwokhbbedgdsjcaipxtdzsvlkixviatvd` (`token`),
  KEY `idx_memuojynjmtbrpnhxiqpekqpxeafzxvzccsw` (`dateUpdated`),
  KEY `idx_sgzpqxrpqadyfkkvhkpsihczrsvnpxucswck` (`userId`),
  CONSTRAINT `fk_ciobxftuhgqkpzpenwxoaxhjgtubtvabvmgg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vtnspmmszpgwzzxdqoadpxcpxkavzdwgywdn` (`userId`,`message`),
  CONSTRAINT `fk_nvnxmxudhsyghhyeskmjovjczrpnxjdjzpet` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xryhnuiibzgqphgvynzunqnryllocqujnjco` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mfjgfrxyhkaqmwxqeytqbkuweehyixrkzuop` (`dateDeleted`),
  KEY `idx_smtkhmqiezpgwuvlmpppxkpiqexmpoxcswrj` (`handle`),
  KEY `idx_giwesqcqmptateldwaboacnefbdaoiqwkqij` (`sortOrder`),
  KEY `fk_cpcrnhlxejlrtozjrjvcyumeejzlcqwptbtb` (`groupId`),
  CONSTRAINT `fk_cpcrnhlxejlrtozjrjvcyumeejzlcqwptbtb` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_viowbhbtillsxwckgzllmofkvzrvtdtqljmr` (`structureId`,`elementId`),
  KEY `idx_nxhcajgzyustymfugmevfkdeisejglewpkby` (`root`),
  KEY `idx_acdckyrpkyxibljceinvqcegdkzozogzrsfn` (`lft`),
  KEY `idx_ffvfvfhymdfpcmflkdwmepcrohwrobodhzjm` (`rgt`),
  KEY `idx_meriihwsmlslnnxpmokfomqiwpvwsluelnek` (`level`),
  KEY `idx_xntrilnacfwnmjiyxhitienzneytwwsrenfa` (`elementId`),
  CONSTRAINT `fk_djwdvywwznmvlumdffmkckgcqlzaxgyizmts` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cjxqmxpobvnffaswfhkwcthrtgekexqolcbe` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yqpoohvesbacprrrfqzuxlnkowylsvyfprtz` (`key`,`language`),
  KEY `idx_auftwmgjfppxskkvuwsoogvnrwfcltxpsiek` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dtiewvcajclrfrlyexdgdnbxffmeyslrlbel` (`name`),
  KEY `idx_hwpgehhmjsscfzfdwzwmokvxtlzkutmgatxd` (`handle`),
  KEY `idx_gsbexaxfuznnjetrbcpcluqnhachysrkwdfx` (`dateDeleted`),
  KEY `fk_dciugjfuqphhgjjlwdykpsjwolrmylubqxuq` (`fieldLayoutId`),
  CONSTRAINT `fk_dciugjfuqphhgjjlwdykpsjwolrmylubqxuq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enwvtotmjrxpoimthunhjjngaseatyltnsjf` (`groupId`),
  CONSTRAINT `fk_iuqqjdlgvxquiqmzqrqvoiycgmrmrjoedrmt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdhkhiivfgjbkxzmhfuutackmdulgylkxege` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xejczmbsiajknljwxmsrzxemoklnnpvramlh` (`token`),
  KEY `idx_eogyuoawiwarzighzgnkghihhnhocggztqnq` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmmiitbevxstjpvewvhnkonuqtcgyuzbxpid` (`handle`),
  KEY `idx_eabyongtnvbwwdsjjrurnhzgxiijznbkjmxb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zsvolpdvbcjwpygixsuojkjomnmrtojizsda` (`groupId`,`userId`),
  KEY `idx_bcjxhiwqrljrkzxckzmmgxhdjunhhivqkunm` (`userId`),
  CONSTRAINT `fk_gqhoadhzfjcrckcbbohbaeswponxggehrgbk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntwwqrmxrbwaxvbuvweigtybbwqlltnjyujx` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qzvagsynahajdunwlfykgsossrzyywzffwkn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qwybaqzyryslldxqzqvozemnterkcflxgqnh` (`permissionId`,`groupId`),
  KEY `idx_qccglwluscidzfpbymmqhgqdamkdxvcjflbo` (`groupId`),
  CONSTRAINT `fk_hmvtcmjeuuxsqoqhkmqbemhzdrbkmpxetlec` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzgfdpvqwvsznkpdgqxqzxnqlenlnsmsjwhm` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vrlznuktovmnzravboxaatykjfrvitnwxqum` (`permissionId`,`userId`),
  KEY `idx_bzlpotabnduzrdjabshqukzjcnerhxzytsls` (`userId`),
  CONSTRAINT `fk_loralcshjrayvruxiguypddukcoyvxzsetjt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zczrfowbyobmiepsjfjcngplhcsbvkdhilmv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_qarzmxotcmdlczahwrmdywbnayoeqfedycol` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bmmgiijaqfsrjlgsmadfmcfdfrzeghzmyigd` (`active`),
  KEY `idx_mhbeihtgswswtdhbjtptfvrprakfnpbmdlcq` (`locked`),
  KEY `idx_khewrddgtofkboakvdpgshbuddknhvknnqxj` (`pending`),
  KEY `idx_yinljrgkpvjivlvgyqbrruwmcrdmfzcrycgo` (`suspended`),
  KEY `idx_vqehqdbxwrqzxqcncatjpuszdfjmksouentw` (`verificationCode`),
  KEY `idx_oyajiwlwbihzwrfhkvvcjzztgvldksfhrujn` (`email`),
  KEY `idx_qyagidvrxovekwkgtauirtbwadnihtgoccui` (`username`),
  KEY `fk_zoxruifphowkbnzogjcurdvekjtogedfnpqc` (`photoId`),
  CONSTRAINT `fk_tofpohgnerasadfppzqlxpnwilwnalfdueba` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zoxruifphowkbnzogjcurdvekjtogedfnpqc` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fbjxrgguqgivdydtcmedlcvxanjvvdbjfvej` (`name`,`parentId`,`volumeId`),
  KEY `idx_spskgbjluutgnkwympzwjslbtfqweozciqvn` (`parentId`),
  KEY `idx_uuvbfmlejgaxtovzairebgfkxxwjyitfogdq` (`volumeId`),
  CONSTRAINT `fk_nohzufdihzanwckwggpngrfnnyjxrslrtdjw` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsljkcwaohypkiotkpkeegzqenxrjyikcavd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lbemmcwxvrlhnttwnyerbetgshqupezagdie` (`name`),
  KEY `idx_dzlykgwwdevnvkckkyytzevfshujatnkkaqp` (`handle`),
  KEY `idx_csvukfjdxzaxihsydhcffowncngpulfsfdxr` (`fieldLayoutId`),
  KEY `idx_hbadboyjpdinaubpjudgqeppvpoixksecmly` (`dateDeleted`),
  CONSTRAINT `fk_kendejhsvatoawdkueiplysapfalrmdcbqce` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text DEFAULT NULL,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qzmmodacrureycgtqeryxlhevvlvevqqigfx` (`userId`),
  CONSTRAINT `fk_qzmmodacrureycgtqeryxlhevvlvevqqigfx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cazaituuczrbhcbyumeaxkrbhzceirmmnqgs` (`userId`),
  CONSTRAINT `fk_mdgfngmwdtbupsndkezxnmctbkoxriokccpe` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 14:59:39
/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES
(10,1,1,1,'catnap.jpg','image',NULL,2016,1134,352264,NULL,NULL,NULL,'2024-04-11 15:06:23','2024-04-11 15:06:23','2024-04-11 15:06:23'),
(97,3,3,1,'dummy.pdf','pdf',NULL,NULL,NULL,13264,NULL,NULL,NULL,'2024-05-13 15:38:23','2024-05-13 15:38:23','2024-05-13 15:38:23');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES
(10,1,NULL),
(97,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `auth_oauth_tokens`
--

LOCK TABLES `auth_oauth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_oauth_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES
(2,1,'postDate','2024-04-11 13:47:29',0,1),
(2,1,'slug','2024-04-11 13:47:26',0,1),
(2,1,'title','2024-04-11 13:47:26',0,1),
(2,1,'uri','2024-04-11 13:47:26',0,1),
(37,1,'postDate','2024-04-19 15:14:57',0,1),
(38,1,'postDate','2024-04-19 15:16:53',0,1),
(89,1,'postDate','2024-05-13 15:37:43',0,1),
(89,1,'slug','2024-05-13 15:37:40',0,1),
(89,1,'title','2024-05-13 15:37:40',0,1),
(89,1,'uri','2024-05-13 15:37:40',0,1),
(101,1,'postDate','2024-05-13 16:17:57',0,1),
(103,1,'postDate','2024-05-13 16:18:40',0,1),
(104,1,'postDate','2024-05-13 16:18:51',0,1),
(105,1,'postDate','2024-05-13 16:29:17',0,1),
(124,1,'postDate','2024-05-14 09:15:42',0,1),
(152,1,'fieldLayoutId','2024-05-15 10:17:02',0,1),
(152,1,'postDate','2024-05-15 10:17:05',0,1),
(152,1,'slug','2024-05-15 10:17:00',0,1),
(152,1,'title','2024-05-15 10:17:00',0,1),
(152,1,'typeId','2024-05-15 10:17:02',0,1),
(152,1,'uri','2024-05-15 10:17:00',0,1),
(156,1,'postDate','2024-05-15 10:44:23',0,1),
(156,1,'slug','2024-05-15 10:44:21',0,1),
(156,1,'title','2024-05-15 10:44:20',0,1),
(156,1,'uri','2024-05-15 10:44:21',0,1),
(158,1,'postDate','2024-05-15 10:44:30',0,1),
(158,1,'slug','2024-05-15 10:44:30',0,1),
(158,1,'title','2024-05-15 10:44:30',0,1),
(158,1,'uri','2024-05-15 10:44:30',0,1),
(160,1,'postDate','2024-05-15 10:44:37',0,1),
(160,1,'slug','2024-05-15 10:44:37',0,1),
(160,1,'title','2024-05-15 10:44:37',0,1),
(160,1,'uri','2024-05-15 10:44:37',0,1),
(162,1,'postDate','2024-05-15 10:44:44',0,1),
(162,1,'slug','2024-05-15 10:44:44',0,1),
(162,1,'title','2024-05-15 10:44:44',0,1),
(162,1,'uri','2024-05-15 10:44:44',0,1),
(164,1,'postDate','2024-05-15 10:44:50',0,1),
(164,1,'slug','2024-05-15 10:44:50',0,1),
(164,1,'title','2024-05-15 10:44:50',0,1),
(164,1,'uri','2024-05-15 10:44:50',0,1),
(167,1,'postDate','2024-05-15 11:27:44',0,1),
(190,1,'postDate','2024-06-10 13:22:40',0,1),
(193,1,'postDate','2024-06-10 13:23:20',0,1),
(193,1,'slug','2024-06-10 13:23:11',0,1),
(193,1,'title','2024-06-10 13:23:11',0,1),
(193,1,'uri','2024-06-10 13:23:11',0,1),
(194,1,'postDate','2024-06-10 13:23:12',0,1),
(195,1,'postDate','2024-06-10 13:23:14',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES
(2,1,1,'5e310356-8cc0-4b59-91b5-4e9728fc1333','2024-04-11 14:39:31',0,1),
(2,1,13,'c89a202c-9c60-456c-be81-aa10c55fd32f','2024-06-26 15:43:49',0,1),
(2,1,13,'c8a018d5-b5d3-4f92-b510-a7159bbfdaec','2024-04-19 15:30:34',0,1),
(37,1,5,'ce010db3-5040-4d74-b706-e1fe1f51f806','2024-04-19 15:14:57',0,1),
(37,1,11,'5c7c72bd-d8aa-46cf-a738-59e92eb1255d','2024-04-19 15:14:57',0,1),
(38,1,5,'ce010db3-5040-4d74-b706-e1fe1f51f806','2024-04-19 15:16:53',0,1),
(38,1,11,'5c7c72bd-d8aa-46cf-a738-59e92eb1255d','2024-04-19 15:16:53',0,1),
(40,1,14,'feaccd20-663f-4175-b444-8525668da3a9','2024-05-13 14:22:21',0,1),
(40,1,15,'3d786b5d-d8e7-43a5-8de1-9566d9be075b','2024-05-16 08:07:40',0,1),
(40,1,16,'5123d8bf-0117-4751-8c71-59ec23ed0163','2024-05-16 08:07:40',0,1),
(45,1,18,'39a40d56-e92a-4692-b96a-c35603ecde2f','2024-05-13 14:54:29',0,1),
(50,1,6,'1d183407-0aec-43db-b96f-5c5f33946bfa','2024-05-13 15:02:27',0,1),
(75,1,6,'1d183407-0aec-43db-b96f-5c5f33946bfa','2024-05-13 15:02:31',0,1),
(82,1,19,'ca9af274-930f-4a77-812b-0601fad4b3d2','2024-05-14 09:15:13',0,1),
(82,1,20,'dcf58cf1-93b2-44eb-a745-53aceb98e22e','2024-05-14 09:15:13',0,1),
(82,1,21,'b36e597e-165b-4dbc-80c6-377b92bc053d','2024-05-13 15:22:47',0,1),
(82,1,22,'b1266986-24d9-4882-8a89-22e315c94d5a','2024-05-13 15:38:33',0,1),
(82,1,23,'8d37558b-24c8-463c-b78a-f758d679ddb6','2024-05-14 09:15:13',0,1),
(82,1,24,'d6fc0ceb-f110-413f-a669-f53d48bab0ac','2024-05-13 15:22:47',0,1),
(89,1,13,'c89a202c-9c60-456c-be81-aa10c55fd32f','2024-06-10 14:01:08',0,1),
(101,1,27,'8de2139a-fa64-461f-98e5-f033d2853ed5','2024-05-13 16:18:45',0,1),
(103,1,25,'b3631407-f99b-493a-a6c7-757156bdef0f','2024-05-13 16:18:40',0,1),
(103,1,26,'f9f7a5c3-f36e-4fdf-aab7-3fa94b513cd7','2024-05-13 16:18:40',0,1),
(104,1,19,'ca9af274-930f-4a77-812b-0601fad4b3d2','2024-05-13 16:18:51',0,1),
(104,1,23,'8d37558b-24c8-463c-b78a-f758d679ddb6','2024-05-13 16:18:51',0,1),
(105,1,19,'ca9af274-930f-4a77-812b-0601fad4b3d2','2024-05-13 16:29:17',0,1),
(105,1,20,'dcf58cf1-93b2-44eb-a745-53aceb98e22e','2024-05-13 16:29:17',0,1),
(105,1,23,'8d37558b-24c8-463c-b78a-f758d679ddb6','2024-05-13 16:29:17',0,1),
(124,1,27,'8de2139a-fa64-461f-98e5-f033d2853ed5','2024-05-14 09:15:43',0,1),
(152,1,36,'485e0b9b-1758-409d-8d91-badcc7567fbc','2024-05-15 10:27:05',0,1),
(167,1,38,'eb0b6bbc-0765-49b3-9b08-10a95e843441','2024-05-15 13:44:12',0,1),
(167,1,39,'834569c6-545d-4771-82ad-42156eff13ed','2024-05-15 13:44:12',0,1),
(175,1,42,'0bc21d81-dcd7-4105-8de0-3de5796b71df','2024-06-10 13:55:46',0,1),
(176,1,15,'3d786b5d-d8e7-43a5-8de1-9566d9be075b','2024-06-10 13:55:46',0,1),
(176,1,16,'5123d8bf-0117-4751-8c71-59ec23ed0163','2024-06-10 13:10:35',0,1),
(190,1,28,'1247d4aa-e385-4cbc-afc8-fc139a7eb7ea','2024-06-10 13:22:40',0,1),
(190,1,29,'642f24a3-e109-4426-982f-2d5f7083bba6','2024-06-10 13:22:40',0,1),
(190,1,30,'ca8d97f0-d020-428b-aabd-2f731eb65cdd','2024-06-10 13:22:40',0,1),
(190,1,31,'ab697d2a-af79-4a05-bd0f-242d1ff4473e','2024-06-10 13:22:40',0,1),
(193,1,13,'c89a202c-9c60-456c-be81-aa10c55fd32f','2024-08-30 13:56:25',0,1),
(194,1,42,'0bc21d81-dcd7-4105-8de0-3de5796b71df','2024-08-30 13:56:25',0,1),
(195,1,5,'5857e4c0-aeb0-4010-ba79-68f9240106b5','2024-06-10 13:23:20',0,1),
(195,1,14,'feaccd20-663f-4175-b444-8525668da3a9','2024-06-10 13:23:20',0,1),
(195,1,15,'3d786b5d-d8e7-43a5-8de1-9566d9be075b','2024-06-10 13:55:24',0,1),
(195,1,16,'5123d8bf-0117-4751-8c71-59ec23ed0163','2024-06-10 13:54:41',0,1),
(264,1,27,'8de2139a-fa64-461f-98e5-f033d2853ed5','2024-08-30 13:56:25',0,1),
(265,1,25,'b3631407-f99b-493a-a6c7-757156bdef0f','2024-08-30 13:56:25',0,1),
(298,1,25,'b3631407-f99b-493a-a6c7-757156bdef0f','2024-08-30 13:56:25',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES
(80,195,1,0,'Draft 1',NULL,1,NULL,0),
(81,195,1,0,'Draft 2',NULL,1,NULL,0),
(82,195,1,0,'Draft 3',NULL,1,NULL,0),
(93,195,1,0,'Draft 4',NULL,1,NULL,0),
(94,244,1,0,'Draft 1',NULL,1,NULL,0),
(95,195,1,0,'Draft 5',NULL,1,NULL,0),
(96,244,1,0,'Draft 2',NULL,1,NULL,0),
(97,195,1,0,'Draft 6',NULL,1,NULL,0),
(98,244,1,0,'Draft 3',NULL,1,NULL,0),
(99,195,1,0,'Draft 7',NULL,1,NULL,0),
(100,244,1,0,'Draft 4',NULL,1,NULL,0),
(101,195,1,0,'Draft 8',NULL,1,NULL,0),
(102,244,1,0,'Draft 5',NULL,1,NULL,0),
(106,265,1,0,'Draft 1',NULL,1,NULL,0),
(107,266,1,0,'Draft 1',NULL,1,NULL,0),
(108,195,1,0,'Draft 9',NULL,1,NULL,0),
(109,244,1,0,'Draft 6',NULL,1,NULL,0),
(110,265,1,0,'Draft 2',NULL,1,NULL,0),
(111,266,1,0,'Draft 2',NULL,1,NULL,0),
(112,195,1,0,'Draft 10',NULL,1,NULL,0),
(113,244,1,0,'Draft 7',NULL,1,NULL,0),
(114,265,1,0,'Draft 3',NULL,1,NULL,0),
(115,266,1,0,'Draft 3',NULL,1,NULL,0),
(116,265,1,0,'Draft 4',NULL,1,NULL,0),
(117,266,1,0,'Draft 4',NULL,1,NULL,0),
(118,265,1,0,'Draft 5',NULL,1,NULL,0),
(119,266,1,0,'Draft 5',NULL,1,NULL,0),
(120,195,1,0,'Draft 11',NULL,1,NULL,0),
(121,244,1,0,'Draft 8',NULL,1,NULL,0),
(122,265,1,0,'Draft 6',NULL,1,NULL,0),
(123,266,1,0,'Draft 6',NULL,1,NULL,0),
(124,195,1,0,'Draft 12',NULL,1,NULL,0),
(125,244,1,0,'Draft 9',NULL,1,NULL,0),
(126,265,1,0,'Draft 7',NULL,1,NULL,0),
(127,266,1,0,'Draft 7',NULL,1,NULL,0),
(128,265,1,0,'Draft 8',NULL,1,NULL,1),
(129,266,1,0,'Draft 8',NULL,1,NULL,0),
(130,266,1,0,'Draft 9',NULL,1,NULL,0),
(131,195,1,0,'Draft 13',NULL,1,NULL,0),
(132,244,1,0,'Draft 10',NULL,1,NULL,0),
(133,266,1,0,'Draft 10',NULL,1,NULL,0),
(134,266,1,0,'Draft 11',NULL,1,NULL,0),
(135,195,1,0,'Draft 14',NULL,1,NULL,0),
(136,244,1,0,'Draft 11',NULL,1,NULL,0),
(137,266,1,0,'Draft 12',NULL,1,NULL,0),
(138,195,1,0,'Draft 15',NULL,1,NULL,0),
(139,244,1,0,'Draft 12',NULL,1,NULL,0),
(140,266,1,0,'Draft 13',NULL,1,NULL,0),
(141,266,1,0,'Draft 14',NULL,1,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES
(2,1,1,NULL,'edit','2024-05-16 08:07:39'),
(2,1,1,NULL,'save','2024-06-26 15:43:49'),
(2,1,1,NULL,'view','2024-06-26 15:43:50'),
(89,1,1,NULL,'edit','2024-06-10 14:01:07'),
(89,1,1,NULL,'save','2024-06-10 14:01:08'),
(89,1,1,NULL,'view','2024-06-10 14:17:16'),
(152,1,1,NULL,'edit','2024-05-15 10:27:03'),
(152,1,1,NULL,'save','2024-05-15 10:27:05'),
(152,1,1,NULL,'view','2024-05-15 10:57:16'),
(156,1,1,NULL,'save','2024-05-15 10:44:23'),
(156,1,1,NULL,'view','2024-05-15 10:44:19'),
(158,1,1,NULL,'save','2024-05-15 10:44:30'),
(158,1,1,NULL,'view','2024-05-15 10:44:26'),
(160,1,1,NULL,'save','2024-05-15 10:44:37'),
(160,1,1,NULL,'view','2024-05-15 10:44:32'),
(162,1,1,NULL,'save','2024-05-15 10:44:44'),
(162,1,1,NULL,'view','2024-05-15 10:44:39'),
(164,1,1,NULL,'save','2024-05-15 10:44:50'),
(164,1,1,NULL,'view','2024-05-15 10:44:46'),
(193,1,1,NULL,'edit','2024-08-30 13:56:24'),
(193,1,1,NULL,'save','2024-08-30 13:56:25'),
(193,1,1,NULL,'view','2024-08-30 14:12:10');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-04-11 13:46:31','2024-04-11 13:46:31',NULL,NULL,NULL,'6c016bdf-e812-406f-b6a7-059150d62863'),
(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-04-11 13:47:16','2024-06-26 15:43:49',NULL,NULL,NULL,'7e0602ed-c425-42a8-8902-ca208cb2df92'),
(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-04-11 13:47:29','2024-04-11 13:47:29',NULL,NULL,NULL,'f72bf177-32ec-4e40-a649-60ab7f782e2a'),
(5,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-04-11 13:47:43','2024-04-11 13:47:43',NULL,NULL,NULL,'f18f5628-9592-411b-be11-02d40016e691'),
(7,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-04-11 14:39:31','2024-04-11 14:39:31',NULL,NULL,NULL,'983b6b41-ed12-4746-a7f3-d1e831528cd4'),
(10,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-04-11 15:06:23','2024-04-11 15:06:23',NULL,NULL,NULL,'52f1fbde-f582-46f3-b9d9-9f8cfb85e8c8'),
(11,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-04-11 15:06:30','2024-04-11 15:06:30',NULL,NULL,NULL,'414b0803-02f3-4496-b63f-12dd1a14ca50'),
(12,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2024-04-11 15:06:30','2024-04-11 15:06:30',NULL,NULL,NULL,'5779582a-2bc1-455d-a2a1-f56bf59bb475'),
(13,11,NULL,5,7,'craft\\elements\\Entry',1,0,'2024-04-11 15:06:30','2024-04-11 15:06:30',NULL,NULL,NULL,'5abbf080-c644-46ac-a913-ed5addcfe648'),
(14,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2024-04-11 15:33:25','2024-04-11 15:33:25',NULL,NULL,NULL,'561084da-36da-4ccd-b45c-015929c09039'),
(16,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2024-04-11 15:52:52','2024-04-11 15:52:52',NULL,NULL,NULL,'b5c6a2b4-8268-49ca-ab75-1e1cba2c54c8'),
(18,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2024-04-11 15:57:09','2024-04-11 15:57:09',NULL,NULL,NULL,'6b29f43c-9883-43bf-b93f-b95de7fb55fb'),
(20,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:03:20','2024-04-11 16:03:20',NULL,NULL,NULL,'93a07667-e023-4ac1-9067-1335515f7ab1'),
(22,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:24:47','2024-04-11 16:24:47',NULL,NULL,NULL,'a2c9cc3d-863f-4a37-aaab-9055b2d98d6c'),
(24,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:25:27','2024-04-11 16:25:27',NULL,NULL,NULL,'a0bc7ff8-6902-46a3-9f66-c4aa6444cd4a'),
(26,2,NULL,12,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:25:33','2024-04-11 16:25:33',NULL,NULL,NULL,'5e4bee20-55ae-4604-bff7-3f88272ba2aa'),
(27,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:33:29','2024-04-11 16:33:29',NULL,NULL,NULL,'5f190831-c859-4453-b7a5-433b84ed6bb6'),
(29,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2024-04-11 16:34:02','2024-04-11 16:34:02',NULL,NULL,NULL,'a67c38b6-a021-438f-b6dd-6d0b2482d3a0'),
(31,2,NULL,15,1,'craft\\elements\\Entry',1,0,'2024-04-12 07:43:40','2024-04-12 07:43:40',NULL,NULL,NULL,'2b485b49-ca89-4ddf-a854-b59b30662e0c'),
(33,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2024-04-19 13:48:40','2024-04-19 13:48:40',NULL,NULL,NULL,'8a2b6fcb-fe82-46bb-aaf9-c170d110a5e5'),
(35,2,NULL,17,1,'craft\\elements\\Entry',1,0,'2024-04-19 13:53:24','2024-04-19 13:53:24',NULL,NULL,NULL,'4295766f-ef7d-4eb5-a97d-0adba7389da4'),
(37,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2024-04-19 15:14:56','2024-04-19 15:19:00',NULL,'2024-04-19 15:19:00',NULL,'8509801b-340c-4ce7-a19a-f93516025287'),
(38,NULL,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2024-04-19 15:16:52','2024-04-19 15:19:00',NULL,'2024-04-19 15:19:00',NULL,'0d1aa389-b00c-417b-bcf7-030b2e8de828'),
(40,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2024-04-19 15:30:34','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'94e9f13d-647a-4a42-8e4f-be3540ecb7ac'),
(41,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2024-04-19 15:30:34','2024-04-19 15:30:34',NULL,NULL,NULL,'ca775572-d887-4f1b-87b9-112d8e7ae243'),
(42,40,NULL,19,14,'craft\\elements\\Entry',1,0,'2024-04-19 15:30:34','2024-04-19 15:30:34',NULL,'2024-06-26 15:43:49',NULL,'25d4590d-bc08-47ae-a84d-69c9cb139480'),
(45,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2024-04-19 16:01:35','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'5e630650-ab3e-4ecc-bcf8-71be988b6628'),
(46,2,NULL,20,1,'craft\\elements\\Entry',1,0,'2024-04-19 16:01:35','2024-04-19 16:01:35',NULL,NULL,NULL,'9e31dac2-8d7d-4e52-bf5a-a2848974b8f0'),
(47,45,NULL,21,12,'craft\\elements\\Entry',1,0,'2024-04-19 16:01:35','2024-04-19 16:01:35',NULL,'2024-06-26 15:43:49',NULL,'a4d0fa0f-9f10-468d-b2be-933383a8568c'),
(50,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2024-04-19 16:03:31','2024-05-13 15:08:19',NULL,'2024-05-13 15:08:19',NULL,'01835be8-b557-4704-b77d-520ca41c57c0'),
(51,2,NULL,22,1,'craft\\elements\\Entry',1,0,'2024-04-19 16:03:31','2024-04-19 16:03:31',NULL,NULL,NULL,'420ca0e8-e9b0-49a3-a566-c724156d268c'),
(52,50,NULL,23,11,'craft\\elements\\Entry',1,0,'2024-04-19 16:03:31','2024-04-19 16:03:31',NULL,'2024-05-13 15:08:19',NULL,'757c2523-b5ce-4fba-9892-7d2038fda0c6'),
(55,2,NULL,24,1,'craft\\elements\\Entry',1,0,'2024-05-13 14:20:56','2024-05-13 14:20:56',NULL,NULL,NULL,'b8be8d8e-208b-4171-be29-72f2b98cd44e'),
(56,40,NULL,25,14,'craft\\elements\\Entry',1,0,'2024-05-13 14:20:56','2024-05-13 14:20:56',NULL,'2024-06-26 15:43:49',NULL,'8ab6bc32-310d-4c96-8977-4383057ca646'),
(59,2,NULL,26,1,'craft\\elements\\Entry',1,0,'2024-05-13 14:22:21','2024-05-13 14:22:21',NULL,NULL,NULL,'3a9ab582-01a4-4b19-8d3c-0f2324aa1f93'),
(60,40,NULL,27,14,'craft\\elements\\Entry',1,0,'2024-05-13 14:22:21','2024-05-13 14:22:21',NULL,'2024-06-26 15:43:49',NULL,'62e255be-7046-4d89-b02d-1169b9f73b95'),
(63,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-05-13 14:28:50','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'900af030-6186-4f26-8636-231099e62d2c'),
(64,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2024-05-13 14:28:50','2024-05-13 14:28:50',NULL,NULL,NULL,'f9f60aed-3060-4512-8135-eea3821eb654'),
(65,63,NULL,29,15,'craft\\elements\\Entry',1,0,'2024-05-13 14:28:50','2024-05-13 14:28:50',NULL,'2024-06-26 15:43:49',NULL,'9f63aa1a-ac83-4992-a642-00515fd3733a'),
(68,2,NULL,30,1,'craft\\elements\\Entry',1,0,'2024-05-13 14:54:29','2024-05-13 14:54:29',NULL,NULL,NULL,'cde5e8b1-b1aa-411c-ae3a-e00e7dc536d3'),
(69,45,NULL,31,12,'craft\\elements\\Entry',1,0,'2024-05-13 14:54:29','2024-05-13 14:54:29',NULL,'2024-06-26 15:43:49',NULL,'c92ffaf6-8015-409c-8e65-8af6b9458cc7'),
(72,2,NULL,32,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:02:27','2024-05-13 15:02:27',NULL,NULL,NULL,'7512d28b-d0de-48f7-b4d2-97ff432ec4a1'),
(73,50,NULL,33,11,'craft\\elements\\Entry',1,0,'2024-05-13 15:02:27','2024-05-13 15:02:27',NULL,'2024-05-13 15:08:19',NULL,'d7b586d9-d421-4a9d-8a2a-1912819f06fa'),
(75,50,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2024-05-13 15:02:31','2024-05-13 15:02:34',NULL,'2024-05-13 15:02:34',NULL,'080f25e8-7c65-4a7c-bb9d-c66fb242bb40'),
(77,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2024-05-13 15:08:19','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'cc67fbad-7da4-4abf-9e86-814ce6871538'),
(78,2,NULL,34,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:08:19','2024-05-13 15:08:19',NULL,NULL,NULL,'56830b98-3921-414b-8076-16746bbedb29'),
(79,77,NULL,35,11,'craft\\elements\\Entry',1,0,'2024-05-13 15:08:19','2024-05-13 15:08:19',NULL,'2024-06-26 15:43:49',NULL,'d62d6023-69db-4ed6-b712-3b9f8bff13d2'),
(82,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-05-13 15:22:32','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'5149648b-181d-4f13-8499-cf0755d2e1b9'),
(83,2,NULL,36,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:22:32','2024-05-13 15:22:32',NULL,NULL,NULL,'5d8f82f2-7ef5-4729-8d6b-f961febf4596'),
(84,82,NULL,37,16,'craft\\elements\\Entry',1,0,'2024-05-13 15:22:32','2024-05-13 15:22:32',NULL,'2024-06-26 15:43:49',NULL,'1b178915-0696-4b6b-8696-97e983098535'),
(87,2,NULL,38,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:22:47','2024-05-13 15:22:47',NULL,NULL,NULL,'654713d4-62e3-4579-a856-3e8302a41966'),
(88,82,NULL,39,16,'craft\\elements\\Entry',1,0,'2024-05-13 15:22:47','2024-05-13 15:22:47',NULL,'2024-06-26 15:43:49',NULL,'c288cef7-1811-413a-8445-0958182c8741'),
(89,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:37:33','2024-06-10 14:01:08',NULL,NULL,NULL,'7b9da91d-bca3-4577-b61b-accd808cf5fc'),
(90,89,NULL,40,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:37:43','2024-05-13 15:37:43',NULL,NULL,NULL,'4c6a9773-c74e-4c11-8a5f-ca27b9627761'),
(93,2,NULL,41,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:38:02','2024-05-13 15:38:02',NULL,NULL,NULL,'f5fb6718-93c3-4a52-b6c8-c999b7ae1cbd'),
(94,82,NULL,42,16,'craft\\elements\\Entry',1,0,'2024-05-13 15:38:02','2024-05-13 15:38:02',NULL,'2024-06-26 15:43:49',NULL,'8e06d8c2-0df3-419b-ada2-f6bdb09e5b95'),
(97,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2024-05-13 15:38:23','2024-05-13 15:38:23',NULL,NULL,NULL,'8e4e8255-2275-4fa8-828b-a4e7426ce8cc'),
(98,2,NULL,43,1,'craft\\elements\\Entry',1,0,'2024-05-13 15:38:33','2024-05-13 15:38:33',NULL,NULL,NULL,'ebea935e-8503-471c-aa10-6206e5f27930'),
(99,82,NULL,44,16,'craft\\elements\\Entry',1,0,'2024-05-13 15:38:33','2024-05-13 15:38:33',NULL,'2024-06-26 15:43:49',NULL,'7358662c-8fe7-4056-a9e9-4dbf146564e6'),
(101,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2024-05-13 16:17:57','2024-05-13 16:18:47',NULL,'2024-05-13 16:18:47',NULL,'dd40ee54-05b4-4723-ab0d-ce9eb940d5a4'),
(103,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-13 16:18:39','2024-05-13 16:18:45',NULL,'2024-05-13 16:18:45',NULL,'7b82fc35-f1df-4b11-9809-7afaef93c2fb'),
(104,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-05-13 16:18:49','2024-05-13 16:18:53',NULL,'2024-05-13 16:18:53',NULL,'c7378401-69ee-4474-9487-3a3ba5f1e001'),
(105,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:14','2024-05-13 16:29:22',NULL,'2024-05-13 16:29:22',NULL,'85e8f196-de2f-4f57-b889-d63c0934fe5f'),
(107,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:24','2024-05-13 16:29:24',NULL,'2024-05-13 16:29:24',NULL,'a17ff958-fdd1-4eda-a5d3-b1cdc233294a'),
(110,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-14 09:16:19',NULL,'2024-05-14 09:16:19',NULL,'91ab1f16-684f-4015-b790-4008fdb6ece5'),
(111,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-14 09:16:19',NULL,'2024-05-14 09:16:19',1,'6c0e7c18-dace-49f5-aff6-df0b86900524'),
(112,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-14 09:16:19',NULL,'2024-05-14 09:16:19',1,'e2a289e2-9086-4de9-a043-cf53967cfad6'),
(113,2,NULL,45,1,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-13 16:29:59',NULL,NULL,NULL,'3dacec02-1c6f-40a7-8af0-16f5175d5da7'),
(114,110,NULL,46,18,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-13 16:29:59',NULL,'2024-05-14 09:16:19',NULL,'9496905f-8c3f-4e26-a102-933a99b35359'),
(115,111,NULL,47,17,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-13 16:29:59',NULL,'2024-05-14 09:16:19',NULL,'30afb23a-b1aa-4504-9443-d5c0baa2ec77'),
(116,112,NULL,48,15,'craft\\elements\\Entry',1,0,'2024-05-13 16:29:59','2024-05-13 16:29:59',NULL,'2024-05-14 09:16:19',NULL,'edd6272a-6378-4214-bbcd-d4b952f16387'),
(117,2,NULL,49,1,'craft\\elements\\Entry',1,0,'2024-05-13 16:35:06','2024-05-13 16:35:06',NULL,NULL,NULL,'0503d837-1086-4c30-a58f-9743c2255a1b'),
(118,2,NULL,50,1,'craft\\elements\\Entry',1,0,'2024-05-14 09:14:50','2024-05-14 09:14:50',NULL,NULL,NULL,'7bd434df-feb2-41d1-9a00-d2b7ec28637f'),
(121,2,NULL,51,1,'craft\\elements\\Entry',1,0,'2024-05-14 09:15:13','2024-05-14 09:15:13',NULL,NULL,NULL,'036e04b5-a466-442b-955f-ded2f66480ce'),
(122,82,NULL,52,16,'craft\\elements\\Entry',1,0,'2024-05-14 09:15:13','2024-05-14 09:15:13',NULL,'2024-06-26 15:43:49',NULL,'ba034b23-6c05-4541-87b2-49e432a71b53'),
(124,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2024-05-14 09:15:42','2024-05-14 09:16:17',NULL,'2024-05-14 09:16:17',NULL,'da914d6c-1b3d-4afa-9386-6561621bd4d0'),
(125,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-14 09:15:42','2024-05-14 09:15:42',NULL,'2024-05-14 09:15:42',NULL,'3bd12190-1a89-4486-8443-23f30f3874e7'),
(126,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-14 09:15:43','2024-05-14 09:16:17',NULL,'2024-05-14 09:16:17',1,'3bd12190-1a89-4486-8443-23f30f3874e7'),
(127,2,NULL,53,1,'craft\\elements\\Entry',1,0,'2024-05-14 09:16:19','2024-05-14 09:16:19',NULL,NULL,NULL,'5905c088-4445-49b2-8f33-1ab1c8e75e94'),
(132,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'6b42738c-0c81-4b34-908a-d5a7ef8bebdb'),
(133,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',1,'2e910846-cc3f-42bf-95e5-f66190985811'),
(134,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',1,'9d801330-5cd8-4fc8-9fa3-1abee8002734'),
(135,2,NULL,54,1,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-05-14 09:17:32',NULL,NULL,NULL,'497d188a-2186-48d1-af30-8a54d72840c8'),
(136,132,NULL,55,18,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-05-14 09:17:32',NULL,'2024-06-26 15:43:49',NULL,'d4632c94-2d2e-46a5-86bc-599bddc75ffd'),
(137,133,NULL,56,17,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-05-14 09:17:32',NULL,'2024-06-26 15:43:49',NULL,'8655a29e-f9c5-4f8d-ad1d-6dc610adfe74'),
(138,134,NULL,57,15,'craft\\elements\\Entry',1,0,'2024-05-14 09:17:32','2024-05-14 09:17:32',NULL,'2024-06-26 15:43:49',NULL,'46ff2eea-10da-4021-b9db-b281d863dc83'),
(142,NULL,NULL,NULL,19,'craft\\elements\\Entry',1,0,'2024-05-14 09:47:16','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'9b13ecae-280d-45c7-b99d-73c5aca9d099'),
(143,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-05-14 09:47:16','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',1,'21fea038-8d3e-41c1-9c0d-52ff1aebb330'),
(144,2,NULL,58,1,'craft\\elements\\Entry',1,0,'2024-05-14 09:47:16','2024-05-14 09:47:16',NULL,NULL,NULL,'37a928a3-6d2e-4086-bf8e-865e5c979422'),
(145,142,NULL,59,19,'craft\\elements\\Entry',1,0,'2024-05-14 09:47:16','2024-05-14 09:47:16',NULL,'2024-06-26 15:43:49',NULL,'d470a2b3-e185-4010-8459-2d148cb3c761'),
(146,143,NULL,60,16,'craft\\elements\\Entry',1,0,'2024-05-14 09:47:16','2024-05-14 09:47:16',NULL,'2024-06-26 15:43:49',NULL,'41911de9-d073-4718-ae19-14775030676d'),
(149,NULL,NULL,NULL,20,'craft\\elements\\Entry',1,0,'2024-05-14 10:52:16','2024-06-26 15:43:49',NULL,'2024-06-26 15:43:49',NULL,'ef4f8398-f61c-4403-a084-25724784a59c'),
(150,2,NULL,61,1,'craft\\elements\\Entry',1,0,'2024-05-14 10:52:16','2024-05-14 10:52:16',NULL,NULL,NULL,'01361eaf-52de-45af-82ca-b22495f8e46f'),
(151,149,NULL,62,20,'craft\\elements\\Entry',1,0,'2024-05-14 10:52:16','2024-05-14 10:52:16',NULL,'2024-06-26 15:43:49',NULL,'cfa1aa9d-0ca9-4570-b312-22d5691ae7ad'),
(152,NULL,NULL,NULL,21,'craft\\elements\\Entry',1,0,'2024-05-15 10:16:56','2024-05-15 10:27:05',NULL,NULL,NULL,'2c52bbf9-2ac7-4d19-be41-631274340ecf'),
(153,152,NULL,63,21,'craft\\elements\\Entry',1,0,'2024-05-15 10:17:05','2024-05-15 10:17:05',NULL,NULL,NULL,'a9fcdfe3-0df0-4549-b158-f84ee97401f1'),
(155,152,NULL,64,21,'craft\\elements\\Entry',1,0,'2024-05-15 10:27:05','2024-05-15 10:27:05',NULL,NULL,NULL,'93285cbf-d93f-4c1d-af16-7957eecc91fd'),
(156,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:43:53','2024-05-15 10:44:23',NULL,'2024-05-15 10:51:12',NULL,'6534507d-447e-4091-b5c3-3f3d3affb688'),
(157,156,NULL,65,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:23','2024-05-15 10:44:23',NULL,NULL,NULL,'db3e24f3-d8b5-4d1d-9764-c9522b5643d9'),
(158,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:25','2024-05-15 10:44:30',NULL,'2024-05-15 10:51:12',NULL,'fde21ec9-0aae-4be6-bf75-be9b389f4b09'),
(159,158,NULL,66,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:30','2024-05-15 10:44:30',NULL,NULL,NULL,'8491cb3d-a521-4e03-b8e9-c4a1a9ae5ea9'),
(160,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:31','2024-05-15 10:44:37',NULL,'2024-05-15 10:51:12',NULL,'bb8b9a7e-045b-49fe-8fc9-04640c0c7855'),
(161,160,NULL,67,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:37','2024-05-15 10:44:37',NULL,NULL,NULL,'2b5ad614-4503-4529-ba30-53ec40c8986b'),
(162,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:38','2024-05-15 10:44:44',NULL,'2024-05-15 10:51:12',NULL,'36626fa0-dc53-491c-9b06-9c350faed940'),
(163,162,NULL,68,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:44','2024-05-15 10:44:44',NULL,NULL,NULL,'e4aefefd-fa43-475c-b690-8153de09a7df'),
(164,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:46','2024-05-15 10:44:50',NULL,'2024-05-15 10:51:12',NULL,'11d7dbd8-812c-47ae-9ea2-40fb37a9e3d8'),
(165,164,NULL,69,1,'craft\\elements\\Entry',1,0,'2024-05-15 10:44:50','2024-05-15 10:44:50',NULL,NULL,NULL,'e69b0ec2-5012-4321-8649-fbc2cd3e7602'),
(166,NULL,NULL,NULL,22,'craft\\elements\\GlobalSet',1,0,'2024-05-15 10:57:59','2024-05-15 13:44:12',NULL,NULL,NULL,'cdd9e7cc-1867-45b4-9c9b-7310c18333bd'),
(167,NULL,NULL,NULL,23,'craft\\elements\\Entry',1,0,'2024-05-15 11:27:13','2024-05-15 13:44:12',NULL,NULL,NULL,'1208ca14-8ccf-47ef-8cf3-0035817bf896'),
(170,2,NULL,70,1,'craft\\elements\\Entry',1,0,'2024-05-16 08:07:40','2024-05-16 08:07:40',NULL,NULL,NULL,'7bbf2152-b3a0-4559-8288-5b37c25cc697'),
(171,40,NULL,71,14,'craft\\elements\\Entry',1,0,'2024-05-16 08:07:40','2024-05-16 08:07:41',NULL,'2024-06-26 15:43:49',NULL,'4c6029ab-5933-4f60-885b-db3917f0ec25'),
(175,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:08:57','2024-06-10 13:55:46',NULL,NULL,NULL,'dcd2a002-fc89-458d-b671-18fa82f8069b'),
(176,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:08:57','2024-06-10 13:55:46',NULL,NULL,NULL,'ee150caf-c307-4c52-a5d1-238291477d04'),
(177,89,NULL,72,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:08:57','2024-06-10 13:08:57',NULL,NULL,NULL,'f45dd236-1650-4060-a8de-7e0d81da80c2'),
(178,175,NULL,73,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:08:57','2024-06-10 13:08:57',NULL,NULL,NULL,'6ef789a9-59c0-4ba7-9297-00ab79cc7dcd'),
(179,176,NULL,74,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:08:57','2024-06-10 13:08:57',NULL,NULL,NULL,'519f4c7a-2d88-44e2-b60f-3a696cde0b17'),
(180,89,NULL,75,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:10:14','2024-06-10 13:10:14',NULL,NULL,NULL,'bddb918f-2b96-4e9f-bfe7-e57390d93827'),
(184,89,NULL,76,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:10:35','2024-06-10 13:10:35',NULL,NULL,NULL,'cb6ab4c8-ba44-4775-8e56-7b9a4bbf3f6f'),
(185,175,NULL,77,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:10:35','2024-06-10 13:10:35',NULL,NULL,NULL,'ac704bfb-83f7-4d32-8d7e-dcf5b2c55b6f'),
(186,176,NULL,78,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:10:35','2024-06-10 13:10:35',NULL,NULL,NULL,'eece02f8-c7ce-4927-84cf-843195106181'),
(187,89,NULL,79,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:10:53','2024-06-10 13:10:53',NULL,NULL,NULL,'9d27524e-7de4-4d98-baa0-e43ac1c441f3'),
(190,NULL,NULL,NULL,19,'craft\\elements\\Entry',1,0,'2024-06-10 13:22:39','2024-06-10 13:22:51',NULL,'2024-06-10 13:22:51',NULL,'71764dfb-72df-46f2-a47b-24aebe4e8600'),
(191,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-06-10 13:22:40','2024-06-10 13:22:40',NULL,'2024-06-10 13:22:40',NULL,'6109a9c3-6e5e-464e-b365-ab30b7a56766'),
(192,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2024-06-10 13:22:40','2024-06-10 13:22:51',NULL,'2024-06-10 13:22:51',1,'6109a9c3-6e5e-464e-b365-ab30b7a56766'),
(193,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:04','2024-08-30 13:56:25',NULL,NULL,NULL,'0fd4c2b3-f3f8-4cb1-bcde-344a140e13ab'),
(194,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:12','2024-08-30 13:56:25',NULL,NULL,NULL,'b6e24ed1-14ef-4500-b995-eae7a5aa3bb4'),
(195,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:14','2024-08-30 13:56:25',NULL,NULL,NULL,'0c617fd7-2f94-459b-b9a5-dffa2834428d'),
(196,193,NULL,80,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:20','2024-06-10 13:23:20',NULL,NULL,NULL,'3aaa1723-cfcd-4927-acf5-627238972c11'),
(197,194,NULL,81,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:20','2024-06-10 13:23:20',NULL,NULL,NULL,'40d6a506-05df-448e-bea6-2143ab7f2d1a'),
(198,195,NULL,82,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:23:20','2024-06-10 13:23:20',NULL,NULL,NULL,'b5098ce5-4383-44ed-bf80-cb8a85e8eb53'),
(199,193,NULL,83,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:42:10','2024-06-10 13:42:10',NULL,NULL,NULL,'eda0977f-a28c-436b-b938-9d6a56ef6fd3'),
(203,193,NULL,84,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:43:40','2024-06-10 13:43:40',NULL,NULL,NULL,'5cb3f603-bd45-40d9-8c33-bab4a8b5098e'),
(204,194,NULL,85,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:43:40','2024-06-10 13:43:40',NULL,NULL,NULL,'758fdadb-cc36-47aa-988e-6ea8d12693bd'),
(205,195,NULL,86,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:43:40','2024-06-10 13:43:40',NULL,NULL,NULL,'44703ec6-773e-4458-99d1-d01ab4719839'),
(209,193,NULL,87,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:45:54','2024-06-10 13:45:54',NULL,NULL,NULL,'7af22c99-e278-41a1-b533-a6c785cf2de9'),
(210,194,NULL,88,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:45:54','2024-06-10 13:45:54',NULL,NULL,NULL,'8c66f8e6-80c1-440c-a34a-53c8a8c03541'),
(211,195,NULL,89,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:45:54','2024-06-10 13:45:54',NULL,NULL,NULL,'2d3d59da-3848-4d75-bcf3-edb0353e0d19'),
(215,193,NULL,90,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:54:41','2024-06-10 13:54:41',NULL,NULL,NULL,'9f64aa28-71d1-48f7-b571-719c65898298'),
(216,194,NULL,91,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:54:41','2024-06-10 13:54:41',NULL,NULL,NULL,'0a02cc22-84c2-4026-bc5f-687f539f9ae5'),
(217,195,NULL,92,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:54:41','2024-06-10 13:54:41',NULL,NULL,NULL,'a92d2214-4e28-44b3-a970-21490bbf0e82'),
(221,193,NULL,93,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:24','2024-06-10 13:55:24',NULL,NULL,NULL,'f9f6551a-b4df-447c-88f4-625bae8bf016'),
(222,194,NULL,94,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:24','2024-06-10 13:55:24',NULL,NULL,NULL,'d3a69213-8b00-485d-976e-d23be05abedb'),
(223,195,NULL,95,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:24','2024-06-10 13:55:24',NULL,NULL,NULL,'edba4015-551f-4426-b60e-7f1b255167fc'),
(226,89,NULL,96,1,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:46','2024-06-10 13:55:46',NULL,NULL,NULL,'58fa60a3-471e-4512-b21d-016d3d5b4a84'),
(227,175,NULL,97,24,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:46','2024-06-10 13:55:46',NULL,NULL,NULL,'c2638a74-3e66-4791-8de8-9e2dac55db24'),
(228,176,NULL,98,14,'craft\\elements\\Entry',1,0,'2024-06-10 13:55:46','2024-06-10 13:55:46',NULL,NULL,NULL,'24c5b8d1-d080-46e6-806b-c855d8fdffd0'),
(232,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2024-06-10 14:01:08','2024-06-10 14:01:08',NULL,NULL,NULL,'740f6da4-e71d-4270-acbb-9e9be79bb20f'),
(233,NULL,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-10 14:01:08','2024-06-10 14:01:08',NULL,NULL,NULL,'38b70247-1496-4569-889a-7bf5d629262e'),
(234,89,NULL,99,1,'craft\\elements\\Entry',1,0,'2024-06-10 14:01:08','2024-06-10 14:01:08',NULL,NULL,NULL,'8663d3e9-0026-46b3-95b4-c70e9c437242'),
(235,232,NULL,100,24,'craft\\elements\\Entry',1,0,'2024-06-10 14:01:08','2024-06-10 14:01:08',NULL,NULL,NULL,'e41ebc4b-f4c9-4810-8848-5eb4c5ce945c'),
(236,233,NULL,101,14,'craft\\elements\\Entry',1,0,'2024-06-10 14:01:08','2024-06-10 14:01:08',NULL,NULL,NULL,'fa69faac-1cf5-4678-a1f4-fa8ea5766e2a'),
(237,193,NULL,102,1,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:08','2024-06-26 15:42:08',NULL,NULL,NULL,'918d38e6-9e4e-4568-b65d-cf0f4c7705dc'),
(241,195,80,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:13','2024-06-26 15:42:17',NULL,'2024-06-26 15:42:17',NULL,'2087fb64-ada8-4ecf-b7ea-f3add4a90af2'),
(242,195,81,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:17','2024-06-26 15:42:17',NULL,'2024-06-26 15:42:17',NULL,'f156fa99-72e5-4d0c-881a-3673dc2e39dd'),
(243,195,82,NULL,14,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:20','2024-06-26 15:42:21',NULL,'2024-06-26 15:42:21',NULL,'f40c9bea-6866-402b-8918-3a357967964b'),
(244,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:21','2024-08-30 13:56:25',NULL,NULL,NULL,'671e94ed-814e-4ec8-8721-e61c70583e84'),
(245,193,NULL,103,1,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:21','2024-06-26 15:42:21',NULL,NULL,NULL,'a42f1e5f-db88-41e2-acc5-3704fe723d86'),
(246,194,NULL,104,24,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:21','2024-06-26 15:42:21',NULL,NULL,NULL,'893a49b9-823a-4c0b-802e-36f7461547d8'),
(247,244,NULL,105,15,'craft\\elements\\Entry',1,0,'2024-06-26 15:42:21','2024-06-26 15:42:21',NULL,NULL,NULL,'cda8bc6f-f1f6-4121-b059-8cfd0fd8f753'),
(248,2,NULL,106,1,'craft\\elements\\Entry',1,0,'2024-06-26 15:43:49','2024-06-26 15:43:49',NULL,NULL,NULL,'0291370e-3ab4-44a6-aa93-0648c1c71f2c'),
(252,195,93,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:44','2024-08-30 13:45:44',NULL,'2024-08-30 13:45:44',NULL,'f7b33519-80f2-4fb4-b90c-ed36a0d79e45'),
(253,244,94,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:44','2024-08-30 13:45:44',NULL,'2024-08-30 13:45:44',NULL,'d3a897f2-da12-4dc6-bc2e-dc0bbf35af4a'),
(255,195,95,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:44','2024-08-30 13:45:45',NULL,'2024-08-30 13:45:45',NULL,'80bd98f6-97a7-4d48-bb4d-6dcb9677e34e'),
(256,244,96,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:44','2024-08-30 13:45:45',NULL,'2024-08-30 13:45:45',NULL,'5923549c-19b0-464b-a128-222c03e84f2d'),
(257,195,97,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:50','2024-08-30 13:45:51',NULL,'2024-08-30 13:45:51',NULL,'fe8b6c04-48bc-4a15-bb38-78e62d40256a'),
(258,244,98,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:50','2024-08-30 13:45:51',NULL,'2024-08-30 13:45:51',NULL,'da2c3dfe-605b-44e8-9872-b9b2946938d2'),
(260,195,99,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:52','2024-08-30 13:45:52',NULL,'2024-08-30 13:45:52',NULL,'e8c86559-c48e-472c-9489-2d068a732c09'),
(261,244,100,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:52','2024-08-30 13:45:52',NULL,'2024-08-30 13:45:52',NULL,'cee13dd6-319a-4055-8f87-678bcbd7ab94'),
(262,195,101,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:58','2024-08-30 13:45:59',NULL,'2024-08-30 13:45:59',NULL,'aeecdc2d-202d-4f73-a8b8-15664f8c56eb'),
(263,244,102,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:58','2024-08-30 13:45:59',NULL,'2024-08-30 13:45:59',NULL,'d65d2fe0-8998-4982-ad73-10d2510a2326'),
(264,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:56:25',NULL,NULL,NULL,'d7515c7c-ec0c-4a91-a125-3dadb4dd0526'),
(265,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:56:25',NULL,NULL,NULL,'bc8b9125-3087-41a6-aac7-5baa0255a7f5'),
(266,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'d902c730-cf82-46f4-8d21-b52603534a32'),
(267,193,NULL,107,1,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'57c4fe24-7d31-46a6-9d0c-68e819697a62'),
(268,194,NULL,108,24,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'ee7ab7c9-98fb-4874-94f7-f4f21fc22591'),
(269,264,NULL,109,18,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'3dadd35c-a932-49ef-bbff-4b10ed02979d'),
(270,265,NULL,110,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'f44efa4a-cad9-49d0-afdf-98c4a0c263ef'),
(271,266,NULL,111,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:45:59','2024-08-30 13:45:59',NULL,NULL,NULL,'c2819fa4-5df1-4029-87d4-4b8ea9cae687'),
(276,265,106,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,'2024-08-30 13:56:03',NULL,'c197a63c-a415-4688-b8d1-cfa77fc5cc81'),
(277,266,107,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,NULL,NULL,'86e2293b-d7f6-4077-96b1-c3f36b9150c4'),
(278,195,108,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,NULL,NULL,'aa7dab29-6fa9-498b-afa6-3e0cc0ed4816'),
(279,244,109,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,NULL,NULL,'c10468e3-325b-4a32-974f-b44da0cf8304'),
(280,265,110,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,'2024-08-30 13:56:03',NULL,'38535ade-de30-4b6c-9f33-7229ad2a0c76'),
(281,266,111,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:03','2024-08-30 13:56:03',NULL,NULL,NULL,'9be3b633-2b5a-4454-b726-50630485d332'),
(282,195,112,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:07','2024-08-30 13:56:07',NULL,NULL,NULL,'7463cd7f-1cfc-4fce-93b2-e1a3ad3deeba'),
(283,244,113,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:07','2024-08-30 13:56:07',NULL,NULL,NULL,'137f7444-d51a-4004-ba27-44ecf61c0091'),
(284,265,114,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:08','2024-08-30 13:56:08',NULL,'2024-08-30 13:56:08',NULL,'25cbd33f-eb06-44ea-bf6c-123c5bc4e17a'),
(285,266,115,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:08','2024-08-30 13:56:08',NULL,NULL,NULL,'4cbeb1b1-b712-494b-9e1c-43d1232cf018'),
(286,265,116,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:08','2024-08-30 13:56:08',NULL,'2024-08-30 13:56:08',NULL,'3924d2a4-48f0-46b5-bf34-5673097d2c2b'),
(287,266,117,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:08','2024-08-30 13:56:08',NULL,NULL,NULL,'e0c3e428-74b7-4870-9a39-787cae8bbd67'),
(288,265,118,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,'2024-08-30 13:56:09',NULL,'5c029fb1-f636-4fbe-b4cf-31d46f2d2cb8'),
(289,266,119,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,NULL,NULL,'ff16eff3-710b-4039-a823-21deb285dce4'),
(290,195,120,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,NULL,NULL,'c4f41f26-9998-448e-926f-b3af17855a07'),
(291,244,121,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,NULL,NULL,'1d5baa23-53d8-4b97-b152-8d2b8fed108a'),
(292,265,122,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,'2024-08-30 13:56:09',NULL,'666689df-1949-4315-9d63-756884c673e8'),
(293,266,123,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:09','2024-08-30 13:56:09',NULL,NULL,NULL,'5e06249c-834d-461f-a5de-891865d440a0'),
(294,195,124,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:12',NULL,NULL,NULL,'fe9bbc20-a5c0-43a1-bfa4-8be4692c8b2f'),
(295,244,125,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:12',NULL,NULL,NULL,'681e9d12-ea73-405a-8d36-6bc2da1cd0be'),
(296,265,126,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:12',NULL,'2024-08-30 13:56:12',NULL,'59a21478-ea5b-432a-8fe3-093419a38efb'),
(297,266,127,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:12',NULL,NULL,NULL,'169e9258-bf35-494f-ad15-4a9996228155'),
(298,265,128,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:25',NULL,NULL,NULL,'7d9060d2-92e9-4736-bf7d-5401aa93cd3c'),
(299,266,129,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:12','2024-08-30 13:56:12',NULL,NULL,NULL,'6d3f70b8-c75d-47e5-8c35-42bd2c60caf7'),
(300,266,130,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:17','2024-08-30 13:56:17',NULL,NULL,NULL,'683a49fa-b9f2-4c86-93fd-b367836dd732'),
(301,195,131,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:17','2024-08-30 13:56:17',NULL,NULL,NULL,'14b88e01-2e28-4ecd-b85e-ef67ad6e6ae3'),
(302,244,132,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:17','2024-08-30 13:56:17',NULL,NULL,NULL,'cf920aa2-a07d-4ab7-9a55-affc8228bb48'),
(303,266,133,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:17','2024-08-30 13:56:17',NULL,NULL,NULL,'833dfc1a-80ef-4a48-8504-20f98be2e9a2'),
(305,266,134,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:20','2024-08-30 13:56:20',NULL,NULL,NULL,'fcab42ce-a836-47e4-a054-28d120138bc1'),
(306,195,135,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:20','2024-08-30 13:56:20',NULL,NULL,NULL,'d6e95e7c-92e2-454e-86d6-104f9175b9c5'),
(307,244,136,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:20','2024-08-30 13:56:20',NULL,NULL,NULL,'78c5b19a-990c-477b-8412-241911260e49'),
(308,266,137,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:20','2024-08-30 13:56:20',NULL,NULL,NULL,'64b82311-4ea4-40e6-959c-d82eafee750f'),
(309,195,138,NULL,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:24','2024-08-30 13:56:24',NULL,NULL,NULL,'3d09c7a9-e047-4875-9b50-da890b2958b5'),
(310,244,139,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:24','2024-08-30 13:56:24',NULL,NULL,NULL,'e403d20e-869e-49ca-89de-c9e42090ef6d'),
(311,266,140,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:24','2024-08-30 13:56:24',NULL,NULL,NULL,'853e8a8f-b116-47ed-94eb-c48bdf1d7385'),
(312,266,141,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:24','2024-08-30 13:56:24',NULL,NULL,NULL,'6daf81cf-d068-41d5-bb83-e13eb0552c95'),
(313,NULL,NULL,NULL,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'61fe19ad-cc23-4967-9367-a5dbd1707b4c'),
(314,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'f09dd6c7-0920-4d38-8f19-124c9b28134d'),
(315,193,NULL,112,1,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'b1c3562b-2901-48dc-acc1-de3c3c98a8c0'),
(316,194,NULL,113,24,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'f9db1be3-2a60-4887-a188-045f5eb66d09'),
(317,195,NULL,114,14,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'39b32989-9cf7-4ffe-8631-c03bd7e7ce9a'),
(318,244,NULL,115,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'d692ee3a-b751-46f0-a4c8-3b4d100fc249'),
(319,264,NULL,116,18,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'33a6a060-59c4-4cef-b34b-85ee5631f230'),
(320,265,NULL,117,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'bb6df6e2-21d7-43e0-89e8-82a8b5156875'),
(321,313,NULL,118,17,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'e2bd7409-1fca-4eac-995b-6622cdaa4f89'),
(322,314,NULL,119,15,'craft\\elements\\Entry',1,0,'2024-08-30 13:56:25','2024-08-30 13:56:25',NULL,NULL,NULL,'54a463d9-2d6c-4abb-a886-11520429c50c');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES
(11,2,1),
(13,12,1),
(13,14,1),
(40,2,1),
(42,41,1),
(42,46,1),
(42,51,1),
(45,2,3),
(47,46,2),
(47,51,2),
(47,55,2),
(47,59,2),
(47,64,3),
(50,2,4),
(52,51,3),
(52,55,3),
(52,59,3),
(52,64,4),
(52,68,4),
(56,55,1),
(60,59,1),
(60,64,1),
(60,68,1),
(60,72,1),
(60,78,1),
(60,83,1),
(60,87,1),
(60,93,1),
(60,98,1),
(60,113,1),
(60,117,1),
(60,118,1),
(60,121,1),
(60,127,1),
(60,135,1),
(60,144,1),
(60,150,1),
(63,2,2),
(65,64,2),
(65,68,2),
(65,72,2),
(65,78,2),
(65,83,2),
(65,87,2),
(65,93,2),
(65,98,2),
(65,113,2),
(65,117,2),
(65,118,2),
(65,121,2),
(65,127,2),
(65,135,2),
(65,144,2),
(65,150,2),
(65,170,2),
(69,68,3),
(69,72,3),
(69,78,3),
(69,83,3),
(69,87,3),
(69,93,3),
(69,98,3),
(69,113,3),
(69,117,3),
(69,118,3),
(69,121,3),
(69,127,3),
(69,135,3),
(69,144,3),
(69,150,3),
(69,170,3),
(73,72,4),
(77,2,4),
(79,78,4),
(79,83,4),
(79,87,4),
(79,93,4),
(79,98,4),
(79,113,4),
(79,117,4),
(79,118,4),
(79,121,4),
(79,127,4),
(79,135,4),
(79,144,4),
(79,150,4),
(79,170,4),
(82,2,6),
(84,83,5),
(88,87,5),
(94,93,5),
(99,98,5),
(99,113,5),
(99,117,5),
(99,118,5),
(103,101,1),
(110,2,6),
(111,110,1),
(112,111,1),
(114,113,6),
(114,117,6),
(114,118,6),
(114,121,6),
(115,114,1),
(116,115,1),
(122,121,5),
(122,127,5),
(122,135,6),
(122,144,6),
(122,150,6),
(122,170,6),
(125,124,1),
(126,124,1),
(132,2,5),
(133,132,1),
(134,133,1),
(136,135,5),
(136,144,5),
(136,150,5),
(136,170,5),
(137,136,1),
(138,137,1),
(142,2,7),
(143,142,1),
(145,144,7),
(145,150,7),
(145,170,7),
(146,145,1),
(149,2,8),
(151,150,8),
(151,170,8),
(167,166,1),
(171,170,1),
(175,89,1),
(176,175,2),
(178,177,1),
(178,180,1),
(179,178,1),
(185,184,1),
(185,187,1),
(186,185,1),
(191,190,1),
(192,190,1),
(194,193,1),
(195,194,8),
(197,196,1),
(197,199,1),
(198,197,1),
(204,203,1),
(205,204,1),
(210,209,1),
(211,210,1),
(216,215,1),
(217,216,1),
(222,221,1),
(222,237,1),
(223,222,1),
(223,246,1),
(223,268,1),
(227,226,1),
(227,234,1),
(228,227,2),
(232,89,2),
(233,232,1),
(235,234,2),
(236,235,1),
(244,194,16),
(246,245,1),
(247,246,2),
(247,268,2),
(264,194,17),
(265,264,1),
(266,265,1),
(266,276,1),
(266,280,1),
(266,284,1),
(266,286,1),
(266,288,1),
(266,292,1),
(266,296,1),
(266,298,1),
(268,267,1),
(269,268,3),
(270,269,1),
(271,270,1),
(271,320,1),
(277,276,1),
(281,280,1),
(285,284,1),
(287,286,1),
(289,288,1),
(293,292,1),
(297,296,1),
(299,298,1),
(300,298,1),
(303,298,1),
(305,298,1),
(308,298,1),
(311,298,1),
(312,298,1),
(313,264,2),
(314,313,1),
(316,315,1),
(317,316,8),
(318,316,16),
(319,316,17),
(320,319,1),
(321,319,2),
(322,321,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2024-04-11 13:46:31','2024-04-11 13:46:31','e0f08abc-b9fb-48b3-a7a1-8583d1492040'),
(2,2,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-16T01:07:39-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-04-11 13:47:16','2024-05-16 08:07:40','c259edb6-ee38-455f-9a57-9adeb9531735'),
(3,3,1,'Website documentation','website-documentation','website-documentation',NULL,1,'2024-04-11 13:47:29','2024-04-11 13:47:29','419c3a24-f646-4214-828a-9365a4f24c4a'),
(5,5,1,'Website documentation','website-documentation','website-documentation',NULL,1,'2024-04-11 13:47:43','2024-04-11 13:47:43','bdbf2b82-4ec8-4942-824a-a134c4f9b845'),
(7,7,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-04-11 14:39:31','2024-04-11 14:39:31','37cab607-fb29-4ee3-a88c-69e07fa857c4'),
(10,10,1,'Catnap',NULL,NULL,NULL,1,'2024-04-11 15:06:23','2024-04-11 15:06:23','71d4bbc1-7b5c-4b50-8b5d-31a3d929a719'),
(11,11,1,NULL,'__temp_alawwftxthiqztozsdlabrlqlpqhbrxbhzwy',NULL,NULL,1,'2024-04-11 15:06:30','2024-04-11 15:06:30','0f83e0a8-8df0-47b3-9666-a9a948ee3684'),
(12,12,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":\"<p>This is a test.<\\/p><craft-entry data-entry-id=\\\"13\\\"> <\\/craft-entry><p> <\\/p>\"}',1,'2024-04-11 15:06:30','2024-04-11 15:06:30','38f10cbb-7a61-4194-8183-0e7251d11d91'),
(13,13,1,NULL,'__temp_alawwftxthiqztozsdlabrlqlpqhbrxbhzwy',NULL,NULL,1,'2024-04-11 15:06:30','2024-04-11 15:06:30','63f4e7a1-7594-4e02-92fd-f3b87731c46c'),
(14,14,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":\"<p>This is a test.<\\/p><craft-entry data-entry-id=\\\"13\\\"> <\\/craft-entry><p> <\\/p>\"}',1,'2024-04-11 15:33:25','2024-04-11 15:33:25','60f48e7f-8b04-4ef5-81c5-2afb16a2214c'),
(16,16,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-cbN3tg1zpg\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"90c7e788-ca96-4589-ac94-bff411e1e32e\":[10]}}}}}]}',1,'2024-04-11 15:52:52','2024-04-11 15:52:52','443eb433-93e4-43aa-81bd-2e20a6f8cd14'),
(18,18,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-cbN3tg1zpg\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"90c7e788-ca96-4589-ac94-bff411e1e32e\":[10]}}}}}]}',1,'2024-04-11 15:57:09','2024-04-11 15:57:09','96f7de8b-1465-43a6-8174-dbd13de6d839'),
(20,20,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-cbN3tg1zpg\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"e77c1044-6812-455c-b1f8-d76cd08b797f\":\"standard\"}}}}}]}',1,'2024-04-11 16:03:20','2024-04-11 16:03:20','3b11b523-c553-4e3d-a919-95d01037e9cf'),
(22,22,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-cbN3tg1zpg\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}}]}',1,'2024-04-11 16:24:47','2024-04-11 16:24:47','4a2c944a-d47f-4ef0-ba3d-629d8fe277dd'),
(24,24,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-cbN3tg1zpg\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}}]}',1,'2024-04-11 16:25:27','2024-04-11 16:25:27','7f16f877-b59e-4183-9da6-ebcb788f94b2'),
(26,26,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}}]}',1,'2024-04-11 16:25:33','2024-04-11 16:25:33','c01950ab-f3b2-46ab-98bc-3742376f264b'),
(27,27,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}}]}',1,'2024-04-11 16:33:29','2024-04-11 16:33:29','fdefaa62-5928-4cb7-a73c-96f4fa065c47'),
(29,29,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-MV4iwEHfBI\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}}]}',1,'2024-04-11 16:34:02','2024-04-11 16:34:02','ce61510f-702c-4538-814a-ad6770700dc7'),
(31,31,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-MV4iwEHfBI\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}}]}',1,'2024-04-12 07:43:40','2024-04-12 07:43:40','1b0fa18a-59ca-4b78-b468-6ebac17e4daf'),
(33,33,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-MV4iwEHfBI\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-5UFHuaZHkx\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-Da3bgPPSPk\",\"content\":{\"fields\":{\"992e293a-b5b9-42d3-a71b-93224cee97fa\":[]}}}}}]}',1,'2024-04-19 13:48:40','2024-04-19 13:48:40','8acc1fe4-4185-4eb5-aab9-6f0ce0ce7293'),
(35,35,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"7489fea3-d0f3-4001-8337-c88e56aab220\":[{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-EhhXaroYhi\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-wf8c5SODLW\",\"content\":{\"fields\":{\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\":\"This is a heading\"}}}}},{\"type\":\"paragraph\",\"attrs\":[],\"content\":[{\"type\":\"text\",\"marks\":[{\"type\":\"textStyle\"}],\"text\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}]},{\"type\":\"vizyBlock\",\"attrs\":{\"id\":\"vizy-block-MV4iwEHfBI\",\"enabled\":true,\"collapsed\":false,\"values\":{\"type\":\"type-fMDRWSjwSu\",\"content\":{\"fields\":{\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\":[10],\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\":\"standard\"}}}}}]}',1,'2024-04-19 13:53:24','2024-04-19 13:53:24','6b7c20cb-5e5b-4f8c-85f1-6d1da098599b'),
(37,37,1,NULL,'__temp_terdxrezvuoxdtylzhiissxejxyqromeevjs',NULL,NULL,1,'2024-04-19 15:14:56','2024-04-19 15:14:56','01978cd0-114d-40bd-9320-8abfdd3fa11d'),
(38,38,1,NULL,'__temp_ycthripimwngfidrueccyowvxqciwlopwtci',NULL,NULL,1,'2024-04-19 15:16:52','2024-04-19 15:16:52','ea6093bc-b48c-48e9-a622-38b7eaece4ab'),
(40,40,1,NULL,'__temp_yecndullbcgjxmznsmpqcfzbhbavjbodflal',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"This is a heading.\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":true}',1,'2024-04-19 15:30:34','2024-05-16 08:07:40','ad7a0454-df42-41b2-9e28-497c1f0dabbb'),
(41,41,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-04-19 15:30:34','2024-04-19 15:30:34','69a369e9-182f-4678-92b1-ff09073db907'),
(42,42,1,NULL,'__temp_yecndullbcgjxmznsmpqcfzbhbavjbodflal',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"This is a heading.\"}',1,'2024-04-19 15:30:34','2024-04-19 15:30:34','be085190-dd99-4950-8d65-1560c8325bf3'),
(45,45,1,NULL,'__temp_mncntrspbajmxwcypwvhgokpmjdyfoykendy',NULL,'{\"39a40d56-e92a-4692-b96a-c35603ecde2f\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\",\"00f22453-dc84-474b-ac87-512e608e4004\":\"standard\"}',1,'2024-04-19 16:01:35','2024-05-13 14:54:29','a37dd66b-1819-4d74-b91e-f111193a022a'),
(46,46,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-04-19 16:01:35','2024-04-19 16:01:35','4353609f-88a4-4515-83e3-d1b9eec39fed'),
(47,47,1,NULL,'__temp_mncntrspbajmxwcypwvhgokpmjdyfoykendy',NULL,'{\"00f22453-dc84-474b-ac87-512e608e4004\":\"standard\"}',1,'2024-04-19 16:01:35','2024-04-19 16:01:35','9101806a-63a9-49a5-9d3d-0d4d00793976'),
(50,50,1,NULL,'__temp_iomqawwfmqdzktlrqlowtehuqztljocfkpvv',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"videoUrl\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/vimeo.com\\/450813916\"}',1,'2024-04-19 16:03:31','2024-05-13 15:02:27','1c276187-d408-4228-8c1a-1f21a2000190'),
(51,51,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-04-19 16:03:31','2024-04-19 16:03:31','3c986492-87b3-4f77-8f2f-481b8149dda0'),
(52,52,1,NULL,'__temp_iomqawwfmqdzktlrqlowtehuqztljocfkpvv',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"vimeo\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/vimeo.com\\/450813916\"}',1,'2024-04-19 16:03:31','2024-04-19 16:03:31','625c875d-187f-4dfa-9a1c-af6dc27bfca3'),
(55,55,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 14:20:56','2024-05-13 14:20:56','81cb65c1-e748-4357-8478-86738f3256d0'),
(56,56,1,NULL,'__temp_yecndullbcgjxmznsmpqcfzbhbavjbodflal',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"This is a heading.\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h3\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-05-13 14:20:56','2024-05-13 14:20:56','63ccddf6-2285-4244-b7b8-bf7adfc61828'),
(59,59,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 14:22:21','2024-05-13 14:22:21','5c8ff167-8ee7-41cb-b01d-15f90ccfd77c'),
(60,60,1,NULL,'__temp_yecndullbcgjxmznsmpqcfzbhbavjbodflal',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"This is a heading.\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-05-13 14:22:21','2024-05-13 14:22:21','c7d225cc-fbf2-4bc7-85fa-9901fba82b82'),
(63,63,1,NULL,'__temp_dseeymhzpudszsowxhovqujzkobgqxcqnday',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<\\/p>\"}',1,'2024-05-13 14:28:50','2024-05-13 14:28:50','011e2e2e-9aba-41e7-b951-301ad6002efd'),
(64,64,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 14:28:50','2024-05-13 14:28:50','3ea5e446-3c7b-420c-9c12-cb866978b26c'),
(65,65,1,NULL,'__temp_dseeymhzpudszsowxhovqujzkobgqxcqnday',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<\\/p>\"}',1,'2024-05-13 14:28:50','2024-05-13 14:28:50','d83fc6c4-3efe-4167-b07c-da6341861398'),
(68,68,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 14:54:29','2024-05-13 14:54:29','725c6495-6be4-49cf-a2e2-fc44a55581fd'),
(69,69,1,NULL,'__temp_mncntrspbajmxwcypwvhgokpmjdyfoykendy',NULL,'{\"39a40d56-e92a-4692-b96a-c35603ecde2f\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\",\"00f22453-dc84-474b-ac87-512e608e4004\":\"standard\"}',1,'2024-05-13 14:54:29','2024-05-13 14:54:29','c1e695a9-9f94-493a-a084-c31ce3f6d40e'),
(72,72,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:02:27','2024-05-13 15:02:27','940b83ba-b911-4e57-a9fb-62ae8ba578be'),
(73,73,1,NULL,'__temp_iomqawwfmqdzktlrqlowtehuqztljocfkpvv',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"videoUrl\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/vimeo.com\\/450813916\"}',1,'2024-05-13 15:02:27','2024-05-13 15:02:27','dd6cbd0a-6cc7-4273-aa8d-e0dd63b518df'),
(75,75,1,NULL,'__temp_iomqawwfmqdzktlrqlowtehuqztljocfkpvv',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/vimeo.com\\/450813916\"}',1,'2024-05-13 15:02:31','2024-05-13 15:02:31','dd4ec82b-da33-4582-9b9f-f76b7a151f0d'),
(77,77,1,NULL,'__temp_jikqjmwjdrufypitvhfjebnrtqiwyhwbjvkl',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"videoUrl\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/youtu.be\\/XfAdPsKCIG4?si=vbhQhb9UI8VKFwgY\"}',1,'2024-05-13 15:08:19','2024-05-13 15:08:19','958a4a68-78af-4750-a490-d74e58d7256d'),
(78,78,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:08:19','2024-05-13 15:08:19','d535e8a2-e08e-4997-b783-b30c38f42105'),
(79,79,1,NULL,'__temp_jikqjmwjdrufypitvhfjebnrtqiwyhwbjvkl',NULL,'{\"1d183407-0aec-43db-b96f-5c5f33946bfa\":\"videoUrl\",\"699650bb-f683-4aec-991a-5c7025228420\":\"https:\\/\\/youtu.be\\/XfAdPsKCIG4?si=vbhQhb9UI8VKFwgY\"}',1,'2024-05-13 15:08:19','2024-05-13 15:08:19','6139e44e-a6ff-45a3-8837-18154c9bb9eb'),
(82,82,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Dummy download\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 15:22:32','2024-05-14 09:15:13','9ee30fa7-a7ff-45d4-8a16-cac4c5f436bc'),
(83,83,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:22:32','2024-05-13 15:22:32','84063ceb-ffcb-4d3b-a556-8a3db338bbe5'),
(84,84,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"urlLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Google\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 15:22:32','2024-05-13 15:22:32','584e24b2-5012-476c-9d85-62c15ff5ac1b'),
(87,87,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:22:47','2024-05-13 15:22:47','d1b3684e-94e6-423c-9434-638f47b2659b'),
(88,88,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"urlLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Google\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 15:22:47','2024-05-13 15:22:47','24ceb5eb-3c72-4d4a-9208-57b73ea32ae6'),
(89,89,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-13 15:37:33','2024-06-10 13:08:57','7ebe91e1-ad68-4d28-b26b-c22722ff59bc'),
(90,90,1,'Sample page','sample-page','sample-page',NULL,1,'2024-05-13 15:37:43','2024-05-13 15:37:43','84d0de99-4db7-4bd7-a1ea-25bdcd25bf42'),
(93,93,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:38:02','2024-05-13 15:38:02','df85cdf1-5597-420e-a175-57d4ef1b3f7d'),
(94,94,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Sample page\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 15:38:02','2024-05-13 15:38:02','3475a73f-2fb3-43a2-87eb-c708efc60701'),
(97,97,1,'Dummy',NULL,NULL,NULL,1,'2024-05-13 15:38:23','2024-05-13 15:38:23','1223d5d6-9697-4bbb-837b-3ed4c6e42c05'),
(98,98,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 15:38:33','2024-05-13 15:38:33','cc7d979c-1b35-40b4-9ee2-b0860c9fd028'),
(99,99,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"assetLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Dummy download\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 15:38:33','2024-05-13 15:38:33','4a0d2e5f-3a98-4db1-a90e-58997d122cee'),
(101,101,1,NULL,'__temp_kmlwdqicekbxclotranxifjajmupqjngqbef',NULL,NULL,1,'2024-05-13 16:17:57','2024-05-13 16:17:57','9c0c5a3e-1d3a-4de9-ab4d-fb957f5ace95'),
(103,103,1,NULL,'__temp_bscangjbspeifnycyhbxjsnfrncwvacckwhs',NULL,NULL,1,'2024-05-13 16:18:39','2024-05-13 16:18:39','63521d17-12f3-429b-84d8-67cbfa4021eb'),
(104,104,1,NULL,'__temp_ulsqxdtmsuhhlsolohpbpakgdbntzljblltt',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 16:18:49','2024-05-13 16:18:49','916269f8-9959-4ef7-8773-b4f2a63bd997'),
(105,105,1,NULL,'__temp_vnwngvouaaqikmkwwhunuynqvfgskkdeidur',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-13 16:29:14','2024-05-13 16:29:17','5c3ef261-e792-4e22-804d-7efe091b29e9'),
(107,107,1,NULL,'__temp_nkfnlugboueptpwpaqoitjxuymvtbswzqyly',NULL,NULL,1,'2024-05-13 16:29:24','2024-05-13 16:29:24','9583871b-675b-4a70-9e37-7f7860153d94'),
(110,110,1,NULL,'__temp_vvksxakhrkmceefvtaaqlxelglzqhyvsygno',NULL,NULL,1,'2024-05-13 16:29:59','2024-05-13 16:29:59','eb2c517e-a2bc-4c11-b181-7ac871989174'),
(111,111,1,NULL,NULL,NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Accordion\"}',1,'2024-05-13 16:29:59','2024-05-13 16:29:59','5deaf485-d7ed-48b2-b548-50e10d813f60'),
(112,112,1,NULL,'__temp_vetaepaaravhshdqikmvghwnduqwbnbkauhm',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<\\/p>\"}',1,'2024-05-13 16:29:59','2024-05-13 16:29:59','e94a43b2-99ea-4f52-a655-0f299da61e5f'),
(113,113,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 16:29:59','2024-05-13 16:29:59','0d49836f-4ba8-4479-beb3-244dbfd6f3be'),
(114,114,1,NULL,'__temp_vvksxakhrkmceefvtaaqlxelglzqhyvsygno',NULL,NULL,1,'2024-05-13 16:29:59','2024-05-13 16:29:59','219ec2fb-24d0-4fb1-b025-48aaec05e337'),
(115,115,1,NULL,NULL,NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Accordion\"}',1,'2024-05-13 16:29:59','2024-05-13 16:29:59','efee62f2-cee2-461c-8d98-25f12b9e200f'),
(116,116,1,NULL,'__temp_vetaepaaravhshdqikmvghwnduqwbnbkauhm',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.<\\/p>\"}',1,'2024-05-13 16:29:59','2024-05-13 16:29:59','7030abdc-309e-4c99-9aaa-0f464b3d810b'),
(117,117,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-13 16:35:06','2024-05-13 16:35:06','98ffef8b-4621-4cfa-af7e-0e0e69629f24'),
(118,118,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 09:14:50','2024-05-14 09:14:50','bd9a3868-5978-4043-ab02-e83b48461757'),
(121,121,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 09:15:13','2024-05-14 09:15:13','91fa0ed6-3575-408c-a30c-37552903f898'),
(122,122,1,NULL,'__temp_fluozztrgqphgcmywnjbajpvqmhdyxugqobz',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"b36e597e-165b-4dbc-80c6-377b92bc053d\":\"http:\\/\\/google.com\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Dummy download\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-14 09:15:13','2024-05-14 09:15:13','4d16acbc-64b6-4b75-b797-ec366678a74e'),
(124,124,1,NULL,'__temp_uytkdslzdzvenyvhxagpuinhfmrapzoxwmvd',NULL,NULL,1,'2024-05-14 09:15:42','2024-05-14 09:15:42','efa63847-688a-4662-a949-299c2c595290'),
(125,125,1,NULL,'__temp_oibqwaztosewbtlxcogvxapyxzockaizkwiw',NULL,NULL,1,'2024-05-14 09:15:42','2024-05-14 09:15:42','ba18cb94-d73a-42a8-bd33-68ac512c989e'),
(126,126,1,NULL,NULL,NULL,NULL,1,'2024-05-14 09:15:43','2024-05-14 09:15:43','04929625-3bff-4a8d-8260-e3d3e3534a69'),
(127,127,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 09:16:19','2024-05-14 09:16:19','db09e8b0-d1b6-432f-8ece-0b7cdae33647'),
(132,132,1,NULL,'__temp_hkqsqtwfsltfsonzrfwqymhhwwkiiaukwmxq',NULL,NULL,1,'2024-05-14 09:17:32','2024-05-14 09:17:32','feada9b6-e21b-4d37-b44d-632eca2e54ff'),
(133,133,1,NULL,'__temp_bgbdrgkocpknvmdxyztlfxyqtrbfnqszluej',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Accordion heading\"}',1,'2024-05-14 09:17:32','2024-05-14 09:17:32','f3a3d6b5-423d-42db-acd6-3df09348168e'),
(134,134,1,NULL,'__temp_uifniarbalplgxjpvetztsubbhjamtczgmvl',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<\\/p>\"}',1,'2024-05-14 09:17:32','2024-05-14 09:17:32','455f1cd6-c262-424b-8520-943ea7fe49e5'),
(135,135,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 09:17:32','2024-05-14 09:17:32','d43ad436-55d4-440e-b204-7554538eec05'),
(136,136,1,NULL,'__temp_hkqsqtwfsltfsonzrfwqymhhwwkiiaukwmxq',NULL,NULL,1,'2024-05-14 09:17:32','2024-05-14 09:17:32','71818e25-d2ae-418c-b6f8-31a464521662'),
(137,137,1,NULL,'__temp_bgbdrgkocpknvmdxyztlfxyqtrbfnqszluej',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Accordion heading\"}',1,'2024-05-14 09:17:32','2024-05-14 09:17:32','989d9deb-4334-423c-b548-2364d34679e6'),
(138,138,1,NULL,'__temp_uifniarbalplgxjpvetztsubbhjamtczgmvl',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<\\/p>\"}',1,'2024-05-14 09:17:32','2024-05-14 09:17:32','34b0436d-9948-4f4d-9416-26debe43c34c'),
(142,142,1,NULL,'__temp_lazukfqlkxhwdslczdmwlrarvqwagftunpxi',NULL,'{\"1247d4aa-e385-4cbc-afc8-fc139a7eb7ea\":\"Call to action heading\"}',1,'2024-05-14 09:47:16','2024-05-14 09:47:16','27943033-d12a-4bcc-98b6-e7821cadf8a6'),
(143,143,1,NULL,'__temp_vrlcpcgmnsfkystdipzldpxydabzfxldoaxm',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Call to action button\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-14 09:47:16','2024-05-14 09:47:16','7c900fa6-3891-48c5-b9c8-c454b06fca23'),
(144,144,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 09:47:16','2024-05-14 09:47:16','311738df-c14c-404c-8776-cc8baf5245f2'),
(145,145,1,NULL,'__temp_lazukfqlkxhwdslczdmwlrarvqwagftunpxi',NULL,'{\"1247d4aa-e385-4cbc-afc8-fc139a7eb7ea\":\"Call to action heading\"}',1,'2024-05-14 09:47:16','2024-05-14 09:47:16','65a45256-1796-4fc3-89b7-909183cb0545'),
(146,146,1,NULL,'__temp_vrlcpcgmnsfkystdipzldpxydabzfxldoaxm',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"entryLink\",\"8d37558b-24c8-463c-b78a-f758d679ddb6\":\"Call to action button\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-05-14 09:47:16','2024-05-14 09:47:16','b330fcad-7a1a-43fe-8e0e-8a1ccb524976'),
(149,149,1,NULL,'__temp_ogpktdvapxoxmcejcihrhwzyutawkfmwolsi',NULL,'{\"eda4d11d-5de8-4194-b4c8-d49fa86ac14d\":true}',1,'2024-05-14 10:52:16','2024-05-14 10:52:16','cf48a7a6-572c-40d7-8f01-9e00c53bfefc'),
(150,150,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\"}',1,'2024-05-14 10:52:16','2024-05-14 10:52:16','051034ce-4369-4415-8516-37b801b6153a'),
(151,151,1,NULL,'__temp_ogpktdvapxoxmcejcihrhwzyutawkfmwolsi',NULL,'{\"eda4d11d-5de8-4194-b4c8-d49fa86ac14d\":true}',1,'2024-05-14 10:52:16','2024-05-14 10:52:16','629f525f-3e12-45ed-ba32-26ff7fd9e520'),
(152,152,1,'listing page','listing-page','listing-page','{\"485e0b9b-1758-409d-8d91-badcc7567fbc\":\"blog\",\"b46897a1-f23e-4444-8ef3-ea6fe6571be0\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:16:56-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:16:56','2024-05-15 10:27:05','541112fc-9549-482f-8850-27d14589f306'),
(153,153,1,'listing page','listing-page','listing-page','{\"b46897a1-f23e-4444-8ef3-ea6fe6571be0\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:16:56-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:17:05','2024-05-15 10:17:05','ec94b88b-4c70-4202-aa96-f595614c0233'),
(155,155,1,'listing page','listing-page','listing-page','{\"485e0b9b-1758-409d-8d91-badcc7567fbc\":\"blog\",\"b46897a1-f23e-4444-8ef3-ea6fe6571be0\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:16:56-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:27:05','2024-05-15 10:27:05','bce7f014-7c43-4272-971d-9cf1deeb8cb3'),
(156,156,1,'Blog one title consectetuer adipiscing elit','blog-one-title-consectetuer-adipiscing-elit','blog/blog-one-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:43:53-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:43:53','2024-05-15 10:44:21','2c269873-5561-4e0e-9a02-fc72dd8804a2'),
(157,157,1,'Blog one title consectetuer adipiscing elit','blog-one-title-consectetuer-adipiscing-elit','blog/blog-one-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:43:53-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:23','2024-05-15 10:44:23','2c6cc571-8795-45ce-8eda-02b386ae512b'),
(158,158,1,'Blog two title consectetuer adipiscing elit','blog-two-title-consectetuer-adipiscing-elit','blog/blog-two-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:25-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:25','2024-05-15 10:44:30','428e8bee-d9ce-4f64-b0af-633819391fe3'),
(159,159,1,'Blog two title consectetuer adipiscing elit','blog-two-title-consectetuer-adipiscing-elit','blog/blog-two-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:25-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:30','2024-05-15 10:44:30','62235936-e136-4894-a9ef-481d4391e32f'),
(160,160,1,'Blog three title consectetuer adipiscing elit','blog-three-title-consectetuer-adipiscing-elit','blog/blog-three-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:31-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:31','2024-05-15 10:44:37','515c0ecb-418b-4fac-8472-daececcbaec6'),
(161,161,1,'Blog three title consectetuer adipiscing elit','blog-three-title-consectetuer-adipiscing-elit','blog/blog-three-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:31-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:37','2024-05-15 10:44:37','bd520348-fbc1-48a8-8bfd-76397ce292e9'),
(162,162,1,'Blog four title consectetuer adipiscing elit','blog-four-title-consectetuer-adipiscing-elit','blog/blog-four-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:38-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:38','2024-05-15 10:44:44','66443977-f77c-4360-abcf-7f04d85aed88'),
(163,163,1,'Blog four title consectetuer adipiscing elit','blog-four-title-consectetuer-adipiscing-elit','blog/blog-four-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:38-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:44','2024-05-15 10:44:44','50dfa04e-849e-4ac4-bc31-6ea81a0a3e93'),
(164,164,1,'Blog five title consectetuer adipiscing elit','blog-five-title-consectetuer-adipiscing-elit','blog/blog-five-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:46-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:46','2024-05-15 10:44:50','11db88ff-12f2-4052-9a91-1e608c273ea7'),
(165,165,1,'Blog five title consectetuer adipiscing elit','blog-five-title-consectetuer-adipiscing-elit','blog/blog-five-title-consectetuer-adipiscing-elit','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-15T03:44:46-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-15 10:44:50','2024-05-15 10:44:50','04e6914e-20d9-4c0e-a209-274bbba8e871'),
(166,166,1,NULL,NULL,NULL,NULL,1,'2024-05-15 10:57:59','2024-05-15 10:57:59','37eda9b2-2640-46f4-a229-1f2390a4f23d'),
(167,167,1,NULL,'__temp_ludegliaioedvzxrdfmkoxigivokgmtvgaek',NULL,'{\"eb0b6bbc-0765-49b3-9b08-10a95e843441\":\"facebook\",\"834569c6-545d-4771-82ad-42156eff13ed\":\"https:\\/\\/facebook.com\"}',1,'2024-05-15 11:27:13','2024-05-15 11:27:44','a24d2f1d-d758-4950-9d32-ae3abd538467'),
(170,170,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-16T01:07:39-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-05-16 08:07:40','2024-05-16 08:07:40','215fa712-4ccb-4803-9c95-532b9662e90f'),
(171,171,1,NULL,'__temp_yecndullbcgjxmznsmpqcfzbhbavjbodflal',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"This is a heading.\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":true}',1,'2024-05-16 08:07:41','2024-05-16 08:07:41','6fbbf32c-7e77-42c5-82a3-d71845494164'),
(175,175,1,NULL,'__temp_nnokmshelrhmjvdewoxomhifkmisgkrglqvw',NULL,NULL,1,'2024-06-10 13:08:57','2024-06-10 13:08:57','c306279f-42a2-47e6-90e8-6226f98570e0'),
(176,176,1,NULL,'__temp_mccxattkitfwateubrqwcnqwwufyusswjepb',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:08:57','2024-06-10 13:55:46','cd4d1439-4424-4ba9-b627-4c3ee51e6858'),
(177,177,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:08:57','2024-06-10 13:08:57','c6e0f02c-3117-44e0-8a90-d5708263c0f5'),
(178,178,1,NULL,'__temp_nnokmshelrhmjvdewoxomhifkmisgkrglqvw',NULL,NULL,1,'2024-06-10 13:08:57','2024-06-10 13:08:57','5c879218-27b1-4a0c-abd1-ce1f320f59a2'),
(179,179,1,NULL,'__temp_mccxattkitfwateubrqwcnqwwufyusswjepb',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:08:57','2024-06-10 13:08:57','9d49c43e-4e07-444e-a786-c07e7c3f6547'),
(180,180,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:10:14','2024-06-10 13:10:14','2e04e917-91a9-4f6c-ae27-75cedc1ec9e8'),
(184,184,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:10:35','2024-06-10 13:10:35','afc19f40-6f49-45e7-b887-0abf4ccc63d7'),
(185,185,1,NULL,'__temp_nnokmshelrhmjvdewoxomhifkmisgkrglqvw',NULL,NULL,1,'2024-06-10 13:10:35','2024-06-10 13:10:35','dfc70679-cbb5-433f-8bec-b6fd71e8d865'),
(186,186,1,NULL,'__temp_mccxattkitfwateubrqwcnqwwufyusswjepb',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":true}',1,'2024-06-10 13:10:35','2024-06-10 13:10:35','af2dfef6-ceb8-4499-a445-150f9743ad16'),
(187,187,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:10:53','2024-06-10 13:10:53','9106d4bf-c0f4-418e-8bbf-c2ab7f9a4908'),
(190,190,1,NULL,'__temp_odvxejnseyhejthmqhmhiwglosiibvlzummf',NULL,NULL,1,'2024-06-10 13:22:39','2024-06-10 13:22:39','78ebd165-02f3-468e-8751-0590c56b7d3d'),
(191,191,1,NULL,'__temp_mfdozlcehmsmrhzoxnebchtryuimimevexat',NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-06-10 13:22:40','2024-06-10 13:22:40','01ee6ad8-b866-4f5d-bae4-492f2173938a'),
(192,192,1,NULL,NULL,NULL,'{\"ca9af274-930f-4a77-812b-0601fad4b3d2\":\"\",\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\":false}',1,'2024-06-10 13:22:40','2024-06-10 13:22:40','cdc375cf-d940-40e9-9cc1-f9d1ab374b0e'),
(193,193,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:23:04','2024-06-10 13:23:11','15ea916d-a780-42f6-a5c7-9533fb01942a'),
(194,194,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:23:12','2024-06-10 13:23:12','bc23a10f-8f47-4a31-8d58-f20a8f7c5ef1'),
(195,195,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:23:14','2024-06-10 13:55:24','0ff19811-993d-4f9f-b239-b7c15bc7ff61'),
(196,196,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:23:20','2024-06-10 13:23:20','dc89c6ab-9951-40bc-809c-4ca600f03cc6'),
(197,197,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:23:20','2024-06-10 13:23:20','24eeb105-f82a-47aa-a016-e90761b92602'),
(198,198,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:23:20','2024-06-10 13:23:20','de73cddb-b62d-4488-be17-b9dc19c5dc2f'),
(199,199,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:42:10','2024-06-10 13:42:10','ba07ec0d-7270-473a-ace8-866e3138aabc'),
(203,203,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:43:40','2024-06-10 13:43:40','dad8880e-e0f1-478f-ba84-0497be8a6763'),
(204,204,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:43:40','2024-06-10 13:43:40','ddf0ec0b-b6e4-4001-9256-61a8397e83bd'),
(205,205,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":true}',1,'2024-06-10 13:43:40','2024-06-10 13:43:40','2306ed93-72d4-4b30-9a4b-a2d836c1fb51'),
(209,209,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:45:54','2024-06-10 13:45:54','36858f72-2a48-48ca-9f89-326a1e442470'),
(210,210,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:45:54','2024-06-10 13:45:54','fc303ce4-4e8b-4dc3-95af-93d063765890'),
(211,211,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:45:54','2024-06-10 13:45:54','b3c0de58-972d-4b2c-9e89-5c887a4c656b'),
(215,215,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:54:41','2024-06-10 13:54:41','30b400bb-1b24-41e2-b71a-797f4a84f594'),
(216,216,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:54:41','2024-06-10 13:54:41','5b59820a-23c4-441c-bb7b-ced1e8d809c2'),
(217,217,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":true}',1,'2024-06-10 13:54:41','2024-06-10 13:54:41','c8529eca-4dbd-4bdc-8b05-9bc038088e01'),
(221,221,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:55:24','2024-06-10 13:55:24','7d016f06-ff98-46ae-93be-3277f6825c59'),
(222,222,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-10 13:55:24','2024-06-10 13:55:24','e023f243-1646-4753-b7bd-c73d919feb7a'),
(223,223,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:55:24','2024-06-10 13:55:24','63dd7f40-f3fc-437a-a9d9-9759dd388a52'),
(226,226,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 13:55:46','2024-06-10 13:55:46','909d8039-fa1f-4e78-b7e7-f48b6d2a27ff'),
(227,227,1,NULL,'__temp_nnokmshelrhmjvdewoxomhifkmisgkrglqvw',NULL,NULL,1,'2024-06-10 13:55:46','2024-06-10 13:55:46','fbcfaf27-527c-4abf-9bdb-7e97b4452ac7'),
(228,228,1,NULL,'__temp_mccxattkitfwateubrqwcnqwwufyusswjepb',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 13:55:46','2024-06-10 13:55:46','4ad78028-3495-4ac3-8891-aebdd456f1b8'),
(232,232,1,NULL,'__temp_ruwfwppeskbulbmbcesmzeahqagwpluikels',NULL,NULL,1,'2024-06-10 14:01:08','2024-06-10 14:01:08','266b956f-3df1-40fb-bcbf-f8cf26f10f33'),
(233,233,1,NULL,'__temp_tcuucblydsyxhegmkcrrkbveypqozejnhyjt',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading two\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 14:01:08','2024-06-10 14:01:08','94b27408-a8b1-4372-a00c-49b4a5003d6b'),
(234,234,1,'Sample page','sample-page','sample-page','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T05:57:43-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-10 14:01:08','2024-06-10 14:01:08','b4c3d388-0b89-4b42-b457-edd4c6e762d6'),
(235,235,1,NULL,'__temp_ruwfwppeskbulbmbcesmzeahqagwpluikels',NULL,NULL,1,'2024-06-10 14:01:08','2024-06-10 14:01:08','5b19bd5a-9054-44a2-a764-819a7f7c348b'),
(236,236,1,NULL,'__temp_tcuucblydsyxhegmkcrrkbveypqozejnhyjt',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading two\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-10 14:01:08','2024-06-10 14:01:08','c9c71a24-645a-454b-9072-aa36a9fa3152'),
(237,237,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-26 15:42:08','2024-06-26 15:42:08','66e5dfe7-1982-4da1-ba47-d4663f0606fb'),
(241,241,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-26 15:42:13','2024-06-26 15:42:13','94c6d8b3-4552-43bb-a9ba-c6de4bf25927'),
(242,242,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-26 15:42:17','2024-06-26 15:42:17','92e2345d-76cf-4c08-b9e1-e3df38ea0572'),
(243,243,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-06-26 15:42:20','2024-06-26 15:42:20','19473a1f-236d-4fb6-be3c-0d70a221d93e'),
(244,244,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-06-26 15:42:21','2024-06-26 15:42:21','b36c8bad-9942-4f54-8690-54090223c188'),
(245,245,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-26 15:42:21','2024-06-26 15:42:21','e58fbc18-e77d-4bd0-88d3-d9d4e7430a5e'),
(246,246,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-06-26 15:42:21','2024-06-26 15:42:21','592c82d3-0f57-485f-b091-b2ddea457688'),
(247,247,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-06-26 15:42:21','2024-06-26 15:42:21','1ebf5c7f-a2aa-449a-a1de-f6c34b40a6bf'),
(248,248,1,'Website documentation','website-documentation','website-documentation','{\"5e310356-8cc0-4b59-91b5-4e9728fc1333\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\",\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-05-16T01:07:39-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-06-26 15:43:49','2024-06-26 15:43:49','ca54d231-1a8f-425f-8165-60096f9bd363'),
(252,252,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:45:44','2024-08-30 13:45:44','063e8b4a-a85d-4fa3-a427-2c45a981f8c1'),
(253,253,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:45:44','2024-08-30 13:45:44','c6a494ac-78d6-442e-acf9-6500d22e9fac'),
(255,255,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:45:44','2024-08-30 13:45:44','fffe6a15-789f-46d5-8065-f13457666a7b'),
(256,256,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:45:44','2024-08-30 13:45:44','4bc70f54-6ed8-4d71-99cc-8053d9da84bf'),
(257,257,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:45:50','2024-08-30 13:45:50','72ed2118-94da-4aa2-a3b3-e9a38bce4ab4'),
(258,258,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:45:50','2024-08-30 13:45:50','0aed8d82-8928-48ae-8764-a46329f65be1'),
(260,260,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:45:52','2024-08-30 13:45:52','61e25983-5879-4c35-8d3f-fc58a2eee607'),
(261,261,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:45:52','2024-08-30 13:45:52','a0115f05-3a43-4711-b31e-02f129dd56e2'),
(262,262,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:45:58','2024-08-30 13:45:58','e5821518-c481-4290-9883-7dd3087411c0'),
(263,263,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:45:58','2024-08-30 13:45:58','d58eafc6-ead4-40ad-8a08-72d6bfcc3f7a'),
(264,264,1,NULL,'__temp_gqaprwexqtrwrorlyaesoenmwpqyagddtyds',NULL,NULL,1,'2024-08-30 13:45:59','2024-08-30 13:45:59','0853b6df-98f8-4abc-8277-32a85ddb56e1'),
(265,265,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Something one\"}',1,'2024-08-30 13:45:59','2024-08-30 13:56:25','1472a58b-4cf8-4112-99ba-a14d09c12e2d'),
(266,266,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:45:59','2024-08-30 13:45:59','e2c3cd24-4d64-49d5-84f8-d04c907c1b8c'),
(267,267,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-08-30 13:45:59','2024-08-30 13:45:59','7da5172f-e8fe-4f3f-9f25-ddb008d15e37'),
(268,268,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-08-30 13:45:59','2024-08-30 13:45:59','604d3efa-84be-4d31-b605-6acc2af6b9f9'),
(269,269,1,NULL,'__temp_gqaprwexqtrwrorlyaesoenmwpqyagddtyds',NULL,NULL,1,'2024-08-30 13:45:59','2024-08-30 13:45:59','2483a6d8-0983-4bb7-a73f-d5f7ee724e5a'),
(270,270,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:45:59','2024-08-30 13:45:59','3028d402-1916-4425-9c0c-f899fd35c6e6'),
(271,271,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:45:59','2024-08-30 13:45:59','eaa6386f-81ae-4e75-822c-1f7e3ad5c312'),
(276,276,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','fc149d03-76b4-4a03-ae26-8c53b4e357aa'),
(277,277,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','620d75f3-c15f-4fb0-8ed6-245ab73c3aa3'),
(278,278,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','80c9a2bc-be57-4e5e-b3af-881bccccf484'),
(279,279,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','be6330dd-0e42-44b6-954a-9ae5c6ade411'),
(280,280,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','80dd58e0-dc83-4c55-ae64-dbc4bf5fcfec'),
(281,281,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:03','2024-08-30 13:56:03','2613af0f-cd70-43f3-885f-981855a5a96c'),
(282,282,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:07','2024-08-30 13:56:07','20964719-8f02-45ec-8c86-51afdd790a3a'),
(283,283,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:07','2024-08-30 13:56:07','7b600794-772c-4a2b-8274-fb414401bc9a'),
(284,284,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:08','2024-08-30 13:56:08','d8707fcf-da5e-44b5-9f4a-443b26225a21'),
(285,285,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:08','2024-08-30 13:56:08','7b0f4fe5-90e8-4515-984b-e4a76716c37a'),
(286,286,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:08','2024-08-30 13:56:08','d47dfea4-a679-4c5e-8cea-e2dcfef289f3'),
(287,287,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:08','2024-08-30 13:56:08','632a887f-0ffc-433a-b397-8c953541d30a'),
(288,288,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','d99044b6-c120-4ec1-9a87-2fb1d8ddd0b4'),
(289,289,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','79259351-adb4-4410-9c43-03fa36b721a3'),
(290,290,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','b7ea78e6-e8ab-44c2-8120-6fcb7758c0da'),
(291,291,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','7767bcbd-b7fe-4809-b96e-8d59f5713a0c'),
(292,292,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','7013008a-c161-422e-b065-913716e98a39'),
(293,293,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:09','2024-08-30 13:56:09','e176bb56-2540-4658-9aaa-a323a283e0ef'),
(294,294,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:12','2024-08-30 13:56:12','430554c9-1044-404f-bdef-0ea2280ae60b'),
(295,295,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:12','2024-08-30 13:56:12','32612883-3712-4e45-bc34-85dff61c2745'),
(296,296,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"something\"}',1,'2024-08-30 13:56:12','2024-08-30 13:56:12','3a6bc25a-b0fa-401c-982a-b348b6af719b'),
(297,297,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:12','2024-08-30 13:56:12','1027eb3f-4fea-4135-acfe-fe28e95d9cd1'),
(298,298,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Something one\"}',1,'2024-08-30 13:56:12','2024-08-30 13:56:18','9c2c2199-baae-4bfa-aeb1-edd4b33358be'),
(299,299,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:12','2024-08-30 13:56:12','32c93c80-cb26-4770-83ba-8663d34cf4a8'),
(300,300,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:17','2024-08-30 13:56:17','df4339b4-2edc-4004-9a78-7acde6f49016'),
(301,301,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:17','2024-08-30 13:56:17','4aace9ff-8dbf-4a18-8fe0-db8b9812dccd'),
(302,302,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:17','2024-08-30 13:56:17','a659926c-5595-4c3d-8930-75342545595c'),
(303,303,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:17','2024-08-30 13:56:17','5d70d92f-b8ae-4b34-8b33-6647b2c48a47'),
(305,305,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:20','2024-08-30 13:56:20','a40b7ca1-4f1c-46e1-97a8-c1b9bb33e593'),
(306,306,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:20','2024-08-30 13:56:20','7f9fe0e5-232a-4968-91ec-397fb272c7cd'),
(307,307,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:20','2024-08-30 13:56:20','108f53d9-dbbf-4a12-9ad5-746a904a104c'),
(308,308,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:20','2024-08-30 13:56:20','04aacda4-a0dc-44ab-b205-f8e0cfdddb93'),
(309,309,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:24','2024-08-30 13:56:24','79b5cae2-4f76-45c7-acb8-8f4380699578'),
(310,310,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:24','2024-08-30 13:56:24','40f7e78e-3ec7-462b-860d-333bb846cb1e'),
(311,311,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:24','2024-08-30 13:56:24','5955babf-ffbf-4b00-825a-d0418d165c19'),
(312,312,1,NULL,'__temp_zljchjpbdzxektxrfhayltpgnlinduwqybdg',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:24','2024-08-30 13:56:24','93470d2f-cd01-46ac-b28e-c921e500c249'),
(313,313,1,NULL,'__temp_gindcywswcwljetcyvrqhsxwnzmyuyqyukef',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Something two\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','a774f452-0962-46f6-bc2f-21eed7389ee9'),
(314,314,1,NULL,'__temp_wltaofwkrifaqsxzvxjlzjftpnwhhaurfdan',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','5bf600c6-4c81-4e9e-bef3-f9723343e805'),
(315,315,1,'Content testing','content-testing','content-testing','{\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\":{\"bundleVersion\":\"1.0.23\",\"sourceBundleType\":\"field\",\"sourceId\":null,\"sourceName\":null,\"sourceHandle\":null,\"sourceType\":\"field\",\"typeId\":null,\"sourceTemplate\":\"\",\"sourceSiteId\":null,\"sourceAltSiteSettings\":[],\"sourceDateUpdated\":\"2024-06-10T06:23:04-07:00\",\"metaGlobalVars\":{\"language\":null,\"mainEntityOfPage\":\"\",\"seoTitle\":\"\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"\",\"robots\":\"\",\"ogType\":\"\",\"ogTitle\":\"\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"\",\"ogImage\":\"\",\"ogImageWidth\":\"\",\"ogImageHeight\":\"\",\"ogImageDescription\":\"\",\"twitterCard\":\"\",\"twitterCreator\":\"\",\"twitterTitle\":\"\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"\",\"twitterImage\":\"\",\"twitterImageWidth\":\"\",\"twitterImageHeight\":\"\",\"twitterImageDescription\":\"\",\"inherited\":[],\"overrides\":[]},\"metaSiteVars\":{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]},\"metaSitemapVars\":{\"sitemapUrls\":null,\"sitemapAssets\":null,\"sitemapAssetTransform\":null,\"newsSitemap\":null,\"newsPublicationName\":\"\",\"sitemapFiles\":null,\"sitemapAltLinks\":null,\"sitemapChangeFreq\":\"\",\"sitemapPriority\":\"\",\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[],\"sitemapVideoFieldMap\":[],\"inherited\":[],\"overrides\":[]},\"metaContainers\":{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}},\"redirectsContainer\":[],\"frontendTemplatesContainer\":{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false},\"metaBundleSettings\":{\"siteType\":\"\",\"siteSubType\":\"\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"\",\"twitterDescriptionSource\":\"\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"\",\"ogDescriptionSource\":\"\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"\",\"ogImageDescriptionField\":\"\"}}}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','3c6f1d33-b1c3-4631-bb25-bc4a9b9d640f'),
(316,316,1,NULL,'__temp_kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf',NULL,NULL,1,'2024-08-30 13:56:25','2024-08-30 13:56:25','3ab741f0-8efb-41e4-8d37-422d47fba597'),
(317,317,1,NULL,'__temp_lyndefotcozymdmooviocewripyakqzhsmzc',NULL,'{\"5857e4c0-aeb0-4010-ba79-68f9240106b5\":\"Heading one\",\"feaccd20-663f-4175-b444-8525668da3a9\":\"h2\",\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\":false}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','cc5ef794-03b7-4637-9604-16f3352e137d'),
(318,318,1,NULL,'__temp_rltfqiglsctihscwbghmxvmbvwmnlgotdsox',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>manibae@gmail.com</p>\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','7c44100f-ac06-4889-85d0-300785d5ba6f'),
(319,319,1,NULL,'__temp_gqaprwexqtrwrorlyaesoenmwpqyagddtyds',NULL,NULL,1,'2024-08-30 13:56:25','2024-08-30 13:56:25','fb6d6c6d-5545-414a-b96c-627a250063be'),
(320,320,1,NULL,'__temp_uobhqqnivvgjtalraihoszfnqmsotigaxnlk',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Something one\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','a5bcdcc8-6b88-46cf-b5bb-d586459c210d'),
(321,321,1,NULL,'__temp_gindcywswcwljetcyvrqhsxwnzmyuyqyukef',NULL,'{\"b3631407-f99b-493a-a6c7-757156bdef0f\":\"Something two\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','fb3e7f48-0394-4a91-9ac3-02e28aa2fd7a'),
(322,322,1,NULL,'__temp_wltaofwkrifaqsxzvxjlzjftpnwhhaurfdan',NULL,'{\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\":\"<p>Something more</p>\"}',1,'2024-08-30 13:56:25','2024-08-30 13:56:25','3b856ece-2318-4a7f-bf1f-968f2fbe943a');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 13:47:16','2024-04-11 13:47:29'),
(3,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 13:47:29','2024-04-11 13:47:29'),
(5,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 13:47:43','2024-04-11 13:47:43'),
(7,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 14:39:31','2024-04-11 14:39:31'),
(12,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 15:06:30','2024-04-11 15:06:30'),
(14,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 15:33:25','2024-04-11 15:33:25'),
(16,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 15:52:52','2024-04-11 15:52:52'),
(18,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 15:57:09','2024-04-11 15:57:09'),
(20,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:03:20','2024-04-11 16:03:20'),
(22,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:24:47','2024-04-11 16:24:47'),
(24,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:25:27','2024-04-11 16:25:27'),
(26,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:25:33','2024-04-11 16:25:33'),
(27,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:33:29','2024-04-11 16:33:29'),
(29,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-11 16:34:02','2024-04-11 16:34:02'),
(31,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-12 07:43:40','2024-04-12 07:43:40'),
(33,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-19 13:48:40','2024-04-19 13:48:40'),
(35,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-19 13:53:24','2024-04-19 13:53:24'),
(40,NULL,NULL,2,13,6,'2024-04-19 15:30:00',NULL,0,'2024-04-19 15:30:34','2024-04-19 15:30:34'),
(41,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-19 15:30:34','2024-04-19 15:30:34'),
(42,NULL,NULL,41,13,6,'2024-04-19 15:30:00',NULL,NULL,'2024-04-19 15:30:34','2024-04-19 15:30:34'),
(45,NULL,NULL,2,13,4,'2024-04-19 16:01:00',NULL,0,'2024-04-19 16:01:35','2024-04-19 16:01:35'),
(46,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-19 16:01:35','2024-04-19 16:01:35'),
(47,NULL,NULL,46,13,4,'2024-04-19 16:01:00',NULL,NULL,'2024-04-19 16:01:35','2024-04-19 16:01:35'),
(50,NULL,NULL,2,13,3,'2024-04-19 16:01:00',NULL,0,'2024-04-19 16:03:31','2024-04-19 16:03:31'),
(51,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-04-19 16:03:31','2024-04-19 16:03:31'),
(52,NULL,NULL,51,13,3,'2024-04-19 16:01:00',NULL,NULL,'2024-04-19 16:03:31','2024-04-19 16:03:31'),
(55,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 14:20:56','2024-05-13 14:20:56'),
(56,NULL,NULL,55,13,6,'2024-04-19 15:30:00',NULL,NULL,'2024-05-13 14:20:56','2024-05-13 14:20:56'),
(59,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 14:22:21','2024-05-13 14:22:21'),
(60,NULL,NULL,59,13,6,'2024-04-19 15:30:00',NULL,NULL,'2024-05-13 14:22:21','2024-05-13 14:22:21'),
(63,NULL,NULL,2,13,7,'2024-05-13 14:28:00',NULL,0,'2024-05-13 14:28:50','2024-05-13 14:28:50'),
(64,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 14:28:50','2024-05-13 14:28:50'),
(65,NULL,NULL,64,13,7,'2024-05-13 14:28:00',NULL,NULL,'2024-05-13 14:28:50','2024-05-13 14:28:50'),
(68,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 14:54:29','2024-05-13 14:54:29'),
(69,NULL,NULL,68,13,4,'2024-04-19 16:01:00',NULL,NULL,'2024-05-13 14:54:29','2024-05-13 14:54:29'),
(72,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:02:27','2024-05-13 15:02:27'),
(73,NULL,NULL,72,13,3,'2024-04-19 16:01:00',NULL,NULL,'2024-05-13 15:02:27','2024-05-13 15:02:27'),
(77,NULL,NULL,2,13,3,'2024-05-13 15:02:00',NULL,0,'2024-05-13 15:08:19','2024-05-13 15:08:19'),
(78,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:08:19','2024-05-13 15:08:19'),
(79,NULL,NULL,78,13,3,'2024-05-13 15:02:00',NULL,NULL,'2024-05-13 15:08:19','2024-05-13 15:08:19'),
(82,NULL,NULL,2,13,8,'2024-05-13 15:21:00',NULL,0,'2024-05-13 15:22:32','2024-05-13 15:22:32'),
(83,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:22:32','2024-05-13 15:22:32'),
(84,NULL,NULL,83,13,8,'2024-05-13 15:21:00',NULL,NULL,'2024-05-13 15:22:32','2024-05-13 15:22:32'),
(87,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:22:47','2024-05-13 15:22:47'),
(88,NULL,NULL,87,13,8,'2024-05-13 15:21:00',NULL,NULL,'2024-05-13 15:22:47','2024-05-13 15:22:47'),
(89,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-05-13 15:37:33','2024-05-13 15:37:43'),
(90,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-05-13 15:37:43','2024-05-13 15:37:43'),
(93,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:38:02','2024-05-13 15:38:02'),
(94,NULL,NULL,93,13,8,'2024-05-13 15:21:00',NULL,NULL,'2024-05-13 15:38:02','2024-05-13 15:38:02'),
(98,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 15:38:33','2024-05-13 15:38:33'),
(99,NULL,NULL,98,13,8,'2024-05-13 15:21:00',NULL,NULL,'2024-05-13 15:38:33','2024-05-13 15:38:33'),
(103,NULL,NULL,101,27,9,'2024-05-13 16:18:00',NULL,0,'2024-05-13 16:18:39','2024-05-13 16:18:40'),
(110,NULL,NULL,2,13,10,'2024-05-13 16:29:00',NULL,0,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(111,NULL,NULL,110,27,9,'2024-05-13 16:29:00',NULL,0,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(112,NULL,NULL,111,26,7,'2024-05-13 16:29:00',NULL,0,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(113,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(114,NULL,NULL,113,13,10,'2024-05-13 16:29:00',NULL,NULL,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(115,NULL,NULL,114,27,9,'2024-05-13 16:29:00',NULL,NULL,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(116,NULL,NULL,115,26,7,'2024-05-13 16:29:00',NULL,NULL,'2024-05-13 16:29:59','2024-05-13 16:29:59'),
(117,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-13 16:35:06','2024-05-13 16:35:06'),
(118,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 09:14:50','2024-05-14 09:14:50'),
(121,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 09:15:13','2024-05-14 09:15:13'),
(122,NULL,NULL,121,13,8,'2024-05-13 15:21:00',NULL,NULL,'2024-05-14 09:15:13','2024-05-14 09:15:13'),
(125,NULL,NULL,124,27,9,NULL,NULL,0,'2024-05-14 09:15:42','2024-05-14 09:15:42'),
(126,NULL,NULL,124,27,9,'2024-05-14 09:15:00',NULL,0,'2024-05-14 09:15:43','2024-05-14 09:15:43'),
(127,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 09:16:19','2024-05-14 09:16:19'),
(132,NULL,NULL,2,13,10,'2024-05-14 09:16:00',NULL,0,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(133,NULL,NULL,132,27,9,'2024-05-14 09:16:00',NULL,0,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(134,NULL,NULL,133,26,7,'2024-05-14 09:17:00',NULL,0,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(135,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(136,NULL,NULL,135,13,10,'2024-05-14 09:16:00',NULL,NULL,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(137,NULL,NULL,136,27,9,'2024-05-14 09:16:00',NULL,NULL,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(138,NULL,NULL,137,26,7,'2024-05-14 09:17:00',NULL,NULL,'2024-05-14 09:17:32','2024-05-14 09:17:32'),
(142,NULL,NULL,2,13,11,'2024-05-14 09:46:00',NULL,0,'2024-05-14 09:47:16','2024-05-14 09:47:16'),
(143,NULL,NULL,142,31,8,'2024-05-14 09:46:00',NULL,0,'2024-05-14 09:47:16','2024-05-14 09:47:16'),
(144,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 09:47:16','2024-05-14 09:47:16'),
(145,NULL,NULL,144,13,11,'2024-05-14 09:46:00',NULL,NULL,'2024-05-14 09:47:16','2024-05-14 09:47:16'),
(146,NULL,NULL,145,31,8,'2024-05-14 09:46:00',NULL,NULL,'2024-05-14 09:47:16','2024-05-14 09:47:16'),
(149,NULL,NULL,2,13,12,'2024-05-14 10:52:00',NULL,0,'2024-05-14 10:52:16','2024-05-14 10:52:16'),
(150,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-14 10:52:16','2024-05-14 10:52:16'),
(151,NULL,NULL,150,13,12,'2024-05-14 10:52:00',NULL,NULL,'2024-05-14 10:52:16','2024-05-14 10:52:16'),
(152,2,NULL,NULL,NULL,13,'2024-05-15 10:17:00',NULL,NULL,'2024-05-15 10:16:56','2024-05-15 10:17:05'),
(153,2,NULL,NULL,NULL,13,'2024-05-15 10:17:00',NULL,NULL,'2024-05-15 10:17:05','2024-05-15 10:17:05'),
(155,2,NULL,NULL,NULL,13,'2024-05-15 10:17:00',NULL,NULL,'2024-05-15 10:27:05','2024-05-15 10:27:05'),
(156,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:43:53','2024-05-15 10:44:23'),
(157,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:23','2024-05-15 10:44:23'),
(158,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:25','2024-05-15 10:44:30'),
(159,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:30','2024-05-15 10:44:30'),
(160,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:31','2024-05-15 10:44:37'),
(161,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:37','2024-05-15 10:44:37'),
(162,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:38','2024-05-15 10:44:44'),
(163,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:44','2024-05-15 10:44:44'),
(164,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:46','2024-05-15 10:44:50'),
(165,3,NULL,NULL,NULL,1,'2024-05-15 10:44:00',NULL,NULL,'2024-05-15 10:44:50','2024-05-15 10:44:50'),
(167,NULL,NULL,166,40,14,'2024-05-15 11:27:00',NULL,NULL,'2024-05-15 11:27:13','2024-05-15 11:27:44'),
(170,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-05-16 08:07:40','2024-05-16 08:07:40'),
(171,NULL,NULL,170,13,6,'2024-04-19 15:30:00',NULL,NULL,'2024-05-16 08:07:41','2024-05-16 08:07:41'),
(175,NULL,NULL,89,13,15,'2024-06-10 12:57:00',NULL,NULL,'2024-06-10 13:08:57','2024-06-10 13:08:57'),
(176,NULL,NULL,175,42,6,'2024-06-10 13:08:00',NULL,NULL,'2024-06-10 13:08:57','2024-06-10 13:08:57'),
(177,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 13:08:57','2024-06-10 13:08:57'),
(178,NULL,NULL,177,13,15,'2024-06-10 12:57:00',NULL,NULL,'2024-06-10 13:08:57','2024-06-10 13:08:57'),
(179,NULL,NULL,178,42,6,'2024-06-10 13:08:00',NULL,NULL,'2024-06-10 13:08:57','2024-06-10 13:08:57'),
(180,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 13:10:14','2024-06-10 13:10:14'),
(184,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 13:10:35','2024-06-10 13:10:35'),
(185,NULL,NULL,184,13,15,'2024-06-10 12:57:00',NULL,NULL,'2024-06-10 13:10:35','2024-06-10 13:10:35'),
(186,NULL,NULL,185,42,6,'2024-06-10 13:08:00',NULL,NULL,'2024-06-10 13:10:35','2024-06-10 13:10:35'),
(187,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 13:10:53','2024-06-10 13:10:53'),
(191,NULL,NULL,190,31,8,NULL,NULL,0,'2024-06-10 13:22:40','2024-06-10 13:22:40'),
(192,NULL,NULL,190,31,8,'2024-06-10 13:22:00',NULL,0,'2024-06-10 13:22:40','2024-06-10 13:22:40'),
(193,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:04','2024-06-10 13:23:20'),
(194,NULL,NULL,193,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:12','2024-06-10 13:23:12'),
(195,NULL,NULL,194,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:14','2024-06-10 13:23:14'),
(196,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:20','2024-06-10 13:23:20'),
(197,NULL,NULL,196,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:20','2024-06-10 13:23:20'),
(198,NULL,NULL,197,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:23:20','2024-06-10 13:23:20'),
(199,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:42:10','2024-06-10 13:42:10'),
(203,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:43:40','2024-06-10 13:43:40'),
(204,NULL,NULL,203,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:43:40','2024-06-10 13:43:40'),
(205,NULL,NULL,204,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:43:40','2024-06-10 13:43:40'),
(209,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:45:54','2024-06-10 13:45:54'),
(210,NULL,NULL,209,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:45:54','2024-06-10 13:45:54'),
(211,NULL,NULL,210,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:45:54','2024-06-10 13:45:54'),
(215,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:54:41','2024-06-10 13:54:41'),
(216,NULL,NULL,215,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:54:41','2024-06-10 13:54:41'),
(217,NULL,NULL,216,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:54:41','2024-06-10 13:54:41'),
(221,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:55:24','2024-06-10 13:55:24'),
(222,NULL,NULL,221,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:55:24','2024-06-10 13:55:24'),
(223,NULL,NULL,222,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-06-10 13:55:24','2024-06-10 13:55:24'),
(226,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 13:55:46','2024-06-10 13:55:46'),
(227,NULL,NULL,226,13,15,'2024-06-10 12:57:00',NULL,NULL,'2024-06-10 13:55:46','2024-06-10 13:55:46'),
(228,NULL,NULL,227,42,6,'2024-06-10 13:08:00',NULL,NULL,'2024-06-10 13:55:46','2024-06-10 13:55:46'),
(232,NULL,NULL,89,13,15,'2024-06-10 14:01:00',NULL,NULL,'2024-06-10 14:01:08','2024-06-10 14:01:08'),
(233,NULL,NULL,232,42,6,'2024-06-10 14:01:00',NULL,NULL,'2024-06-10 14:01:08','2024-06-10 14:01:08'),
(234,2,NULL,NULL,NULL,1,'2024-05-13 15:37:00',NULL,NULL,'2024-06-10 14:01:08','2024-06-10 14:01:08'),
(235,NULL,NULL,234,13,15,'2024-06-10 14:01:00',NULL,NULL,'2024-06-10 14:01:08','2024-06-10 14:01:08'),
(236,NULL,NULL,235,42,6,'2024-06-10 14:01:00',NULL,NULL,'2024-06-10 14:01:08','2024-06-10 14:01:08'),
(237,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-26 15:42:08','2024-06-26 15:42:08'),
(244,NULL,NULL,194,42,7,'2024-06-26 15:42:00',NULL,NULL,'2024-06-26 15:42:21','2024-06-26 15:42:21'),
(245,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-06-26 15:42:21','2024-06-26 15:42:21'),
(246,NULL,NULL,245,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-06-26 15:42:21','2024-06-26 15:42:21'),
(247,NULL,NULL,246,42,7,'2024-06-26 15:42:00',NULL,NULL,'2024-06-26 15:42:21','2024-06-26 15:42:21'),
(248,1,NULL,NULL,NULL,1,'2024-04-11 13:47:00',NULL,NULL,'2024-06-26 15:43:49','2024-06-26 15:43:49'),
(264,NULL,NULL,194,42,10,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(265,NULL,NULL,264,27,9,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(266,NULL,NULL,265,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(267,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(268,NULL,NULL,267,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(269,NULL,NULL,268,42,10,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(270,NULL,NULL,269,27,9,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(271,NULL,NULL,270,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:45:59','2024-08-30 13:45:59'),
(277,NULL,NULL,276,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:03','2024-08-30 13:56:03'),
(281,NULL,NULL,280,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:03','2024-08-30 13:56:03'),
(285,NULL,NULL,284,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:08','2024-08-30 13:56:08'),
(287,NULL,NULL,286,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:08','2024-08-30 13:56:08'),
(289,NULL,NULL,288,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:09','2024-08-30 13:56:09'),
(293,NULL,NULL,292,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:09','2024-08-30 13:56:09'),
(297,NULL,NULL,296,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:12','2024-08-30 13:56:12'),
(299,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:12','2024-08-30 13:56:12'),
(300,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:17','2024-08-30 13:56:17'),
(303,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:17','2024-08-30 13:56:17'),
(305,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:20','2024-08-30 13:56:20'),
(308,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:20','2024-08-30 13:56:20'),
(311,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:24','2024-08-30 13:56:24'),
(312,NULL,NULL,298,26,7,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:24','2024-08-30 13:56:24'),
(313,NULL,NULL,264,27,9,'2024-08-30 13:56:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(314,NULL,NULL,313,26,7,'2024-08-30 13:56:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(315,1,NULL,NULL,NULL,1,'2024-06-10 13:23:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(316,NULL,NULL,315,13,15,'2024-06-10 13:23:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(317,NULL,NULL,316,42,6,'2024-06-10 13:23:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(318,NULL,NULL,316,42,7,'2024-06-26 15:42:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(319,NULL,NULL,316,42,10,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(320,NULL,NULL,319,27,9,'2024-08-30 13:45:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(321,NULL,NULL,319,27,9,'2024-08-30 13:56:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25'),
(322,NULL,NULL,321,26,7,'2024-08-30 13:56:00',NULL,NULL,'2024-08-30 13:56:25','2024-08-30 13:56:25');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES
(2,1,1),
(3,1,1),
(5,1,1),
(7,1,1),
(12,1,1),
(14,1,1),
(16,1,1),
(18,1,1),
(20,1,1),
(22,1,1),
(24,1,1),
(26,1,1),
(27,1,1),
(29,1,1),
(31,1,1),
(33,1,1),
(35,1,1),
(41,1,1),
(46,1,1),
(51,1,1),
(55,1,1),
(59,1,1),
(64,1,1),
(68,1,1),
(72,1,1),
(78,1,1),
(83,1,1),
(87,1,1),
(89,1,1),
(90,1,1),
(93,1,1),
(98,1,1),
(113,1,1),
(117,1,1),
(118,1,1),
(121,1,1),
(127,1,1),
(135,1,1),
(144,1,1),
(150,1,1),
(152,1,1),
(153,1,1),
(155,1,1),
(156,1,1),
(157,1,1),
(158,1,1),
(159,1,1),
(160,1,1),
(161,1,1),
(162,1,1),
(163,1,1),
(164,1,1),
(165,1,1),
(170,1,1),
(177,1,1),
(180,1,1),
(184,1,1),
(187,1,1),
(193,1,1),
(196,1,1),
(199,1,1),
(203,1,1),
(209,1,1),
(215,1,1),
(221,1,1),
(226,1,1),
(234,1,1),
(237,1,1),
(245,1,1),
(248,1,1),
(267,1,1),
(315,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES
(1,1,'Standard','entry__standard','newspaper',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-04-11 13:46:31','2024-04-11 13:46:31',NULL,'75e255f2-86f8-4b83-8bfa-39f20fa4eedd'),
(2,7,'Image vizy','body__image','',NULL,0,'site',NULL,'',0,'site',NULL,0,'2024-04-11 15:05:00','2024-04-19 15:12:58','2024-04-19 15:20:48','62bd9751-3c68-48c1-b0d0-f28f7efaece2'),
(3,11,'Video','content__video','video','cyan',0,'site',NULL,'',0,'site',NULL,0,'2024-04-19 13:46:12','2024-05-13 15:00:26',NULL,'c0a70d36-1182-4a66-aad7-1cbfbe3da1dc'),
(4,12,'Image','content__image','image','cyan',0,'site',NULL,'',0,'site',NULL,0,'2024-04-19 15:10:47','2024-05-13 14:52:52',NULL,'409117cb-de3e-4900-82ec-2a7440e33e84'),
(5,13,'Content','body__content','',NULL,0,'site',NULL,'',0,'site',NULL,0,'2024-04-19 15:11:11','2024-04-19 15:11:11','2024-04-19 15:20:40','a267b1d1-c334-48d5-babb-d73f7f328744'),
(6,14,'Heading','content__heading','text','blue',0,'site',NULL,'',0,'site',NULL,0,'2024-04-19 15:18:42','2024-05-13 14:19:21',NULL,'93688f52-2bc2-4914-aac6-0f949e89919e'),
(7,15,'Text','content__text','i-cursor','blue',0,'site',NULL,'',0,'site',NULL,0,'2024-05-13 14:27:31','2024-05-13 14:27:31',NULL,'af11e5ad-a8af-4df5-a21c-e2608c19edeb'),
(8,16,'Action link','content__actionLink','link','violet',0,'site',NULL,'',0,'site',NULL,0,'2024-05-13 15:17:35','2024-05-13 15:17:35',NULL,'96349527-2c4a-4eb7-9481-e12be1fa2e29'),
(9,17,'Item','acc__item','table-list','blue',0,'site',NULL,'',0,'site',NULL,0,'2024-05-13 16:17:03','2024-05-13 16:17:03',NULL,'b53d1a3f-d0be-4181-b4f3-63b2415caf50'),
(10,18,'Accordions','content__accordions','table-list','blue',0,'site',NULL,'',0,'site',NULL,0,'2024-05-13 16:17:37','2024-05-13 16:17:37',NULL,'f030fb15-80d7-484b-b74f-0e51dc2d82c8'),
(11,19,'Call to action','content__callToAction','rocket-launch','violet',0,'site',NULL,'',0,'site',NULL,0,'2024-05-14 09:45:39','2024-05-14 09:45:39',NULL,'3354af91-f989-4740-bdd2-65c9630089b2'),
(12,20,'Entry cards','entryCards','grid','violet',0,'site',NULL,'',0,'site',NULL,0,'2024-05-14 10:51:40','2024-05-14 10:51:40',NULL,'c465af7a-827f-45c8-9e47-f9c38f3d83ac'),
(13,21,'Listing','entry__listing','list',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-05-15 10:12:27','2024-05-15 10:12:27',NULL,'53cc26d6-9a93-49c4-a588-2ae7871da1cf'),
(14,23,'Social media account','footer__socialMedia','thumbs-up',NULL,0,'site',NULL,'',0,'site',NULL,0,'2024-05-15 11:25:02','2024-05-15 11:25:02',NULL,'bf96f3a4-eb06-49f8-af84-f939d5426416'),
(15,24,'Section','content__section','rectangle',NULL,0,'site',NULL,'',0,'site',NULL,0,'2024-06-10 12:56:38','2024-06-10 12:56:38',NULL,'92f8ff6a-4be8-49d9-80bb-870617aa0f85');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"bdb88b26-d6f3-4c33-89b3-a4b2b1cfbb65\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"4eaffa64-446e-46ed-aece-ac8a6e211b7e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5e310356-8cc0-4b59-91b5-4e9728fc1333\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"53112398-e0df-4ef1-976b-8272da500720\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\",\"uid\":\"f59d3bb5-6938-463f-a65b-ad1f4b39656d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"c89a202c-9c60-456c-be81-aa10c55fd32f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\",\"uid\":\"9d3c079b-9817-48f7-9661-57ef30eb4eea\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"1edbcfaa-82b3-4a13-98b3-8cc304edde2f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e9f404d8-0076-45fc-aa9e-76a69b393f81\"}]},{\"name\":\"SEO\",\"uid\":\"8788b31c-63af-4b79-b2e2-320f744041bf\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95870b87-85c2-4fda-97ad-3dab5f1c81e9\"}]}]}','2024-04-11 13:46:31','2024-05-15 10:10:11',NULL,'87c335ca-6f14-483b-b742-b28d48965c5c'),
(2,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"68aa03b5-cd90-4830-8eb3-8cbe8b5a9956\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"f31c5888-6319-4201-ab4f-1353c4bab7f1\",\"userCondition\":null,\"elementCondition\":null}]}]}','2024-04-11 14:59:50','2024-04-11 14:59:50',NULL,'a1a433e5-be43-4cdd-a37a-a846972db09c'),
(3,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"6cbfb459-ad5d-47f4-9520-a4ef4172a7b8\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"0aeead8d-1bd1-4250-b005-46f6882d9fec\",\"userCondition\":null,\"elementCondition\":null}]}]}','2024-04-11 15:00:38','2024-04-11 15:00:38',NULL,'5164034c-8014-40bf-b940-63ec5d937a48'),
(4,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"f3f319a8-7b35-42a8-a8e2-38d9c321c458\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"ddc84187-0ad7-4e98-b207-06d61a82862a\",\"userCondition\":null,\"elementCondition\":null}]}]}','2024-04-11 15:01:30','2024-04-11 15:01:30',NULL,'521e8173-7cd0-4548-bfd3-d76be0138ad2'),
(5,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"0e6e73aa-73cf-45a3-ad0a-facfb77d7f62\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"30647628-ef7a-4c28-9b94-65e63540c6f5\",\"userCondition\":null,\"elementCondition\":null}]}]}','2024-04-11 15:02:03','2024-04-11 15:02:03',NULL,'0a5eafd1-00c9-47cd-a0c5-3c78784ca941'),
(6,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"e02cf822-071f-4410-bb6e-8da09c4ced83\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"3be8eb6b-fc8c-49a3-bc56-1768dca4017f\",\"userCondition\":null,\"elementCondition\":null}]}]}','2024-04-11 15:02:41','2024-04-11 15:02:41',NULL,'c88332fb-65cf-480c-a95f-0b863eb4ad45'),
(7,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"7fc03d01-eebf-4712-a945-e32ef5befffc\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"6897c18c-c91f-48b9-938d-f9f901c171cb\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":true,\"width\":100,\"uid\":\"98369db2-9010-4a75-9074-312725f42a03\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b502800f-c7b7-47b3-85b1-a0d7a179ea00\"}]}]}','2024-04-11 15:05:00','2024-04-11 15:35:35','2024-04-19 15:20:48','66a05539-534b-44ae-9751-913e31cbffed'),
(8,'verbb\\vizy\\models\\BlockType','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"0574f03a-0d25-4fb3-b29e-92a9c468b693\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"3fa04ff6-4137-44e3-8a41-5edffb964a3e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b502800f-c7b7-47b3-85b1-a0d7a179ea00\"}]},{\"name\":\"Options\",\"uid\":\"12ce6ae4-2d8f-4d77-b75e-ba10dcbbe64c\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"0ca6e9b9-adff-4f3b-9e9d-773f7df8dacd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"adf10d1b-d5b5-4564-a880-732b9ec4e22c\"}]}]}','2024-04-11 15:51:44','2024-04-11 16:07:16','2024-04-19 15:20:34','20b4dbe1-054c-4b9e-b18a-f9fbac93e09f'),
(9,'verbb\\vizy\\models\\BlockType','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"8aaef171-94a7-4a35-bbf8-41b5383f6e69\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"53bfe2b3-80db-421b-8c00-b02edbf6dd0b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cd14ae12-0e6a-4f07-9de0-bd0536bd55c1\"}]}]}','2024-04-11 16:24:22','2024-04-11 16:24:22','2024-04-19 15:20:34','9e4c5f46-1f66-4a8f-a56d-14b0bddb78da'),
(10,'verbb\\vizy\\models\\BlockType','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"a4e4011f-d40c-4b3a-9f6a-28e2854d8468\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"992e293a-b5b9-42d3-a71b-93224cee97fa\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d0247de8-ec57-403b-b334-bbf9703049f8\"}]}]}','2024-04-19 13:38:23','2024-04-19 13:48:17','2024-04-19 15:20:34','b5230776-3cae-499b-bb84-4c782f5d9977'),
(11,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"7c65d4f7-7303-4dc3-8f45-eece8060b2da\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"db60901b-a50c-4226-93ff-70e6d4d4e9f9\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"1d183407-0aec-43db-b96f-5c5f33946bfa\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"699650bb-f683-4aec-991a-5c7025228420\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"410ed677-15c7-4581-9e7d-26375584a02e\",\"operator\":\"in\",\"values\":[\"videoUrl\"],\"fieldUid\":\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\",\"layoutElementUid\":\"1d183407-0aec-43db-b96f-5c5f33946bfa\"}]},\"fieldUid\":\"1c25abdf-4ed0-4f3e-9efc-afaa953f4da7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"c3f9d2c1-e31a-40c3-a6a5-b07e02feede9\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"9e1d757d-8671-475e-9540-951e278e4a0d\",\"operator\":\"in\",\"values\":[\"videoUpload\"],\"fieldUid\":\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\",\"layoutElementUid\":\"1d183407-0aec-43db-b96f-5c5f33946bfa\"}]},\"fieldUid\":\"3fe2c1d5-8a1b-4113-898e-9819f561f482\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"01c4396d-db4f-47f8-b03c-c33902559aad\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"673cb6e1-eb77-40ba-b02e-122c3a42286a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"714970c5-b950-48dd-bfa8-2b0f45454e6c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3b11d463-accb-41de-ba6b-9331689fa7ce\"}]}]}','2024-04-19 13:46:12','2024-05-13 15:03:13',NULL,'81dcc96a-7ab4-4769-8ea2-062a0f3838e1'),
(12,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"14f345cf-5514-495b-9aef-44bd65c153fe\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"a47589c4-373a-4dc1-a43a-4b8efd4b66d9\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"3f3e02c8-8847-438b-8732-d4ee36fc17e4\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b502800f-c7b7-47b3-85b1-a0d7a179ea00\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"39a40d56-e92a-4692-b96a-c35603ecde2f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ba07e685-77b8-422c-a2ff-2c5ba52decc3\"}]},{\"name\":\"Settings\",\"uid\":\"a8f6c090-42cc-4fb1-b56e-b4896ba53210\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"00f22453-dc84-474b-ac87-512e608e4004\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"adf10d1b-d5b5-4564-a880-732b9ec4e22c\"}]}]}','2024-04-19 15:10:47','2024-05-13 14:52:52',NULL,'f0e94ed0-f641-41b7-8877-91a9c78b82e0'),
(13,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"5984ce54-f429-489a-b867-212bd04d0d07\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5b3a4060-b55a-4a42-a413-20b984bd8c86\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"ce010db3-5040-4d74-b706-e1fe1f51f806\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cd14ae12-0e6a-4f07-9de0-bd0536bd55c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"92bafdea-984c-4273-85d5-07411e55ce8b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d4b5dd99-9088-494e-b54b-39b5d76840f0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5c7c72bd-d8aa-46cf-a738-59e92eb1255d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d0247de8-ec57-403b-b334-bbf9703049f8\"}]}]}','2024-04-19 15:11:11','2024-04-19 15:11:11','2024-04-19 15:20:40','f9abc135-25c4-4750-87f5-61af9f237127'),
(14,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"adfdf151-29c1-4756-b30f-0565901646a9\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5879bc07-b415-4129-9413-1c97967f7092\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5857e4c0-aeb0-4010-ba79-68f9240106b5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cd14ae12-0e6a-4f07-9de0-bd0536bd55c1\"}]},{\"name\":\"Settings\",\"uid\":\"38421dbf-725a-446f-8ac2-4df16b90c26d\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"feaccd20-663f-4175-b444-8525668da3a9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"73f8e366-7f0d-422c-8131-f28b1309cde6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"uid\":\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"88868b59-0dc8-4932-8fbe-5a8a5fb28762\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"5123d8bf-0117-4751-8c71-59ec23ed0163\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"0c4b28ff-661d-4f3b-baa2-2b2e0e5102d1\",\"value\":true,\"fieldUid\":\"88868b59-0dc8-4932-8fbe-5a8a5fb28762\",\"layoutElementUid\":\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\"}]},\"fieldUid\":\"5cf7e469-364f-4258-b9ab-37d6e6395222\"}]}]}','2024-04-19 15:18:42','2024-05-13 14:19:43',NULL,'e6e886e1-5195-4ee0-8d41-8b2a4335d530'),
(15,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"034dfd2c-4cd2-4e1a-8f9f-ea2f6cd929dd\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"6ae2b20e-698a-4aa4-b34b-00a8273a16ce\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f532ffc5-e55e-40a0-b01e-70b9c34ba6f6\"}]}]}','2024-05-13 14:27:31','2024-05-13 15:00:40',NULL,'27f3b5db-d1ee-48a4-b3e8-1b8d67396563'),
(16,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"bee9ce48-4580-49fc-ae3a-646e919098d0\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"c3ebace7-f6b9-400b-b9bc-733bb4785f9e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"dcf58cf1-93b2-44eb-a745-53aceb98e22e\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"376ef665-87ad-4726-bd4f-4cef790502b0\",\"operator\":\"in\",\"values\":[\"entryLink\"],\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\",\"layoutElementUid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\"}]},\"fieldUid\":\"61a52075-e8d1-4571-94a5-73b6448cb2e1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"b36e597e-165b-4dbc-80c6-377b92bc053d\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"118befa2-a09e-4a69-9188-990bb0c349c8\",\"operator\":\"in\",\"values\":[\"urlLink\"],\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\",\"layoutElementUid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\"}]},\"fieldUid\":\"8e986997-22af-4fce-8225-a1fc3cbb5bac\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"b1266986-24d9-4882-8a89-22e315c94d5a\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"8b52c3a6-bcda-4611-abc2-f121ffa817f6\",\"operator\":\"in\",\"values\":[\"assetLink\"],\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\",\"layoutElementUid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\"}]},\"fieldUid\":\"c849e39d-e259-447a-bdd8-c577bf05b762\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"8d37558b-24c8-463c-b78a-f758d679ddb6\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"bfdcc309-b5b8-4b0b-92a6-c7a19cda17a8\",\"operator\":\"in\",\"values\":[\"entryLink\",\"urlLink\",\"assetLink\"],\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\",\"layoutElementUid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\"}]},\"fieldUid\":\"7a82df58-7169-4f16-9078-ab400c68ac97\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"55627b64-ad3c-4a8f-b130-992fdd744923\",\"operator\":\"in\",\"values\":[\"urlLink\"],\"fieldUid\":\"52c4e51e-b5d1-433e-8683-073d97a20e51\",\"layoutElementUid\":\"ca9af274-930f-4a77-812b-0601fad4b3d2\"}]},\"fieldUid\":\"1803a6fd-4bb9-4613-8953-bcfc78b4e0c7\"}]}]}','2024-05-13 15:17:35','2024-05-13 16:28:50',NULL,'300461e9-7560-41a7-ba53-516f2af3d005'),
(17,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"58d25e37-f36d-42c7-8655-48306fd7106b\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"8b0e1dc3-4b41-4d7f-9d48-7444d9a445c2\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"b3631407-f99b-493a-a6c7-757156bdef0f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cdd0917f-398e-46b8-a373-2fcb84257eca\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"f9f7a5c3-f36e-4fdf-aab7-3fa94b513cd7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7dd6601d-5a16-4e28-8d2a-2f0340c48b65\"}]}]}','2024-05-13 16:17:03','2024-05-13 16:17:03',NULL,'ef2abe74-6689-4b90-a4c8-44690f7f0999'),
(18,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"cacc48d7-58e2-48b8-8811-cf60c738a443\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5f0f4067-8cb7-4fcd-a32a-922abcb9ed74\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"__blank__\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"8de2139a-fa64-461f-98e5-f033d2853ed5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d0fc3bd4-7289-4c25-ab69-5e6b7d086eed\"}]}]}','2024-05-13 16:17:37','2024-05-14 09:16:12',NULL,'40f62781-6812-44e4-9db3-86bcdc6a6a22'),
(19,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"2df1cf61-c8c2-45a2-b267-baf6c1f1df70\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"8b4d39f0-569a-43e2-9632-5e8f5d390059\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"1247d4aa-e385-4cbc-afc8-fc139a7eb7ea\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"fb678e73-288b-42c7-8c19-27c44d13f324\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"642f24a3-e109-4426-982f-2d5f7083bba6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cf947787-479e-4889-93cf-2a7b62aafac4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"uid\":\"ca8d97f0-d020-428b-aabd-2f731eb65cdd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"42fdb1ca-7367-4cf5-9375-37416cbc8615\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"__blank__\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"ab697d2a-af79-4a05-bd0f-242d1ff4473e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"604eaaf1-80fd-42f6-aa9f-3c91970e89aa\"}]}]}','2024-05-14 09:45:39','2024-05-14 09:46:43',NULL,'4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1'),
(20,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"e7fc8f61-0f08-4d55-b789-c371e90ce67d\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"07eb0d3b-91c4-4de0-b420-b361f7169d5c\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"9d69ddf9-4c31-4f99-a527-b0a088d45599\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"506d8357-6bb1-4b98-aa31-628a66d53cfb\"}]},{\"name\":\"Settings\",\"uid\":\"514a827a-6bfc-4457-9b47-28571f50004c\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"eda4d11d-5de8-4194-b4c8-d49fa86ac14d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"05ad0930-f6fa-430f-a8d6-f29e553e30dc\"}]}]}','2024-05-14 10:51:40','2024-05-14 10:51:40',NULL,'27648bfa-f6f4-4ee8-bc57-27c9a3ff971e'),
(21,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"dde77792-5291-46ec-a41a-fae27f5001bf\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"d21bf47b-323f-4aa5-bb32-5ae1b8bfa227\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"f3dbe468-e337-482e-8111-1e8efeff19e4\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"53112398-e0df-4ef1-976b-8272da500720\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\",\"uid\":\"5d11c24d-7475-4845-b9a2-71f32a5cf8c6\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"485e0b9b-1758-409d-8d91-badcc7567fbc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4cd374ac-6a5a-483e-b17d-223382d6d4a1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\",\"uid\":\"9220d960-cffb-44b4-8239-80c1bf6b955f\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"5f5ed616-d99c-43fc-9808-a47cac702aed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e9f404d8-0076-45fc-aa9e-76a69b393f81\"}]},{\"name\":\"SEO\",\"uid\":\"bdf40baa-c989-4855-bfb1-4c96ac20affe\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"b46897a1-f23e-4444-8ef3-ea6fe6571be0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95870b87-85c2-4fda-97ad-3dab5f1c81e9\"}]}]}','2024-05-15 10:12:27','2024-05-15 10:26:49',NULL,'7d13a944-d21e-4c86-9519-16aade300af6'),
(22,'craft\\elements\\GlobalSet','{\"tabs\":[{\"name\":\"Social media\",\"uid\":\"2120c724-b70d-4d9d-8ee6-389b30cd64b2\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"9a2e0a80-b650-4609-868c-64a309094c7c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ae279549-89d9-41f5-bdcb-cad0dcb85925\"}]},{\"name\":\"Legal\",\"uid\":\"defafc7a-09c2-4108-8ba2-a3a577eb18c7\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"3ae2f86e-c5f8-41fc-9817-e8919a5785b5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c6072259-9bf9-4ec5-bcf4-32119fef2e0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"c81734d2-98c2-4ad3-8393-874dba0a2f69\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0217698d-d0e4-4110-89bf-12e604fb40fe\"}]}]}','2024-05-15 11:01:21','2024-05-15 13:42:08',NULL,'54b20a13-6e82-4e22-914b-3ff6ac2baa43'),
(23,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"6d9e04ed-493c-45e5-9818-0a2f7235ca9d\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"9c26dbf5-a3eb-414d-86f1-67a3a3e4eabb\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"eb0b6bbc-0765-49b3-9b08-10a95e843441\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a3c239c2-5e16-432d-a651-abff865a4492\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"834569c6-545d-4771-82ad-42156eff13ed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4df4913b-0a34-4362-a115-1480a1f194cf\"}]}]}','2024-05-15 11:25:02','2024-05-15 11:25:02',NULL,'8fe3a5a2-0e78-424d-8e6d-b7433afe793c'),
(24,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ccf41f6d-1493-4186-a5d3-248f4be5f1f8\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"01bb9992-f2d7-4210-a041-9f1eee2eec2a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"__blank__\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"uid\":\"0bc21d81-dcd7-4105-8de0-3de5796b71df\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"bb5fd73c-d0d3-44b5-a992-476eb9b739a4\"}]}]}','2024-06-10 12:56:38','2024-06-10 12:59:07',NULL,'7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES
(1,'Standfirst','standfirst','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":2,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-04-11 13:50:54','2024-04-11 13:50:54','53112398-e0df-4ef1-976b-8272da500720'),
(3,'Image','image__image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2024-04-11 15:03:08','2024-04-11 16:08:20','b502800f-c7b7-47b3-85b1-a0d7a179ea00'),
(4,'Image ratio','image__imageRatio','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Standard (16:9)\",\"value\":\"standard\",\"default\":\"1\"},{\"label\":\"Fit (non-crop)\",\"value\":\"fit\",\"default\":\"\"}]}','2024-04-11 15:56:30','2024-04-11 15:56:30','adf10d1b-d5b5-4564-a880-732b9ec4e22c'),
(5,'Heading','heading__heading','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-04-11 16:24:02','2024-04-11 16:24:02','cd14ae12-0e6a-4f07-9de0-bd0536bd55c1'),
(6,'Option','video__option','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Select\",\"value\":\"\",\"default\":\"\"},{\"label\":\"Vimeo or Youtube\",\"value\":\"videoUrl\",\"default\":\"\"},{\"label\":\"Upload\",\"value\":\"videoUpload\",\"default\":\"\"}]}','2024-04-19 13:33:26','2024-05-13 15:01:35','944eb893-6b00-4c63-b7b9-9ee73630a1f1'),
(7,'Video file','video__videoFile','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"video\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:10d1394f-6863-440f-945c-891da0c65bad\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:10d1394f-6863-440f-945c-891da0c65bad\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-04-19 13:35:12','2024-04-19 13:35:12','3fe2c1d5-8a1b-4113-898e-9819f561f482'),
(8,'Video URL','video__videoUrl','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\"]}','2024-04-19 13:35:39','2024-04-19 15:19:53','1c25abdf-4ed0-4f3e-9efc-afaa953f4da7'),
(9,'Cover image','video__coverImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-04-19 13:36:26','2024-04-19 13:36:26','673cb6e1-eb77-40ba-b02e-122c3a42286a'),
(10,'Transcript','video__transcript','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"125a39f1-c7fd-462c-beff-e3dfd421bec7\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-04-19 13:37:11','2024-05-13 15:04:48','3b11d463-accb-41de-ba6b-9331689fa7ce'),
(11,'Video','video','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"pageSize\":null,\"createButtonLabel\":null,\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"17ea053e-13d0-4c0f-a465-42342bea6915\":[]},\"entryTypes\":[\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\"]}','2024-04-19 13:47:43','2024-04-19 13:54:40','d0247de8-ec57-403b-b334-bbf9703049f8'),
(12,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"409117cb-de3e-4900-82ec-2a7440e33e84\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2024-04-19 15:10:55','2024-04-19 15:10:55','d4b5dd99-9088-494e-b54b-39b5d76840f0'),
(13,'Content','content__content','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Section\",\"entryTypes\":[\"92f8ff6a-4be8-49d9-80bb-870617aa0f85\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-04-19 15:11:30','2024-06-10 12:58:18','eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7'),
(14,'Size','heading__size','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Heading level 2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"Heading level 3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"Heading level 4\",\"value\":\"h4\",\"default\":\"\"}]}','2024-05-13 14:16:41','2024-05-13 14:16:41','73f8e366-7f0d-422c-8131-f28b1309cde6'),
(15,'Add to jump link','heading__jumpLink','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":\"Remove\",\"onLabel\":\"Add\"}','2024-05-13 14:17:24','2024-05-13 14:17:56','88868b59-0dc8-4932-8fbe-5a8a5fb28762'),
(16,'Jump link text (optional)','heading__jumpLinkText','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-13 14:18:44','2024-05-13 14:18:44','5cf7e469-364f-4258-b9ab-37d6e6395222'),
(17,'Text','text__text','global',NULL,NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"bc60a081-9838-490c-abd8-4401a5bd6e1e\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-05-13 14:27:24','2024-05-13 14:27:24','f532ffc5-e55e-40a0-b01e-70b9c34ba6f6'),
(18,'Caption','image__caption','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-13 14:52:17','2024-05-13 14:52:17','ba07e685-77b8-422c-a2ff-2c5ba52decc3'),
(19,'Option','action__option','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Select\",\"value\":\"\",\"default\":\"\"},{\"label\":\"Internal (entry) link\",\"value\":\"entryLink\",\"default\":\"\"},{\"label\":\"External (URL) link\",\"value\":\"urlLink\",\"default\":\"\"},{\"label\":\"Download (asset) link\",\"value\":\"assetLink\",\"default\":\"\"}]}','2024-05-13 15:11:33','2024-05-13 16:29:00','52c4e51e-b5d1-433e-8683-073d97a20e51'),
(20,'Entry link','action__entryLink','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-13 15:12:26','2024-05-13 15:12:26','61a52075-e8d1-4571-94a5-73b6448cb2e1'),
(21,'URL link','action__urlLink','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\"]}','2024-05-13 15:13:07','2024-05-13 15:13:56','8e986997-22af-4fce-8225-a1fc3cbb5bac'),
(22,'Asset link','action__assetLink','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"excel\",\"pdf\",\"powerpoint\",\"text\",\"word\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:d8da528a-5de1-4ea5-9278-983c10cfe9a5\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:d8da528a-5de1-4ea5-9278-983c10cfe9a5\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-13 15:15:18','2024-05-13 15:15:18','c849e39d-e259-447a-bdd8-c577bf05b762'),
(23,'Link text','action__linkText','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-13 15:15:54','2024-05-13 15:15:54','7a82df58-7169-4f16-9078-ab400c68ac97'),
(24,'Open in a new window?','action__linkTarget','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2024-05-13 15:16:50','2024-05-13 15:16:50','1803a6fd-4bb9-4613-8953-bcfc78b4e0c7'),
(25,'Heading','acc__heading','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-13 16:15:30','2024-05-13 16:15:30','cdd0917f-398e-46b8-a373-2fcb84257eca'),
(26,'Content','acc__content','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Content\",\"entryTypes\":[\"af11e5ad-a8af-4df5-a21c-e2608c19edeb\",\"409117cb-de3e-4900-82ec-2a7440e33e84\",\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\",\"96349527-2c4a-4eb7-9481-e12be1fa2e29\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":1,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-05-13 16:16:51','2024-05-13 16:16:51','7dd6601d-5a16-4e28-8d2a-2f0340c48b65'),
(27,'Accordion','acc__accordion','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Item\",\"entryTypes\":[\"b53d1a3f-d0be-4181-b4f3-63b2415caf50\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":1,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-05-13 16:17:07','2024-05-13 16:18:34','d0fc3bd4-7289-4c25-ab69-5e6b7d086eed'),
(28,'Heading','cta__heading','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-14 09:42:22','2024-05-14 10:26:32','fb678e73-288b-42c7-8c19-27c44d13f324'),
(29,'Text','cta__text','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":2,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-14 09:42:54','2024-05-14 10:26:40','cf947787-479e-4889-93cf-2a7b62aafac4'),
(30,'Image','cta__image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-14 09:43:27','2024-05-14 09:43:27','42fdb1ca-7367-4cf5-9375-37416cbc8615'),
(31,'Action link','cta__actionLink','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"96349527-2c4a-4eb7-9481-e12be1fa2e29\"],\"includeTableView\":false,\"maxEntries\":1,\"minEntries\":1,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-05-14 09:45:15','2024-05-14 09:45:15','604eaaf1-80fd-42f6-aa9f-3c91970e89aa'),
(32,'Entries','entryCards__entries','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-14 10:50:23','2024-05-14 10:50:23','506d8357-6bb1-4b98-aa31-628a66d53cfb'),
(33,'Columns','entryCards__columns','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":\"2\",\"onLabel\":\"3\"}','2024-05-14 10:51:27','2024-05-14 10:51:27','05ad0930-f6fa-430f-a8d6-f29e553e30dc'),
(34,'Internal search keywords','internalSearch','global',NULL,'This won\'t help you with SEO – it\'s only for the internal Craft search function. Add the search terms that you want the entry to appear for in the internal search results but are typos or misspelt (so you don\'t want to display them in the page content). Separate the terms with a comma.',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-15 10:04:11','2024-05-15 10:04:11','e9f404d8-0076-45fc-aa9e-76a69b393f81'),
(35,'SEO','seo','global',NULL,NULL,1,'none',NULL,'nystudio107\\seomatic\\fields\\SeoSettings','{\"elementDisplayPreviewType\":\"google\",\"facebookEnabledFields\":[\"seoPreview\",\"ogType\",\"ogTitle\",\"ogSiteNamePosition\",\"ogDescription\",\"ogImage\",\"ogImageDescription\"],\"facebookTabEnabled\":\"1\",\"generalEnabledFields\":[\"seoPreview\",\"mainEntityOfPage\",\"seoTitle\",\"siteNamePosition\",\"seoDescription\",\"seoImage\",\"seoImageDescription\",\"robots\"],\"generalTabEnabled\":\"1\",\"sitemapEnabledFields\":[\"sitemapUrls\"],\"sitemapTabEnabled\":\"1\",\"twitterEnabledFields\":[\"seoPreview\",\"twitterCardType\",\"twitterCreator\",\"twitterTitle\",\"twitterSiteNamePosition\",\"twitterDescription\",\"twitterImage\",\"twitterImageDescription\"],\"twitterTabEnabled\":\"1\"}','2024-05-15 10:09:34','2024-05-15 10:09:34','95870b87-85c2-4fda-97ad-3dab5f1c81e9'),
(36,'List by channel','listByChannel','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Select\",\"value\":\"\",\"default\":\"1\"},{\"label\":\"Blog\",\"value\":\"blog\",\"default\":\"\"},{\"label\":\"News\",\"value\":\"news\",\"default\":\"\"}]}','2024-05-15 10:26:29','2024-05-15 10:26:29','4cd374ac-6a5a-483e-b17d-223382d6d4a1'),
(37,'Registration details','registration','global',NULL,NULL,1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-05-15 11:01:13','2024-05-15 11:01:13','c6072259-9bf9-4ec5-bcf4-32119fef2e0b'),
(38,'Platform','socialMedia__platform','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Select\",\"value\":\"\",\"default\":\"1\"},{\"label\":\"Facebook\",\"value\":\"facebook\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"instagram\",\"default\":\"\"},{\"label\":\"Linkedin\",\"value\":\"linkedin\",\"default\":\"\"},{\"label\":\"YouTube\",\"value\":\"youtube\",\"default\":\"\"},{\"label\":\"Pinterest\",\"value\":\"pinterest\",\"default\":\"\"}]}','2024-05-15 11:23:27','2024-05-15 11:23:27','a3c239c2-5e16-432d-a651-abff865a4492'),
(39,'Profile URL','socialMedia__profileUrl','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\"]}','2024-05-15 11:24:12','2024-05-15 11:24:12','4df4913b-0a34-4362-a115-1480a1f194cf'),
(40,'Social media accounts','footer__socialMedia','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"entryTypes\":[\"bf96f3a4-eb06-49f8-af84-f939d5426416\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-05-15 11:26:38','2024-05-15 11:26:38','ae279549-89d9-41f5-bdcb-cad0dcb85925'),
(41,'Legal nav','footer__legalNav','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:ffb3da3c-2f4d-47a3-a021-d496e6c5516a\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-05-15 13:41:48','2024-05-15 13:41:48','0217698d-d0e4-4110-89bf-12e604fb40fe'),
(42,'Section','content__section','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"Content\",\"entryTypes\":[\"93688f52-2bc2-4914-aac6-0f949e89919e\",\"af11e5ad-a8af-4df5-a21c-e2608c19edeb\",\"409117cb-de3e-4900-82ec-2a7440e33e84\",\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\",\"f030fb15-80d7-484b-b74f-0e51dc2d82c8\",\"96349527-2c4a-4eb7-9481-e12be1fa2e29\",\"3354af91-f989-4740-bdd2-65c9630089b2\",\"c465af7a-827f-45c8-9e47-f9c38f3d83ac\"],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2024-06-10 12:55:00','2024-06-10 12:59:04','bb5fd73c-d0d3-44b5-a992-476eb9b739a4');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_emailtemplates`
--

LOCK TABLES `formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `formie_emailtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_pages`
--

LOCK TABLES `formie_fieldlayout_pages` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_pages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_fieldlayout_pages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_rows`
--

LOCK TABLES `formie_fieldlayout_rows` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_rows` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_fieldlayout_rows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayouts`
--

LOCK TABLES `formie_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fields`
--

LOCK TABLES `formie_fields` WRITE;
/*!40000 ALTER TABLE `formie_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_forms`
--

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_formtemplates`
--

LOCK TABLES `formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `formie_formtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_integrations`
--

LOCK TABLES `formie_integrations` WRITE;
/*!40000 ALTER TABLE `formie_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_notifications`
--

LOCK TABLES `formie_notifications` WRITE;
/*!40000 ALTER TABLE `formie_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments`
--

LOCK TABLES `formie_payments` WRITE;
/*!40000 ALTER TABLE `formie_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_plans`
--

LOCK TABLES `formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `formie_payments_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_subscriptions`
--

LOCK TABLES `formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `formie_payments_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_pdftemplates`
--

LOCK TABLES `formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `formie_pdftemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_relations`
--

LOCK TABLES `formie_relations` WRITE;
/*!40000 ALTER TABLE `formie_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_sentnotifications`
--

LOCK TABLES `formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `formie_sentnotifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_statuses`
--

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_statuses` VALUES
(1,'New','new','green',NULL,1,1,NULL,'2024-04-11 13:46:31','2024-04-11 13:46:31','b85f18dc-5c7d-4c3d-be23-437b9c3675f3');
/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_stencils`
--

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_stencils` VALUES
(1,'Contact Form','contactForm','{\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"Admin Notification\",\"replyTo\":\"{field:emailAddress}\",\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"to\":\"{systemEmail}\"},{\"attachFiles\":true,\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enabled\":true,\"name\":\"User Notification\",\"replyTo\":null,\"subject\":\"Thanks for contacting us!\",\"to\":\"{field:emailAddress}\"}],\"pages\":[{\"label\":\"Page 1\",\"rows\":[{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"placeholder\":\"Your name\",\"required\":false,\"rows\":[{\"fields\":[{\"settings\":{\"enabled\":false,\"handle\":\"prefix\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"honorific-prefix\"}],\"label\":\"Prefix\",\"options\":[{\"isDefault\":true,\"isOptgroup\":false,\"label\":\"Select an option\",\"value\":\"\"}],\"required\":false},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NamePrefix\"},{\"settings\":{\"enabled\":true,\"handle\":\"firstName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"given-name\"}],\"label\":\"First Name\",\"placeholder\":\"e.g. Peter\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameFirst\"},{\"settings\":{\"enabled\":false,\"handle\":\"middleName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"additional-name\"}],\"label\":\"Middle Name\",\"required\":false},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameMiddle\"},{\"settings\":{\"enabled\":true,\"handle\":\"lastName\",\"inputAttributes\":[{\"label\":\"autocomplete\",\"value\":\"family-name\"}],\"label\":\"Last Name\",\"placeholder\":\"e.g. Sherman\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameLast\"}]}],\"useMultipleFields\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\Name\"}]},{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"label\":\"Email Address\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\Email\"}]},{\"fields\":[{\"settings\":{\"enabled\":true,\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"label\":\"Message\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\MultiLineText\"}]}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"saveButtonLabel\":\"Save\",\"saveButtonStyle\":\"link\",\"showBackButton\":false,\"showSaveButton\":false,\"submitButtonLabel\":\"Contact us\"}}],\"settings\":{\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":null,\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"disableCaptchas\":false,\"displayCurrentPageTitle\":false,\"displayFormTitle\":false,\"displayPageProgress\":false,\"displayPageTabs\":false,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"limitSubmissions\":false,\"limitSubmissionsMessage\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"pageRedirectUrl\":null,\"progressPosition\":\"end\",\"redirectUrl\":null,\"requireUser\":false,\"requireUserMessage\":null,\"requiredIndicator\":\"asterisk\",\"scheduleForm\":false,\"scheduleFormEnd\":null,\"scheduleFormExpiredMessage\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormStart\":null,\"scrollToTop\":true,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\",\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitMethod\":\"ajax\",\"validationOnFocus\":true,\"validationOnSubmit\":true},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,1,NULL,'2024-04-11 13:46:31','2024-04-11 13:46:31','3031c488-fd65-4a4c-b69b-770f27f5fd77');
/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_submissions`
--

LOCK TABLES `formie_submissions` WRITE;
/*!40000 ALTER TABLE `formie_submissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES
(166,'Site footer','siteFooter',22,1,'2024-05-15 10:57:59','2024-05-15 11:01:21','cdd9e7cc-1867-45b4-9c9b-7310c18333bd');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES
(1,'5.2.3','5.0.0.21',0,'dguhgephkmnf','3@klbbfwhsvn','2024-04-11 13:46:30','2024-06-26 15:33:47','e922c5fc-c5c8-474b-8fa1-4c008dd7c1e8');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `knockknock_logins`
--

LOCK TABLES `knockknock_logins` WRITE;
/*!40000 ALTER TABLE `knockknock_logins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `knockknock_logins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'plugin:ckeditor','Install','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','c9181ef3-64a4-4fdd-a9fb-5ff5c020fad2'),
(2,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','6ae97808-bae0-4d24-a6db-3602d0a969b6'),
(3,'module:verbb-auth','m221127_000000_install','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','296cdbea-4d97-4c18-8af0-7052dc6a1598'),
(4,'plugin:formie','Install','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','eda81ef2-0597-4371-a354-be9048dc6de5'),
(5,'plugin:formie','m231125_000000_craft5','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','016a4697-60af-4b97-967c-a233e3c8f321'),
(6,'plugin:formie','m231129_000000_integrations_mapping','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','8266aef5-4c32-4c4f-b158-651669edc36e'),
(7,'plugin:formie','m231130_000000_conditions_mapping','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','530e2f60-83a3-4017-8507-5fc6bafbf046'),
(8,'plugin:formie','m231202_000000_auth_module','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','70ea884c-e1b8-4297-a04a-6d846e633823'),
(9,'plugin:formie','m240130_000000_permissions','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','74e32757-96e5-4618-b41d-5b4bdaaf69ac'),
(10,'plugin:formie','m240313_000000_subfields','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','39156513-02d5-41cd-b9aa-43116e1bc88a'),
(11,'plugin:formie','m240318_000000_fix_content_table','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','6499e39c-72c4-4e1f-83c2-7acae5167e2d'),
(12,'plugin:formie','m240318_000000_migrate_stencils','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','1688517d-71ba-4f43-9b89-f1863d385317'),
(13,'plugin:formie','m240318_000000_notification_fields','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','d83795b6-5797-440d-8ac1-81e0f5aaf3c6'),
(14,'plugin:formie','m240325_000000_notifications_custom_settings','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','a48eaff9-4f99-453d-bd5e-85dfd138faa9'),
(15,'plugin:knock-knock','Install','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','31c806e1-86d4-4465-b659-fed92b872623'),
(16,'plugin:seomatic','Install','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','0a4025b6-f23e-49cc-8298-3accb0a9f255'),
(17,'plugin:seomatic','m180314_002755_field_type','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','db5c09b8-6ded-444b-8586-90e40fe5d1cb'),
(18,'plugin:seomatic','m180314_002756_base_install','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','5db607db-cb16-4409-ba97-2052c51f2e22'),
(19,'plugin:seomatic','m180502_202319_remove_field_metabundles','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','b7eaf89c-2638-4e98-a301-38e90f18104c'),
(20,'plugin:seomatic','m180711_024947_commerce_products','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','9dadbd0f-cdac-4aea-85f3-5d948ece8945'),
(21,'plugin:seomatic','m190401_220828_longer_handles','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','3ed868e7-986f-40d2-b1db-1d8f270c38ed'),
(22,'plugin:seomatic','m190518_030221_calendar_events','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','3144564f-98be-4509-9da0-7a4348325d5f'),
(23,'plugin:seomatic','m200419_203444_add_type_id','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','36bf8b21-c2aa-4ca0-81fb-c7be4412a4ea'),
(24,'plugin:seomatic','m210603_213100_add_gql_schema_components','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','efcc0899-c9ad-4782-bbd3-85f9c1b62efb'),
(25,'plugin:seomatic','m210817_230853_announcement_v3_4','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','10e196ee-4db9-477c-ae2e-512d5f5e7852'),
(26,'plugin:seomatic','m230601_184259_announcement_google_ua_deprecated','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','afd2ff01-4355-4684-a54d-eca477d158a9'),
(27,'craft','Install','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','9dddcfc9-2baf-4bbb-ad41-421503b1756d'),
(28,'craft','m221101_115859_create_entries_authors_table','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','97c9245a-62eb-4a6a-a1f8-532c1fa95dc8'),
(29,'craft','m221107_112121_add_max_authors_to_sections','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','0a1bde90-6da2-49e1-8f01-00fa31477f38'),
(30,'craft','m221205_082005_translatable_asset_alt_text','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','ede5f102-6c1f-447d-acce-1777a3d72617'),
(31,'craft','m230314_110309_add_authenticator_table','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','8f67e50d-773c-47a5-b020-59fabc39a5ce'),
(32,'craft','m230314_111234_add_webauthn_table','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','307489ad-ffc1-48a1-a4f0-8d83f710e4a3'),
(33,'craft','m230503_120303_add_recoverycodes_table','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','db314977-922d-4381-ab8f-c63d809d4fc3'),
(34,'craft','m230511_000000_field_layout_configs','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','b3bd8816-4061-4003-b553-3bdf4f0a3ab7'),
(35,'craft','m230511_215903_content_refactor','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','774692bf-1b46-41ee-8329-00071edff037'),
(36,'craft','m230524_000000_add_entry_type_show_slug_field','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','98e00b29-d2df-4630-8921-bbc49ef7dd13'),
(37,'craft','m230524_000001_entry_type_icons','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','53ce8342-2593-4d3d-acb6-79688e490eca'),
(38,'craft','m230524_000002_entry_type_colors','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','c23c14d7-546e-4b74-a890-af782ddef920'),
(39,'craft','m230524_220029_global_entry_types','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','a7ae3780-ab6e-4794-870a-73e79290da67'),
(40,'craft','m230531_123004_add_entry_type_show_status_field','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','1cb01dbe-2463-4656-95c1-e69de24b104b'),
(41,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','d1f797f0-be0b-43d3-8e94-74dfcb526e61'),
(42,'craft','m230616_173810_kill_field_groups','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','a6c044d9-9111-4ac8-99c7-074a60f61e5c'),
(43,'craft','m230616_183820_remove_field_name_limit','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','942a967e-2992-4cc1-b63c-6138f388d63f'),
(44,'craft','m230617_070415_entrify_matrix_blocks','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','f19deb5e-0035-4416-9111-02eae8e5dee6'),
(45,'craft','m230710_162700_element_activity','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','5cf7237b-68c9-4336-be21-de32deb345b7'),
(46,'craft','m230820_162023_fix_cache_id_type','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','44f0e484-23c1-41d1-baf7-1caf949c9171'),
(47,'craft','m230826_094050_fix_session_id_type','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','45a6270f-d8ee-4a36-8b55-9183dd29618e'),
(48,'craft','m230904_190356_address_fields','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','55f6b0e7-0a6d-44cd-aa93-5dbd58e4686c'),
(49,'craft','m230928_144045_add_subpath_to_volumes','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','aab024ef-508a-4775-b60f-b2409fdb53e0'),
(50,'craft','m231013_185640_changedfields_amend_primary_key','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','882db523-f14b-4f4c-af5b-5419792f641e'),
(51,'craft','m231213_030600_element_bulk_ops','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','f5b7e235-358f-489c-aeaf-05bc54965fb4'),
(52,'craft','m240129_150719_sites_language_amend_length','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','d41f7ed9-22de-4fef-804e-bbf4196a8742'),
(53,'craft','m240206_035135_convert_json_columns','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','def782d3-a283-4f54-9b54-7531dd253cfe'),
(54,'craft','m240207_182452_address_line_3','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','eb345ec8-3eea-4b88-a502-d902b85c2988'),
(55,'craft','m240302_212719_solo_preview_targets','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-04-11 13:46:31','7e75644e-da36-4f3a-acf4-8a0363a7996d'),
(56,'plugin:formie','m240407_000000_payment_fk','2024-04-19 13:52:06','2024-04-19 13:52:06','2024-04-19 13:52:06','a9f07dd6-2905-4e8b-aabf-77418ad517d1'),
(57,'craft','m240619_091352_add_auth_2fa_timestamp','2024-06-26 15:33:47','2024-06-26 15:33:47','2024-06-26 15:33:47','a19192c2-ba60-482a-8c90-95893b3ece53'),
(58,'plugin:formie','m240507_000000_entry_integration_ids','2024-06-26 15:33:47','2024-06-26 15:33:47','2024-06-26 15:33:47','435d1809-8152-4cd0-80d9-da6b437be2d1'),
(59,'plugin:formie','m240528_000000_payment_fk','2024-06-26 15:33:47','2024-06-26 15:33:47','2024-06-26 15:33:47','88a4b13e-e746-49df-ad42-665027b64378'),
(60,'plugin:formie','m240614_000000_klaviyo','2024-06-26 15:33:47','2024-06-26 15:33:47','2024-06-26 15:33:47','60923c65-1610-4127-9b00-6ebb416ccf1c');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES
(1,'admin-bar','5.0.0-beta.1','3.1.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','7767e7ba-cc09-4bfe-b137-40fec42cc396'),
(2,'assetrev','8.0.0','1.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','3580e4d8-f176-49ab-bc88-c694119c7e6a'),
(3,'ckeditor','4.1.0','3.0.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-06-26 15:33:43','786b48f8-bf22-4fae-8b76-67d2f0f351e6'),
(4,'cookies','5.0.0','1.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-19 13:51:48','c4af0850-5883-44ae-b2f9-d2895367394e'),
(5,'cp-css','3.0.0','2.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','b15039a0-bf6f-4fad-a513-728818d230da'),
(6,'cp-field-inspect','2.0.1','1.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','ede61e7f-2dc3-4672-8995-522f44dd78ec'),
(7,'dashboard-begone','3.0.0','1.0.0','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-04-11 13:46:30','86c59955-2081-4b7b-b8f8-a0f9f3cccccc'),
(8,'formie','3.0.0-beta.15','3.4.6','2024-04-11 13:46:30','2024-04-11 13:46:30','2024-06-26 15:33:47','5268484a-551b-46c9-93b5-1c5bf2f835bf'),
(9,'image-resizer','4.0.0','2.0.0','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-06-26 15:33:43','5e1e6667-9f0f-4d63-b779-8da2729d94b7'),
(10,'knock-knock','3.0.0','1.1.1','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-06-26 15:33:43','ea7e78ce-0a46-4f78-9367-cfaf76b64d16'),
(11,'seomatic','5.0.4','3.0.12','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-06-26 15:33:43','d2c6711c-485e-441d-9a99-53ec466d14d3'),
(12,'typogrify','5.0.1','1.0.0','2024-04-11 13:46:31','2024-04-11 13:46:31','2024-06-26 15:33:43','fde5de89-bbae-4714-9c2d-d5eb2478b887'),
(13,'vizy','3.0.0-beta.5','0.9.0','2024-04-11 15:44:30','2024-04-11 15:44:30','2024-04-19 13:51:48','a7740898-406d-467f-9f03-93887f2438cd'),
(14,'obfuscator','1.2.0','1.0.0','2024-06-26 15:32:39','2024-06-26 15:32:39','2024-06-26 15:32:39','d2d1717d-66d9-4b38-8f32-6e04cc57404b');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.0','1'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.1','2'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.2','3'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.3','4'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.4','5'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.headingLevels.5','6'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.name','\"Simple\"'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.toolbar.0','\"heading\"'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.toolbar.1','\"|\"'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.toolbar.2','\"bold\"'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.toolbar.3','\"italic\"'),
('ckeditor.configs.125a39f1-c7fd-462c-beff-e3dfd421bec7.toolbar.4','\"link\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.headingLevels','false'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.name','\"Standard\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.options.list.properties.styles','false'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.0','\"heading\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.1','\"|\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.2','\"bold\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.3','\"italic\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.4','\"bulletedList\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.5','\"numberedList\"'),
('ckeditor.configs.bc60a081-9838-490c-abd8-4401a5bd6e1e.toolbar.6','\"link\"'),
('dateModified','1719416027'),
('elementSources.craft\\elements\\Entry.0.key','\"*\"'),
('elementSources.craft\\elements\\Entry.0.type','\"native\"'),
('elementSources.craft\\elements\\Entry.1.heading','\"Structures\"'),
('elementSources.craft\\elements\\Entry.1.type','\"heading\"'),
('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"structure\"'),
('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"asc\"'),
('elementSources.craft\\elements\\Entry.2.disabled','false'),
('elementSources.craft\\elements\\Entry.2.key','\"section:ffb3da3c-2f4d-47a3-a021-d496e6c5516a\"'),
('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"postDate\"'),
('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"expiryDate\"'),
('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"authors\"'),
('elementSources.craft\\elements\\Entry.2.tableAttributes.3','\"link\"'),
('elementSources.craft\\elements\\Entry.2.type','\"native\"'),
('elementSources.craft\\elements\\Entry.3.heading','\"Site info\"'),
('elementSources.craft\\elements\\Entry.3.type','\"heading\"'),
('elementSources.craft\\elements\\Entry.4.defaultSort.0','\"structure\"'),
('elementSources.craft\\elements\\Entry.4.defaultSort.1','\"asc\"'),
('elementSources.craft\\elements\\Entry.4.disabled','false'),
('elementSources.craft\\elements\\Entry.4.key','\"section:545bf85d-2516-4846-ab8f-778f8f10fcab\"'),
('elementSources.craft\\elements\\Entry.4.tableAttributes.0','\"postDate\"'),
('elementSources.craft\\elements\\Entry.4.tableAttributes.1','\"expiryDate\"'),
('elementSources.craft\\elements\\Entry.4.tableAttributes.2','\"authors\"'),
('elementSources.craft\\elements\\Entry.4.tableAttributes.3','\"link\"'),
('elementSources.craft\\elements\\Entry.4.type','\"native\"'),
('email.fromEmail','\"mani.bae@williamjoseph.co.uk\"'),
('email.fromName','\"WJ Boilerplate\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.color','\"violet\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.autocomplete','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.autocorrect','true'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.class','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.disabled','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.id','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.includeInCards','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.inputType','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.instructions','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.label','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.max','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.min','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.name','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.orientation','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.placeholder','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.readonly','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.requirable','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.size','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.step','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.tip','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.title','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.uid','\"8b4d39f0-569a-43e2-9632-5e8f5d390059\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.warning','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.0.width','100'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.fieldUid','\"fb678e73-288b-42c7-8c19-27c44d13f324\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.handle','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.includeInCards','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.instructions','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.label','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.required','true'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.tip','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.uid','\"1247d4aa-e385-4cbc-afc8-fc139a7eb7ea\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.warning','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.1.width','100'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.fieldUid','\"cf947787-479e-4889-93cf-2a7b62aafac4\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.handle','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.includeInCards','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.instructions','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.label','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.required','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.tip','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.uid','\"642f24a3-e109-4426-982f-2d5f7083bba6\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.warning','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.2.width','50'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.fieldUid','\"42fdb1ca-7367-4cf5-9375-37416cbc8615\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.handle','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.includeInCards','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.instructions','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.label','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.required','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.tip','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.uid','\"ca8d97f0-d020-428b-aabd-2f731eb65cdd\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.warning','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.3.width','50'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.elementCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.fieldUid','\"604eaaf1-80fd-42f6-aa9f-3c91970e89aa\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.handle','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.includeInCards','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.instructions','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.label','\"__blank__\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.required','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.tip','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.uid','\"ab697d2a-af79-4a05-bd0f-242d1ff4473e\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.warning','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.elements.4.width','100'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.name','\"Content\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.uid','\"2df1cf61-c8c2-45a2-b267-baf6c1f1df70\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.fieldLayouts.4c23a5c2-e512-41eb-a9b8-997f7c4cb0c1.tabs.0.userCondition','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.handle','\"content__callToAction\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.hasTitleField','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.icon','\"rocket-launch\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.name','\"Call to action\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.showSlugField','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.showStatusField','false'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.slugTranslationKeyFormat','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.slugTranslationMethod','\"site\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.titleFormat','\"\"'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.titleTranslationKeyFormat','null'),
('entryTypes.3354af91-f989-4740-bdd2-65c9630089b2.titleTranslationMethod','\"site\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.color','\"cyan\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.autocomplete','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.autocorrect','true'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.class','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.disabled','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.id','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.includeInCards','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.inputType','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.instructions','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.label','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.max','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.min','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.name','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.orientation','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.placeholder','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.readonly','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.requirable','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.size','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.step','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.tip','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.title','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.uid','\"a47589c4-373a-4dc1-a43a-4b8efd4b66d9\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.warning','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.0.width','100'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.fieldUid','\"b502800f-c7b7-47b3-85b1-a0d7a179ea00\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.handle','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.includeInCards','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.instructions','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.label','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.required','true'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.tip','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.uid','\"3f3e02c8-8847-438b-8732-d4ee36fc17e4\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.warning','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.1.width','100'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.fieldUid','\"ba07e685-77b8-422c-a2ff-2c5ba52decc3\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.handle','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.includeInCards','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.instructions','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.label','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.required','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.tip','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.uid','\"39a40d56-e92a-4692-b96a-c35603ecde2f\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.warning','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.elements.2.width','100'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.name','\"Content\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.uid','\"14f345cf-5514-495b-9aef-44bd65c153fe\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.0.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.elementCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.fieldUid','\"adf10d1b-d5b5-4564-a880-732b9ec4e22c\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.handle','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.includeInCards','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.instructions','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.label','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.required','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.tip','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.uid','\"00f22453-dc84-474b-ac87-512e608e4004\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.warning','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.elements.0.width','100'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.name','\"Settings\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.uid','\"a8f6c090-42cc-4fb1-b56e-b4896ba53210\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.fieldLayouts.f0e94ed0-f641-41b7-8877-91a9c78b82e0.tabs.1.userCondition','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.handle','\"content__image\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.hasTitleField','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.icon','\"image\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.name','\"Image\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.showSlugField','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.showStatusField','false'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.slugTranslationKeyFormat','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.slugTranslationMethod','\"site\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.titleFormat','\"\"'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.titleTranslationKeyFormat','null'),
('entryTypes.409117cb-de3e-4900-82ec-2a7440e33e84.titleTranslationMethod','\"site\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.color','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.autocomplete','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.autocorrect','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.class','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.disabled','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.id','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.includeInCards','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.inputType','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.instructions','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.label','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.max','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.min','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.name','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.orientation','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.placeholder','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.readonly','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.requirable','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.size','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.step','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.tip','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.title','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.uid','\"d21bf47b-323f-4aa5-bb32-5ae1b8bfa227\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.warning','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.0.width','100'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.fieldUid','\"53112398-e0df-4ef1-976b-8272da500720\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.handle','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.includeInCards','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.instructions','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.label','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.required','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.tip','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.uid','\"f3dbe468-e337-482e-8111-1e8efeff19e4\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.warning','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.1.width','100'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.2.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.2.uid','\"5d11c24d-7475-4845-b9a2-71f32a5cf8c6\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.2.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.fieldUid','\"4cd374ac-6a5a-483e-b17d-223382d6d4a1\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.handle','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.includeInCards','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.instructions','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.label','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.required','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.tip','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.uid','\"485e0b9b-1758-409d-8d91-badcc7567fbc\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.warning','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.3.width','100'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.4.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.4.uid','\"9220d960-cffb-44b4-8239-80c1bf6b955f\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.4.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.fieldUid','\"e9f404d8-0076-45fc-aa9e-76a69b393f81\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.handle','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.includeInCards','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.instructions','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.label','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.required','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.tip','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.uid','\"5f5ed616-d99c-43fc-9808-a47cac702aed\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.warning','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.elements.5.width','100'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.name','\"Content\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.uid','\"dde77792-5291-46ec-a41a-fae27f5001bf\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.0.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.elementCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.fieldUid','\"95870b87-85c2-4fda-97ad-3dab5f1c81e9\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.handle','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.includeInCards','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.instructions','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.label','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.required','false'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.tip','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.uid','\"b46897a1-f23e-4444-8ef3-ea6fe6571be0\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.warning','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.elements.0.width','100'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.name','\"SEO\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.uid','\"bdf40baa-c989-4855-bfb1-4c96ac20affe\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.fieldLayouts.7d13a944-d21e-4c86-9519-16aade300af6.tabs.1.userCondition','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.handle','\"entry__listing\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.hasTitleField','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.icon','\"list\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.name','\"Listing\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.showSlugField','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.showStatusField','true'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.slugTranslationKeyFormat','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.slugTranslationMethod','\"site\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.titleFormat','\"\"'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.titleTranslationKeyFormat','null'),
('entryTypes.53cc26d6-9a93-49c4-a588-2ae7871da1cf.titleTranslationMethod','\"site\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.color','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.autocomplete','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.autocorrect','true'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.class','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.disabled','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.id','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.includeInCards','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.inputType','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.instructions','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.label','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.max','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.min','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.name','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.orientation','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.placeholder','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.readonly','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.requirable','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.size','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.step','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.tip','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.title','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.uid','\"4eaffa64-446e-46ed-aece-ac8a6e211b7e\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.warning','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.0.width','100'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.fieldUid','\"53112398-e0df-4ef1-976b-8272da500720\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.handle','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.includeInCards','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.instructions','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.label','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.required','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.tip','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.uid','\"5e310356-8cc0-4b59-91b5-4e9728fc1333\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.warning','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.1.width','100'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.2.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.2.uid','\"f59d3bb5-6938-463f-a65b-ad1f4b39656d\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.2.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.fieldUid','\"eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.handle','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.includeInCards','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.instructions','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.label','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.required','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.tip','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.uid','\"c89a202c-9c60-456c-be81-aa10c55fd32f\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.warning','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.3.width','100'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.4.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.4.uid','\"9d3c079b-9817-48f7-9661-57ef30eb4eea\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.4.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.fieldUid','\"e9f404d8-0076-45fc-aa9e-76a69b393f81\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.handle','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.includeInCards','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.instructions','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.label','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.required','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.tip','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.uid','\"1edbcfaa-82b3-4a13-98b3-8cc304edde2f\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.warning','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.elements.5.width','100'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.name','\"Content\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.uid','\"bdb88b26-d6f3-4c33-89b3-a4b2b1cfbb65\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.0.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.elementCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.fieldUid','\"95870b87-85c2-4fda-97ad-3dab5f1c81e9\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.handle','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.includeInCards','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.instructions','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.label','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.required','false'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.tip','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.uid','\"a0859778-2a16-457a-b0dd-4e89e6db4eb8\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.warning','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.elements.0.width','100'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.name','\"SEO\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.uid','\"8788b31c-63af-4b79-b2e2-320f744041bf\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.fieldLayouts.87c335ca-6f14-483b-b742-b28d48965c5c.tabs.1.userCondition','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.handle','\"entry__standard\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.hasTitleField','true'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.icon','\"newspaper\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.name','\"Standard\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.showSlugField','true'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.showStatusField','true'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.slugTranslationKeyFormat','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.slugTranslationMethod','\"site\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.titleFormat','\"\"'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.titleTranslationKeyFormat','null'),
('entryTypes.75e255f2-86f8-4b83-8bfa-39f20fa4eedd.titleTranslationMethod','\"site\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.color','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elementCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.autocomplete','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.autocorrect','true'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.class','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.disabled','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.elementCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.id','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.includeInCards','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.inputType','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.instructions','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.label','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.max','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.min','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.name','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.orientation','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.placeholder','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.readonly','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.requirable','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.size','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.step','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.tip','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.title','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.uid','\"01bb9992-f2d7-4210-a041-9f1eee2eec2a\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.userCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.warning','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.0.width','100'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.elementCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.fieldUid','\"bb5fd73c-d0d3-44b5-a992-476eb9b739a4\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.handle','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.includeInCards','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.instructions','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.label','\"__blank__\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.required','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.tip','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.uid','\"0bc21d81-dcd7-4105-8de0-3de5796b71df\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.userCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.warning','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.elements.1.width','100'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.name','\"Content\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.uid','\"ccf41f6d-1493-4186-a5d3-248f4be5f1f8\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.fieldLayouts.7642d4c0-3d5d-4e0e-b94a-0d7e1ae928f2.tabs.0.userCondition','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.handle','\"content__section\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.hasTitleField','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.icon','\"rectangle\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.name','\"Section\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.showSlugField','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.showStatusField','false'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.slugTranslationKeyFormat','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.slugTranslationMethod','\"site\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.titleFormat','\"\"'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.titleTranslationKeyFormat','null'),
('entryTypes.92f8ff6a-4be8-49d9-80bb-870617aa0f85.titleTranslationMethod','\"site\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.color','\"blue\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.autocomplete','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.autocorrect','true'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.class','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.disabled','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.id','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.includeInCards','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.inputType','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.instructions','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.label','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.max','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.min','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.name','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.orientation','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.placeholder','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.readonly','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.requirable','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.size','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.step','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.tip','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.title','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.uid','\"5879bc07-b415-4129-9413-1c97967f7092\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.warning','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.0.width','100'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.fieldUid','\"cd14ae12-0e6a-4f07-9de0-bd0536bd55c1\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.handle','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.includeInCards','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.instructions','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.label','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.required','true'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.tip','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.uid','\"5857e4c0-aeb0-4010-ba79-68f9240106b5\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.warning','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.elements.1.width','100'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.name','\"Content\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.uid','\"adfdf151-29c1-4756-b30f-0565901646a9\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.0.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.fieldUid','\"73f8e366-7f0d-422c-8131-f28b1309cde6\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.handle','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.includeInCards','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.instructions','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.label','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.required','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.tip','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.uid','\"feaccd20-663f-4175-b444-8525668da3a9\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.warning','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.0.width','100'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.elementCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.fieldUid','\"88868b59-0dc8-4932-8fbe-5a8a5fb28762\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.handle','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.includeInCards','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.instructions','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.label','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.providesThumbs','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.required','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.tip','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.uid','\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.warning','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.1.width','25'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.conditionRules.0.fieldUid','\"88868b59-0dc8-4932-8fbe-5a8a5fb28762\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"3d786b5d-d8e7-43a5-8de1-9566d9be075b\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.conditionRules.0.uid','\"0c4b28ff-661d-4f3b-baa2-2b2e0e5102d1\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.conditionRules.0.value','true'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.elementCondition.fieldContext','\"global\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.fieldUid','\"5cf7e469-364f-4258-b9ab-37d6e6395222\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.handle','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.includeInCards','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.instructions','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.label','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.providesThumbs','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.required','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.tip','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.uid','\"5123d8bf-0117-4751-8c71-59ec23ed0163\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.warning','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.elements.2.width','50'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.name','\"Settings\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.uid','\"38421dbf-725a-446f-8ac2-4df16b90c26d\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.fieldLayouts.e6e886e1-5195-4ee0-8d41-8b2a4335d530.tabs.1.userCondition','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.handle','\"content__heading\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.hasTitleField','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.icon','\"text\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.name','\"Heading\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.showSlugField','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.showStatusField','false'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.slugTranslationKeyFormat','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.slugTranslationMethod','\"site\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.titleFormat','\"\"'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.titleTranslationKeyFormat','null'),
('entryTypes.93688f52-2bc2-4914-aac6-0f949e89919e.titleTranslationMethod','\"site\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.color','\"violet\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elementCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.autocomplete','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.autocorrect','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.class','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.disabled','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.elementCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.id','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.inputType','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.max','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.min','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.name','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.orientation','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.placeholder','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.readonly','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.requirable','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.size','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.step','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.title','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.uid','\"c3ebace7-f6b9-400b-b9bc-733bb4785f9e\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.0.width','100'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.elementCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.required','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.uid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.1.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"376ef665-87ad-4726-bd4f-4cef790502b0\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"entryLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.fieldUid','\"61a52075-e8d1-4571-94a5-73b6448cb2e1\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.required','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.uid','\"dcf58cf1-93b2-44eb-a745-53aceb98e22e\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.2.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.layoutElementUid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.uid','\"118befa2-a09e-4a69-9188-990bb0c349c8\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.conditionRules.0.values.0','\"urlLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.elementCondition.fieldContext','\"global\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.fieldUid','\"8e986997-22af-4fce-8225-a1fc3cbb5bac\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.required','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.uid','\"b36e597e-165b-4dbc-80c6-377b92bc053d\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.3.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.layoutElementUid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.uid','\"8b52c3a6-bcda-4611-abc2-f121ffa817f6\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.conditionRules.0.values.0','\"assetLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.elementCondition.fieldContext','\"global\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.fieldUid','\"c849e39d-e259-447a-bdd8-c577bf05b762\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.required','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.uid','\"b1266986-24d9-4882-8a89-22e315c94d5a\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.4.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.layoutElementUid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.uid','\"bfdcc309-b5b8-4b0b-92a6-c7a19cda17a8\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.values.0','\"entryLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.values.1','\"urlLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.conditionRules.0.values.2','\"assetLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.elementCondition.fieldContext','\"global\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.fieldUid','\"7a82df58-7169-4f16-9078-ab400c68ac97\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.required','true'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.uid','\"8d37558b-24c8-463c-b78a-f758d679ddb6\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.5.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.fieldUid','\"52c4e51e-b5d1-433e-8683-073d97a20e51\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.layoutElementUid','\"ca9af274-930f-4a77-812b-0601fad4b3d2\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.uid','\"55627b64-ad3c-4a8f-b130-992fdd744923\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.conditionRules.0.values.0','\"urlLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.elementCondition.fieldContext','\"global\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.fieldUid','\"1803a6fd-4bb9-4613-8953-bcfc78b4e0c7\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.handle','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.includeInCards','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.instructions','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.label','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.providesThumbs','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.required','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.tip','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.uid','\"d6fc0ceb-f110-413f-a669-f53d48bab0ac\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.warning','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.elements.6.width','50'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.name','\"Content\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.uid','\"bee9ce48-4580-49fc-ae3a-646e919098d0\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.fieldLayouts.300461e9-7560-41a7-ba53-516f2af3d005.tabs.0.userCondition','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.handle','\"content__actionLink\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.hasTitleField','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.icon','\"link\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.name','\"Action link\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.showSlugField','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.showStatusField','false'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.slugTranslationKeyFormat','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.slugTranslationMethod','\"site\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.titleFormat','\"\"'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.titleTranslationKeyFormat','null'),
('entryTypes.96349527-2c4a-4eb7-9481-e12be1fa2e29.titleTranslationMethod','\"site\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.color','\"blue\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elementCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.autocomplete','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.autocorrect','true'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.class','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.disabled','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.elementCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.id','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.includeInCards','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.inputType','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.instructions','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.label','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.max','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.min','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.name','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.orientation','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.placeholder','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.readonly','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.requirable','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.size','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.step','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.tip','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.title','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.uid','\"6ae2b20e-698a-4aa4-b34b-00a8273a16ce\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.userCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.warning','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.0.width','100'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.elementCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.fieldUid','\"f532ffc5-e55e-40a0-b01e-70b9c34ba6f6\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.handle','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.includeInCards','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.instructions','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.label','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.required','true'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.tip','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.uid','\"f39d5cc9-26e6-4e4e-95fe-b549a6ce5bfe\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.userCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.warning','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.elements.1.width','100'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.name','\"Content\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.uid','\"034dfd2c-4cd2-4e1a-8f9f-ea2f6cd929dd\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.fieldLayouts.27f3b5db-d1ee-48a4-b3e8-1b8d67396563.tabs.0.userCondition','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.handle','\"content__text\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.hasTitleField','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.icon','\"i-cursor\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.name','\"Text\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.showSlugField','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.showStatusField','false'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.slugTranslationKeyFormat','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.slugTranslationMethod','\"site\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.titleFormat','\"\"'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.titleTranslationKeyFormat','null'),
('entryTypes.af11e5ad-a8af-4df5-a21c-e2608c19edeb.titleTranslationMethod','\"site\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.color','\"blue\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elementCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.autocomplete','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.autocorrect','true'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.class','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.disabled','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.elementCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.id','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.includeInCards','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.inputType','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.instructions','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.label','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.max','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.min','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.name','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.orientation','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.placeholder','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.readonly','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.requirable','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.size','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.step','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.tip','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.title','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.uid','\"8b0e1dc3-4b41-4d7f-9d48-7444d9a445c2\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.userCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.warning','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.0.width','100'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.elementCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.fieldUid','\"cdd0917f-398e-46b8-a373-2fcb84257eca\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.handle','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.includeInCards','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.instructions','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.label','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.required','true'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.tip','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.uid','\"b3631407-f99b-493a-a6c7-757156bdef0f\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.userCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.warning','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.1.width','100'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.elementCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.fieldUid','\"7dd6601d-5a16-4e28-8d2a-2f0340c48b65\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.handle','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.includeInCards','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.instructions','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.label','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.required','true'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.tip','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.uid','\"f9f7a5c3-f36e-4fdf-aab7-3fa94b513cd7\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.userCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.warning','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.elements.2.width','100'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.name','\"Content\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.uid','\"58d25e37-f36d-42c7-8655-48306fd7106b\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.fieldLayouts.ef2abe74-6689-4b90-a4c8-44690f7f0999.tabs.0.userCondition','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.handle','\"acc__item\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.hasTitleField','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.icon','\"table-list\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.name','\"Item\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.showSlugField','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.showStatusField','false'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.slugTranslationKeyFormat','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.slugTranslationMethod','\"site\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.titleFormat','\"\"'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.titleTranslationKeyFormat','null'),
('entryTypes.b53d1a3f-d0be-4181-b4f3-63b2415caf50.titleTranslationMethod','\"site\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.color','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elementCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.autocomplete','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.autocorrect','true'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.class','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.disabled','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.elementCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.id','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.includeInCards','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.inputType','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.instructions','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.label','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.max','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.min','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.name','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.orientation','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.placeholder','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.readonly','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.requirable','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.size','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.step','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.tip','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.title','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.uid','\"9c26dbf5-a3eb-414d-86f1-67a3a3e4eabb\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.userCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.warning','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.0.width','100'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.elementCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.fieldUid','\"a3c239c2-5e16-432d-a651-abff865a4492\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.handle','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.includeInCards','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.instructions','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.label','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.required','true'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.tip','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.uid','\"eb0b6bbc-0765-49b3-9b08-10a95e843441\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.userCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.warning','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.1.width','100'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.elementCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.fieldUid','\"4df4913b-0a34-4362-a115-1480a1f194cf\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.handle','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.includeInCards','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.instructions','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.label','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.required','true'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.tip','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.uid','\"834569c6-545d-4771-82ad-42156eff13ed\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.userCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.warning','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.elements.2.width','100'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.name','\"Content\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.uid','\"6d9e04ed-493c-45e5-9818-0a2f7235ca9d\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.fieldLayouts.8fe3a5a2-0e78-424d-8e6d-b7433afe793c.tabs.0.userCondition','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.handle','\"footer__socialMedia\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.hasTitleField','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.icon','\"thumbs-up\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.name','\"Social media account\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.showSlugField','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.showStatusField','false'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.slugTranslationKeyFormat','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.slugTranslationMethod','\"site\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.titleFormat','\"\"'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.titleTranslationKeyFormat','null'),
('entryTypes.bf96f3a4-eb06-49f8-af84-f939d5426416.titleTranslationMethod','\"site\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.color','\"cyan\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elementCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.autocomplete','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.autocorrect','true'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.class','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.disabled','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.elementCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.id','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.inputType','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.max','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.min','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.name','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.orientation','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.placeholder','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.readonly','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.requirable','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.size','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.step','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.title','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.uid','\"db60901b-a50c-4226-93ff-70e6d4d4e9f9\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.0.width','100'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.elementCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.fieldUid','\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.handle','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.required','true'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.uid','\"1d183407-0aec-43db-b96f-5c5f33946bfa\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.1.width','50'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"1d183407-0aec-43db-b96f-5c5f33946bfa\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"410ed677-15c7-4581-9e7d-26375584a02e\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"videoUrl\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.fieldUid','\"1c25abdf-4ed0-4f3e-9efc-afaa953f4da7\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.handle','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.required','true'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.uid','\"699650bb-f683-4aec-991a-5c7025228420\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.2.width','50'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.fieldUid','\"944eb893-6b00-4c63-b7b9-9ee73630a1f1\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.layoutElementUid','\"1d183407-0aec-43db-b96f-5c5f33946bfa\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.uid','\"9e1d757d-8671-475e-9540-951e278e4a0d\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.conditionRules.0.values.0','\"videoUpload\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.elementCondition.fieldContext','\"global\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.fieldUid','\"3fe2c1d5-8a1b-4113-898e-9819f561f482\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.handle','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.required','true'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.uid','\"c3f9d2c1-e31a-40c3-a6a5-b07e02feede9\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.3.width','50'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.elementCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.fieldUid','\"673cb6e1-eb77-40ba-b02e-122c3a42286a\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.handle','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.required','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.uid','\"01c4396d-db4f-47f8-b03c-c33902559aad\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.4.width','100'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.elementCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.fieldUid','\"3b11d463-accb-41de-ba6b-9331689fa7ce\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.handle','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.includeInCards','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.instructions','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.label','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.providesThumbs','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.required','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.tip','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.uid','\"714970c5-b950-48dd-bfa8-2b0f45454e6c\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.warning','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.elements.5.width','100'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.name','\"Content\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.uid','\"7c65d4f7-7303-4dc3-8f45-eece8060b2da\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.fieldLayouts.81dcc96a-7ab4-4769-8ea2-062a0f3838e1.tabs.0.userCondition','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.handle','\"content__video\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.hasTitleField','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.icon','\"video\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.name','\"Video\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.showSlugField','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.showStatusField','false'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.slugTranslationKeyFormat','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.slugTranslationMethod','\"site\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.titleFormat','\"\"'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.titleTranslationKeyFormat','null'),
('entryTypes.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc.titleTranslationMethod','\"site\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.color','\"violet\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elementCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.autocomplete','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.autocorrect','true'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.class','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.disabled','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.elementCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.id','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.includeInCards','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.inputType','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.instructions','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.label','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.max','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.min','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.name','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.orientation','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.placeholder','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.readonly','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.requirable','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.size','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.step','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.tip','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.title','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.uid','\"07eb0d3b-91c4-4de0-b420-b361f7169d5c\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.userCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.warning','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.0.width','100'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.elementCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.fieldUid','\"506d8357-6bb1-4b98-aa31-628a66d53cfb\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.handle','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.includeInCards','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.instructions','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.label','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.required','true'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.tip','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.uid','\"9d69ddf9-4c31-4f99-a527-b0a088d45599\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.userCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.warning','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.elements.1.width','100'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.name','\"Content\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.uid','\"e7fc8f61-0f08-4d55-b789-c371e90ce67d\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.0.userCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elementCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.elementCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.fieldUid','\"05ad0930-f6fa-430f-a8d6-f29e553e30dc\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.handle','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.includeInCards','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.instructions','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.label','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.required','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.tip','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.uid','\"eda4d11d-5de8-4194-b4c8-d49fa86ac14d\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.userCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.warning','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.elements.0.width','100'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.name','\"Settings\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.uid','\"514a827a-6bfc-4457-9b47-28571f50004c\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.fieldLayouts.27648bfa-f6f4-4ee8-bc57-27c9a3ff971e.tabs.1.userCondition','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.handle','\"entryCards\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.hasTitleField','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.icon','\"grid\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.name','\"Entry cards\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.showSlugField','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.showStatusField','false'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.slugTranslationKeyFormat','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.slugTranslationMethod','\"site\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.titleFormat','\"\"'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.titleTranslationKeyFormat','null'),
('entryTypes.c465af7a-827f-45c8-9e47-f9c38f3d83ac.titleTranslationMethod','\"site\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.color','\"blue\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elementCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.autocomplete','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.autocorrect','true'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.class','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.disabled','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.elementCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.id','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.includeInCards','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.inputType','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.instructions','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.label','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.max','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.min','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.name','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.orientation','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.placeholder','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.readonly','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.requirable','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.size','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.step','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.tip','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.title','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.uid','\"5f0f4067-8cb7-4fcd-a32a-922abcb9ed74\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.userCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.warning','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.0.width','100'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.elementCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.fieldUid','\"d0fc3bd4-7289-4c25-ab69-5e6b7d086eed\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.handle','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.includeInCards','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.instructions','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.label','\"__blank__\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.required','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.tip','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.uid','\"8de2139a-fa64-461f-98e5-f033d2853ed5\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.userCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.warning','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.elements.1.width','100'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.name','\"Content\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.uid','\"cacc48d7-58e2-48b8-8811-cf60c738a443\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.fieldLayouts.40f62781-6812-44e4-9db3-86bcdc6a6a22.tabs.0.userCondition','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.handle','\"content__accordions\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.hasTitleField','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.icon','\"table-list\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.name','\"Accordions\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.showSlugField','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.showStatusField','false'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.slugTranslationKeyFormat','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.slugTranslationMethod','\"site\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.titleFormat','\"\"'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.titleTranslationKeyFormat','null'),
('entryTypes.f030fb15-80d7-484b-b74f-0e51dc2d82c8.titleTranslationMethod','\"site\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.columnSuffix','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.handle','\"footer__legalNav\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.instructions','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.name','\"Legal nav\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.searchable','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.allowSelfRelations','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.branchLimit','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.localizeRelations','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.maintainHierarchy','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.maxRelations','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.minRelations','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.selectionLabel','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.showCardsInGrid','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.showSiteMenu','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.sources.0','\"section:ffb3da3c-2f4d-47a3-a021-d496e6c5516a\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.targetSiteId','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.validateRelatedElements','false'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.settings.viewMode','\"list\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.translationKeyFormat','null'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.translationMethod','\"site\"'),
('fields.0217698d-d0e4-4110-89bf-12e604fb40fe.type','\"craft\\\\fields\\\\Entries\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.columnSuffix','null'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.handle','\"entryCards__columns\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.instructions','null'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.name','\"Columns\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.searchable','false'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.settings.default','true'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.settings.offLabel','\"2\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.settings.onLabel','\"3\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.translationKeyFormat','null'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.translationMethod','\"none\"'),
('fields.05ad0930-f6fa-430f-a8d6-f29e553e30dc.type','\"craft\\\\fields\\\\Lightswitch\"'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.columnSuffix','null'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.handle','\"action__linkTarget\"'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.instructions','null'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.name','\"Open in a new window?\"'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.searchable','false'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.settings.default','false'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.settings.offLabel','null'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.settings.onLabel','null'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.translationKeyFormat','null'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.translationMethod','\"none\"'),
('fields.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7.type','\"craft\\\\fields\\\\Lightswitch\"'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.columnSuffix','null'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.handle','\"video__videoUrl\"'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.instructions','null'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.name','\"Video URL\"'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.searchable','false'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.settings.maxLength','255'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.settings.types.0','\"url\"'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.translationKeyFormat','null'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.translationMethod','\"none\"'),
('fields.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7.type','\"craft\\\\fields\\\\Url\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.columnSuffix','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.handle','\"video__transcript\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.instructions','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.name','\"Transcript\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.searchable','false'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.availableTransforms','\"\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.availableVolumes','\"*\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.ckeConfig','\"125a39f1-c7fd-462c-beff-e3dfd421bec7\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.createButtonLabel','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.defaultTransform','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.enableSourceEditingForNonAdmins','false'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.purifierConfig','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.purifyHtml','true'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.showUnpermittedFiles','false'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.showUnpermittedVolumes','false'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.showWordCount','false'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.settings.wordLimit','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.translationKeyFormat','null'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.translationMethod','\"none\"'),
('fields.3b11d463-accb-41de-ba6b-9331689fa7ce.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.columnSuffix','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.handle','\"video__videoFile\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.instructions','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.name','\"Video file\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.searchable','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.allowedKinds.0','\"video\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.allowSelfRelations','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.allowSubfolders','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.allowUploads','true'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.branchLimit','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.defaultUploadLocationSource','\"volume:10d1394f-6863-440f-945c-891da0c65bad\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.defaultUploadLocationSubpath','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.localizeRelations','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.maintainHierarchy','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.maxRelations','1'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.minRelations','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.previewMode','\"full\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.restrictedDefaultUploadSubpath','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.restrictedLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.restrictedLocationSubpath','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.restrictFiles','true'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.restrictLocation','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.selectionLabel','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.showCardsInGrid','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.showSiteMenu','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.showUnpermittedFiles','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.showUnpermittedVolumes','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.sources.0','\"volume:10d1394f-6863-440f-945c-891da0c65bad\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.targetSiteId','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.validateRelatedElements','false'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.settings.viewMode','\"list\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.translationKeyFormat','null'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.translationMethod','\"site\"'),
('fields.3fe2c1d5-8a1b-4113-898e-9819f561f482.type','\"craft\\\\fields\\\\Assets\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.columnSuffix','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.handle','\"cta__image\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.instructions','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.name','\"Image\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.searchable','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.allowedKinds.0','\"image\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.allowSelfRelations','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.allowSubfolders','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.allowUploads','true'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.branchLimit','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.defaultUploadLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.defaultUploadLocationSubpath','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.localizeRelations','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.maintainHierarchy','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.maxRelations','1'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.minRelations','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.previewMode','\"full\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.restrictedDefaultUploadSubpath','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.restrictedLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.restrictedLocationSubpath','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.restrictFiles','true'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.restrictLocation','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.selectionLabel','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.showCardsInGrid','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.showSiteMenu','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.showUnpermittedFiles','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.showUnpermittedVolumes','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.sources.0','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.targetSiteId','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.validateRelatedElements','false'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.settings.viewMode','\"list\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.translationKeyFormat','null'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.translationMethod','\"site\"'),
('fields.42fdb1ca-7367-4cf5-9375-37416cbc8615.type','\"craft\\\\fields\\\\Assets\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.columnSuffix','null'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.handle','\"listByChannel\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.instructions','null'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.name','\"List by channel\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.searchable','false'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.0.1','\"Select\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.1.1','\"\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.0.__assoc__.2.1','\"1\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.0.1','\"Blog\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.1.1','\"blog\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.1.__assoc__.2.1','\"\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.0.1','\"News\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.1.1','\"news\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.2.0','\"default\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.settings.options.2.__assoc__.2.1','\"\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.translationKeyFormat','null'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.translationMethod','\"none\"'),
('fields.4cd374ac-6a5a-483e-b17d-223382d6d4a1.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.columnSuffix','null'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.handle','\"socialMedia__profileUrl\"'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.instructions','null'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.name','\"Profile URL\"'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.searchable','false'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.settings.maxLength','255'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.settings.types.0','\"url\"'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.translationKeyFormat','null'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.translationMethod','\"none\"'),
('fields.4df4913b-0a34-4362-a115-1480a1f194cf.type','\"craft\\\\fields\\\\Url\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.columnSuffix','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.handle','\"entryCards__entries\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.instructions','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.name','\"Entries\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.searchable','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.allowSelfRelations','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.branchLimit','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.localizeRelations','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.maintainHierarchy','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.maxRelations','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.minRelations','1'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.selectionLabel','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.showCardsInGrid','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.showSiteMenu','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.sources','\"*\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.targetSiteId','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.validateRelatedElements','false'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.settings.viewMode','\"list\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.translationKeyFormat','null'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.translationMethod','\"site\"'),
('fields.506d8357-6bb1-4b98-aa31-628a66d53cfb.type','\"craft\\\\fields\\\\Entries\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.columnSuffix','null'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.handle','\"action__option\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.instructions','null'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.name','\"Option\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.searchable','false'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.0.1','\"Select\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.1.1','\"\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.0.__assoc__.2.1','\"\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.0.1','\"Internal (entry) link\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.1.1','\"entryLink\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.1.__assoc__.2.1','\"\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.0.1','\"External (URL) link\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.1.1','\"urlLink\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.2.0','\"default\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.2.__assoc__.2.1','\"\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.0.0','\"label\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.0.1','\"Download (asset) link\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.1.0','\"value\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.1.1','\"assetLink\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.2.0','\"default\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.settings.options.3.__assoc__.2.1','\"\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.translationKeyFormat','null'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.translationMethod','\"none\"'),
('fields.52c4e51e-b5d1-433e-8683-073d97a20e51.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.53112398-e0df-4ef1-976b-8272da500720.columnSuffix','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.handle','\"standfirst\"'),
('fields.53112398-e0df-4ef1-976b-8272da500720.instructions','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.name','\"Standfirst\"'),
('fields.53112398-e0df-4ef1-976b-8272da500720.searchable','true'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.byteLimit','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.charLimit','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.code','false'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.initialRows','2'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.multiline','true'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.placeholder','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.settings.uiMode','\"normal\"'),
('fields.53112398-e0df-4ef1-976b-8272da500720.translationKeyFormat','null'),
('fields.53112398-e0df-4ef1-976b-8272da500720.translationMethod','\"none\"'),
('fields.53112398-e0df-4ef1-976b-8272da500720.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.columnSuffix','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.handle','\"heading__jumpLinkText\"'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.instructions','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.name','\"Jump link text (optional)\"'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.searchable','true'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.byteLimit','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.charLimit','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.code','false'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.initialRows','4'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.multiline','false'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.placeholder','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.settings.uiMode','\"normal\"'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.translationKeyFormat','null'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.translationMethod','\"none\"'),
('fields.5cf7e469-364f-4258-b9ab-37d6e6395222.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.columnSuffix','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.handle','\"cta__actionLink\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.instructions','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.name','\"Action link\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.searchable','false'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.createButtonLabel','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.entryTypes.0','\"96349527-2c4a-4eb7-9481-e12be1fa2e29\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.includeTableView','false'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.maxEntries','1'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.minEntries','1'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.pageSize','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.propagationKeyFormat','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.propagationMethod','\"all\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.showCardsInGrid','false'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.settings.viewMode','\"blocks\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.translationKeyFormat','null'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.translationMethod','\"site\"'),
('fields.604eaaf1-80fd-42f6-aa9f-3c91970e89aa.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.columnSuffix','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.handle','\"action__entryLink\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.instructions','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.name','\"Entry link\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.searchable','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.allowSelfRelations','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.branchLimit','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.localizeRelations','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.maintainHierarchy','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.maxRelations','1'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.minRelations','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.selectionLabel','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.showCardsInGrid','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.showSiteMenu','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.sources','\"*\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.targetSiteId','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.validateRelatedElements','false'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.settings.viewMode','\"list\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.translationKeyFormat','null'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.translationMethod','\"site\"'),
('fields.61a52075-e8d1-4571-94a5-73b6448cb2e1.type','\"craft\\\\fields\\\\Entries\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.columnSuffix','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.handle','\"video__coverImage\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.instructions','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.name','\"Cover image\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.searchable','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.allowedKinds','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.allowSelfRelations','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.allowSubfolders','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.allowUploads','true'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.branchLimit','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.defaultUploadLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.defaultUploadLocationSubpath','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.localizeRelations','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.maintainHierarchy','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.maxRelations','1'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.minRelations','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.previewMode','\"full\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.restrictedDefaultUploadSubpath','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.restrictedLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.restrictedLocationSubpath','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.restrictFiles','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.restrictLocation','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.selectionLabel','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.showCardsInGrid','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.showSiteMenu','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.showUnpermittedFiles','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.showUnpermittedVolumes','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.sources.0','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.targetSiteId','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.validateRelatedElements','false'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.settings.viewMode','\"list\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.translationKeyFormat','null'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.translationMethod','\"site\"'),
('fields.673cb6e1-eb77-40ba-b02e-122c3a42286a.type','\"craft\\\\fields\\\\Assets\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.columnSuffix','null'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.handle','\"heading__size\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.instructions','null'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.name','\"Size\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.searchable','false'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.0.1','\"Heading level 2\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.1.1','\"h2\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.0.__assoc__.2.1','\"1\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.0.1','\"Heading level 3\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.1.1','\"h3\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.1.__assoc__.2.1','\"\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.0.1','\"Heading level 4\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.1.1','\"h4\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.2.0','\"default\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.settings.options.2.__assoc__.2.1','\"\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.translationKeyFormat','null'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.translationMethod','\"none\"'),
('fields.73f8e366-7f0d-422c-8131-f28b1309cde6.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.columnSuffix','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.handle','\"action__linkText\"'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.instructions','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.name','\"Link text\"'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.searchable','true'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.byteLimit','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.charLimit','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.code','false'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.initialRows','4'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.multiline','false'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.placeholder','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.settings.uiMode','\"normal\"'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.translationKeyFormat','null'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.translationMethod','\"none\"'),
('fields.7a82df58-7169-4f16-9078-ab400c68ac97.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.columnSuffix','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.handle','\"acc__content\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.instructions','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.name','\"Content\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.searchable','true'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.createButtonLabel','\"Content\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.entryTypes.0','\"af11e5ad-a8af-4df5-a21c-e2608c19edeb\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.entryTypes.1','\"409117cb-de3e-4900-82ec-2a7440e33e84\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.entryTypes.2','\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.entryTypes.3','\"96349527-2c4a-4eb7-9481-e12be1fa2e29\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.includeTableView','false'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.maxEntries','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.minEntries','1'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.pageSize','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.propagationKeyFormat','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.propagationMethod','\"all\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.showCardsInGrid','false'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.settings.viewMode','\"blocks\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.translationKeyFormat','null'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.translationMethod','\"site\"'),
('fields.7dd6601d-5a16-4e28-8d2a-2f0340c48b65.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.columnSuffix','null'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.handle','\"heading__jumpLink\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.instructions','null'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.name','\"Add to jump link\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.searchable','false'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.settings.default','false'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.settings.offLabel','\"Remove\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.settings.onLabel','\"Add\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.translationKeyFormat','null'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.translationMethod','\"none\"'),
('fields.88868b59-0dc8-4932-8fbe-5a8a5fb28762.type','\"craft\\\\fields\\\\Lightswitch\"'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.columnSuffix','null'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.handle','\"action__urlLink\"'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.instructions','null'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.name','\"URL link\"'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.searchable','false'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.settings.maxLength','255'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.settings.types.0','\"url\"'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.translationKeyFormat','null'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.translationMethod','\"none\"'),
('fields.8e986997-22af-4fce-8225-a1fc3cbb5bac.type','\"craft\\\\fields\\\\Url\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.columnSuffix','null'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.handle','\"video__option\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.instructions','null'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.name','\"Option\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.searchable','false'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.0.1','\"Select\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.1.1','\"\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.0.__assoc__.2.1','\"\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.0.1','\"Vimeo or Youtube\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.1.1','\"videoUrl\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.1.__assoc__.2.1','\"\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.0.1','\"Upload\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.1.1','\"videoUpload\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.2.0','\"default\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.settings.options.2.__assoc__.2.1','\"\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.translationKeyFormat','null'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.translationMethod','\"none\"'),
('fields.944eb893-6b00-4c63-b7b9-9ee73630a1f1.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.columnSuffix','null'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.handle','\"seo\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.instructions','null'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.name','\"SEO\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.searchable','true'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.elementDisplayPreviewType','\"google\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.0','\"seoPreview\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.1','\"ogType\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.2','\"ogTitle\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.3','\"ogSiteNamePosition\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.4','\"ogDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.5','\"ogImage\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookEnabledFields.6','\"ogImageDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.facebookTabEnabled','\"1\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.0','\"seoPreview\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.1','\"mainEntityOfPage\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.2','\"seoTitle\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.3','\"siteNamePosition\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.4','\"seoDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.5','\"seoImage\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.6','\"seoImageDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalEnabledFields.7','\"robots\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.generalTabEnabled','\"1\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.sitemapEnabledFields.0','\"sitemapUrls\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.sitemapTabEnabled','\"1\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.0','\"seoPreview\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.1','\"twitterCardType\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.2','\"twitterCreator\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.3','\"twitterTitle\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.4','\"twitterSiteNamePosition\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.5','\"twitterDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.6','\"twitterImage\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterEnabledFields.7','\"twitterImageDescription\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.settings.twitterTabEnabled','\"1\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.translationKeyFormat','null'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.translationMethod','\"none\"'),
('fields.95870b87-85c2-4fda-97ad-3dab5f1c81e9.type','\"nystudio107\\\\seomatic\\\\fields\\\\SeoSettings\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.columnSuffix','null'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.handle','\"socialMedia__platform\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.instructions','null'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.name','\"Platform\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.searchable','false'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.0.1','\"Select\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.1.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.0.__assoc__.2.1','\"1\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.0.1','\"Facebook\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.1.1','\"facebook\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.1.__assoc__.2.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.0.1','\"Instagram\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.1.1','\"instagram\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.2.__assoc__.2.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.0.1','\"Linkedin\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.1.1','\"linkedin\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.3.__assoc__.2.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.0.1','\"YouTube\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.1.1','\"youtube\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.4.__assoc__.2.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.0.0','\"label\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.0.1','\"Pinterest\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.1.0','\"value\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.1.1','\"pinterest\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.2.0','\"default\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.settings.options.5.__assoc__.2.1','\"\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.translationKeyFormat','null'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.translationMethod','\"none\"'),
('fields.a3c239c2-5e16-432d-a651-abff865a4492.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.columnSuffix','null'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.handle','\"image__imageRatio\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.instructions','null'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.name','\"Image ratio\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.searchable','false'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.0.1','\"Standard (16:9)\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.1.1','\"standard\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.2.0','\"default\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.0.__assoc__.2.1','\"1\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.0.1','\"Fit (non-crop)\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.1.1','\"fit\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.2.0','\"default\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.settings.options.1.__assoc__.2.1','\"\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.translationKeyFormat','null'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.translationMethod','\"none\"'),
('fields.adf10d1b-d5b5-4564-a880-732b9ec4e22c.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.columnSuffix','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.handle','\"footer__socialMedia\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.instructions','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.name','\"Social media accounts\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.searchable','false'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.createButtonLabel','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.entryTypes.0','\"bf96f3a4-eb06-49f8-af84-f939d5426416\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.includeTableView','false'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.maxEntries','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.minEntries','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.pageSize','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.propagationKeyFormat','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.propagationMethod','\"all\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.showCardsInGrid','false'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.settings.viewMode','\"blocks\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.translationKeyFormat','null'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.translationMethod','\"site\"'),
('fields.ae279549-89d9-41f5-bdcb-cad0dcb85925.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.columnSuffix','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.handle','\"image__image\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.instructions','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.name','\"Image\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.searchable','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.allowedKinds.0','\"image\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.allowSelfRelations','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.allowSubfolders','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.allowUploads','true'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.branchLimit','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.defaultUploadLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.defaultUploadLocationSubpath','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.localizeRelations','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.maintainHierarchy','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.maxRelations','1'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.minRelations','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.previewMode','\"full\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.restrictedDefaultUploadSubpath','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.restrictedLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.restrictedLocationSubpath','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.restrictFiles','true'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.restrictLocation','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.selectionLabel','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.showCardsInGrid','true'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.showSiteMenu','true'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.showUnpermittedFiles','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.showUnpermittedVolumes','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.sources.0','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.targetSiteId','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.validateRelatedElements','false'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.settings.viewMode','\"large\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.translationKeyFormat','null'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.translationMethod','\"site\"'),
('fields.b502800f-c7b7-47b3-85b1-a0d7a179ea00.type','\"craft\\\\fields\\\\Assets\"'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.columnSuffix','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.handle','\"image__caption\"'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.instructions','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.name','\"Caption\"'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.searchable','true'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.byteLimit','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.charLimit','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.code','false'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.initialRows','1'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.multiline','true'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.placeholder','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.settings.uiMode','\"normal\"'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.translationKeyFormat','null'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.translationMethod','\"none\"'),
('fields.ba07e685-77b8-422c-a2ff-2c5ba52decc3.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.columnSuffix','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.handle','\"content__section\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.instructions','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.name','\"Section\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.searchable','true'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.createButtonLabel','\"Content\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.0','\"93688f52-2bc2-4914-aac6-0f949e89919e\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.1','\"af11e5ad-a8af-4df5-a21c-e2608c19edeb\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.2','\"409117cb-de3e-4900-82ec-2a7440e33e84\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.3','\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.4','\"f030fb15-80d7-484b-b74f-0e51dc2d82c8\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.5','\"96349527-2c4a-4eb7-9481-e12be1fa2e29\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.6','\"3354af91-f989-4740-bdd2-65c9630089b2\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.entryTypes.7','\"c465af7a-827f-45c8-9e47-f9c38f3d83ac\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.includeTableView','false'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.maxEntries','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.minEntries','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.pageSize','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.propagationKeyFormat','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.propagationMethod','\"all\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.showCardsInGrid','false'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.settings.viewMode','\"blocks\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.translationKeyFormat','null'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.translationMethod','\"site\"'),
('fields.bb5fd73c-d0d3-44b5-a992-476eb9b739a4.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.columnSuffix','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.handle','\"registration\"'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.instructions','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.name','\"Registration details\"'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.searchable','true'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.byteLimit','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.charLimit','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.code','false'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.initialRows','1'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.multiline','true'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.placeholder','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.settings.uiMode','\"normal\"'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.translationKeyFormat','null'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.translationMethod','\"none\"'),
('fields.c6072259-9bf9-4ec5-bcf4-32119fef2e0b.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.columnSuffix','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.handle','\"action__assetLink\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.instructions','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.name','\"Asset link\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.searchable','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowedKinds.0','\"excel\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowedKinds.1','\"pdf\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowedKinds.2','\"powerpoint\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowedKinds.3','\"text\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowedKinds.4','\"word\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowSelfRelations','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowSubfolders','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.allowUploads','true'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.branchLimit','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.defaultUploadLocationSource','\"volume:d8da528a-5de1-4ea5-9278-983c10cfe9a5\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.defaultUploadLocationSubpath','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.localizeRelations','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.maintainHierarchy','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.maxRelations','1'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.minRelations','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.previewMode','\"full\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.restrictedDefaultUploadSubpath','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.restrictedLocationSource','\"volume:9d1bef95-d78d-4735-952e-4b60158cf167\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.restrictedLocationSubpath','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.restrictFiles','true'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.restrictLocation','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.selectionLabel','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.showCardsInGrid','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.showSiteMenu','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.showUnpermittedFiles','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.showUnpermittedVolumes','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.sources.0','\"volume:d8da528a-5de1-4ea5-9278-983c10cfe9a5\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.targetSiteId','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.validateRelatedElements','false'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.settings.viewMode','\"list\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.translationKeyFormat','null'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.translationMethod','\"site\"'),
('fields.c849e39d-e259-447a-bdd8-c577bf05b762.type','\"craft\\\\fields\\\\Assets\"'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.columnSuffix','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.handle','\"heading__heading\"'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.instructions','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.name','\"Heading\"'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.searchable','true'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.byteLimit','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.charLimit','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.code','false'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.initialRows','4'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.multiline','false'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.placeholder','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.settings.uiMode','\"normal\"'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.translationKeyFormat','null'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.translationMethod','\"none\"'),
('fields.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.columnSuffix','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.handle','\"acc__heading\"'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.instructions','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.name','\"Heading\"'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.searchable','true'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.byteLimit','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.charLimit','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.code','false'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.initialRows','4'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.multiline','false'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.placeholder','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.settings.uiMode','\"normal\"'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.translationKeyFormat','null'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.translationMethod','\"none\"'),
('fields.cdd0917f-398e-46b8-a373-2fcb84257eca.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.columnSuffix','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.handle','\"cta__text\"'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.instructions','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.name','\"Text\"'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.searchable','true'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.byteLimit','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.charLimit','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.code','false'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.initialRows','2'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.multiline','true'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.placeholder','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.settings.uiMode','\"normal\"'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.translationKeyFormat','null'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.translationMethod','\"none\"'),
('fields.cf947787-479e-4889-93cf-2a7b62aafac4.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.columnSuffix','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.handle','\"video\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.instructions','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.name','\"Video\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.searchable','false'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.createButtonLabel','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.entryTypes.0','\"c0a70d36-1182-4a66-aad7-1cbfbe3da1dc\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.includeTableView','false'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.maxEntries','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.minEntries','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.pageSize','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.propagationKeyFormat','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.propagationMethod','\"all\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.showCardsInGrid','false'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.settings.viewMode','\"blocks\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.translationKeyFormat','null'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.translationMethod','\"site\"'),
('fields.d0247de8-ec57-403b-b334-bbf9703049f8.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.columnSuffix','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.handle','\"acc__accordion\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.instructions','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.name','\"Accordion\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.searchable','true'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.createButtonLabel','\"Item\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.entryTypes.0','\"b53d1a3f-d0be-4181-b4f3-63b2415caf50\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.includeTableView','false'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.maxEntries','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.minEntries','1'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.pageSize','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.propagationKeyFormat','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.propagationMethod','\"all\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.showCardsInGrid','false'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.settings.viewMode','\"blocks\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.translationKeyFormat','null'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.translationMethod','\"site\"'),
('fields.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.columnSuffix','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.handle','\"image\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.instructions','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.name','\"Image\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.searchable','false'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.createButtonLabel','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.entryTypes.0','\"409117cb-de3e-4900-82ec-2a7440e33e84\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.includeTableView','false'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.maxEntries','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.minEntries','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.pageSize','50'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.propagationKeyFormat','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.propagationMethod','\"all\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.showCardsInGrid','false'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.settings.viewMode','\"cards\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.translationKeyFormat','null'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.translationMethod','\"site\"'),
('fields.d4b5dd99-9088-494e-b54b-39b5d76840f0.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.columnSuffix','null'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.handle','\"internalSearch\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.instructions','\"This won\'t help you with SEO – it\'s only for the internal Craft search function. Add the search terms that you want the entry to appear for in the internal search results but are typos or misspelt (so you don\'t want to display them in the page content). Separate the terms with a comma.\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.name','\"Internal search keywords\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.searchable','true'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.byteLimit','null'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.charLimit','null'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.code','false'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.initialRows','4'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.multiline','false'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.placeholder','null'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.settings.uiMode','\"normal\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.translationKeyFormat','null'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.translationMethod','\"none\"'),
('fields.e9f404d8-0076-45fc-aa9e-76a69b393f81.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.columnSuffix','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.handle','\"content__content\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.instructions','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.name','\"Content\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.searchable','true'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.createButtonLabel','\"Section\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.entryTypes.0','\"92f8ff6a-4be8-49d9-80bb-870617aa0f85\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.includeTableView','false'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.maxEntries','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.minEntries','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.pageSize','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.propagationKeyFormat','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.propagationMethod','\"all\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.showCardsInGrid','false'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.settings.viewMode','\"blocks\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.translationKeyFormat','null'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.translationMethod','\"site\"'),
('fields.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.columnSuffix','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.handle','\"text__text\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.instructions','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.name','\"Text\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.searchable','true'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.availableTransforms','\"\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.availableVolumes','\"*\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.ckeConfig','\"bc60a081-9838-490c-abd8-4401a5bd6e1e\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.createButtonLabel','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.defaultTransform','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.enableSourceEditingForNonAdmins','false'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.purifierConfig','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.purifyHtml','true'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.showUnpermittedFiles','false'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.showUnpermittedVolumes','false'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.showWordCount','false'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.settings.wordLimit','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.translationKeyFormat','null'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.translationMethod','\"none\"'),
('fields.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.columnSuffix','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.handle','\"cta__heading\"'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.instructions','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.name','\"Heading\"'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.searchable','true'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.byteLimit','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.charLimit','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.code','false'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.initialRows','4'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.multiline','false'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.placeholder','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.settings.uiMode','\"normal\"'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.translationKeyFormat','null'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.translationMethod','\"none\"'),
('fields.fb678e73-288b-42c7-8c19-27c44d13f324.type','\"craft\\\\fields\\\\PlainText\"'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.color','\"green\"'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.description','null'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.handle','\"new\"'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.isDefault','true'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.name','\"New\"'),
('formie.statuses.b85f18dc-5c7d-4c3d-be23-437b9c3675f3.sortOrder','1'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.dataRetention','\"forever\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.dataRetentionValue','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.fileUploadsAction','\"retain\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.attachFiles','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.name','\"Admin Notification\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.replyTo','\"{field:emailAddress}\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.subject','\"A new submission was made on \\\"{formName}\\\"\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.0.to','\"{systemEmail}\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.attachFiles','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.content','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.name','\"User Notification\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.replyTo','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.subject','\"Thanks for contacting us!\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.notifications.1.to','\"{field:emailAddress}\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.label','\"Page 1\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.handle','\"yourName\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.instructions','\"Please enter your full name.\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.instructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.label','\"Your Name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.labelPosition','\"verbb\\\\formie\\\\positions\\\\Hidden\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.placeholder','\"Your name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.required','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.enabled','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.handle','\"prefix\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.inputAttributes.0.label','\"autocomplete\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.inputAttributes.0.value','\"honorific-prefix\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.label','\"Prefix\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.isDefault','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.isOptgroup','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.label','\"Select an option\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.options.0.value','\"\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.settings.required','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NamePrefix\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.handle','\"firstName\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.inputAttributes.0.label','\"autocomplete\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.inputAttributes.0.value','\"given-name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.label','\"First Name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.placeholder','\"e.g. Peter\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.settings.required','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.1.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameFirst\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.enabled','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.handle','\"middleName\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.inputAttributes.0.label','\"autocomplete\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.inputAttributes.0.value','\"additional-name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.label','\"Middle Name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.settings.required','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.2.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameMiddle\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.handle','\"lastName\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.inputAttributes.0.label','\"autocomplete\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.inputAttributes.0.value','\"family-name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.label','\"Last Name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.placeholder','\"e.g. Sherman\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.settings.required','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.rows.0.fields.3.type','\"verbb\\\\formie\\\\fields\\\\subfields\\\\NameLast\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.settings.useMultipleFields','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.0.fields.0.type','\"verbb\\\\formie\\\\fields\\\\Name\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.handle','\"emailAddress\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.instructions','\"Please enter your email so we can get in touch.\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.label','\"Email Address\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.placeholder','\"e.g. psherman@wallaby.com\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.settings.required','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.1.fields.0.type','\"verbb\\\\formie\\\\fields\\\\Email\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.enabled','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.handle','\"message\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.instructions','\"Please enter your comments.\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.label','\"Message\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.placeholder','\"e.g. The reason for my enquiry is...\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.settings.required','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.rows.2.fields.0.type','\"verbb\\\\formie\\\\fields\\\\MultiLineText\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.backButtonLabel','\"Back\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.buttonsPosition','\"left\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.saveButtonLabel','\"Save\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.saveButtonStyle','\"link\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.showBackButton','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.showSaveButton','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.pages.0.settings.submitButtonLabel','\"Contact us\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.collectIp','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.collectUser','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.dataRetention','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.dataRetentionValue','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.defaultEmailTemplateId','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.disableCaptchas','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.displayCurrentPageTitle','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.displayFormTitle','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.displayPageProgress','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.displayPageTabs','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.errorMessage','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.errorMessagePosition','\"top-form\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.fileUploadsAction','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.limitSubmissions','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.limitSubmissionsMessage','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.limitSubmissionsNumber','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.limitSubmissionsType','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.loadingIndicator','\"spinner\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.loadingIndicatorText','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.pageRedirectUrl','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.progressPosition','\"end\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.redirectUrl','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.requiredIndicator','\"asterisk\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.requireUser','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.requireUserMessage','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scheduleForm','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scheduleFormEnd','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scheduleFormExpiredMessage','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scheduleFormPendingMessage','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scheduleFormStart','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.scrollToTop','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submissionTitleFormat','\"{timestamp}\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitAction','\"message\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionFormHide','false'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionMessage','\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\\\"}]}]\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionMessagePosition','\"top-form\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionMessageTimeout','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionTab','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitActionUrl','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.submitMethod','\"ajax\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.validationOnFocus','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.settings.validationOnSubmit','true'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.data.userDeletedAction','\"retain\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.defaultStatus','\"b85f18dc-5c7d-4c3d-be23-437b9c3675f3\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.handle','\"contactForm\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.name','\"Contact Form\"'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.submitActionEntry','null'),
('formie.stencils.3031c488-fd65-4a4c-b69b-770f27f5fd77.template','null'),
('fs.documents.hasUrls','true'),
('fs.documents.name','\"Documents\"'),
('fs.documents.settings.path','\"@webroot/assets/documents\"'),
('fs.documents.type','\"craft\\\\fs\\\\Local\"'),
('fs.documents.url','\"@web/assets/documents\"'),
('fs.icons.hasUrls','true'),
('fs.icons.name','\"Icons\"'),
('fs.icons.settings.path','\"@webroot/assets/icons\"'),
('fs.icons.type','\"craft\\\\fs\\\\Local\"'),
('fs.icons.url','\"@web/assets/icons\"'),
('fs.images.hasUrls','true'),
('fs.images.name','\"Images\"'),
('fs.images.settings.path','\"@webroot/assets/images\"'),
('fs.images.type','\"craft\\\\fs\\\\Local\"'),
('fs.images.url','\"@web/assets/images\"'),
('fs.logos.hasUrls','true'),
('fs.logos.name','\"Logos\"'),
('fs.logos.settings.path','\"@webroot/assets/logos\"'),
('fs.logos.type','\"craft\\\\fs\\\\Local\"'),
('fs.logos.url','\"@web/assets/logos\"'),
('fs.videos.hasUrls','true'),
('fs.videos.name','\"Videos\"'),
('fs.videos.settings.path','\"@webroot/assets/videos\"'),
('fs.videos.type','\"craft\\\\fs\\\\Local\"'),
('fs.videos.url','\"@web/assets/videos\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elementCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.elementCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.fieldUid','\"ae279549-89d9-41f5-bdcb-cad0dcb85925\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.handle','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.includeInCards','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.instructions','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.label','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.providesThumbs','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.required','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.tip','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.uid','\"9a2e0a80-b650-4609-868c-64a309094c7c\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.userCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.warning','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.elements.0.width','100'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.name','\"Social media\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.uid','\"2120c724-b70d-4d9d-8ee6-389b30cd64b2\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.0.userCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elementCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.elementCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.fieldUid','\"c6072259-9bf9-4ec5-bcf4-32119fef2e0b\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.handle','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.includeInCards','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.instructions','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.label','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.providesThumbs','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.required','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.tip','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.uid','\"3ae2f86e-c5f8-41fc-9817-e8919a5785b5\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.userCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.warning','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.0.width','100'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.elementCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.fieldUid','\"0217698d-d0e4-4110-89bf-12e604fb40fe\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.handle','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.includeInCards','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.instructions','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.label','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.providesThumbs','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.required','false'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.tip','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.uid','\"c81734d2-98c2-4ad3-8393-874dba0a2f69\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.userCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.warning','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.elements.1.width','100'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.name','\"Legal\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.uid','\"defafc7a-09c2-4108-8ba2-a3a577eb18c7\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.fieldLayouts.54b20a13-6e82-4e22-914b-3ff6ac2baa43.tabs.1.userCondition','null'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.handle','\"siteFooter\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.name','\"Site footer\"'),
('globalSets.cdd9e7cc-1867-45b4-9c9b-7310c18333bd.sortOrder','1'),
('meta.__names__.0217698d-d0e4-4110-89bf-12e604fb40fe','\"Legal nav\"'),
('meta.__names__.05ad0930-f6fa-430f-a8d6-f29e553e30dc','\"Columns\"'),
('meta.__names__.10d1394f-6863-440f-945c-891da0c65bad','\"Videos\"'),
('meta.__names__.125a39f1-c7fd-462c-beff-e3dfd421bec7','\"Simple\"'),
('meta.__names__.17ea053e-13d0-4c0f-a465-42342bea6915','\"WJ Craft5 Boilerplate\"'),
('meta.__names__.1803a6fd-4bb9-4613-8953-bcfc78b4e0c7','\"Open in a new window?\"'),
('meta.__names__.1a5747be-fb88-4384-a10e-ab7459382bc0','\"WJ Boilerplate\"'),
('meta.__names__.1c25abdf-4ed0-4f3e-9efc-afaa953f4da7','\"Video URL\"'),
('meta.__names__.3031c488-fd65-4a4c-b69b-770f27f5fd77','\"Contact Form\"'),
('meta.__names__.3354af91-f989-4740-bdd2-65c9630089b2','\"Call to action\"'),
('meta.__names__.3b11d463-accb-41de-ba6b-9331689fa7ce','\"Transcript\"'),
('meta.__names__.3fe2c1d5-8a1b-4113-898e-9819f561f482','\"Video file\"'),
('meta.__names__.409117cb-de3e-4900-82ec-2a7440e33e84','\"Image\"'),
('meta.__names__.42fdb1ca-7367-4cf5-9375-37416cbc8615','\"Image\"'),
('meta.__names__.4cd374ac-6a5a-483e-b17d-223382d6d4a1','\"List by channel\"'),
('meta.__names__.4df4913b-0a34-4362-a115-1480a1f194cf','\"Profile URL\"'),
('meta.__names__.506d8357-6bb1-4b98-aa31-628a66d53cfb','\"Entries\"'),
('meta.__names__.52c4e51e-b5d1-433e-8683-073d97a20e51','\"Option\"'),
('meta.__names__.53112398-e0df-4ef1-976b-8272da500720','\"Standfirst\"'),
('meta.__names__.53cc26d6-9a93-49c4-a588-2ae7871da1cf','\"Listing\"'),
('meta.__names__.545bf85d-2516-4846-ab8f-778f8f10fcab','\"Website documentation\"'),
('meta.__names__.5cf7e469-364f-4258-b9ab-37d6e6395222','\"Jump link text (optional)\"'),
('meta.__names__.604eaaf1-80fd-42f6-aa9f-3c91970e89aa','\"Action link\"'),
('meta.__names__.61a52075-e8d1-4571-94a5-73b6448cb2e1','\"Entry link\"'),
('meta.__names__.673cb6e1-eb77-40ba-b02e-122c3a42286a','\"Cover image\"'),
('meta.__names__.73f8e366-7f0d-422c-8131-f28b1309cde6','\"Size\"'),
('meta.__names__.75e255f2-86f8-4b83-8bfa-39f20fa4eedd','\"Standard\"'),
('meta.__names__.7a82df58-7169-4f16-9078-ab400c68ac97','\"Link text\"'),
('meta.__names__.7dd6601d-5a16-4e28-8d2a-2f0340c48b65','\"Content\"'),
('meta.__names__.88868b59-0dc8-4932-8fbe-5a8a5fb28762','\"Add to jump link\"'),
('meta.__names__.8e986997-22af-4fce-8225-a1fc3cbb5bac','\"URL link\"'),
('meta.__names__.92f8ff6a-4be8-49d9-80bb-870617aa0f85','\"Section\"'),
('meta.__names__.93688f52-2bc2-4914-aac6-0f949e89919e','\"Heading\"'),
('meta.__names__.944eb893-6b00-4c63-b7b9-9ee73630a1f1','\"Option\"'),
('meta.__names__.95870b87-85c2-4fda-97ad-3dab5f1c81e9','\"SEO\"'),
('meta.__names__.96349527-2c4a-4eb7-9481-e12be1fa2e29','\"Action link\"'),
('meta.__names__.9d1bef95-d78d-4735-952e-4b60158cf167','\"Images\"'),
('meta.__names__.a3c239c2-5e16-432d-a651-abff865a4492','\"Platform\"'),
('meta.__names__.adf10d1b-d5b5-4564-a880-732b9ec4e22c','\"Image ratio\"'),
('meta.__names__.ae279549-89d9-41f5-bdcb-cad0dcb85925','\"Social media accounts\"'),
('meta.__names__.af11e5ad-a8af-4df5-a21c-e2608c19edeb','\"Text\"'),
('meta.__names__.b502800f-c7b7-47b3-85b1-a0d7a179ea00','\"Image\"'),
('meta.__names__.b53d1a3f-d0be-4181-b4f3-63b2415caf50','\"Item\"'),
('meta.__names__.b85f18dc-5c7d-4c3d-be23-437b9c3675f3','\"New\"'),
('meta.__names__.ba07e685-77b8-422c-a2ff-2c5ba52decc3','\"Caption\"'),
('meta.__names__.bb5fd73c-d0d3-44b5-a992-476eb9b739a4','\"Section\"'),
('meta.__names__.bc60a081-9838-490c-abd8-4401a5bd6e1e','\"Standard\"'),
('meta.__names__.bf96f3a4-eb06-49f8-af84-f939d5426416','\"Social media account\"'),
('meta.__names__.c0a70d36-1182-4a66-aad7-1cbfbe3da1dc','\"Video\"'),
('meta.__names__.c465af7a-827f-45c8-9e47-f9c38f3d83ac','\"Entry cards\"'),
('meta.__names__.c6072259-9bf9-4ec5-bcf4-32119fef2e0b','\"Registration details\"'),
('meta.__names__.c849e39d-e259-447a-bdd8-c577bf05b762','\"Asset link\"'),
('meta.__names__.cd14ae12-0e6a-4f07-9de0-bd0536bd55c1','\"Heading\"'),
('meta.__names__.cdd0917f-398e-46b8-a373-2fcb84257eca','\"Heading\"'),
('meta.__names__.cdd9e7cc-1867-45b4-9c9b-7310c18333bd','\"Site footer\"'),
('meta.__names__.cf947787-479e-4889-93cf-2a7b62aafac4','\"Text\"'),
('meta.__names__.d0247de8-ec57-403b-b334-bbf9703049f8','\"Video\"'),
('meta.__names__.d0fc3bd4-7289-4c25-ab69-5e6b7d086eed','\"Accordion\"'),
('meta.__names__.d4b5dd99-9088-494e-b54b-39b5d76840f0','\"Image\"'),
('meta.__names__.d8da528a-5de1-4ea5-9278-983c10cfe9a5','\"Documents\"'),
('meta.__names__.e618d81f-6316-4a68-b87b-c324a5ba248b','\"Icons\"'),
('meta.__names__.e9f404d8-0076-45fc-aa9e-76a69b393f81','\"Internal search keywords\"'),
('meta.__names__.eb8ef9d9-e105-41b5-ba50-3c4c6e9871e7','\"Content\"'),
('meta.__names__.ec8c86e6-93eb-406e-959b-b955e23b35e8','\"Logos\"'),
('meta.__names__.f030fb15-80d7-484b-b74f-0e51dc2d82c8','\"Accordions\"'),
('meta.__names__.f532ffc5-e55e-40a0-b01e-70b9c34ba6f6','\"Text\"'),
('meta.__names__.fb678e73-288b-42c7-8c19-27c44d13f324','\"Heading\"'),
('meta.__names__.ffb3da3c-2f4d-47a3-a021-d496e6c5516a','\"Pages\"'),
('plugins.admin-bar.edition','\"standard\"'),
('plugins.admin-bar.enabled','true'),
('plugins.admin-bar.schemaVersion','\"3.1.0\"'),
('plugins.assetrev.edition','\"standard\"'),
('plugins.assetrev.enabled','true'),
('plugins.assetrev.schemaVersion','\"1.0.0\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
('plugins.cookies.edition','\"standard\"'),
('plugins.cookies.enabled','true'),
('plugins.cookies.schemaVersion','\"1.0.0\"'),
('plugins.cp-css.edition','\"standard\"'),
('plugins.cp-css.enabled','true'),
('plugins.cp-css.schemaVersion','\"2.0.0\"'),
('plugins.cp-css.settings.additionalCss','\"\"'),
('plugins.cp-css.settings.cacheBusting','true'),
('plugins.cp-css.settings.cssFile','\"$CRAFT_CP_CSS\"'),
('plugins.cp-field-inspect.edition','\"standard\"'),
('plugins.cp-field-inspect.enabled','true'),
('plugins.cp-field-inspect.schemaVersion','\"1.0.0\"'),
('plugins.dashboard-begone.edition','\"standard\"'),
('plugins.dashboard-begone.enabled','true'),
('plugins.dashboard-begone.schemaVersion','\"1.0.0\"'),
('plugins.formie.edition','\"standard\"'),
('plugins.formie.enabled','true'),
('plugins.formie.licenseKey','\"K73T4S4RZ6HPWJUIQB7AG4M2\"'),
('plugins.formie.schemaVersion','\"3.4.6\"'),
('plugins.image-resizer.edition','\"standard\"'),
('plugins.image-resizer.enabled','true'),
('plugins.image-resizer.schemaVersion','\"2.0.0\"'),
('plugins.image-resizer.settings.enabled','true'),
('plugins.image-resizer.settings.imageHeight','4096'),
('plugins.image-resizer.settings.imageQuality','100'),
('plugins.image-resizer.settings.imageWidth','4096'),
('plugins.image-resizer.settings.nonDestructiveCrop','false'),
('plugins.image-resizer.settings.nonDestructiveResize','false'),
('plugins.image-resizer.settings.skipLarger','true'),
('plugins.knock-knock.edition','\"standard\"'),
('plugins.knock-knock.enabled','true'),
('plugins.knock-knock.schemaVersion','\"1.1.1\"'),
('plugins.obfuscator.edition','\"standard\"'),
('plugins.obfuscator.enabled','true'),
('plugins.obfuscator.schemaVersion','\"1.0.0\"'),
('plugins.seomatic.edition','\"standard\"'),
('plugins.seomatic.enabled','true'),
('plugins.seomatic.licenseKey','\"54OLWN3NMDQ0NZHSV00E6YVR\"'),
('plugins.seomatic.schemaVersion','\"3.0.12\"'),
('plugins.typogrify.edition','\"standard\"'),
('plugins.typogrify.enabled','true'),
('plugins.typogrify.schemaVersion','\"1.0.0\"'),
('plugins.vizy.edition','\"standard\"'),
('plugins.vizy.enabled','true'),
('plugins.vizy.licenseKey','\"EBFD8ITW70SVS3XRT9ROIN77\"'),
('plugins.vizy.schemaVersion','\"0.9.0\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.defaultPlacement','\"end\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.enableVersioning','true'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.entryTypes.0','\"75e255f2-86f8-4b83-8bfa-39f20fa4eedd\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.entryTypes.1','\"53cc26d6-9a93-49c4-a588-2ae7871da1cf\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.handle','\"webDoc\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.maxAuthors','1'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.name','\"Website documentation\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.propagationMethod','\"all\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.enabledByDefault','true'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.hasUrls','true'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.template','\"_entry\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.uriFormat','\"{parent.uri}/{slug}\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.structure.maxLevels','null'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.structure.uid','\"8c20520f-e761-4122-b917-e763cc6731a1\"'),
('sections.545bf85d-2516-4846-ab8f-778f8f10fcab.type','\"structure\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.defaultPlacement','\"end\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.enableVersioning','true'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.entryTypes.0','\"75e255f2-86f8-4b83-8bfa-39f20fa4eedd\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.entryTypes.1','\"53cc26d6-9a93-49c4-a588-2ae7871da1cf\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.handle','\"pages\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.maxAuthors','1'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.name','\"Pages\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.propagationMethod','\"all\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.enabledByDefault','true'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.hasUrls','true'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.template','\"_entry\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.siteSettings.17ea053e-13d0-4c0f-a465-42342bea6915.uriFormat','\"{parent.uri}/{slug}\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.structure.maxLevels','null'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.structure.uid','\"21029549-95d4-4440-8c06-8837168eda96\"'),
('sections.ffb3da3c-2f4d-47a3-a021-d496e6c5516a.type','\"structure\"'),
('siteGroups.1a5747be-fb88-4384-a10e-ab7459382bc0.name','\"WJ Boilerplate\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.enabled','true'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.handle','\"default\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.hasUrls','true'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.language','\"en-GB\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.name','\"WJ Craft5 Boilerplate\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.primary','true'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.siteGroup','\"1a5747be-fb88-4384-a10e-ab7459382bc0\"'),
('sites.17ea053e-13d0-4c0f-a465-42342bea6915.sortOrder','1'),
('system.edition','\"pro\"'),
('system.live','true'),
('system.name','\"WJ Boilerplate\"'),
('system.schemaVersion','\"5.0.0.21\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.require2fa','false'),
('users.requireEmailVerification','true'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.altTranslationKeyFormat','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.altTranslationMethod','\"none\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elementCondition','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.autocapitalize','true'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.autocomplete','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.autocorrect','true'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.class','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.disabled','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.elementCondition','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.id','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.includeInCards','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.inputType','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.instructions','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.label','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.max','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.min','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.name','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.orientation','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.placeholder','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.providesThumbs','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.readonly','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.requirable','false'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.size','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.step','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.tip','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.title','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.uid','\"0aeead8d-1bd1-4250-b005-46f6882d9fec\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.userCondition','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.warning','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.elements.0.width','100'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.name','\"Content\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.uid','\"6cbfb459-ad5d-47f4-9520-a4ef4172a7b8\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fieldLayouts.5164034c-8014-40bf-b940-63ec5d937a48.tabs.0.userCondition','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.fs','\"videos\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.handle','\"videos\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.name','\"Videos\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.sortOrder','2'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.subpath','\"\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.titleTranslationKeyFormat','null'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.titleTranslationMethod','\"site\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.transformFs','\"\"'),
('volumes.10d1394f-6863-440f-945c-891da0c65bad.transformSubpath','\"\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.altTranslationKeyFormat','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.altTranslationMethod','\"none\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elementCondition','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.autocapitalize','true'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.autocomplete','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.autocorrect','true'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.class','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.disabled','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.elementCondition','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.id','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.includeInCards','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.inputType','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.instructions','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.label','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.max','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.min','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.name','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.orientation','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.placeholder','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.providesThumbs','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.readonly','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.requirable','false'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.size','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.step','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.tip','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.title','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.uid','\"f31c5888-6319-4201-ab4f-1353c4bab7f1\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.userCondition','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.warning','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.elements.0.width','100'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.name','\"Content\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.uid','\"68aa03b5-cd90-4830-8eb3-8cbe8b5a9956\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fieldLayouts.a1a433e5-be43-4cdd-a37a-a846972db09c.tabs.0.userCondition','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.fs','\"images\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.handle','\"images\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.name','\"Images\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.sortOrder','1'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.subpath','\"\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.titleTranslationKeyFormat','null'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.titleTranslationMethod','\"site\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.transformFs','\"\"'),
('volumes.9d1bef95-d78d-4735-952e-4b60158cf167.transformSubpath','\"\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.altTranslationKeyFormat','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.altTranslationMethod','\"none\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elementCondition','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.autocapitalize','true'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.autocomplete','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.autocorrect','true'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.class','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.disabled','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.elementCondition','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.id','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.includeInCards','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.inputType','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.instructions','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.label','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.max','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.min','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.name','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.orientation','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.placeholder','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.providesThumbs','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.readonly','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.requirable','false'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.size','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.step','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.tip','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.title','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.uid','\"ddc84187-0ad7-4e98-b207-06d61a82862a\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.userCondition','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.warning','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.elements.0.width','100'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.name','\"Content\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.uid','\"f3f319a8-7b35-42a8-a8e2-38d9c321c458\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fieldLayouts.521e8173-7cd0-4548-bfd3-d76be0138ad2.tabs.0.userCondition','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.fs','\"documents\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.handle','\"documents\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.name','\"Documents\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.sortOrder','3'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.subpath','\"\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.titleTranslationKeyFormat','null'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.titleTranslationMethod','\"site\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.transformFs','\"\"'),
('volumes.d8da528a-5de1-4ea5-9278-983c10cfe9a5.transformSubpath','\"\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.altTranslationKeyFormat','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.altTranslationMethod','\"none\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elementCondition','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.autocapitalize','true'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.autocomplete','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.autocorrect','true'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.class','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.disabled','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.elementCondition','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.id','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.includeInCards','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.inputType','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.instructions','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.label','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.max','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.min','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.name','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.orientation','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.placeholder','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.providesThumbs','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.readonly','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.requirable','false'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.size','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.step','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.tip','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.title','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.uid','\"30647628-ef7a-4c28-9b94-65e63540c6f5\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.userCondition','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.warning','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.elements.0.width','100'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.name','\"Content\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.uid','\"0e6e73aa-73cf-45a3-ad0a-facfb77d7f62\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fieldLayouts.0a5eafd1-00c9-47cd-a0c5-3c78784ca941.tabs.0.userCondition','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.fs','\"icons\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.handle','\"icons\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.name','\"Icons\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.sortOrder','4'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.subpath','\"\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.titleTranslationKeyFormat','null'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.titleTranslationMethod','\"site\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.transformFs','\"\"'),
('volumes.e618d81f-6316-4a68-b87b-c324a5ba248b.transformSubpath','\"\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.altTranslationKeyFormat','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.altTranslationMethod','\"none\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elementCondition','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.autocapitalize','true'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.autocomplete','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.autocorrect','true'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.class','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.disabled','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.elementCondition','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.id','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.includeInCards','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.inputType','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.instructions','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.label','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.max','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.min','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.name','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.orientation','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.placeholder','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.providesThumbs','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.readonly','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.requirable','false'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.size','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.step','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.tip','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.title','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.uid','\"3be8eb6b-fc8c-49a3-bc56-1768dca4017f\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.userCondition','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.warning','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.elements.0.width','100'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.name','\"Content\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.uid','\"e02cf822-071f-4410-bb6e-8da09c4ced83\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fieldLayouts.c88332fb-65cf-480c-a95f-0b863eb4ad45.tabs.0.userCondition','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.fs','\"logos\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.handle','\"logos\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.name','\"Logos\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.sortOrder','5'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.subpath','\"\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.titleTranslationKeyFormat','null'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.titleTranslationMethod','\"site\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.transformFs','\"\"'),
('volumes.ec8c86e6-93eb-406e-959b-b955e23b35e8.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES
(2,3,11,NULL,10,1,'2024-04-11 15:06:30','2024-04-11 15:06:30','48b43f1c-8237-4c68-8692-a82d6f957a02'),
(3,3,13,NULL,10,1,'2024-04-11 15:06:30','2024-04-11 15:06:30','9595fbb9-751f-40a9-b68e-c61ff8fd8deb'),
(5,3,45,NULL,10,1,'2024-04-19 16:01:35','2024-04-19 16:01:35','72984fe2-8755-4082-a95d-f3c183f0fff6'),
(6,3,47,NULL,10,1,'2024-04-19 16:01:35','2024-04-19 16:01:35','98555da6-d589-4b48-a14c-2a3bd0ba2513'),
(8,3,69,NULL,10,1,'2024-05-13 14:54:29','2024-05-13 14:54:29','087622be-da70-4707-932d-a8a92b7edfa5'),
(10,20,82,NULL,89,1,'2024-05-13 15:38:02','2024-05-13 15:38:02','568daac5-532b-4bab-8750-bad63c06badd'),
(11,20,94,NULL,89,1,'2024-05-13 15:38:02','2024-05-13 15:38:02','ea3eb14d-fc4b-4992-995b-194965a4c84a'),
(14,22,82,NULL,97,1,'2024-05-13 15:38:33','2024-05-13 15:38:33','1bbb1604-b254-4435-95fd-a1bdd110719d'),
(15,20,99,NULL,89,1,'2024-05-13 15:38:33','2024-05-13 15:38:33','7cbdf65c-31d8-41a9-8829-ffc87dc33633'),
(16,22,99,NULL,97,1,'2024-05-13 15:38:33','2024-05-13 15:38:33','d24f7c06-0442-4273-a06b-5220c5108c3a'),
(19,20,122,NULL,89,1,'2024-05-14 09:15:13','2024-05-14 09:15:13','a90b4e15-18db-4e89-be24-2df5088f2c62'),
(20,22,122,NULL,97,1,'2024-05-14 09:15:13','2024-05-14 09:15:13','847abc9d-97b5-418a-9624-b33bedc6e3a8'),
(23,30,142,NULL,10,1,'2024-05-14 09:47:16','2024-05-14 09:47:16','808b92fc-2e3d-4e2f-8078-9bbb5c5ca81c'),
(24,20,143,NULL,89,1,'2024-05-14 09:47:16','2024-05-14 09:47:16','f5ef9d8a-a780-4753-80f3-e2785c2031e8'),
(25,30,145,NULL,10,1,'2024-05-14 09:47:16','2024-05-14 09:47:16','4b90769a-2a03-46c5-a9cd-f5e379ee5bfc'),
(26,20,146,NULL,89,1,'2024-05-14 09:47:16','2024-05-14 09:47:16','2c7b58e3-2f16-494e-a163-d4f414bf5eb1'),
(28,32,149,NULL,89,1,'2024-05-14 10:52:16','2024-05-14 10:52:16','d46d9999-7935-485f-a48d-c1dff40b08d4'),
(29,32,151,NULL,89,1,'2024-05-14 10:52:16','2024-05-14 10:52:16','41307377-166a-4885-a289-33ac99879fec'),
(30,41,166,NULL,89,1,'2024-05-15 13:42:25','2024-05-15 13:42:25','22cffd6a-f870-424d-94e3-292316b6a5e1'),
(31,41,166,NULL,152,2,'2024-05-15 13:44:12','2024-05-15 13:44:12','83f7ec11-075e-4d93-a6ca-9d14a8c94bb8');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES
(1,2,1,1,''),
(2,2,1,2,'Applied “Draft 1”'),
(3,2,1,3,'Applied “Draft 1”'),
(4,2,1,4,'Applied “Draft 1”'),
(5,11,1,1,NULL),
(6,2,1,5,''),
(7,2,1,6,'Applied “Draft 1”'),
(8,2,1,7,'Applied “Draft 1”'),
(9,2,1,8,'Applied “Draft 1”'),
(10,2,1,9,'Applied “Draft 1”'),
(11,2,1,10,'Applied “Draft 1”'),
(12,2,1,11,'Applied “Draft 1”'),
(13,2,1,12,''),
(14,2,1,13,'Applied “Draft 1”'),
(15,2,1,14,'Applied “Draft 1”'),
(16,2,1,15,'Applied “Draft 1”'),
(17,2,1,16,'Applied “Draft 1”'),
(18,2,1,17,'Applied “Draft 1”'),
(19,40,1,1,NULL),
(20,2,1,18,'Applied “Draft 1”'),
(21,45,1,1,NULL),
(22,2,1,19,'Applied “Draft 1”'),
(23,50,1,1,NULL),
(24,2,1,20,'Applied “Draft 1”'),
(25,40,1,2,NULL),
(26,2,1,21,'Applied “Draft 1”'),
(27,40,1,3,NULL),
(28,2,1,22,'Applied “Draft 1”'),
(29,63,1,1,NULL),
(30,2,1,23,'Applied “Draft 1”'),
(31,45,1,2,NULL),
(32,2,1,24,'Applied “Draft 1”'),
(33,50,1,2,NULL),
(34,2,1,25,'Applied “Draft 1”'),
(35,77,1,1,NULL),
(36,2,1,26,'Applied “Draft 1”'),
(37,82,1,1,NULL),
(38,2,1,27,'Applied “Draft 1”'),
(39,82,1,2,NULL),
(40,89,1,1,''),
(41,2,1,28,'Applied “Draft 1”'),
(42,82,1,3,NULL),
(43,2,1,29,'Applied “Draft 1”'),
(44,82,1,4,NULL),
(45,2,1,30,'Applied “Draft 1”'),
(46,110,1,1,NULL),
(47,111,1,1,NULL),
(48,112,1,1,NULL),
(49,2,1,31,''),
(50,2,1,32,''),
(51,2,1,33,'Applied “Draft 1”'),
(52,82,1,5,NULL),
(53,2,1,34,'Applied “Draft 1”'),
(54,2,1,35,'Applied “Draft 1”'),
(55,132,1,1,NULL),
(56,133,1,1,NULL),
(57,134,1,1,NULL),
(58,2,1,36,'Applied “Draft 1”'),
(59,142,1,1,NULL),
(60,143,1,1,NULL),
(61,2,1,37,'Applied “Draft 1”'),
(62,149,1,1,NULL),
(63,152,1,1,''),
(64,152,1,2,'Applied “Draft 1”'),
(65,156,1,1,''),
(66,158,1,1,''),
(67,160,1,1,''),
(68,162,1,1,''),
(69,164,1,1,''),
(70,2,1,38,'Applied “Draft 1”'),
(71,40,1,4,NULL),
(72,89,1,2,'Applied “Draft 1”'),
(73,175,1,1,NULL),
(74,176,1,1,NULL),
(75,89,1,3,''),
(76,89,1,4,'Applied “Draft 1”'),
(77,175,1,2,NULL),
(78,176,1,2,NULL),
(79,89,1,5,''),
(80,193,1,1,''),
(81,194,1,1,NULL),
(82,195,1,1,NULL),
(83,193,1,2,''),
(84,193,1,3,'Applied “Draft 1”'),
(85,194,1,2,NULL),
(86,195,1,2,NULL),
(87,193,1,4,'Applied “Draft 1”'),
(88,194,1,3,NULL),
(89,195,1,3,NULL),
(90,193,1,5,'Applied “Draft 1”'),
(91,194,1,4,NULL),
(92,195,1,4,NULL),
(93,193,1,6,'Applied “Draft 1”'),
(94,194,1,5,NULL),
(95,195,1,5,NULL),
(96,89,1,6,'Applied “Draft 1”'),
(97,175,1,3,NULL),
(98,176,1,3,NULL),
(99,89,1,7,'Applied “Draft 1”'),
(100,232,1,1,NULL),
(101,233,1,1,NULL),
(102,193,1,7,''),
(103,193,1,8,'Applied “Draft 1”'),
(104,194,1,6,NULL),
(105,244,1,1,NULL),
(106,2,1,39,''),
(107,193,1,9,'Applied “Draft 1”'),
(108,194,1,7,NULL),
(109,264,1,1,NULL),
(110,265,1,1,NULL),
(111,266,1,1,NULL),
(112,193,1,10,'Applied “Draft 1”'),
(113,194,1,8,NULL),
(114,195,1,6,NULL),
(115,244,1,2,NULL),
(116,264,1,2,NULL),
(117,265,1,2,NULL),
(118,313,1,1,NULL),
(119,314,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' mani bae williamjoseph co uk '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' wj mani '),
(2,'field',1,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit aenean commodo ligula eget dolor aenean massa cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus '),
(2,'field',13,1,''),
(2,'slug',0,1,' website documentation '),
(2,'title',0,1,' website documentation '),
(10,'alt',0,1,''),
(10,'extension',0,1,' jpg '),
(10,'filename',0,1,' catnap jpg '),
(10,'kind',0,1,' image '),
(10,'slug',0,1,''),
(10,'title',0,1,' catnap '),
(11,'slug',0,1,' temp alawwftxthiqztozsdlabrlqlpqhbrxbhzwy '),
(11,'title',0,1,''),
(37,'field',5,1,''),
(37,'slug',0,1,' temp terdxrezvuoxdtylzhiissxejxyqromeevjs '),
(37,'title',0,1,''),
(38,'field',5,1,''),
(38,'slug',0,1,' temp ycthripimwngfidrueccyowvxqciwlopwtci '),
(38,'title',0,1,''),
(40,'field',5,1,' this is a heading '),
(40,'field',16,1,''),
(40,'slug',0,1,' temp yecndullbcgjxmznsmpqcfzbhbavjbodflal '),
(40,'title',0,1,''),
(45,'field',18,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit '),
(45,'slug',0,1,' temp mncntrspbajmxwcypwvhgokpmjdyfoykendy '),
(45,'title',0,1,''),
(50,'slug',0,1,' temp iomqawwfmqdzktlrqlowtehuqztljocfkpvv '),
(50,'title',0,1,''),
(63,'field',17,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit aenean commodo ligula eget dolor aenean massa cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus '),
(63,'slug',0,1,' temp dseeymhzpudszsowxhovqujzkobgqxcqnday '),
(63,'title',0,1,''),
(77,'slug',0,1,' temp jikqjmwjdrufypitvhfjebnrtqiwyhwbjvkl '),
(77,'title',0,1,''),
(82,'field',23,1,' dummy download '),
(82,'slug',0,1,' temp fluozztrgqphgcmywnjbajpvqmhdyxugqobz '),
(82,'title',0,1,''),
(89,'field',13,1,' heading heading two '),
(89,'slug',0,1,' sample page '),
(89,'title',0,1,' sample page '),
(97,'alt',0,1,''),
(97,'extension',0,1,' pdf '),
(97,'filename',0,1,' dummy pdf '),
(97,'kind',0,1,' pdf '),
(97,'slug',0,1,''),
(97,'title',0,1,' dummy '),
(101,'slug',0,1,' temp kmlwdqicekbxclotranxifjajmupqjngqbef '),
(101,'title',0,1,''),
(110,'field',27,1,' accordion lorem ipsum dolor sit amet consectetuer adipiscing elit '),
(110,'slug',0,1,' temp vvksxakhrkmceefvtaaqlxelglzqhyvsygno '),
(110,'title',0,1,''),
(111,'field',25,1,' accordion '),
(111,'field',26,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit '),
(111,'slug',0,1,''),
(111,'title',0,1,''),
(112,'field',17,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit '),
(112,'slug',0,1,' temp vetaepaaravhshdqikmvghwnduqwbnbkauhm '),
(112,'title',0,1,''),
(124,'field',27,1,''),
(124,'slug',0,1,' temp uytkdslzdzvenyvhxagpuinhfmrapzoxwmvd '),
(124,'title',0,1,''),
(126,'field',25,1,''),
(126,'field',26,1,''),
(126,'slug',0,1,''),
(126,'title',0,1,''),
(132,'field',27,1,' accordion heading lorem ipsum dolor sit amet consectetuer adipiscing elit aenean commodo ligula eget dolor aenean massa cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus '),
(132,'slug',0,1,' temp hkqsqtwfsltfsonzrfwqymhhwwkiiaukwmxq '),
(132,'title',0,1,''),
(133,'field',25,1,' accordion heading '),
(133,'field',26,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit aenean commodo ligula eget dolor aenean massa cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus '),
(133,'slug',0,1,' temp bgbdrgkocpknvmdxyztlfxyqtrbfnqszluej '),
(133,'title',0,1,''),
(134,'field',17,1,' lorem ipsum dolor sit amet consectetuer adipiscing elit aenean commodo ligula eget dolor aenean massa cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus '),
(134,'slug',0,1,' temp uifniarbalplgxjpvetztsubbhjamtczgmvl '),
(134,'title',0,1,''),
(142,'field',28,1,' call to action heading '),
(142,'field',29,1,''),
(142,'slug',0,1,' temp lazukfqlkxhwdslczdmwlrarvqwagftunpxi '),
(142,'title',0,1,''),
(143,'field',23,1,' call to action button '),
(143,'slug',0,1,' temp vrlcpcgmnsfkystdipzldpxydabzfxldoaxm '),
(143,'title',0,1,''),
(149,'slug',0,1,' temp ogpktdvapxoxmcejcihrhwzyutawkfmwolsi '),
(149,'title',0,1,''),
(152,'slug',0,1,' listing page '),
(152,'title',0,1,' listing page '),
(156,'slug',0,1,' blog one title consectetuer adipiscing elit '),
(156,'title',0,1,' blog one title consectetuer adipiscing elit '),
(158,'slug',0,1,' blog two title consectetuer adipiscing elit '),
(158,'title',0,1,' blog two title consectetuer adipiscing elit '),
(160,'slug',0,1,' blog three title consectetuer adipiscing elit '),
(160,'title',0,1,' blog three title consectetuer adipiscing elit '),
(162,'slug',0,1,' blog four title consectetuer adipiscing elit '),
(162,'title',0,1,' blog four title consectetuer adipiscing elit '),
(164,'slug',0,1,' blog five title consectetuer adipiscing elit '),
(164,'title',0,1,' blog five title consectetuer adipiscing elit '),
(166,'field',37,1,''),
(166,'slug',0,1,''),
(167,'slug',0,1,' temp ludegliaioedvzxrdfmkoxigivokgmtvgaek '),
(167,'title',0,1,''),
(175,'field',42,1,' heading '),
(175,'slug',0,1,' temp nnokmshelrhmjvdewoxomhifkmisgkrglqvw '),
(175,'title',0,1,''),
(176,'field',5,1,' heading '),
(176,'field',16,1,''),
(176,'slug',0,1,' temp mccxattkitfwateubrqwcnqwwufyusswjepb '),
(176,'title',0,1,''),
(193,'field',13,1,' heading one manibae gmail com something one something more something two something more '),
(193,'slug',0,1,' content testing '),
(193,'title',0,1,' content testing '),
(194,'field',42,1,' heading one manibae gmail com something one something more something two something more '),
(194,'slug',0,1,' temp kjivwbnojkpwibvmgadrfgvswdnqynxpbrbf '),
(194,'title',0,1,''),
(195,'field',5,1,' heading one '),
(195,'field',16,1,''),
(195,'slug',0,1,' temp lyndefotcozymdmooviocewripyakqzhsmzc '),
(195,'title',0,1,''),
(232,'field',42,1,' heading two '),
(232,'slug',0,1,' temp ruwfwppeskbulbmbcesmzeahqagwpluikels '),
(232,'title',0,1,''),
(233,'field',5,1,' heading two '),
(233,'field',16,1,''),
(233,'slug',0,1,' temp tcuucblydsyxhegmkcrrkbveypqozejnhyjt '),
(233,'title',0,1,''),
(244,'field',17,1,' manibae gmail com '),
(244,'slug',0,1,' temp rltfqiglsctihscwbghmxvmbvwmnlgotdsox '),
(244,'title',0,1,''),
(264,'field',27,1,' something one something more something two something more '),
(264,'slug',0,1,' temp gqaprwexqtrwrorlyaesoenmwpqyagddtyds '),
(264,'title',0,1,''),
(265,'field',25,1,' something one '),
(265,'field',26,1,' something more '),
(265,'slug',0,1,' temp uobhqqnivvgjtalraihoszfnqmsotigaxnlk '),
(265,'title',0,1,''),
(266,'field',17,1,' something more '),
(266,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(266,'title',0,1,''),
(277,'field',17,1,' something more '),
(277,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(277,'title',0,1,''),
(281,'field',17,1,' something more '),
(281,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(281,'title',0,1,''),
(285,'field',17,1,' something more '),
(285,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(285,'title',0,1,''),
(287,'field',17,1,' something more '),
(287,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(287,'title',0,1,''),
(289,'field',17,1,' something more '),
(289,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(289,'title',0,1,''),
(293,'field',17,1,' something more '),
(293,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(293,'title',0,1,''),
(297,'field',17,1,' something more '),
(297,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(297,'title',0,1,''),
(299,'field',17,1,' something more '),
(299,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(299,'title',0,1,''),
(300,'field',17,1,' something more '),
(300,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(300,'title',0,1,''),
(303,'field',17,1,' something more '),
(303,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(303,'title',0,1,''),
(305,'field',17,1,' something more '),
(305,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(305,'title',0,1,''),
(308,'field',17,1,' something more '),
(308,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(308,'title',0,1,''),
(311,'field',17,1,' something more '),
(311,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(311,'title',0,1,''),
(312,'field',17,1,' something more '),
(312,'slug',0,1,' temp zljchjpbdzxektxrfhayltpgnlinduwqybdg '),
(312,'title',0,1,''),
(313,'field',25,1,' something two '),
(313,'field',26,1,' something more '),
(313,'slug',0,1,' temp gindcywswcwljetcyvrqhsxwnzmyuyqyukef '),
(313,'title',0,1,''),
(314,'field',17,1,' something more '),
(314,'slug',0,1,' temp wltaofwkrifaqsxzvxjlzjftpnwhhaurfdan '),
(314,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES
(1,1,'Website documentation','webDoc','structure',1,1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2024-04-11 13:46:31','2024-04-11 13:46:31',NULL,'545bf85d-2516-4846-ab8f-778f8f10fcab'),
(2,2,'Pages','pages','structure',1,1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2024-05-13 15:36:46','2024-05-13 15:36:46',NULL,'ffb3da3c-2f4d-47a3-a021-d496e6c5516a'),
(3,NULL,'Blog','blog','channel',1,1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2024-05-15 10:43:31','2024-05-15 10:43:31','2024-05-15 10:51:12','a708d09c-0733-4913-a9e8-feb7b3af4f48');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES
(1,1,1),
(1,13,2),
(2,1,1),
(2,13,2),
(3,1,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'{parent.uri}/{slug}','_entry',1,'2024-04-11 13:46:31','2024-04-11 13:46:31','35666b18-da91-4120-a4f9-1082c7d80eff'),
(2,2,1,1,'{parent.uri}/{slug}','_entry',1,'2024-05-13 15:36:46','2024-05-13 15:36:46','76b88019-c0d6-4e9a-bf67-f414f4ebcb03'),
(3,3,1,1,'blog/{slug}','_entry',1,'2024-05-15 10:43:31','2024-05-15 10:50:17','1c47db03-9f1e-47f6-9622-16d3116fd81b');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seomatic_metabundles` VALUES
(1,'2024-04-11 13:46:31','2024-04-11 13:46:31','b258b2b2-c6cb-42fb-ae63-4d5e107baa71','1.0.71','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2024-04-11 13:46:31','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":null,\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text\\/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https:\\/\\/developers.google.com\\/gtagjs\\/)\",\"templatePath\":\"_frontend\\/scripts\\/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement\\/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/adwords-remarketing-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/dcm\\/partner\\/answer\\/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https:\\/\\/support.google.com\\/tagmanager\\/answer\\/6102821?hl=en)\",\"templatePath\":\"_frontend\\/scripts\\/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"><\\/iframe><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/tag-manager\\/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/ns.html\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https:\\/\\/www.facebook.com\\/business\\/help\\/651294705016616)\",\"templatePath\":\"_frontend\\/scripts\\/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.facebook.com\\/docs\\/facebook-pixel\\/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.facebook.com\\/tr\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend\\/scripts\\/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text\\/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text\\/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n<\\/script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" \\/>\\n<\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/www.linkedin.com\\/help\\/lms\\/answer\\/65513\\/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/snap.licdn.com\\/li.lms-analytics\\/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/dc.ads.linkedin.com\\/collect\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text\\/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/knowledge.hubspot.com\\/articles\\/kcs_article\\/reports\\/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"\\/\\/js.hs-scripts.com\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https:\\/\\/help.pinterest.com\\/en\\/business\\/article\\/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend\\/scripts\\/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.pinterest.com\\/docs\\/ad-tools\\/conversion-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/s.pinimg.com\\/ct\\/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/ct.pinterest.com\\/v3\\/\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https:\\/\\/usefathom.com\\/)\",\"templatePath\":\"_frontend\\/scripts\\/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/cdn.usefathom.com\\/script.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https:\\/\\/matomo.org\\/)\",\"templatePath\":\"_frontend\\/scripts\\/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text\\/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https:\\/\\/plausible.io\\/)\",\"templatePath\":\"_frontend\\/scripts\\/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https:\\/\\/plausible.io\\/docs\\/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/plausible.io\\/js\\/plausible.js\"}},\"dataLayer\":[],\"deprecated\":false,\"deprecationNotice\":\"\",\"discontinued\":false,\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https:\\/\\/www.google.com\\/analytics\\/analytics\\/)\",\"templatePath\":\"_frontend\\/scripts\\/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.google-analytics.com\\/analytics.js\"}},\"dataLayer\":[],\"deprecated\":true,\"deprecationNotice\":\"Universal Analytics (which is what this script uses) is being [discontinued on July 1st, 2023](https:\\/\\/support.google.com\\/analytics\\/answer\\/11583528). You should use Google gtag.js or Google Tag Manager instead and transition to a new GA4 property.\",\"discontinued\":false,\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"dateModified\":null,\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":null,\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":null,\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":null,\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":null,\"isAccessibleForFree\":null,\"dateCreated\":null,\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"},\"identity\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.identity.genericName }}\",\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null},\"creator\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"memberOf\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"hasOfferCatalog\":null,\"awards\":null,\"alumni\":null,\"nonprofitStatus\":null,\"slogan\":null,\"owns\":null,\"award\":null,\"event\":null,\"makesOffer\":null,\"review\":null,\"hasPOS\":null,\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"brand\":null,\"knowsLanguage\":null,\"department\":null,\"knowsAbout\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"diversityPolicy\":null,\"leiCode\":null,\"publishingPrinciples\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"ownershipFundingInfo\":null,\"reviews\":null,\"isicV4\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"location\":null,\"correctionsPolicy\":null,\"areaServed\":null,\"funding\":null,\"employee\":null,\"numberOfEmployees\":null,\"hasMerchantReturnPolicy\":null,\"iso6523Code\":null,\"taxID\":null,\"naics\":null,\"founders\":null,\"contactPoint\":null,\"serviceArea\":null,\"globalLocationNumber\":null,\"keywords\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"ethicsPolicy\":null,\"sponsor\":null,\"agentInteractionStatistic\":null,\"employees\":null,\"events\":null,\"interactionStatistic\":null,\"legalName\":null,\"vatID\":null,\"members\":null,\"funder\":null,\"aggregateRating\":null,\"hasCredential\":null,\"seeks\":null,\"subOrganization\":null,\"dissolutionDate\":null,\"contactPoints\":[],\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"unnamedSourcesPolicy\":null,\"parentOrganization\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"faxNumber\":null,\"actionableFeedbackPolicy\":null,\"diversityStaffingReport\":null,\"hasCertification\":null,\"member\":null,\"name\":\"{{ seomatic.site.creator.genericName }}\",\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"additionalType\":null,\"potentialAction\":null,\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"\\/* TEAM *\\/\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n\\/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n\\/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n\\/a\\\" }}\\n\\n\\/* THANKS *\\/\\n\\nCraft CMS - https:\\/\\/craftcms.com\\nPixel & Tonic - https:\\/\\/pixelandtonic.com\\n\\n\\/* SITE *\\/\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 5, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend\\/pages\\/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n    # live - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% case \\\"staging\\\" %}\\n\\n    # staging - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% case \\\"local\\\" %}\\n\\n    # local - disallow all\\n\\n    User-agent: *\\n    Disallow: \\/\\n\\n{% default %}\\n\\n    # default - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\n    User-agent: *\\n    Disallow: \\/cpresources\\/\\n    Disallow: \\/vendor\\/\\n    Disallow: \\/.env\\n    Disallow: \\/cache\\/\\n\\n{% endswitch %}\\n\\n# Disallow ChatGPT bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: GPTBot\\nDisallow: \\/\\n\\n# Disallow Google Bard and Vertex AI bots, as there\'s no benefit to allowing it to index your site\\nUser-agent: Google-Extended\\nDisallow: \\/\\n\\n# Disallow Perplexity bot, as there\'s no benefit to allowing it to index your site\\nUser-agent: PerplexityBot\\nDisallow: \\/\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend\\/pages\\/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n# More info: https:\\/\\/support.google.com\\/admanager\\/answer\\/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend\\/pages\\/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }} - more info: https:\\/\\/securitytxt.org\\/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\".well-known\\/security.txt\",\"template\":\"_frontend\\/pages\\/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),
(2,'2024-04-11 13:47:29','2024-08-30 13:56:25','6e69c832-30ea-436e-a681-dcb68ee9da4d','1.0.31','section',1,'Website documentation','webDoc','structure',NULL,'_entry',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"{parent.uri}\\/{slug}\",\"template\":\"_entry\",\"language\":\"en-gb\"}}','2024-08-30 13:56:25','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"sameAsGlobal\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"sameAsGlobal\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"specialty\":null,\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"significantLinks\":null,\"reviewedBy\":null,\"relatedLink\":null,\"primaryImageOfPage\":null,\"significantLink\":null,\"speakable\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"isAccessibleForFree\":null,\"dateCreated\":\"{{ entry.dateCreated |atom }}\",\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),
(3,'2024-05-13 15:36:46','2024-06-10 14:01:08','7705bd9b-97ba-4ba0-9c5b-968927584314','1.0.31','section',2,'Pages','pages','structure',NULL,'_entry',1,'{\"1\":{\"id\":2,\"sectionId\":2,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"{parent.uri}\\/{slug}\",\"template\":\"_entry\",\"language\":\"en-gb\"}}','2024-06-10 14:01:08','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"sameAsGlobal\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"sameAsGlobal\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"WJ Craft5 Boilerplate\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapAssetTransform\":null,\"newsSitemap\":false,\"newsPublicationName\":\"\",\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"specialty\":null,\"breadcrumb\":null,\"lastReviewed\":null,\"mainContentOfPage\":null,\"significantLinks\":null,\"reviewedBy\":null,\"relatedLink\":null,\"primaryImageOfPage\":null,\"significantLink\":null,\"speakable\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"associatedMedia\":null,\"publisherImprint\":null,\"pattern\":null,\"audio\":null,\"recordedAt\":null,\"hasPart\":null,\"awards\":null,\"encoding\":null,\"workTranslation\":null,\"releasedEvent\":null,\"workExample\":null,\"spatial\":null,\"accessModeSufficient\":null,\"award\":null,\"review\":null,\"interpretedAsClaim\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"exampleOfWork\":null,\"genre\":null,\"translationOfWork\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"acquireLicensePage\":null,\"assesses\":null,\"creativeWorkStatus\":null,\"sdLicense\":null,\"educationalUse\":null,\"countryOfOrigin\":null,\"contentRating\":null,\"locationCreated\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"accessibilitySummary\":null,\"commentCount\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"isBasedOnUrl\":null,\"license\":null,\"usageInfo\":null,\"publication\":null,\"timeRequired\":null,\"interactivityType\":null,\"publishingPrinciples\":null,\"contributor\":null,\"citation\":null,\"conditionsOfAccess\":null,\"learningResourceType\":null,\"correction\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"reviews\":null,\"isPartOf\":null,\"producer\":null,\"thumbnail\":null,\"accessMode\":null,\"editEIDR\":null,\"temporalCoverage\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"educationalAlignment\":null,\"funding\":null,\"material\":null,\"alternativeHeadline\":null,\"version\":null,\"isFamilyFriendly\":null,\"materialExtent\":null,\"discussionUrl\":null,\"size\":null,\"maintainer\":null,\"copyrightNotice\":null,\"comment\":null,\"offers\":null,\"text\":null,\"fileFormat\":null,\"encodings\":null,\"about\":null,\"audience\":null,\"keywords\":null,\"spatialCoverage\":null,\"sponsor\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"contentLocation\":null,\"interactionStatistic\":null,\"encodingFormat\":null,\"archivedAt\":null,\"mainEntity\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"isAccessibleForFree\":null,\"dateCreated\":\"{{ entry.dateCreated |atom }}\",\"teaches\":null,\"thumbnailUrl\":null,\"accountablePerson\":null,\"typicalAgeRange\":null,\"sdDatePublished\":null,\"funder\":null,\"expires\":null,\"aggregateRating\":null,\"temporal\":null,\"accessibilityControl\":null,\"accessibilityFeature\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"provider\":null,\"abstract\":null,\"digitalSourceType\":null,\"position\":null,\"mentions\":null,\"sourceOrganization\":null,\"video\":null,\"editor\":null,\"creditText\":null,\"schemaVersion\":null,\"translator\":null,\"accessibilityHazard\":null,\"contentReferenceTime\":null,\"educationalLevel\":null,\"character\":null,\"isBasedOn\":null,\"name\":\"{{ seomatic.meta.seoTitle }}\",\"description\":\"{{ seomatic.meta.seoDescription }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"additionalType\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"alternateName\":null,\"disambiguatingDescription\":null,\"sameAs\":null,\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\"}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"sameAsGlobal\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":false,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":false,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES
(1,'WJ Boilerplate','2024-04-11 13:46:30','2024-04-11 13:46:30',NULL,'1a5747be-fb88-4384-a10e-ab7459382bc0');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,1,1,'1','WJ Craft5 Boilerplate','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2024-04-11 13:46:30','2024-04-11 13:46:31',NULL,'17ea053e-13d0-4c0f-a465-42342bea6915');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES
(1,1,NULL,1,1,6,0,'2024-04-11 13:47:16','2024-06-10 13:23:04','c9f45d0a-a637-454c-91ce-756aa7556b93'),
(2,1,2,1,2,3,1,'2024-04-11 13:47:16','2024-04-11 13:47:16','e0f253e0-c8bc-4213-be6a-9763dd5f948b'),
(3,2,NULL,3,1,6,0,'2024-05-13 15:37:33','2024-05-15 10:16:56','d9df6547-e45f-4419-b049-77ae9562b81a'),
(4,2,89,3,2,3,1,'2024-05-13 15:37:33','2024-05-13 15:37:33','24cf7495-07f7-461d-8e61-133b1e033dd4'),
(5,2,152,3,4,5,1,'2024-05-15 10:16:56','2024-05-15 10:16:56','ae7111fb-22c1-459b-81b4-4bcf6901362c'),
(6,1,193,1,4,5,1,'2024-06-10 13:23:04','2024-06-10 13:23:04','42d8df92-9b7b-475f-a9da-e3fa769c9c8c');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES
(1,NULL,'2024-04-11 13:46:31','2024-04-11 13:46:31',NULL,'8c20520f-e761-4122-b917-e763cc6731a1'),
(2,NULL,'2024-05-13 15:36:46','2024-05-13 15:36:46',NULL,'21029549-95d4-4440-8c06-8837168eda96');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES
(3,'G_rHrstWOH0y2UtsPjoa5VRLZla3r4OL','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":89,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-06-17 13:55:39','2024-06-10 13:55:39','2024-06-10 13:55:39','a2386de2-c5ce-41fc-888f-71108bd482e4');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES
(1,'{\"language\":\"en-GB\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,NULL,1,0,0,0,1,'wj-mani',NULL,NULL,NULL,'mani.bae@williamjoseph.co.uk','$2y$13$Pa8HljoNsDMHdmPnUZ3aAue1rQGpswu0eAoultLcq.uhesk8yDWVe','2024-08-30 14:59:30',NULL,NULL,NULL,'2024-05-13 14:09:35',NULL,1,NULL,NULL,NULL,0,'2024-04-11 13:46:31','2024-04-11 13:46:31','2024-08-30 14:59:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Images','','2024-04-11 14:59:50','2024-04-11 14:59:50','05db0dfb-cef0-4832-9eee-d5755a4da304'),
(2,NULL,2,'Videos','','2024-04-11 15:00:38','2024-04-11 15:00:38','d9c338b3-7272-44e6-b9db-16929861a23a'),
(3,NULL,3,'Documents','','2024-04-11 15:01:30','2024-04-11 15:01:30','c725856d-d50d-4b7d-8317-8ecb3eb98f82'),
(4,NULL,4,'Icons','','2024-04-11 15:02:03','2024-04-11 15:02:03','b7eabad0-b1d3-4e1e-8a3a-30bb6efc1cb5'),
(5,NULL,5,'Logos','','2024-04-11 15:02:41','2024-04-11 15:02:41','d74dbf94-3f18-46da-8d69-147be552bbc2'),
(6,NULL,NULL,'Temporary Uploads',NULL,'2024-04-11 15:51:57','2024-04-11 15:51:57','4ca5f798-38f3-42a1-9d82-7b656be3914f'),
(7,6,NULL,'user_1','user_1/','2024-04-11 15:51:57','2024-04-11 15:51:57','d9a7bfe6-c3f2-4a0d-bff2-c26a41e02107');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES
(1,2,'Images','images','images','','','','site',NULL,'none',NULL,1,'2024-04-11 14:59:50','2024-04-11 14:59:50',NULL,'9d1bef95-d78d-4735-952e-4b60158cf167'),
(2,3,'Videos','videos','videos','','','','site',NULL,'none',NULL,2,'2024-04-11 15:00:38','2024-04-11 15:00:38',NULL,'10d1394f-6863-440f-945c-891da0c65bad'),
(3,4,'Documents','documents','documents','','','','site',NULL,'none',NULL,3,'2024-04-11 15:01:30','2024-04-11 15:01:30',NULL,'d8da528a-5de1-4ea5-9278-983c10cfe9a5'),
(4,5,'Icons','icons','icons','','','','site',NULL,'none',NULL,4,'2024-04-11 15:02:03','2024-04-11 15:02:03',NULL,'e618d81f-6316-4a68-b87b-c324a5ba248b'),
(5,6,'Logos','logos','logos','','','','site',NULL,'none',NULL,5,'2024-04-11 15:02:41','2024-04-11 15:02:41',NULL,'ec8c86e6-93eb-406e-959b-b955e23b35e8');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-04-19 11:07:30','2024-04-19 11:07:30','134301f5-5bda-4e4e-a6f0-a6d04f099e51'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-04-19 11:07:30','2024-04-19 11:07:30','4461594e-4550-4d87-99bb-b2c8020d987c'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-04-19 11:07:30','2024-04-19 11:07:30','7e1d0095-6051-45c3-a481-d5502d271a01'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-04-19 11:07:30','2024-04-19 11:07:30','ddcd96ed-1668-4538-ad8f-9e403678b2bb');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 14:59:39
