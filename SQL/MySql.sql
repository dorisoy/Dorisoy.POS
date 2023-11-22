CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;

CREATE TABLE `Currencies` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Symbol` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Currencies` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `LoginAudits` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NULL,
    `LoginTime` datetime(6) NOT NULL,
    `RemoteIP` varchar(50) CHARACTER SET utf8mb4 NULL,
    `Status` longtext CHARACTER SET utf8mb4 NULL,
    `Provider` longtext CHARACTER SET utf8mb4 NULL,
    `Latitude` varchar(50) CHARACTER SET utf8mb4 NULL,
    `Longitude` varchar(50) CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_LoginAudits` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `NewsletterSubscribers` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Email` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `CreatedDate` datetime(6) NOT NULL,
    CONSTRAINT `PK_NewsletterSubscribers` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `NLog` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `MachineName` longtext CHARACTER SET utf8mb4 NULL,
    `Logged` datetime(6) NOT NULL,
    `Level` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `Logger` longtext CHARACTER SET utf8mb4 NULL,
    `Properties` longtext CHARACTER SET utf8mb4 NULL,
    `Callsite` longtext CHARACTER SET utf8mb4 NULL,
    `Exception` longtext CHARACTER SET utf8mb4 NULL,
    `Source` varchar(50) CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_NLog` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Users` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `FirstName` longtext CHARACTER SET utf8mb4 NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `IsActive` tinyint(1) NOT NULL,
    `ProfilePhoto` longtext CHARACTER SET utf8mb4 NULL,
    `Provider` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `IsSuperAdmin` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `UserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `Email` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 NULL,
    `EmailConfirmed` tinyint(1) NOT NULL,
    `PasswordHash` longtext CHARACTER SET utf8mb4 NULL,
    `SecurityStamp` longtext CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNumberConfirmed` tinyint(1) NOT NULL,
    `TwoFactorEnabled` tinyint(1) NOT NULL,
    `LockoutEnd` datetime(6) NULL,
    `LockoutEnabled` tinyint(1) NOT NULL,
    `AccessFailedCount` int NOT NULL,
    CONSTRAINT `PK_Users` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Brands` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `ImageUrl` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Brands` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Brands_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `CompanyProfiles` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Title` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `LogoUrl` longtext CHARACTER SET utf8mb4 NULL,
    `Phone` longtext CHARACTER SET utf8mb4 NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `CurrencyCode` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_CompanyProfiles` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_CompanyProfiles_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ContactRequests` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `Phone` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ContactRequests` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ContactRequests_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Countries` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `CountryName` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Countries` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Countries_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `EmailSMTPSettings` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Host` longtext CHARACTER SET utf8mb4 NOT NULL,
    `UserName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Password` longtext CHARACTER SET utf8mb4 NOT NULL,
    `IsEnableSSL` tinyint(1) NOT NULL,
    `Port` int NOT NULL,
    `IsDefault` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_EmailSMTPSettings` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_EmailSMTPSettings_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_EmailSMTPSettings_Users_DeletedBy` FOREIGN KEY (`DeletedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_EmailSMTPSettings_Users_ModifiedBy` FOREIGN KEY (`ModifiedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `EmailTemplates` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Body` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_EmailTemplates` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_EmailTemplates_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `ExpenseCategories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ExpenseCategories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ExpenseCategories_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquirySources` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InquirySources` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InquirySources_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquiryStatuses` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InquiryStatuses` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InquiryStatuses_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Pages` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Order` int NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Pages` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Pages_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `ProductCategories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `ParentId` char(36) COLLATE ascii_general_ci NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ProductCategories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ProductCategories_ProductCategories_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `ProductCategories` (`Id`),
    CONSTRAINT `FK_ProductCategories_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Reminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `Frequency` int NULL,
    `StartDate` datetime(6) NOT NULL,
    `EndDate` datetime(6) NULL,
    `DayOfWeek` int NULL,
    `IsRepeated` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Reminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Reminders_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderSchedulers` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Duration` datetime(6) NOT NULL,
    `IsActive` tinyint(1) NOT NULL,
    `Frequency` int NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsRead` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `ReferenceId` char(36) COLLATE ascii_general_ci NULL,
    `Application` int NULL,
    CONSTRAINT `PK_ReminderSchedulers` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ReminderSchedulers_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Roles` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime(6) NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsSuperRole` tinyint(1) NOT NULL,
    `Name` varchar(256) CHARACTER SET utf8mb4 NULL,
    `NormalizedName` varchar(256) CHARACTER SET utf8mb4 NULL,
    `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Roles` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Roles_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Roles_Users_DeletedBy` FOREIGN KEY (`DeletedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Roles_Users_ModifiedBy` FOREIGN KEY (`ModifiedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Taxes` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Percentage` decimal(18,2) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Taxes` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Taxes_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Testimonials` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Designation` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `IsActive` tinyint(1) NOT NULL,
    `Url` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Testimonials` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Testimonials_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Testimonials_Users_DeletedBy` FOREIGN KEY (`DeletedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Testimonials_Users_ModifiedBy` FOREIGN KEY (`ModifiedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `UnitConversations` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Code` longtext CHARACTER SET utf8mb4 NULL,
    `Operator` int NULL,
    `Value` decimal(65,30) NULL,
    `ParentId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_UnitConversations` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_UnitConversations_UnitConversations_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `UnitConversations` (`Id`),
    CONSTRAINT `FK_UnitConversations_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserLogins` (
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderKey` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `ProviderDisplayName` longtext CHARACTER SET utf8mb4 NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_UserLogins` PRIMARY KEY (`LoginProvider`, `ProviderKey`),
    CONSTRAINT `FK_UserLogins_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserTokens` (
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_UserTokens` PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
    CONSTRAINT `FK_UserTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Warehouses` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `ContactPerson` longtext CHARACTER SET utf8mb4 NULL,
    `MobileNumber` longtext CHARACTER SET utf8mb4 NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Warehouses` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Warehouses_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Cities` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `CityName` longtext CHARACTER SET utf8mb4 NULL,
    `CountryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Cities` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Cities_Countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Cities_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Expenses` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Reference` longtext CHARACTER SET utf8mb4 NULL,
    `ExpenseCategoryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Amount` decimal(18,2) NOT NULL,
    `ExpenseById` char(36) COLLATE ascii_general_ci NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `ExpenseDate` datetime(6) NOT NULL,
    `ReceiptName` longtext CHARACTER SET utf8mb4 NULL,
    `ReceiptPath` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Expenses` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Expenses_ExpenseCategories_ExpenseCategoryId` FOREIGN KEY (`ExpenseCategoryId`) REFERENCES `ExpenseCategories` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Expenses_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Expenses_Users_ExpenseById` FOREIGN KEY (`ExpenseById`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Actions` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Order` int NOT NULL,
    `PageId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Code` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Actions` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Actions_Pages_PageId` FOREIGN KEY (`PageId`) REFERENCES `Pages` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Actions_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `DailyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `DayOfWeek` int NOT NULL,
    `IsActive` tinyint(1) NOT NULL,
    CONSTRAINT `PK_DailyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_DailyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `HalfYearlyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Day` int NOT NULL,
    `Month` int NOT NULL,
    `Quarter` int NOT NULL,
    CONSTRAINT `PK_HalfYearlyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_HalfYearlyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `QuarterlyReminders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Day` int NOT NULL,
    `Month` int NOT NULL,
    `Quarter` int NOT NULL,
    CONSTRAINT `PK_QuarterlyReminders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_QuarterlyReminders_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderNotifications` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `FetchDateTime` datetime(6) NOT NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    `IsEmailNotification` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ReminderNotifications` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_ReminderNotifications_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `ReminderUsers` (
    `ReminderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_ReminderUsers` PRIMARY KEY (`ReminderId`, `UserId`),
    CONSTRAINT `FK_ReminderUsers_Reminders_ReminderId` FOREIGN KEY (`ReminderId`) REFERENCES `Reminders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_ReminderUsers_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserRoles` (
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `RoleId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_UserRoles` PRIMARY KEY (`UserId`, `RoleId`),
    CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Products` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `Code` longtext CHARACTER SET utf8mb4 NULL,
    `Barcode` longtext CHARACTER SET utf8mb4 NULL,
    `SkuCode` longtext CHARACTER SET utf8mb4 NULL,
    `SkuName` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `ProductUrl` longtext CHARACTER SET utf8mb4 NULL,
    `QRCodeUrl` longtext CHARACTER SET utf8mb4 NULL,
    `UnitId` char(36) COLLATE ascii_general_ci NOT NULL,
    `PurchasePrice` decimal(18,2) NULL,
    `SalesPrice` decimal(18,2) NULL,
    `Mrp` decimal(18,2) NULL,
    `CategoryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `BrandId` char(36) COLLATE ascii_general_ci NOT NULL,
    `WarehouseId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Products` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Products_Brands_BrandId` FOREIGN KEY (`BrandId`) REFERENCES `Brands` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Products_ProductCategories_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `ProductCategories` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Products_UnitConversations_UnitId` FOREIGN KEY (`UnitId`) REFERENCES `UnitConversations` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Products_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Products_Warehouses_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `Warehouses` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Customers` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `CustomerName` longtext CHARACTER SET utf8mb4 NULL,
    `ContactPerson` longtext CHARACTER SET utf8mb4 NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `Fax` longtext CHARACTER SET utf8mb4 NULL,
    `MobileNo` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNo` longtext CHARACTER SET utf8mb4 NULL,
    `Website` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `Url` longtext CHARACTER SET utf8mb4 NULL,
    `IsVarified` tinyint(1) NOT NULL,
    `IsUnsubscribe` tinyint(1) NOT NULL,
    `CustomerProfile` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `CountryName` longtext CHARACTER SET utf8mb4 NULL,
    `CityName` longtext CHARACTER SET utf8mb4 NULL,
    `CountryId` char(36) COLLATE ascii_general_ci NULL,
    `CityId` char(36) COLLATE ascii_general_ci NULL,
    `IsWalkIn` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Customers` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Customers_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`),
    CONSTRAINT `FK_Customers_Countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`Id`),
    CONSTRAINT `FK_Customers_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Customers_Users_DeletedBy` FOREIGN KEY (`DeletedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Customers_Users_ModifiedBy` FOREIGN KEY (`ModifiedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `Inquiries` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `CompanyName` longtext CHARACTER SET utf8mb4 NULL,
    `ContactPerson` varchar(100) CHARACTER SET utf8mb4 NULL,
    `Email` varchar(50) CHARACTER SET utf8mb4 NULL,
    `Phone` longtext CHARACTER SET utf8mb4 NULL,
    `MobileNo` longtext CHARACTER SET utf8mb4 NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `CityName` longtext CHARACTER SET utf8mb4 NULL,
    `Website` longtext CHARACTER SET utf8mb4 NULL,
    `CountryName` longtext CHARACTER SET utf8mb4 NULL,
    `CityId` char(36) COLLATE ascii_general_ci NULL,
    `CountryId` char(36) COLLATE ascii_general_ci NULL,
    `AssignTo` char(36) COLLATE ascii_general_ci NULL,
    `InquiryStatusId` char(36) COLLATE ascii_general_ci NULL,
    `InquirySourceId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Inquiries` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Inquiries_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`),
    CONSTRAINT `FK_Inquiries_Countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`Id`),
    CONSTRAINT `FK_Inquiries_InquirySources_InquirySourceId` FOREIGN KEY (`InquirySourceId`) REFERENCES `InquirySources` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Inquiries_InquiryStatuses_InquiryStatusId` FOREIGN KEY (`InquiryStatusId`) REFERENCES `InquiryStatuses` (`Id`),
    CONSTRAINT `FK_Inquiries_Users_AssignTo` FOREIGN KEY (`AssignTo`) REFERENCES `Users` (`Id`),
    CONSTRAINT `FK_Inquiries_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `SupplierAddresses` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Address` longtext CHARACTER SET utf8mb4 NULL,
    `CountryName` longtext CHARACTER SET utf8mb4 NULL,
    `CityName` longtext CHARACTER SET utf8mb4 NULL,
    `CountryId` char(36) COLLATE ascii_general_ci NULL,
    `CityId` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_SupplierAddresses` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SupplierAddresses_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`),
    CONSTRAINT `FK_SupplierAddresses_Countries_CountryId` FOREIGN KEY (`CountryId`) REFERENCES `Countries` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `RoleClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ActionId` char(36) COLLATE ascii_general_ci NOT NULL,
    `RoleId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_RoleClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_RoleClaims_Actions_ActionId` FOREIGN KEY (`ActionId`) REFERENCES `Actions` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_RoleClaims_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `UserClaims` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `ActionId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UserId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ClaimType` longtext CHARACTER SET utf8mb4 NULL,
    `ClaimValue` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_UserClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_UserClaims_Actions_ActionId` FOREIGN KEY (`ActionId`) REFERENCES `Actions` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_UserClaims_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Inventories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Stock` decimal(65,30) NOT NULL,
    `AveragePurchasePrice` decimal(65,30) NOT NULL,
    `AverageSalesPrice` decimal(65,30) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Inventories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Inventories_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Inventories_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `ProductTaxes` (
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `TaxId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_ProductTaxes` PRIMARY KEY (`ProductId`, `TaxId`),
    CONSTRAINT `FK_ProductTaxes_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_ProductTaxes_Taxes_TaxId` FOREIGN KEY (`TaxId`) REFERENCES `Taxes` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_ProductTaxes_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `WarehouseInventories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Stock` decimal(65,30) NOT NULL,
    `WarehouseId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_WarehouseInventories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_WarehouseInventories_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_WarehouseInventories_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_WarehouseInventories_Warehouses_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `Warehouses` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `SalesOrders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `OrderNumber` longtext CHARACTER SET utf8mb4 NULL,
    `Note` longtext CHARACTER SET utf8mb4 NULL,
    `SaleReturnNote` longtext CHARACTER SET utf8mb4 NULL,
    `TermAndCondition` longtext CHARACTER SET utf8mb4 NULL,
    `IsSalesOrderRequest` tinyint(1) NOT NULL,
    `SOCreatedDate` datetime(6) NOT NULL,
    `Status` int NOT NULL,
    `DeliveryDate` datetime(6) NOT NULL,
    `DeliveryStatus` int NOT NULL,
    `CustomerId` char(36) COLLATE ascii_general_ci NOT NULL,
    `TotalAmount` decimal(18,2) NOT NULL,
    `TotalTax` decimal(65,30) NOT NULL,
    `TotalDiscount` decimal(65,30) NOT NULL,
    `TotalPaidAmount` decimal(65,30) NOT NULL,
    `PaymentStatus` int NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_SalesOrders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SalesOrders_Customers_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_SalesOrders_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquiryActivities` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `DueDate` datetime(6) NULL,
    `IsOpen` tinyint(1) NOT NULL,
    `AssignTo` char(36) COLLATE ascii_general_ci NULL,
    `Priority` longtext CHARACTER SET utf8mb4 NULL,
    `InquiryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InquiryActivities` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InquiryActivities_Inquiries_InquiryId` FOREIGN KEY (`InquiryId`) REFERENCES `Inquiries` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_InquiryActivities_Users_AssignTo` FOREIGN KEY (`AssignTo`) REFERENCES `Users` (`Id`),
    CONSTRAINT `FK_InquiryActivities_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquiryAttachments` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `InquiryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Path` longtext CHARACTER SET utf8mb4 NULL,
    `Name` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InquiryAttachments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InquiryAttachments_Inquiries_InquiryId` FOREIGN KEY (`InquiryId`) REFERENCES `Inquiries` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_InquiryAttachments_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquiryNotes` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `InquiryId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Note` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InquiryNotes` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InquiryNotes_Inquiries_InquiryId` FOREIGN KEY (`InquiryId`) REFERENCES `Inquiries` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_InquiryNotes_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `InquiryProducts` (
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `InquiryId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_InquiryProducts` PRIMARY KEY (`ProductId`, `InquiryId`),
    CONSTRAINT `FK_InquiryProducts_Inquiries_InquiryId` FOREIGN KEY (`InquiryId`) REFERENCES `Inquiries` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_InquiryProducts_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `Suppliers` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `SupplierName` longtext CHARACTER SET utf8mb4 NULL,
    `ContactPerson` longtext CHARACTER SET utf8mb4 NULL,
    `Email` longtext CHARACTER SET utf8mb4 NULL,
    `Fax` longtext CHARACTER SET utf8mb4 NULL,
    `MobileNo` longtext CHARACTER SET utf8mb4 NULL,
    `PhoneNo` longtext CHARACTER SET utf8mb4 NULL,
    `Website` longtext CHARACTER SET utf8mb4 NULL,
    `Description` longtext CHARACTER SET utf8mb4 NULL,
    `Url` longtext CHARACTER SET utf8mb4 NULL,
    `IsVarified` tinyint(1) NOT NULL,
    `IsUnsubscribe` tinyint(1) NOT NULL,
    `SupplierProfile` longtext CHARACTER SET utf8mb4 NULL,
    `BusinessType` longtext CHARACTER SET utf8mb4 NULL,
    `SupplierAddressId` char(36) COLLATE ascii_general_ci NOT NULL,
    `BillingAddressId` char(36) COLLATE ascii_general_ci NOT NULL,
    `ShippingAddressId` char(36) COLLATE ascii_general_ci NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_Suppliers` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Suppliers_SupplierAddresses_BillingAddressId` FOREIGN KEY (`BillingAddressId`) REFERENCES `SupplierAddresses` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Suppliers_SupplierAddresses_ShippingAddressId` FOREIGN KEY (`ShippingAddressId`) REFERENCES `SupplierAddresses` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Suppliers_SupplierAddresses_SupplierAddressId` FOREIGN KEY (`SupplierAddressId`) REFERENCES `SupplierAddresses` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Suppliers_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Suppliers_Users_DeletedBy` FOREIGN KEY (`DeletedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_Suppliers_Users_ModifiedBy` FOREIGN KEY (`ModifiedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `SalesOrderItems` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Status` int NOT NULL,
    `SalesOrderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UnitPrice` decimal(18,2) NOT NULL,
    `Quantity` int NOT NULL,
    `TaxValue` decimal(18,2) NOT NULL,
    `Discount` decimal(18,2) NOT NULL,
    `DiscountPercentage` decimal(65,30) NOT NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `UnitId` char(36) COLLATE ascii_general_ci NOT NULL,
    `WarehouseId` char(36) COLLATE ascii_general_ci NULL,
    CONSTRAINT `PK_SalesOrderItems` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SalesOrderItems_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_SalesOrderItems_SalesOrders_SalesOrderId` FOREIGN KEY (`SalesOrderId`) REFERENCES `SalesOrders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_SalesOrderItems_UnitConversations_UnitId` FOREIGN KEY (`UnitId`) REFERENCES `UnitConversations` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_SalesOrderItems_Warehouses_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `Warehouses` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `SalesOrderPayments` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `SalesOrderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `PaymentDate` datetime(6) NOT NULL,
    `ReferenceNumber` longtext CHARACTER SET utf8mb4 NULL,
    `Amount` decimal(65,30) NOT NULL,
    `PaymentMethod` int NOT NULL,
    `Note` longtext CHARACTER SET utf8mb4 NULL,
    `AttachmentUrl` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_SalesOrderPayments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SalesOrderPayments_SalesOrders_SalesOrderId` FOREIGN KEY (`SalesOrderId`) REFERENCES `SalesOrders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_SalesOrderPayments_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `PurchaseOrders` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `OrderNumber` longtext CHARACTER SET utf8mb4 NULL,
    `Note` longtext CHARACTER SET utf8mb4 NULL,
    `PurchaseReturnNote` longtext CHARACTER SET utf8mb4 NULL,
    `TermAndCondition` longtext CHARACTER SET utf8mb4 NULL,
    `IsPurchaseOrderRequest` tinyint(1) NOT NULL,
    `POCreatedDate` datetime(6) NOT NULL,
    `Status` int NOT NULL,
    `DeliveryDate` datetime(6) NOT NULL,
    `DeliveryStatus` int NOT NULL,
    `SupplierId` char(36) COLLATE ascii_general_ci NOT NULL,
    `TotalAmount` decimal(18,2) NOT NULL,
    `TotalTax` decimal(65,30) NOT NULL,
    `TotalDiscount` decimal(65,30) NOT NULL,
    `TotalPaidAmount` decimal(65,30) NOT NULL,
    `PaymentStatus` int NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_PurchaseOrders` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_PurchaseOrders_Suppliers_SupplierId` FOREIGN KEY (`SupplierId`) REFERENCES `Suppliers` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_PurchaseOrders_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `SendEmails` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `Subject` longtext CHARACTER SET utf8mb4 NULL,
    `Message` longtext CHARACTER SET utf8mb4 NULL,
    `SupplierId` char(36) COLLATE ascii_general_ci NULL,
    `CustomerId` char(36) COLLATE ascii_general_ci NULL,
    `IsSend` tinyint(1) NOT NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_SendEmails` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SendEmails_Customers_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`Id`),
    CONSTRAINT `FK_SendEmails_Suppliers_SupplierId` FOREIGN KEY (`SupplierId`) REFERENCES `Suppliers` (`Id`),
    CONSTRAINT `FK_SendEmails_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `SalesOrderItemTaxes` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `SalesOrderItemId` char(36) COLLATE ascii_general_ci NOT NULL,
    `TaxId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_SalesOrderItemTaxes` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_SalesOrderItemTaxes_SalesOrderItems_SalesOrderItemId` FOREIGN KEY (`SalesOrderItemId`) REFERENCES `SalesOrderItems` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_SalesOrderItemTaxes_Taxes_TaxId` FOREIGN KEY (`TaxId`) REFERENCES `Taxes` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `InventoryHistories` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `InventorySource` int NOT NULL,
    `Stock` decimal(65,30) NOT NULL,
    `PricePerUnit` decimal(65,30) NOT NULL,
    `PreviousTotalStock` decimal(65,30) NOT NULL,
    `PurchaseOrderId` char(36) COLLATE ascii_general_ci NULL,
    `SalesOrderId` char(36) COLLATE ascii_general_ci NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_InventoryHistories` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_InventoryHistories_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_InventoryHistories_PurchaseOrders_PurchaseOrderId` FOREIGN KEY (`PurchaseOrderId`) REFERENCES `PurchaseOrders` (`Id`),
    CONSTRAINT `FK_InventoryHistories_SalesOrders_SalesOrderId` FOREIGN KEY (`SalesOrderId`) REFERENCES `SalesOrders` (`Id`),
    CONSTRAINT `FK_InventoryHistories_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `PurchaseOrderItems` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `ProductId` char(36) COLLATE ascii_general_ci NOT NULL,
    `Status` int NOT NULL,
    `PurchaseOrderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `UnitPrice` decimal(18,2) NOT NULL,
    `Quantity` int NOT NULL,
    `TaxValue` decimal(18,2) NOT NULL,
    `Discount` decimal(18,2) NOT NULL,
    `DiscountPercentage` decimal(65,30) NOT NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `UnitId` char(36) COLLATE ascii_general_ci NOT NULL,
    `WarehouseId` char(36) COLLATE ascii_general_ci NULL,
    CONSTRAINT `PK_PurchaseOrderItems` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_PurchaseOrderItems_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_PurchaseOrderItems_PurchaseOrders_PurchaseOrderId` FOREIGN KEY (`PurchaseOrderId`) REFERENCES `PurchaseOrders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_PurchaseOrderItems_UnitConversations_UnitId` FOREIGN KEY (`UnitId`) REFERENCES `UnitConversations` (`Id`) ON DELETE RESTRICT,
    CONSTRAINT `FK_PurchaseOrderItems_Warehouses_WarehouseId` FOREIGN KEY (`WarehouseId`) REFERENCES `Warehouses` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `PurchaseOrderPayments` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `PurchaseOrderId` char(36) COLLATE ascii_general_ci NOT NULL,
    `PaymentDate` datetime(6) NOT NULL,
    `ReferenceNumber` longtext CHARACTER SET utf8mb4 NULL,
    `Amount` decimal(65,30) NOT NULL,
    `PaymentMethod` int NOT NULL,
    `Note` longtext CHARACTER SET utf8mb4 NULL,
    `AttachmentUrl` longtext CHARACTER SET utf8mb4 NULL,
    `CreatedDate` datetime NOT NULL,
    `CreatedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `ModifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedBy` char(36) COLLATE ascii_general_ci NOT NULL,
    `DeletedDate` datetime NULL,
    `DeletedBy` char(36) COLLATE ascii_general_ci NULL,
    `IsDeleted` tinyint(1) NOT NULL,
    CONSTRAINT `PK_PurchaseOrderPayments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_PurchaseOrderPayments_PurchaseOrders_PurchaseOrderId` FOREIGN KEY (`PurchaseOrderId`) REFERENCES `PurchaseOrders` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_PurchaseOrderPayments_Users_CreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT
) CHARACTER SET=utf8mb4;

CREATE TABLE `PurchaseOrderItemTaxes` (
    `Id` char(36) COLLATE ascii_general_ci NOT NULL,
    `PurchaseOrderItemId` char(36) COLLATE ascii_general_ci NOT NULL,
    `TaxId` char(36) COLLATE ascii_general_ci NOT NULL,
    CONSTRAINT `PK_PurchaseOrderItemTaxes` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_PurchaseOrderItemTaxes_PurchaseOrderItems_PurchaseOrderItemId` FOREIGN KEY (`PurchaseOrderItemId`) REFERENCES `PurchaseOrderItems` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_PurchaseOrderItemTaxes_Taxes_TaxId` FOREIGN KEY (`TaxId`) REFERENCES `Taxes` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_Actions_CreatedBy` ON `Actions` (`CreatedBy`);

CREATE INDEX `IX_Actions_PageId` ON `Actions` (`PageId`);

CREATE INDEX `IX_Brands_CreatedBy` ON `Brands` (`CreatedBy`);

CREATE INDEX `IX_Cities_CountryId` ON `Cities` (`CountryId`);

CREATE INDEX `IX_Cities_CreatedBy` ON `Cities` (`CreatedBy`);

CREATE INDEX `IX_CompanyProfiles_CreatedBy` ON `CompanyProfiles` (`CreatedBy`);

CREATE INDEX `IX_ContactRequests_CreatedBy` ON `ContactRequests` (`CreatedBy`);

CREATE INDEX `IX_Countries_CreatedBy` ON `Countries` (`CreatedBy`);

CREATE INDEX `IX_Customers_CityId` ON `Customers` (`CityId`);

CREATE INDEX `IX_Customers_CountryId` ON `Customers` (`CountryId`);

CREATE INDEX `IX_Customers_CreatedBy` ON `Customers` (`CreatedBy`);

CREATE INDEX `IX_Customers_DeletedBy` ON `Customers` (`DeletedBy`);

CREATE INDEX `IX_Customers_ModifiedBy` ON `Customers` (`ModifiedBy`);

CREATE INDEX `IX_DailyReminders_ReminderId` ON `DailyReminders` (`ReminderId`);

CREATE INDEX `IX_EmailSMTPSettings_CreatedBy` ON `EmailSMTPSettings` (`CreatedBy`);

CREATE INDEX `IX_EmailSMTPSettings_DeletedBy` ON `EmailSMTPSettings` (`DeletedBy`);

CREATE INDEX `IX_EmailSMTPSettings_ModifiedBy` ON `EmailSMTPSettings` (`ModifiedBy`);

CREATE INDEX `IX_EmailTemplates_CreatedBy` ON `EmailTemplates` (`CreatedBy`);

CREATE INDEX `IX_ExpenseCategories_CreatedBy` ON `ExpenseCategories` (`CreatedBy`);

CREATE INDEX `IX_Expenses_CreatedBy` ON `Expenses` (`CreatedBy`);

CREATE INDEX `IX_Expenses_ExpenseById` ON `Expenses` (`ExpenseById`);

CREATE INDEX `IX_Expenses_ExpenseCategoryId` ON `Expenses` (`ExpenseCategoryId`);

CREATE INDEX `IX_HalfYearlyReminders_ReminderId` ON `HalfYearlyReminders` (`ReminderId`);

CREATE INDEX `IX_Inquiries_AssignTo` ON `Inquiries` (`AssignTo`);

CREATE INDEX `IX_Inquiries_CityId` ON `Inquiries` (`CityId`);

CREATE INDEX `IX_Inquiries_CountryId` ON `Inquiries` (`CountryId`);

CREATE INDEX `IX_Inquiries_CreatedBy` ON `Inquiries` (`CreatedBy`);

CREATE INDEX `IX_Inquiries_InquirySourceId` ON `Inquiries` (`InquirySourceId`);

CREATE INDEX `IX_Inquiries_InquiryStatusId` ON `Inquiries` (`InquiryStatusId`);

CREATE INDEX `IX_InquiryActivities_AssignTo` ON `InquiryActivities` (`AssignTo`);

CREATE INDEX `IX_InquiryActivities_CreatedBy` ON `InquiryActivities` (`CreatedBy`);

CREATE INDEX `IX_InquiryActivities_InquiryId` ON `InquiryActivities` (`InquiryId`);

CREATE INDEX `IX_InquiryAttachments_CreatedBy` ON `InquiryAttachments` (`CreatedBy`);

CREATE INDEX `IX_InquiryAttachments_InquiryId` ON `InquiryAttachments` (`InquiryId`);

CREATE INDEX `IX_InquiryNotes_CreatedBy` ON `InquiryNotes` (`CreatedBy`);

CREATE INDEX `IX_InquiryNotes_InquiryId` ON `InquiryNotes` (`InquiryId`);

CREATE INDEX `IX_InquiryProducts_InquiryId` ON `InquiryProducts` (`InquiryId`);

CREATE INDEX `IX_InquirySources_CreatedBy` ON `InquirySources` (`CreatedBy`);

CREATE INDEX `IX_InquiryStatuses_CreatedBy` ON `InquiryStatuses` (`CreatedBy`);

CREATE INDEX `IX_Inventories_CreatedBy` ON `Inventories` (`CreatedBy`);

CREATE INDEX `IX_Inventories_ProductId` ON `Inventories` (`ProductId`);

CREATE INDEX `IX_InventoryHistories_CreatedBy` ON `InventoryHistories` (`CreatedBy`);

CREATE INDEX `IX_InventoryHistories_ProductId` ON `InventoryHistories` (`ProductId`);

CREATE INDEX `IX_InventoryHistories_PurchaseOrderId` ON `InventoryHistories` (`PurchaseOrderId`);

CREATE INDEX `IX_InventoryHistories_SalesOrderId` ON `InventoryHistories` (`SalesOrderId`);

CREATE INDEX `IX_Pages_CreatedBy` ON `Pages` (`CreatedBy`);

CREATE INDEX `IX_ProductCategories_CreatedBy` ON `ProductCategories` (`CreatedBy`);

CREATE INDEX `IX_ProductCategories_ParentId` ON `ProductCategories` (`ParentId`);

CREATE INDEX `IX_Products_BrandId` ON `Products` (`BrandId`);

CREATE INDEX `IX_Products_CategoryId` ON `Products` (`CategoryId`);

CREATE INDEX `IX_Products_CreatedBy` ON `Products` (`CreatedBy`);

CREATE INDEX `IX_Products_UnitId` ON `Products` (`UnitId`);

CREATE INDEX `IX_Products_WarehouseId` ON `Products` (`WarehouseId`);

CREATE INDEX `IX_ProductTaxes_CreatedBy` ON `ProductTaxes` (`CreatedBy`);

CREATE INDEX `IX_ProductTaxes_TaxId` ON `ProductTaxes` (`TaxId`);

CREATE INDEX `IX_PurchaseOrderItems_ProductId` ON `PurchaseOrderItems` (`ProductId`);

CREATE INDEX `IX_PurchaseOrderItems_PurchaseOrderId` ON `PurchaseOrderItems` (`PurchaseOrderId`);

CREATE INDEX `IX_PurchaseOrderItems_UnitId` ON `PurchaseOrderItems` (`UnitId`);

CREATE INDEX `IX_PurchaseOrderItems_WarehouseId` ON `PurchaseOrderItems` (`WarehouseId`);

CREATE INDEX `IX_PurchaseOrderItemTaxes_PurchaseOrderItemId` ON `PurchaseOrderItemTaxes` (`PurchaseOrderItemId`);

CREATE INDEX `IX_PurchaseOrderItemTaxes_TaxId` ON `PurchaseOrderItemTaxes` (`TaxId`);

CREATE INDEX `IX_PurchaseOrderPayments_CreatedBy` ON `PurchaseOrderPayments` (`CreatedBy`);

CREATE INDEX `IX_PurchaseOrderPayments_PurchaseOrderId` ON `PurchaseOrderPayments` (`PurchaseOrderId`);

CREATE INDEX `IX_PurchaseOrders_CreatedBy` ON `PurchaseOrders` (`CreatedBy`);

CREATE INDEX `IX_PurchaseOrders_SupplierId` ON `PurchaseOrders` (`SupplierId`);

CREATE INDEX `IX_QuarterlyReminders_ReminderId` ON `QuarterlyReminders` (`ReminderId`);

CREATE INDEX `IX_ReminderNotifications_ReminderId` ON `ReminderNotifications` (`ReminderId`);

CREATE INDEX `IX_Reminders_CreatedBy` ON `Reminders` (`CreatedBy`);

CREATE INDEX `IX_ReminderSchedulers_UserId` ON `ReminderSchedulers` (`UserId`);

CREATE INDEX `IX_ReminderUsers_UserId` ON `ReminderUsers` (`UserId`);

CREATE INDEX `IX_RoleClaims_ActionId` ON `RoleClaims` (`ActionId`);

CREATE INDEX `IX_RoleClaims_RoleId` ON `RoleClaims` (`RoleId`);

CREATE INDEX `IX_Roles_CreatedBy` ON `Roles` (`CreatedBy`);

CREATE INDEX `IX_Roles_DeletedBy` ON `Roles` (`DeletedBy`);

CREATE INDEX `IX_Roles_ModifiedBy` ON `Roles` (`ModifiedBy`);

CREATE UNIQUE INDEX `RoleNameIndex` ON `Roles` (`NormalizedName`);

CREATE INDEX `IX_SalesOrderItems_ProductId` ON `SalesOrderItems` (`ProductId`);

CREATE INDEX `IX_SalesOrderItems_SalesOrderId` ON `SalesOrderItems` (`SalesOrderId`);

CREATE INDEX `IX_SalesOrderItems_UnitId` ON `SalesOrderItems` (`UnitId`);

CREATE INDEX `IX_SalesOrderItems_WarehouseId` ON `SalesOrderItems` (`WarehouseId`);

CREATE INDEX `IX_SalesOrderItemTaxes_SalesOrderItemId` ON `SalesOrderItemTaxes` (`SalesOrderItemId`);

CREATE INDEX `IX_SalesOrderItemTaxes_TaxId` ON `SalesOrderItemTaxes` (`TaxId`);

CREATE INDEX `IX_SalesOrderPayments_CreatedBy` ON `SalesOrderPayments` (`CreatedBy`);

CREATE INDEX `IX_SalesOrderPayments_SalesOrderId` ON `SalesOrderPayments` (`SalesOrderId`);

CREATE INDEX `IX_SalesOrders_CreatedBy` ON `SalesOrders` (`CreatedBy`);

CREATE INDEX `IX_SalesOrders_CustomerId` ON `SalesOrders` (`CustomerId`);

CREATE INDEX `IX_SendEmails_CreatedBy` ON `SendEmails` (`CreatedBy`);

CREATE INDEX `IX_SendEmails_CustomerId` ON `SendEmails` (`CustomerId`);

CREATE INDEX `IX_SendEmails_SupplierId` ON `SendEmails` (`SupplierId`);

CREATE INDEX `IX_SupplierAddresses_CityId` ON `SupplierAddresses` (`CityId`);

CREATE INDEX `IX_SupplierAddresses_CountryId` ON `SupplierAddresses` (`CountryId`);

CREATE INDEX `IX_Suppliers_BillingAddressId` ON `Suppliers` (`BillingAddressId`);

CREATE INDEX `IX_Suppliers_CreatedBy` ON `Suppliers` (`CreatedBy`);

CREATE INDEX `IX_Suppliers_DeletedBy` ON `Suppliers` (`DeletedBy`);

CREATE INDEX `IX_Suppliers_ModifiedBy` ON `Suppliers` (`ModifiedBy`);

CREATE INDEX `IX_Suppliers_ShippingAddressId` ON `Suppliers` (`ShippingAddressId`);

CREATE INDEX `IX_Suppliers_SupplierAddressId` ON `Suppliers` (`SupplierAddressId`);

CREATE INDEX `IX_Taxes_CreatedBy` ON `Taxes` (`CreatedBy`);

CREATE INDEX `IX_Testimonials_CreatedBy` ON `Testimonials` (`CreatedBy`);

CREATE INDEX `IX_Testimonials_DeletedBy` ON `Testimonials` (`DeletedBy`);

CREATE INDEX `IX_Testimonials_ModifiedBy` ON `Testimonials` (`ModifiedBy`);

CREATE INDEX `IX_UnitConversations_CreatedBy` ON `UnitConversations` (`CreatedBy`);

CREATE INDEX `IX_UnitConversations_ParentId` ON `UnitConversations` (`ParentId`);

CREATE INDEX `IX_UserClaims_ActionId` ON `UserClaims` (`ActionId`);

CREATE INDEX `IX_UserClaims_UserId` ON `UserClaims` (`UserId`);

CREATE INDEX `IX_UserLogins_UserId` ON `UserLogins` (`UserId`);

CREATE INDEX `IX_UserRoles_RoleId` ON `UserRoles` (`RoleId`);

CREATE INDEX `EmailIndex` ON `Users` (`NormalizedEmail`);

CREATE UNIQUE INDEX `UserNameIndex` ON `Users` (`NormalizedUserName`);

CREATE INDEX `IX_WarehouseInventories_CreatedBy` ON `WarehouseInventories` (`CreatedBy`);

CREATE INDEX `IX_WarehouseInventories_ProductId` ON `WarehouseInventories` (`ProductId`);

CREATE INDEX `IX_WarehouseInventories_WarehouseId` ON `WarehouseInventories` (`WarehouseId`);

CREATE INDEX `IX_Warehouses_CreatedBy` ON `Warehouses` (`CreatedBy`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20221105122642_Initial', '6.0.7');

COMMIT;

START TRANSACTION;

INSERT `Users` (`Id`, `FirstName`, `LastName`, `IsDeleted`, `IsActive`, `ProfilePhoto`, `Provider`, `Address`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, IsSuperAdmin) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'Norman', N'Russell', 0, 1, NULL, NULL, NULL, CAST(N'2021-01-09T16:00:55.3200000' AS DateTime), NULL, CAST(N'2021-04-09T22:13:04.3607628' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', N'employee@gmail.com', N'EMPLOYEE@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEKWs5TYpiKZTo10GsYT3ydUD92Xv9PzHyaE6IlWewhVAcBXpQ92H1g7zz9r2wNXTTw==', N'C6DDSWCQJIFOEWSOC2IEIDGXZ7YOHGAC', N'542d648b-582f-464b-9264-4efd2a4f8b1a', N'7684012345', 0, 0, NULL, 1, 0,0);
INSERT `Users` (`Id`, `FirstName`, `LastName`, `IsDeleted`, `IsActive`, `ProfilePhoto`, `Provider`, `Address`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, IsSuperAdmin) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'Frederic', N'Holland', 0, 1, N'', NULL, NULL, CAST(N'2021-01-09T16:00:55.3200000' AS DateTime), NULL, CAST(N'2021-04-09T22:13:30.0911557' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEkx5K65gWhkIDvtcI3QVCom8fFRVWBIVlDWGqPujKdUWwSs2/0bB2fFzTaAq8z3pA==', N'EZNIRU4TFNZUE4VWL4CLRBHP7VMTICHA', N'510c7230-efc3-4401-baf9-eb56b37d19e5', N'3360123459', 0, 0, NULL, 1, 0,1);

INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c08d1303-474c-48e9-a5ab-05641e80808f', N'Settings', 15, CAST(N'2022-05-21T07:43:25.4818821' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:43:25.4818834' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'Reports', 10, CAST(N'2022-05-21T07:42:25.7773381' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:25.7773394' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7b542ac0-4c4b-4288-90d7-08d5f1f4f6fd', N'Reminder', 11, CAST(N'2022-05-21T07:42:36.6409351' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:36.6409364' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c4510cea-3b3f-4104-9eee-355788c86218', N'POS', 7, CAST(N'2022-07-11T06:37:45.6699508' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-07-11T06:37:53.5846659' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'Purchase Order', 6, CAST(N'2022-05-21T07:41:25.3713097' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:41:25.3713113' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1f5e57b6-a2c8-4bd7-8baa-311bfa4a32e1', N'Roles', 12, CAST(N'2022-05-21T07:42:46.8249919' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:46.8249939' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cd31a4fc-f46f-4a8b-ae1c-4c9e348778d9', N'Supplier', 2, CAST(N'2022-05-21T07:40:34.1161131' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:40:34.1161171' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'586b3001-82fa-4409-822a-4d1cf9df1384', N'Customer', 3, CAST(N'2022-05-21T07:40:55.4251097' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:40:55.4251116' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'Dashboard', 0, CAST(N'2022-05-21T07:40:05.7778611' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:40:05.7779229' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'60cf7833-4f34-4440-a7ce-5b8249165839', N'Product', 1, CAST(N'2022-05-21T07:40:22.7068217' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:40:47.2423495' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'Inquiry', 4, CAST(N'2022-05-21T07:41:02.7510113' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:41:02.7510157' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'Sales Order', 7, CAST(N'2022-05-21T07:41:36.9063542' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:41:40.7374649' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'Quotation', 5, CAST(N'2022-05-21T07:41:15.6336973' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:41:15.6337010' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'Users', 13, CAST(N'2022-05-21T07:42:53.2243600' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:53.2243615' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'74eda712-7c65-4735-a9e3-ac4d09459e4b', N'Inventory', 8, CAST(N'2022-05-21T07:42:13.6577786' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:13.6577811' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ff211fcb-9cf6-4bee-b4de-d7bdc372c888', N'Logs', 16, CAST(N'2022-05-21T07:43:31.3687142' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:43:31.3687153' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'Expense', 9, CAST(N'2022-05-21T07:42:19.8238474' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:42:19.8238489' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Pages` (`Id`, `Name`, `Order`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f08bcb7a-654e-4b18-af73-f2ade469a67c', N'Email', 14, CAST(N'2022-05-21T07:43:13.7012906' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T07:43:13.7012918' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ba8fc8b6-8982-4197-bf2a-05ab0e79e3d1', N'View Reminders', 1, N'7b542ac0-4c4b-4288-90d7-08d5f1f4f6fd', N'REM_VIEW_REMINDERS', CAST(N'2022-05-21T08:43:22.2727873' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:20:18.4903842' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5340a380-a8b1-4e01-ac88-05fc5e714abd', N'Delete Purchase Order Payment', 9, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_DELETE_PO_PAYMENT', CAST(N'2022-05-21T08:35:03.8762430' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:11:58.8839520' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e16e7eb5-cb97-4da2-958a-0c6a6ad904fc', N'View Inventories', 1, N'74eda712-7c65-4735-a9e3-ac4d09459e4b', N'INVE_VIEW_INVENTORIES', CAST(N'2022-05-21T08:40:11.8210658' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:02.8746418' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'84fd7cc0-c5a3-4c8d-bf64-113a94126975', N'View Sales Order Payment Report', 5, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_SO_PAYMENT_REP', CAST(N'2022-05-21T08:42:48.4754736' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:43.0427683' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1ecc483c-56c6-440c-a0fa-117dc95ffea6', N'Manage Inquiry Source', 6, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_MANAGE_INQ_SOURCE', CAST(N'2022-05-21T07:48:36.0972552' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:23:02.3533071' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd758eecf-a6f8-4f2c-8613-13321e34c18a', N'Manage Email Templates', 2, N'f08bcb7a-654e-4b18-af73-f2ade469a67c', N'EMAIL_MANAGE_EMAIL_TEMPLATES', CAST(N'2022-05-21T08:47:24.2581505' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:47:24.2581516' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6643cd87-5919-45a4-a4c8-13a09ad634ff', N'View Latest Inquiries', 4, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_LATEST_INQUIRIES', CAST(N'2022-05-21T08:26:36.9705738' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:25:59.9698536' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'535845e4-9ad3-43b5-b211-180d93a5b7a4', N'View Product Purchase Report', 7, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_PRO_PP_REP', CAST(N'2022-06-02T08:27:50.7802056' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-06-02T08:35:35.9576986' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4e3480c0-d396-4698-8a41-18896aaa61f1', N'Update Quotation', 3, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_UPDATE_PO_REQUEST', CAST(N'2022-05-21T07:49:44.4149304' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:13:41.9471212' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'10931818-757b-4c2d-94cb-1d613bb8f8ad', N'Manage Inquiry Status', 5, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_MANAGE_INQ_STATUS', CAST(N'2022-05-21T07:48:22.1388359' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:22:58.3312093' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eb708ad5-5e02-4078-a045-1dec7c478af7', N'Delete Quotation', 4, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_DELETE_PO_REQUEST', CAST(N'2022-05-21T07:50:00.2269914' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:13:49.0895834' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dc35bbc6-0bfb-4c17-a837-29c57d778732', N'Add Purchase Order', 2, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_ADD_PO', CAST(N'2022-05-21T08:32:35.9719744' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:27.4325659' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'591bdbca-19cc-440a-b2f1-2bc4f960aefc', N'Delete Reminder', 4, N'7b542ac0-4c4b-4288-90d7-08d5f1f4f6fd', N'REM_DELETE_REMINDER', CAST(N'2022-05-21T08:43:42.4352907' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:20:27.5145980' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'214c2d6e-d7f4-42a9-9d42-2daaf974a231', N'Manage Reminders', 7, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_MANAGE_REMINDERS', CAST(N'2022-05-21T07:53:57.3700675' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:30.6825410' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8f668703-b676-4d32-8533-2df18adba38e', N'Add Sales Order', 2, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_ADD_SO', CAST(N'2022-05-21T08:36:12.3877678' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:00.5538758' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'95cb2ac5-1df7-4638-9fff-30558296d238', N'Return Purchase Order', 6, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_RETURN_PO', CAST(N'2022-05-21T08:33:42.1959853' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:08.6280150' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c727325e-832c-4415-b225-3056ec6ebbb0', N'Reset Password', 5, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_RESET_PWD', CAST(N'2022-05-21T08:45:36.9130095' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:36.9556407' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'af35f348-c08b-48bb-9114-32ec00796b2d', N'Manage Expense Category', 5, N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'EXP_MANAGE_EXP_CATEGORY', CAST(N'2022-05-21T08:41:39.8514823' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:23:33.9075688' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'71324dce-e34a-4f09-8b9e-36cca42a459b', N'Manage Warehouse', 9, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_MANAGE_WAREHOUSE', CAST(N'2022-05-21T08:51:53.3317166' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:39.4982495' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5a54e8ea-ce73-468a-8d19-381dfa515e18', N'Add User', 2, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_ADD_USER', CAST(N'2022-05-21T08:45:09.4512580' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:18.1222228' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'43ca17e4-9d56-4ada-b044-3f2eb8a178d7', N'Add Quotation', 2, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_ADD_PO_REQUEST', CAST(N'2022-05-21T07:49:31.1140128' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:13:32.2658267' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5b102028-ac30-46dc-a5df-3fb6d5db1798', N'View Statistics', 0, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_STATISTICS', CAST(N'2022-05-21T08:25:36.9957356' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:25:40.3717520' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cc38b6c0-549b-4619-84a3-41296c0cf36c', N'Add Expense', 2, N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'EXP_ADD_EXPENSE', CAST(N'2022-05-21T08:41:13.9756176' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:19.8760560' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'211d3f08-773c-4d73-bbee-4147d223e5e5', N'Delete Product', 4, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_DELETE_PRODUCT', CAST(N'2022-05-21T07:45:41.5460341' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:21.1379637' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'53abe36f-1ec2-43f4-9788-418406778504', N'Manage Inventory', 2, N'74eda712-7c65-4735-a9e3-ac4d09459e4b', N'INVE_MANAGE_INVENTORY', CAST(N'2022-05-21T08:40:18.9005247' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:06.9135257' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bca867fc-4d72-426b-951b-448c25182a4e', N'Delete User', 4, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_DELETE_USER', CAST(N'2022-05-21T08:45:26.3233677' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:24.8335293' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e0871c29-080c-47fa-b52a-4750fec9f671', N'Update User', 3, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_UPDATE_USER', CAST(N'2022-05-21T08:45:16.1631549' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:21.6100780' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'14b57304-4eb8-48dc-a159-477dbf494dd9', N'View Customer Payment Report', 11, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_CUST_PAYMENT_REP', CAST(N'2022-06-02T08:30:21.7428588' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-06-02T08:35:55.9182798' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c15a4651-249a-4680-bd68-49c2dca7a431', N'Add Inquiry', 2, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_ADD_INQUIRY', CAST(N'2022-05-21T07:47:56.4336794' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:12.9129549' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd09266a8-dbed-4c0a-ad07-4d432de4c6b0', N'View Reminders', 3, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_REMINDERS', CAST(N'2022-05-21T08:26:26.0835382' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:25:54.6579854' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'40b5068b-cc64-4228-aa89-4dc9f5928135', N'View Users', 1, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_VIEW_USERS', CAST(N'2022-05-21T08:45:01.0436984' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:13.1873117' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f02385bb-46b7-41c1-9515-567e67699afd', N'View Inquiries', 1, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_VIEW_INQUIRIES', CAST(N'2022-05-21T07:47:50.8260770' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:09.5541886' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0fd2b76a-4e29-46ed-854c-5b727a7579e0', N'Update Reminder', 3, N'7b542ac0-4c4b-4288-90d7-08d5f1f4f6fd', N'REM_UPDATE_REMINDER', CAST(N'2022-05-21T08:43:35.6337627' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:20:24.3532519' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b3187d5b-33f0-4905-b534-5d6a66b84a8b', N'View Quotations', 1, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_VIEW_PO_REQUESTS', CAST(N'2022-05-21T07:49:05.1225676' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:13:24.7614563' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'97257f0e-e107-4a87-84ed-65106a08bd98', N'View Customers', 1, N'586b3001-82fa-4409-822a-4d1cf9df1384', N'CUST_VIEW_CUSTOMERS', CAST(N'2022-05-21T07:47:18.6182702' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:44.9855031' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd57eb050-4319-4998-b090-662e9ae096fb', N'Delete Sales Order Payment', 9, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_DELETE_SO_PAYMENT', CAST(N'2022-05-21T08:38:28.5213957' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:43.3139254' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f1a8fb1d-6236-4e87-89c3-6a0a9e69a49b', N'View Purchase Orders Report', 1, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_PO_REP', CAST(N'2022-05-21T08:42:03.7948166' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:27.1399256' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ffa85bd4-dbe7-4906-ac42-6abec2d2054a', N'View Sales Orders', 1, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_VIEW_SALES_ORDERS', CAST(N'2022-05-21T08:36:06.2357042' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:55.1860126' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ad6ae222-0053-4fce-81db-70e31f07cd56', N'Update Supplier', 3, N'cd31a4fc-f46f-4a8b-ae1c-4c9e348778d9', N'SUPP_UPDATE_SUPPLIER', CAST(N'2022-05-21T07:46:59.2741205' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:26.1225308' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'416452fc-27df-4550-bd3b-7304f8b3b7c4', N'View Stock Report', 9, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_STOCK_REPORT', CAST(N'2022-06-02T08:28:18.9909201' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-06-02T08:35:46.1260446' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'494d70f6-6dc0-4bd2-a0df-784dd4076db7', N'Manage Unit', 7, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_MANAGE_UNIT', CAST(N'2022-05-21T08:51:33.3157974' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:32.0017410' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7ed25023-a542-4236-a13f-7bd61a767e4a', N'Assign User Permissions', 7, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_ASSIGN_USR_PERMISSIONS', CAST(N'2022-05-21T08:46:26.9804151' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:24:49.8673348' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'68ca97f4-4683-4161-b3d1-7f161d4148e3', N'Manage Product Categories', 5, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_MANAGE_PRO_CAT', CAST(N'2022-05-21T07:46:05.4742682' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:26:31.1863949' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'13d482e4-0745-437a-824b-81a4f586ad28', N'Update Product', 3, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_UPDATE_PRODUCT', CAST(N'2022-05-21T07:45:35.6673404' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:17.6354077' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7f346d99-cdd1-4903-b1ea-8c68ec856c2d', N'View Recent Purchase Order Expected Delivery', 7, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_RECENT_PO_DELIVERY', CAST(N'2022-05-21T08:27:09.9963656' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:26:13.0364788' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4cdb0a09-6357-4d83-9cb2-8c84f449f112', N'View Purchase Orders', 1, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_VIEW_PURCHASE_ORDERS', CAST(N'2022-05-21T08:32:25.7955164' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:13:07.7537957' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7aa00d67-13c8-4762-a388-8ffb92c4357a', N'Add Supplier', 2, N'cd31a4fc-f46f-4a8b-ae1c-4c9e348778d9', N'SUPP_ADD_SUPPLIER', CAST(N'2022-05-21T07:46:52.1224096' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:22.9307454' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'577a9e80-7c6e-4f25-bdde-903060fbaf18', N'View Login Audits', 1, N'ff211fcb-9cf6-4bee-b4de-d7bdc372c888', N'LOGS_VIEW_LOGIN_AUDITS', CAST(N'2022-05-21T08:48:08.9320010' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:48:08.9320025' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'20bb60f7-30b8-49ef-aca6-913626cf116c', N'View Quotation Detail', 6, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_POR_DETAIL', CAST(N'2022-05-21T11:55:23.1419271' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T11:55:23.1419287' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ea9f6c3c-76a9-4b0a-b2d3-9148a43f66b9', N'View Supplier Payment Report', 10, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_SUP_PAYMENT_REP', CAST(N'2022-06-02T08:29:58.8911046' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-06-02T08:35:50.1811593' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b6f0a0c1-102d-4b99-a34f-9360903fc916', N'View Purchase Order Payments', 7, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_VIEW_PO_PAYMENTS', CAST(N'2022-05-21T08:33:57.6600348' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:11:42.2018490' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4ba8bc10-d750-478b-85c8-99a3e7795532', N'Update Expense', 3, N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'EXP_UPDATE_EXPENSE', CAST(N'2022-05-21T08:41:19.7638931' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:23.4323906' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'886345c5-02b2-4b58-892a-9b611534d43a', N'View Sales Vs Purchase Report', 6, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_SALES_VS_PURCHASE_REP', CAST(N'2022-05-21T08:43:02.4760216' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:47.5535261' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9661ed37-c94d-4311-8343-9f2b07b4fbec', N'Generate Invoice', 10, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_GENERATE_INVOICE', CAST(N'2022-05-21T08:38:47.1567109' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:47.3300956' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd1a52bd6-9619-42df-9355-a06696ecc8fb', N'Delete Purchase Order', 4, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_DELETE_PO', CAST(N'2022-05-21T08:32:48.6994328' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:18.9943360' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6b40689a-7273-4800-861e-a1869f2b7f85', N'View Sales Order Payments', 7, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_VIEW_SO_PAYMENTS', CAST(N'2022-05-21T08:37:36.4038354' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:30.8589387' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'de8c09f9-5139-4e89-b984-a3c45ccb8916', N'Update Sales Order', 3, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_UPDATE_SO', CAST(N'2022-05-21T08:36:17.4119191' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:05.5222225' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd3aad893-5527-426c-baf6-a655f810d64b', N'Manage Country', 2, N'c08d1303-474c-48e9-a5ab-05641e80808f', N'SETT_MANAGE_COUNTRY', CAST(N'2022-05-21T08:49:00.7647125' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:21:06.4906836' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'98c5ff4c-2ab0-4e8c-8adc-a9b87416506f', N'View Sales Order Report', 2, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_SO_REP', CAST(N'2022-05-21T08:42:12.8995579' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:31.0910533' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'810b2232-00dc-4e14-a865-aa092a9c7abb', N'Return Sales Order', 6, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_RETURN_SO', CAST(N'2022-05-21T08:37:21.1396991' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:23.7311373' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f56facfb-28aa-416e-a283-b02ee1486ec4', N'Delete Expense', 4, N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'EXP_DELETE_EXPENSE', CAST(N'2022-05-21T08:41:25.3877352' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:26.7557827' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'93bf3f03-a7c3-42b3-bbc8-b3b600d82ea1', N'View Online Users', 8, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_ONLINE_USERS', CAST(N'2022-05-21T09:42:25.6865539' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:42:29.9309860' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'74589181-a2e9-4f2b-981f-b4362cc26b4c', N'View Expenses', 1, N'534a5916-5096-4f34-bf26-eb9dc2dfa6ce', N'EXP_VIEW_EXPENSES', CAST(N'2022-05-21T08:41:06.2747931' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:18:16.0742462' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4d56092d-bc67-497c-935e-b4802e6b0f20', N'Add Customer', 2, N'586b3001-82fa-4409-822a-4d1cf9df1384', N'CUST_ADD_CUSTOMER', CAST(N'2022-05-21T07:47:24.4250649' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:48.6983363' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'37cf8471-ae9b-4a91-86d6-b5b469a7f5d3', N'Delete Sales Order', 4, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_DELETE_SO', CAST(N'2022-05-21T08:36:22.8673690' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:11.0827351' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'daea0425-480f-4359-831f-b5ce1cd54525', N'Add Product', 2, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_ADD_PRODUCT', CAST(N'2022-05-21T07:45:20.4021878' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:14.5222271' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c5a8659f-de5d-41a3-8004-b6bb7dd6bf20', N'Generate Invoice', 10, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_GENERATE_INVOICE', CAST(N'2022-05-21T08:39:05.4525729' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:03.3629793' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c88d05cb-c961-478f-8b10-c37aaa71bbb3', N'Convert to Purchase Order', 5, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_CONVERT_TO_PO', CAST(N'2022-05-21T11:53:18.5841098' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T11:53:18.5842664' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'161b88ce-6092-4a74-ad0e-c463ca3d068f', N'Manage City', 3, N'c08d1303-474c-48e9-a5ab-05641e80808f', N'SETT_MANAGE_CITY', CAST(N'2022-05-21T08:50:24.1485699' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:21:10.4007774' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'caf6ad9d-dadf-4aed-a022-c53c78ea3266', N'View Sales Order Detail', 5, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_VIEW_SO_DETAIL', CAST(N'2022-05-21T08:37:02.4689352' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:17.9215174' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd94cb177-4e0e-485e-8df4-c85aa514765a', N'Add Role', 2, N'1f5e57b6-a2c8-4bd7-8baa-311bfa4a32e1', N'ROLES_ADD_ROLE', CAST(N'2022-05-21T08:44:31.2078417' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:44:31.2078428' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'41482205-3126-4589-9967-c9bd147ffaf8', N'Assign User Roles', 6, N'9ebb7571-c92d-4e20-bcd8-a5d18b98079a', N'USR_ASSIGN_USR_ROLES', CAST(N'2022-05-21T08:46:12.6692401' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:28:08.5150271' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3f215a6f-460f-441a-8256-cbbc089d2289', N'Update Inquiry', 3, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_UPDATE_INQUIRY', CAST(N'2022-05-21T07:48:04.5059558' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:15.9932504' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f816dd8f-98f7-45e7-be43-ce42123e7444', N'Send Email', 3, N'f08bcb7a-654e-4b18-af73-f2ade469a67c', N'EMAIL_SEND_EMAIL', CAST(N'2022-05-21T08:47:32.6833073' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:47:32.6833082' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eec71360-9dbc-4909-97e0-d15c1099e2e3', N'View Products', 1, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_VIEW_PRODUCTS', CAST(N'2022-05-21T07:45:16.2834528' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:10.8667370' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8b7e7d7c-36fe-49d1-b7af-d27427449275', N'View Error Logs', 2, N'ff211fcb-9cf6-4bee-b4de-d7bdc372c888', N'LOGS_VIEW_ERROR_LOGS', CAST(N'2022-05-21T08:48:20.1951357' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:48:20.1951366' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'59ebd3d4-521a-4860-8ae6-d340329ec549', N'View Purchase Order Detail', 5, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_VIEW_PO_DETAIL', CAST(N'2022-05-21T08:33:20.5724106' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:14.3069344' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9496d17f-2585-42a1-9c84-d4e25452ba7a', N'Delete Role', 4, N'1f5e57b6-a2c8-4bd7-8baa-311bfa4a32e1', N'ROLES_DELETE_ROLE', CAST(N'2022-05-21T08:44:40.8107274' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:44:40.8107294' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'71414bc7-7b13-4a1d-b208-d704c885af92', N'Manage Email SMTP Settins', 0, N'f08bcb7a-654e-4b18-af73-f2ade469a67c', N'EMAIL_MANAGE_EMAIL_SMTP_SETTINS', CAST(N'2022-05-21T08:47:13.5488181' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:47:13.5488194' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c39d46fe-f6d3-4513-bb7a-da4e3c48f873', N'Update Role', 3, N'1f5e57b6-a2c8-4bd7-8baa-311bfa4a32e1', N'ROLES_UPDATE_ROLE', CAST(N'2022-05-21T08:44:36.2268350' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:44:36.2268361' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b7312078-6826-4ea4-806c-db0ed5435a8c', N'Update Purchase Order', 3, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_UPDATE_PO', CAST(N'2022-05-21T08:32:40.8583603' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:12:23.0824931' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'619ae69a-2f1f-4fd5-9929-dc82a3e8d7d9', N'Manage Tax', 6, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_MANAGE_TAX', CAST(N'2022-05-21T08:51:25.3887634' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:28.7060638' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'951dd299-1241-43e1-ad6b-dfd1731518b8', N'View Recent Sales Order Expected Shipment', 6, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_RECENT_SO_SHIPMENT', CAST(N'2022-05-21T08:27:00.8598016' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:26:05.3383502' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a4d58c79-91dc-42b9-9b2c-e18eed6dbad9', N'View Product Sales Report', 8, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_PRO_SO_REPORT', CAST(N'2022-06-02T08:28:01.7762735' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-06-02T08:35:41.4245898' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8d2053f2-5ebe-4c9b-97e1-e621f0d5e36a', N'Add Purchase Order Payment', 8, N'93551dee-cb76-481f-b30c-23ebfd28aaab', N'PO_ADD_PO_PAYMENT', CAST(N'2022-05-21T08:34:27.5842565' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:11:52.3058235' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'da8c25d3-399b-4c1d-a163-e68f7d3a9d99', N'Manage Brand', 8, N'60cf7833-4f34-4440-a7ce-5b8249165839', N'PRO_MANAGE_BRAND', CAST(N'2022-05-21T08:51:41.8686055' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:14:35.3944706' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0bca2ee2-d85b-443f-8bdc-e6e7f502be17', N'Update Company Profile', 1, N'c08d1303-474c-48e9-a5ab-05641e80808f', N'SETT_UPDATE_COM_PROFILE', CAST(N'2022-05-21T08:47:49.6165848' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:25:08.8759387' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0a3203fb-6e52-4585-abbf-e8c8d87fec97', N'View Purchase Payment Report', 3, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_PO_PAYMENT_REP', CAST(N'2022-05-21T08:42:21.4401678' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:35.2018025' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5e1f698c-2f2b-4bc5-ae0b-eb3e14135708', N'Update Customer', 3, N'586b3001-82fa-4409-822a-4d1cf9df1384', N'CUST_UPDATE_CUSTOMER', CAST(N'2022-05-21T07:47:29.4727462' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:53.1623628' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8c9e01ea-47cd-49af-a746-ebda95d5961a', N'Add Reminder', 2, N'7b542ac0-4c4b-4288-90d7-08d5f1f4f6fd', N'REM_ADD_REMINDER', CAST(N'2022-05-21T08:43:30.2594287' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:20:21.6260937' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'22228f03-3955-409a-9cfc-edeec8096f96', N'View Suppliers', 1, N'cd31a4fc-f46f-4a8b-ae1c-4c9e348778d9', N'SUPP_VIEW_SUPPLIERS', CAST(N'2022-05-21T07:46:39.3546523' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:19.3633393' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e413a2db-d885-4fdd-9398-f40c57cca73f', N'View Roles', 1, N'1f5e57b6-a2c8-4bd7-8baa-311bfa4a32e1', N'ROLES_VIEW_ROLES', CAST(N'2022-05-21T08:44:08.4183867' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T08:44:08.4183877' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7be00733-df57-4d59-99bd-f5d04768643d', N'Add Sales Order Payment', 8, N'90c6fbaa-173b-4264-a6fd-73fda9af4bd0', N'SO_ADD_SO_PAYMENT', CAST(N'2022-05-21T08:38:10.3889077' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:17:37.3139791' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8b5de497-e803-4c7d-88e7-f6025eaf8b70', N'View Expense Report', 4, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_EXPENSE_REP', CAST(N'2022-05-21T08:42:32.0281132' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:27:39.4512264' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9ab47732-50f9-45b2-98ce-f79722d1dbc7', N'Delete Customer', 4, N'586b3001-82fa-4409-822a-4d1cf9df1384', N'CUST_DELETE_CUSTOMER', CAST(N'2022-05-21T07:47:34.2652085' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:56.8742180' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2d910a48-2d89-4a63-8725-fba452f9eb8f', N'Delete Inquiry', 4, N'bf08ac3b-9b68-48b1-8b38-6ea0ad315c4e', N'INQ_DELETE_INQUIRY', CAST(N'2022-05-21T07:48:13.4099661' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:16:19.5149675' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'356e61f4-bd45-40f4-8347-a33b96f5ba0f', N'POS', 1, N'c4510cea-3b3f-4104-9eee-355788c86218', N'POS_POS', CAST(N'2022-07-11T06:38:15.1981783' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-07-11T06:38:15.1981807' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e95e85c7-55e9-453d-8a8a-fd511aea3c93', N'Delete Supplier', 4, N'cd31a4fc-f46f-4a8b-ae1c-4c9e348778d9', N'SUPP_DELETE_SUPPLIER', CAST(N'2022-05-21T07:47:05.1939323' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:15:29.9850219' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c4f907db-0f28-486a-b81b-feb3fc940a6e', N'View Best Selling Products', 1, N'abb6e964-a3f7-4a9e-b67d-5a63833b92e5', N'DB_BEST_SELLING_PROS', CAST(N'2022-05-21T08:26:15.3641666' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T09:25:50.2436001' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'21768bc9-6492-4617-9bbc-ffd1802d5260', N'Generate Invoice', 6, N'ef38fe5a-0329-437f-8f99-74b63246ee9d', N'POR_GENERATE_INVOICE', CAST(N'2022-05-21T11:57:09.2150029' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T11:57:09.2150049' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'813aa4b6-e872-4745-bd83-1754cb68e818', N'View Warehouse Report', 11, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_VIEW_WAR_REP', CAST(N'2022-10-18T04:38:32.1741975' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:38:32.1743035' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Actions` (`Id`, `Name`, `Order`, `PageId`, `Code`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e31457b6-e434-4305-ad94-fafc64c79b0d', N'View Profit/Loss Report', 12, N'fdba3bfd-6670-441a-88f2-05adbde8a661', N'REP_VIEW_PRO_LOSS_REP', CAST(N'2022-11-05T11:58:52.3660973' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-11-05T11:59:03.8701479' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ee1fca5a-a9b9-4269-66d0-08da3b2a1d41', N';ogle', NULL, CAST(N'2022-05-21T13:02:09.2007327' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:47:44.3895345' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f17e5d20-6c31-4c52-66d1-08da3b2a1d41', N'Apple', NULL, CAST(N'2022-05-21T13:02:19.5033825' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:48:37.2666223' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b8994322-75a9-4609-66d2-08da3b2a1d41', N'MI', NULL, CAST(N'2022-05-21T13:02:29.6753372' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:48:56.3149088' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eac7a4fe-b2f4-4ecc-66d3-08da3b2a1d41', N'IBM', NULL, CAST(N'2022-05-21T13:02:37.5339461' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:02:37.5339477' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8b7237a9-b9c9-460a-66d4-08da3b2a1d41', N'Wells Far;', NULL, CAST(N'2022-05-21T13:02:43.8205467' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:49:12.9476977' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6525b552-48b4-48a0-66d5-08da3b2a1d41', N'Logitech', NULL, CAST(N'2022-05-21T13:05:09.1626656' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:05:09.1626673' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4e805fd3-bc32-40f8-66d6-08da3b2a1d41', N'Pescafresh', NULL, CAST(N'2022-05-21T13:06:52.5612750' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:06:52.5612765' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6093106d-3129-4a89-66d7-08da3b2a1d41', N'Samsung', NULL, CAST(N'2022-05-21T13:22:05.6339814' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:22:05.6339830' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Brands` (`Id`, `Name`, `ImageUrl`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1f2bb5d6-92bb-4ce6-66d8-08da3b2a1d41', N'Lenovo', NULL, CAST(N'2022-05-21T13:22:54.1428826' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:49:35.2273066' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f137e0e8-6561-41ad-86c7-9b908900800f', N'Electronics', NULL, NULL, CAST(N'2022-05-21T12:57:20.2197446' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:57:20.2198382' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3b38f232-3036-4420-843c-c13b62030af1', N'Food', NULL, NULL, CAST(N'2022-05-21T12:57:23.1836297' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:57:23.1836338' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cb44219c-ad95-4ef7-bbe2-4a5fa0285962', N'Accessories', N'f137e0e8-6561-41ad-86c7-9b908900800f', N'', CAST(N'2022-05-21T12:57:46.5492582' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:57:46.5492600' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'328cfc44-4f47-49bc-899b-75a2f3e2d19d', N'Dairy & Bakery', N'3b38f232-3036-4420-843c-c13b62030af1', N'', CAST(N'2022-05-21T12:58:42.0943748' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:58:42.0943764' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b0c2904c-960b-41e0-83f8-8ce429117816', N'Personal Care', N'3b38f232-3036-4420-843c-c13b62030af1', N'', CAST(N'2022-05-21T12:58:54.7895601' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:58:54.7895613' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6d979399-cbfc-4668-9c0f-973854e94b01', N'Beverages', N'3b38f232-3036-4420-843c-c13b62030af1', N'', CAST(N'2022-05-21T12:58:48.4767494' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:58:48.4767512' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5f8e078e-adf7-48b4-9eaa-9aa0d64d94ee', N'Vegetables', N'3b38f232-3036-4420-843c-c13b62030af1', N'', CAST(N'2022-05-21T12:58:34.5664356' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:58:34.5664371' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ProductCategories` (`Id`, `Name`, `ParentId`, `Description`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a7a04e66-d8d0-45b5-9b34-b81657c2e18b', N'Computers & Accessories', N'f137e0e8-6561-41ad-86c7-9b908900800f', N'', CAST(N'2022-05-21T12:57:58.1263984' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:57:58.1264012' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e9e5b90d-30a2-4af5-ac95-56710734c84b', N'Box', N'Box', NULL, NULL, NULL, CAST(N'2022-05-21T13:01:25.8097997' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:01:25.8098030' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'907c5dab-b5b1-460f-b46d-ab724fa2a4ae', N'Kilo Gram', N'KG', NULL, NULL, NULL, CAST(N'2022-05-21T13:01:45.6687857' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:01:45.6687875' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4f0a0258-0a2e-4155-8e6a-d753db215fbd', N'Piece', N'Piece', NULL, NULL, NULL, CAST(N'2022-05-21T13:01:37.3001887' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:01:37.3001902' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f3e243f5-124d-47e3-919d-2689bbfbb67b', N'5 KG', N'5KG', 2, CAST(5.00 AS Decimal(18, 2)), N'907c5dab-b5b1-460f-b46d-ab724fa2a4ae', CAST(N'2022-10-18T04:01:22.6040097' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:01:22.6040116' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b69db658-4ac6-4cb9-b7f3-41816b088706', N'Pound', N'POUND', 3, CAST(2.20 AS Decimal(18, 2)), N'907c5dab-b5b1-460f-b46d-ab724fa2a4ae', CAST(N'2022-10-18T04:34:18.1296247' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:34:18.1296259' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0251ae58-3cbd-4245-a483-4b4b97ff1304', N'Gram', N'GM', 3, CAST(1000.00 AS Decimal(18, 2)), N'907c5dab-b5b1-460f-b46d-ab724fa2a4ae', CAST(N'2022-10-18T04:33:02.9728516' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:33:02.9728531' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dee04e31-66cf-4949-8a7f-bb583bbca852', N'Dozen', N'Dozen', 2, CAST(12.00 AS Decimal(18, 2)), N'4f0a0258-0a2e-4155-8e6a-d753db215fbd', CAST(N'2022-10-18T04:31:35.4221528' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:31:35.4222534' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `UnitConversations` (`Id`, `Name`, `Code`, `Operator`, `Value`, `ParentId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a61127d3-59b7-4e41-8968-f1c42070ab07', N'Ton', N'TON', 2, CAST(1000.00 AS Decimal(18, 2)), N'907c5dab-b5b1-460f-b46d-ab724fa2a4ae', CAST(N'2022-10-18T04:32:27.6714811' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-10-18T04:32:27.6714826' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Taxes` (`Id`, `Name`, `Percentage`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fd3e34a9-a5e2-4e18-aed3-326cea175437', N'Sales Tax', CAST(10.00 AS Decimal(18, 2)), CAST(N'2022-05-21T12:59:28.2260611' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:59:49.0677348' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Taxes` (`Id`, `Name`, `Percentage`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7f6fa7f1-7af8-42bc-aab9-3460c8d752bd', N'SGST', CAST(12.00 AS Decimal(18, 2)), CAST(N'2022-05-21T13:00:11.4617054' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:00:11.4617073' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Taxes` (`Id`, `Name`, `Percentage`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2b9972d1-300e-45b0-93e4-6d47cea9991c', N'CGST', CAST(10.00 AS Decimal(18, 2)), CAST(N'2022-05-21T13:00:22.2836703' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:00:22.2836719' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Taxes` (`Id`, `Name`, `Percentage`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5c698e75-4dfc-408e-9318-c24a69530532', N'Excise Tax', CAST(8.00 AS Decimal(18, 2)), CAST(N'2022-05-21T12:59:45.0516529' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:59:45.0516553' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3a67fe96-c5e3-4511-a933-802f056cf517', N'India', CAST(N'2022-05-21T13:08:01.8583314' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:01.8583332' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ae99cd88-398a-48a3-8900-d9554a308396', N'US', CAST(N'2022-05-21T13:08:04.2686302' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:04.2686324' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `InquirySources` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3b8d662c-7936-46f1-bb9b-c07ae8dc2a32', N'Website', CAST(N'2022-05-21T13:13:05.7249955' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:13:05.7249981' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquirySources` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eddb34bc-d5d0-40c2-9f89-c467cd27f7b0', N'Tender Notice', CAST(N'2022-05-21T13:13:09.8030567' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:13:09.8030586' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquirySources` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'49139820-4192-4efb-bddb-d35341407e93', N'Mobile', CAST(N'2022-05-21T13:13:13.0862080' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:13:13.0862100' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquirySources` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f0e4be1b-3506-48d0-a5e0-e1bd4d3e67db', N'Email', CAST(N'2022-05-21T13:13:17.2606995' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:13:17.2607012' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ca61dab0-b430-485b-bb05-27090e1d2204', N'Not Contacted', CAST(N'2022-05-21T13:12:53.5990633' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:53.5990647' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'eec49fd6-287c-498a-b46c-73768d50076c', N'Contact in Future', CAST(N'2022-05-21T13:12:42.1969331' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:42.1969366' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0bd7ffa5-181f-4504-ba9c-9083897ffe61', N'Contacted', CAST(N'2022-05-21T13:12:58.6846312' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:58.6846325' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2b20052e-f09b-4461-bc31-a22606d1c2f3', N'Lost Lead', CAST(N'2022-05-21T13:12:46.1747641' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:46.1747683' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b5df30ff-5b04-4e86-bb02-b4a7a259e5a3', N'Junk Lead', CAST(N'2022-05-21T13:12:49.9172731' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:49.9172745' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `InquiryStatuses` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5b1d0c07-53fb-43ff-979b-de82e9200112', N'Attempted to Contact', CAST(N'2022-05-21T13:12:38.5279669' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:12:38.5279689' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Cities` (`Id`, `CityName`, `CountryId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'585d0953-a526-4339-8285-4f925478c272', N'Los Angeles', N'ae99cd88-398a-48a3-8900-d9554a308396', CAST(N'2022-05-21T13:08:36.4942792' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:36.4944028' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Cities` (`Id`, `CityName`, `CountryId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'589eca15-21a8-4884-8102-85aeaa1523c0', N'Chica;', N'ae99cd88-398a-48a3-8900-d9554a308396', CAST(N'2022-05-21T13:08:27.8020179' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:27.8020198' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Cities` (`Id`, `CityName`, `CountryId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5108cc4a-f194-4bff-87cb-969712d6e08f', N'NY', N'ae99cd88-398a-48a3-8900-d9554a308396', CAST(N'2022-05-21T13:08:14.2868954' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:14.2868980' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `Cities` (`Id`, `CityName`, `CountryId`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'58e8f673-9623-48be-9ef4-d09f669520d0', N'Ahmedabad', N'3a67fe96-c5e3-4511-a933-802f056cf517', CAST(N'2022-05-21T13:08:10.2177361' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:08:10.2177378' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `Roles` (`Id`, `IsDeleted`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `Name`, `NormalizedName`, `ConcurrencyStamp`, `IsSuperRole`) VALUES (N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', 0, CAST(N'2022-05-21T12:56:58.8525276' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:56:58.8600000' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, N'Employee', N'Employee', N'aef4f8d9-266f-4d14-8afc-6012296ff054', 0);
INSERT `Roles` (`Id`, `IsDeleted`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `Name`, `NormalizedName`, `ConcurrencyStamp`, `IsSuperRole`) VALUES (N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', 0, CAST(N'2022-05-21T12:55:58.2030965' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T12:55:58.3100000' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, N'Super Admin', N'Super Admin', N'8671170d-fe29-4492-9378-58afd0a078e4', 1);

INSERT `ExpenseCategories` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b1977db3-d909-4936-a5da-41bf84638963', N'Advertising', CAST(N'2022-05-21T13:51:40.4053215' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:51:40.4053236' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ExpenseCategories` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'465aac5d-87e6-47f3-8691-4c1f801e58ba', N'Furniture and equipment', CAST(N'2022-05-21T13:51:44.9109295' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:51:44.9109315' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ExpenseCategories` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ddd16f3f-928d-4d8b-b513-ab5c709ff096', N'Marketing', CAST(N'2022-05-21T13:51:36.6823952' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:51:36.6823970' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);
INSERT `ExpenseCategories` (`Id`, `Name`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ed69e9a0-2d54-4a91-a598-f79973b9fe99', N'Office Tour', CAST(N'2022-05-21T13:51:49.4530168' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-05-21T13:51:49.4530189' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5b102028-ac30-46dc-a5df-3fb6d5db1798', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_STATISTICS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c4f907db-0f28-486a-b81b-feb3fc940a6e', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_BEST_SELLING_PROS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd09266a8-dbed-4c0a-ad07-4d432de4c6b0', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_REMINDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6643cd87-5919-45a4-a4c8-13a09ad634ff', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_LATEST_INQUIRIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'951dd299-1241-43e1-ad6b-dfd1731518b8', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_RECENT_SO_SHIPMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7f346d99-cdd1-4903-b1ea-8c68ec856c2d', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'DB_RECENT_PO_DELIVERY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'eec71360-9dbc-4909-97e0-d15c1099e2e3', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_VIEW_PRODUCTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'daea0425-480f-4359-831f-b5ce1cd54525', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_ADD_PRODUCT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'13d482e4-0745-437a-824b-81a4f586ad28', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_UPDATE_PRODUCT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'211d3f08-773c-4d73-bbee-4147d223e5e5', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_DELETE_PRODUCT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'68ca97f4-4683-4161-b3d1-7f161d4148e3', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_MANAGE_PRO_CAT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'619ae69a-2f1f-4fd5-9929-dc82a3e8d7d9', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_MANAGE_TAX', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'494d70f6-6dc0-4bd2-a0df-784dd4076db7', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_MANAGE_UNIT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'da8c25d3-399b-4c1d-a163-e68f7d3a9d99', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_MANAGE_BRAND', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'71324dce-e34a-4f09-8b9e-36cca42a459b', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PRO_MANAGE_WAREHOUSE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'22228f03-3955-409a-9cfc-edeec8096f96', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SUPP_VIEW_SUPPLIERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7aa00d67-13c8-4762-a388-8ffb92c4357a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SUPP_ADD_SUPPLIER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ad6ae222-0053-4fce-81db-70e31f07cd56', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SUPP_UPDATE_SUPPLIER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e95e85c7-55e9-453d-8a8a-fd511aea3c93', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SUPP_DELETE_SUPPLIER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'97257f0e-e107-4a87-84ed-65106a08bd98', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'CUST_VIEW_CUSTOMERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4d56092d-bc67-497c-935e-b4802e6b0f20', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'CUST_ADD_CUSTOMER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5e1f698c-2f2b-4bc5-ae0b-eb3e14135708', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'CUST_UPDATE_CUSTOMER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'9ab47732-50f9-45b2-98ce-f79722d1dbc7', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'CUST_DELETE_CUSTOMER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'f02385bb-46b7-41c1-9515-567e67699afd', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_VIEW_INQUIRIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c15a4651-249a-4680-bd68-49c2dca7a431', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_ADD_INQUIRY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'3f215a6f-460f-441a-8256-cbbc089d2289', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_UPDATE_INQUIRY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'2d910a48-2d89-4a63-8725-fba452f9eb8f', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_DELETE_INQUIRY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'10931818-757b-4c2d-94cb-1d613bb8f8ad', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_MANAGE_INQ_STATUS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'1ecc483c-56c6-440c-a0fa-117dc95ffea6', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_MANAGE_INQ_SOURCE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'214c2d6e-d7f4-42a9-9d42-2daaf974a231', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INQ_MANAGE_REMINDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'b3187d5b-33f0-4905-b534-5d6a66b84a8b', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_VIEW_PO_REQUESTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'43ca17e4-9d56-4ada-b044-3f2eb8a178d7', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_ADD_PO_REQUEST', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4e3480c0-d396-4698-8a41-18896aaa61f1', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_UPDATE_PO_REQUEST', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'eb708ad5-5e02-4078-a045-1dec7c478af7', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_DELETE_PO_REQUEST', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c88d05cb-c961-478f-8b10-c37aaa71bbb3', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_CONVERT_TO_PO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'21768bc9-6492-4617-9bbc-ffd1802d5260', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'20bb60f7-30b8-49ef-aca6-913626cf116c', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POR_POR_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4cdb0a09-6357-4d83-9cb2-8c84f449f112', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_VIEW_PURCHASE_ORDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'dc35bbc6-0bfb-4c17-a837-29c57d778732', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_ADD_PO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'b7312078-6826-4ea4-806c-db0ed5435a8c', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_UPDATE_PO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd1a52bd6-9619-42df-9355-a06696ecc8fb', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_DELETE_PO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'59ebd3d4-521a-4860-8ae6-d340329ec549', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_VIEW_PO_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'95cb2ac5-1df7-4638-9fff-30558296d238', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_RETURN_PO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'b6f0a0c1-102d-4b99-a34f-9360903fc916', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_VIEW_PO_PAYMENTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'8d2053f2-5ebe-4c9b-97e1-e621f0d5e36a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_ADD_PO_PAYMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5340a380-a8b1-4e01-ac88-05fc5e714abd', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_DELETE_PO_PAYMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c5a8659f-de5d-41a3-8004-b6bb7dd6bf20', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'PO_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ffa85bd4-dbe7-4906-ac42-6abec2d2054a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_VIEW_SALES_ORDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'8f668703-b676-4d32-8533-2df18adba38e', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_ADD_SO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'de8c09f9-5139-4e89-b984-a3c45ccb8916', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_UPDATE_SO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'37cf8471-ae9b-4a91-86d6-b5b469a7f5d3', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_DELETE_SO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'caf6ad9d-dadf-4aed-a022-c53c78ea3266', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_VIEW_SO_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'810b2232-00dc-4e14-a865-aa092a9c7abb', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_RETURN_SO', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6b40689a-7273-4800-861e-a1869f2b7f85', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_VIEW_SO_PAYMENTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7be00733-df57-4d59-99bd-f5d04768643d', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_ADD_SO_PAYMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd57eb050-4319-4998-b090-662e9ae096fb', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_DELETE_SO_PAYMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'9661ed37-c94d-4311-8343-9f2b07b4fbec', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SO_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e16e7eb5-cb97-4da2-958a-0c6a6ad904fc', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INVE_VIEW_INVENTORIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'53abe36f-1ec2-43f4-9788-418406778504', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'INVE_MANAGE_INVENTORY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'74589181-a2e9-4f2b-981f-b4362cc26b4c', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EXP_VIEW_EXPENSES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'cc38b6c0-549b-4619-84a3-41296c0cf36c', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EXP_ADD_EXPENSE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4ba8bc10-d750-478b-85c8-99a3e7795532', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EXP_UPDATE_EXPENSE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'f56facfb-28aa-416e-a283-b02ee1486ec4', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EXP_DELETE_EXPENSE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'af35f348-c08b-48bb-9114-32ec00796b2d', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EXP_MANAGE_EXP_CATEGORY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'f1a8fb1d-6236-4e87-89c3-6a0a9e69a49b', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_PO_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'98c5ff4c-2ab0-4e8c-8adc-a9b87416506f', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_SO_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'0a3203fb-6e52-4585-abbf-e8c8d87fec97', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_PO_PAYMENT_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'8b5de497-e803-4c7d-88e7-f6025eaf8b70', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_EXPENSE_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'84fd7cc0-c5a3-4c8d-bf64-113a94126975', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_SO_PAYMENT_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'886345c5-02b2-4b58-892a-9b611534d43a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_SALES_VS_PURCHASE_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ba8fc8b6-8982-4197-bf2a-05ab0e79e3d1', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REM_VIEW_REMINDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'8c9e01ea-47cd-49af-a746-ebda95d5961a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REM_ADD_REMINDER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'0fd2b76a-4e29-46ed-854c-5b727a7579e0', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REM_UPDATE_REMINDER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'591bdbca-19cc-440a-b2f1-2bc4f960aefc', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REM_DELETE_REMINDER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e413a2db-d885-4fdd-9398-f40c57cca73f', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'ROLES_VIEW_ROLES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd94cb177-4e0e-485e-8df4-c85aa514765a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'ROLES_ADD_ROLE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c39d46fe-f6d3-4513-bb7a-da4e3c48f873', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'ROLES_UPDATE_ROLE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'9496d17f-2585-42a1-9c84-d4e25452ba7a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'ROLES_DELETE_ROLE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'40b5068b-cc64-4228-aa89-4dc9f5928135', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_VIEW_USERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5a54e8ea-ce73-468a-8d19-381dfa515e18', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_ADD_USER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e0871c29-080c-47fa-b52a-4750fec9f671', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_UPDATE_USER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'bca867fc-4d72-426b-951b-448c25182a4e', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_DELETE_USER', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c727325e-832c-4415-b225-3056ec6ebbb0', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_RESET_PWD', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'41482205-3126-4589-9967-c9bd147ffaf8', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_ASSIGN_USR_ROLES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7ed25023-a542-4236-a13f-7bd61a767e4a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_ASSIGN_USR_PERMISSIONS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'93bf3f03-a7c3-42b3-bbc8-b3b600d82ea1', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'USR_ONLINE_USERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'71414bc7-7b13-4a1d-b208-d704c885af92', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EMAIL_MANAGE_EMAIL_SMTP_SETTINS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd758eecf-a6f8-4f2c-8613-13321e34c18a', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EMAIL_MANAGE_EMAIL_TEMPLATES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'f816dd8f-98f7-45e7-be43-ce42123e7444', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'EMAIL_SEND_EMAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'0bca2ee2-d85b-443f-8bdc-e6e7f502be17', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SETT_UPDATE_COM_PROFILE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd3aad893-5527-426c-baf6-a655f810d64b', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SETT_MANAGE_COUNTRY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'161b88ce-6092-4a74-ad0e-c463ca3d068f', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'SETT_MANAGE_CITY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'577a9e80-7c6e-4f25-bdde-903060fbaf18', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'LOGS_VIEW_LOGIN_AUDITS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'8b7e7d7c-36fe-49d1-b7af-d27427449275', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'LOGS_VIEW_ERROR_LOGS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'5b102028-ac30-46dc-a5df-3fb6d5db1798', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_STATISTICS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c4f907db-0f28-486a-b81b-feb3fc940a6e', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_BEST_SELLING_PROS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'd09266a8-dbed-4c0a-ad07-4d432de4c6b0', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_REMINDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'6643cd87-5919-45a4-a4c8-13a09ad634ff', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_LATEST_INQUIRIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'951dd299-1241-43e1-ad6b-dfd1731518b8', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_RECENT_SO_SHIPMENT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'7f346d99-cdd1-4903-b1ea-8c68ec856c2d', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'DB_RECENT_PO_DELIVERY', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'eec71360-9dbc-4909-97e0-d15c1099e2e3', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'PRO_VIEW_PRODUCTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'22228f03-3955-409a-9cfc-edeec8096f96', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'SUPP_VIEW_SUPPLIERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'97257f0e-e107-4a87-84ed-65106a08bd98', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'CUST_VIEW_CUSTOMERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'f02385bb-46b7-41c1-9515-567e67699afd', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'INQ_VIEW_INQUIRIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'b3187d5b-33f0-4905-b534-5d6a66b84a8b', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'POR_VIEW_PO_REQUESTS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'20bb60f7-30b8-49ef-aca6-913626cf116c', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'POR_POR_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'21768bc9-6492-4617-9bbc-ffd1802d5260', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'POR_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'4cdb0a09-6357-4d83-9cb2-8c84f449f112', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'PO_VIEW_PURCHASE_ORDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'59ebd3d4-521a-4860-8ae6-d340329ec549', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'PO_VIEW_PO_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ffa85bd4-dbe7-4906-ac42-6abec2d2054a', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'SO_VIEW_SALES_ORDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'caf6ad9d-dadf-4aed-a022-c53c78ea3266', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'SO_VIEW_SO_DETAIL', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'9661ed37-c94d-4311-8343-9f2b07b4fbec', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'SO_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'c5a8659f-de5d-41a3-8004-b6bb7dd6bf20', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'PO_GENERATE_INVOICE', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e16e7eb5-cb97-4da2-958a-0c6a6ad904fc', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'INVE_VIEW_INVENTORIES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'74589181-a2e9-4f2b-981f-b4362cc26b4c', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'EXP_VIEW_EXPENSES', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ba8fc8b6-8982-4197-bf2a-05ab0e79e3d1', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c', N'REM_VIEW_REMINDERS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'535845e4-9ad3-43b5-b211-180d93a5b7a4', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_PRO_PP_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'14b57304-4eb8-48dc-a159-477dbf494dd9', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_CUST_PAYMENT_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'a4d58c79-91dc-42b9-9b2c-e18eed6dbad9', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_PRO_SO_REPORT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'ea9f6c3c-76a9-4b0a-b2d3-9148a43f66b9', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_SUP_PAYMENT_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'416452fc-27df-4550-bd3b-7304f8b3b7c4', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_STOCK_REPORT', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'356e61f4-bd45-40f4-8347-a33b96f5ba0f', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'POS_POS', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'813aa4b6-e872-4745-bd83-1754cb68e818', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_VIEW_WAR_REP', N'');
INSERT `RoleClaims` (`ActionId`, `RoleId`, `ClaimType`, `ClaimValue`) VALUES (N'e31457b6-e434-4305-ad94-fafc64c79b0d', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4', N'REP_VIEW_PRO_LOSS_REP', N'');

INSERT `UserRoles` (`UserId`, `RoleId`) VALUES (N'1a5cf5b9-ead8-495c-8719-2d8be776f452', N'ff635a8f-4bb3-4d70-a3ed-c7749030696c');
INSERT `UserRoles` (`UserId`, `RoleId`) VALUES (N'4b352b37-332a-40c6-ab05-e38fcf109719', N'f8b6ace9-a625-4397-bdf8-f34060dbd8e4');

INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'dc3b14f7-fb25-4bde-8b9b-00eb532657e8', N'CHF', N'Swiss franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'695a0760-54d9-49f4-894c-02694512b097', N'XSU', N'SUCRE');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e8c796e5-9fde-40fe-a2de-03a5063cdf82', N'MUR', N'Mauritian rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fbbc7fe1-ff0b-4abe-a20b-067b49e9841d', N'ALL', N'Albanian lek');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'29bd036f-5b91-46f7-9b99-08b8f7eec483', N'COU', N'Unidad de Valor Real');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'dae3e52a-a89c-45a7-8c85-08fb8d84a441', N'OMR', N'Omani rial');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1c53a6eb-6458-435b-b0f3-09d9fd4dc87e', N'TWD', N'New Taiwan dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a68d04e5-1f92-43cf-af5b-0ac3e00ab98e', N'TJS', N'Tajikistani somoni');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'620101ce-f015-4be8-a2dd-0bdb0df9f5d4', N'MGA', N'Malagasy ariary');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a5b024b5-a8a0-4769-8918-0c848f80e44d', N'XAU', N';ld (one troy ounce)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'21cb097e-c03e-4dae-94a1-0f2bcc000495', N'NZD', N'New Zealand dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'18e37daa-bbbf-4771-8da0-11f37d538802', N'SDG', N'Sudanese pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c1c47673-5b05-4651-8299-151a625b3344', N'CVE', N'Cape Verdean escudo');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'52a5f220-f165-4dc9-96aa-1605ca240e4a', N'BZD', N'Belize dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'4cec274f-f5e6-4675-b876-16af784e2b8e', N'ANG', N'Netherlands Antillean guilder');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'5e2655d7-93ab-4876-b4f0-17adcc86df2c', N'JMD', N'Jamaican dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b52194f1-9535-454c-ae19-1933703112fd', N'GTQ', N'Guatemalan quetzal');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9718e702-64be-45b0-bf68-19b2d0537bac', N'CRC', N'Costa Rican colon');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ea2c6e34-eb17-49a0-a0c3-1aea4bdd2afc', N'LKR', N'Sri Lankan rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1f2b643e-8625-4eed-af75-1b48ab0628d4', N'FKP', N'Falkland Islands pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'356ebe82-e236-4b70-b29f-1dd1aa764a52', N'BGN', N'Bulgarian lev');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd4b0efac-1cae-44c6-b69c-1f2c595ecb17', N'SOS', N'Somali shilling');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'33f2b187-cfaa-4ddc-936e-2264a8f6cfd0', N'AWG', N'Aruban florin');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c8c2a3ea-ccc3-48c4-85c8-22b0f5afcc35', N'TMT', N'Turkmenistan manat');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'5e171260-d7ad-4f09-be98-23062f3910f4', N'PEN', N'Peruvian sol');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b91dcd47-eb94-449a-a0df-244cd9dcb0f5', N'MMK', N'Myanmar kyat');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a5d89b91-66fe-42ff-99c8-27be7f0d4672', N'BRL', N'Brazilian real');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'791dbc34-6c69-4351-8563-29b5610765dd', N'LYD', N'Libyan dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9b8092b8-338d-4dc8-90c2-2a5cf35e63fa', N'SCR', N'Seychelles rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8a199070-0541-4ef6-ac91-2ca62273a43f', N'MNT', N'Mon;lian tÃ¶grÃ¶g');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a0d59bef-7483-4564-9833-2d988351bfd8', N'XBD', N'European Unit of Account 17 ');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd4d13f31-1d67-4510-80d7-332fec884332', N'LBP', N'Lebanese pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9e0f575e-b30d-49f1-b88b-335476a349f0', N'KYD', N'Cayman Islands dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1a89f34a-c25d-4bbc-aa3f-3532e0693f0b', N'SBD', N'Solomon Islands dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'52f73d1d-5d99-4e28-9631-3546b66241f8', N'BTN', N'Bhutanese ngultrum');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'05f0463f-2e8d-49ab-a604-38c70873aabb', N'NIO', N'Nicaraguan cÃ³rdoba');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b45d645d-1f09-4046-a777-39352194be54', N'BDT', N'Bangladeshi taka');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9a403cc3-0cc5-4d26-8ee9-3a963efa2d74', N'BND', N'Brunei dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1bdb25e6-88a6-4173-ab59-3af284db78ba', N'INR', N'Indian rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7bd42030-cdae-4e72-b86c-3b0cd645e510', N'UYU', N'Uruguayan peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'dad3f78e-7729-4b07-ab94-3bf0e677fa53', N'KHR', N'Cambodian riel');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'5b523f7c-1f46-450a-8b72-3d114c8a2ead', N'EGP', N'Egyptian pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e7aefad8-3a7e-44c3-bb7b-3e80973b7f40', N'UGX', N'Ugandan shilling');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3c5e92d9-91ec-4be3-a8d8-3f00131eca56', N'SEK', N'Swedish krona (plural: kronor)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a874cfc4-eeca-4405-9f71-3fcb5276d367', N'AED', N'United Arab Emirates dirham');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ae0afe64-927c-4867-a85a-40d14e1e5364', N'PKR', N'Pakistani rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd488cb20-543b-4410-b279-432a8ac327f3', N'ZWL', N'Zimbabwean dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ff2f1622-627b-4764-9c08-445efb1cf6c4', N'NOK', N'Norwegian krone');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b3e437f6-268f-4f60-b7d9-45e88607e734', N'CHW', N'WIR franc (complementary currency)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fcd2b0dd-32a6-4e6e-a413-46f24c27860c', N'VED', N'Venezuelan bolÃ­var digital');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ad99fc39-7b12-41db-9591-4757ca4f742d', N'AOA', N'An;lan kwanza');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'61f3fa7c-d2cd-4a3a-abf7-4cef17bbc9a1', N'BIF', N'Burundian franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'de00a01a-02eb-4d08-bd68-4f920b1faf88', N'CLP', N'Chilean peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7c8b343c-cfb3-4990-b2a2-5225b9a492fd', N'CUP', N'Cuban peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a7cb3225-9705-40d6-8324-5493e96e74ca', N'GMD', N'Gambian dalasi');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'64e5e683-98ab-4cb8-ba89-54b2fdda9add', N'EUR', N'Euro');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9a8facaf-faac-46dd-a294-54d882469770', N'XPT', N'Platinum');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'afc7ff15-5324-4984-aeb9-5579c6876be0', N'SGD', N'Singapore dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'cd104f48-5fab-4e11-9254-58656ba587c7', N'CHE', N'WIR euro (complementary currency)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e8eb13bc-8819-4b83-bf6b-58ce2ad8eb53', N'TZS', N'Tanzanian shilling');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'0e50ff4a-0fc3-45e1-9d8b-5979ed0c5bdc', N'SRD', N'Surinamese dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b8cf6ee9-f714-4611-bb83-5a36ee46cf6b', N'UYI', N'Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'65266ef6-5417-485d-a09d-5af0ee3e94b5', N'GNF', N'Guinean franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7178c8cb-620a-404d-8626-5b2f93fe430d', N'CDF', N'Con;lese franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ef8dafc9-fc97-48a7-923b-5cabc46524f5', N'BBD', N'Barbados dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'663bcd40-24fc-4193-b4a9-5ceeac3189ff', N'UYW', N'Unidad previsional');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'08728dcf-a885-40e0-9edb-5de7fe02a856', N'ERN', N'Eritrean nakfa');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fe04e052-228f-426a-bb4c-5e509017e634', N'SAR', N'Saudi riyal');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'adbfab04-cb0a-41f3-8484-5ee1fa081c4a', N'TTD', N'Trinidad and Toba; dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'365be2be-2967-44d9-943b-5f79e6538187', N'MKD', N'Macedonian denar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'99e462cb-167b-4208-b7eb-604fb848d9de', N'JPY', N'Japanese yen');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b4aecd4c-8ace-4cb5-a893-62b7ff316aa6', N'XOF', N'CFA franc BCEAO');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'0d097561-86b9-41b6-8946-62dba6ba2322', N'XPF', N'CFP franc ');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3d22ec43-aaa8-4b43-a372-646dba5b88b1', N'VES', N'Venezuelan bolÃ­var soberano');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b3caf4f9-6045-4b2a-8234-658f6c765eed', N'HUF', N'Hungarian forint');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8d7030d4-aea6-47ca-8e94-6a1197de0874', N'SSP', N'South Sudanese pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a0d62283-b722-4eb4-8c7a-6a8f13531295', N'MDL', N'Moldovan leu');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'f92a7677-a3ef-4f16-91b3-6bc7a1b10db4', N'TRY', N'Turkish lira');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'943cf826-c85b-47b5-ab11-6cea4422ad3c', N'HNL', N'Honduran lempira');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b5d54997-3b13-4d42-9dda-6d186b86cecf', N'KWD', N'Kuwaiti dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b88d06dc-036d-48d3-818b-6d40f6194c08', N'KRW', N'South Korean won');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'81409cb4-de10-4144-9f8e-6fc15667300d', N'SZL', N'Swazi lilangeni');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b09d3dfb-6162-4860-98c3-6ffcf4f38a87', N'CUC', N'Cuban convertible peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1858664e-c8fe-48fe-b4a2-72095b7678a7', N'AFN', N'Afghan afghani');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a92a3970-5953-4afc-b162-7273bd112d28', N'KMF', N'Comoro franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'67fbc0b7-b440-418e-a9bb-72a8f8a99729', N'SLL', N'Sierra Leonean leone');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fb257e69-1991-48ca-ae20-7508134924f9', N'TND', N'Tunisian dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'cfdcae4b-c39c-4163-b877-755f4f36693d', N'RUB', N'Russian ruble');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'55baa4bd-2538-4580-bdb5-75e17450fd3e', N'XPD', N'Palladium ');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'4af95b4c-afb2-41ba-b06e-768870f40a01', N'ISK', N'Icelandic krÃ³na (plural: krÃ³nur)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1b051094-f211-4dcf-82e3-77b087cc7dda', N'ILS', N'Israeli new shekel');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1aa4c8f7-7c06-4588-8f12-77c1ee162131', N'NGN', N'Nigerian naira');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'cc09cf93-6439-4359-9e53-77fd56afd26b', N'CAD', N'Canadian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'44461e7e-e291-4857-8f46-7923abe616a3', N'VND', N'Vietnamese Ä‘á»“ng');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'42bcfa08-3758-4d7f-a782-7c0cdd42f6bf', N'LRD', N'Liberian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'253eab35-b044-4158-9eec-7efc9b8e8842', N'AZN', N'Azerbaijani manat');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'f7fbf142-fc45-4828-8e75-828f1ff2aaeb', N'BYN', N'Belarusian ruble');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'51942b1d-4b94-4b5f-b323-86644cd66ef7', N'DZD', N'Algerian dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9e65f715-d93a-436f-974c-8a5fa06ee2a7', N'HKD', N'Hong Kong dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3716c421-963a-4d3f-81e6-8aa7543bbb7c', N'AUD', N'Australian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a3c4792e-9e13-4016-b5d2-8b81e07b4143', N'PGK', N'Papua New Guinean kina');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8d843c04-9f58-43ed-9984-8f0ffa2673f7', N'XAG', N'Silver (one troy ounce)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'6ceeac11-67df-46b2-a2e5-90597eae9baf', N'BOV', N'Bolivian Mvdol (funds code)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'2ba1e41f-69af-4608-8f09-90d515f26ae8', N'XBB', N'European Monetary Unit');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'6063a1b3-bd7e-4f34-b0ec-91b06951ea7e', N'QAR', N'Qatari riyal');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8fe0c3f5-34c3-4973-b96c-91f0edf98adb', N'PLN', N'Polish zÅ‚oty');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3404bb86-ca75-4c64-adb9-9374d0ebc66a', N'CLF', N'Unidad de Fomento (funds code)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'95ab9c3b-98b9-42f6-a306-94091f9f1f14', N'ZAR', N'South African rand');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'cee86834-461b-4035-9bd1-95743d7786f7', N'ZMW', N'Zambian kwacha');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'65235019-070c-48aa-8751-9863304d137b', N'XBC', N'European Unit of Account 9 ');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a404e6a7-09b0-4911-a56c-98c43828f0fb', N'ETB', N'Ethiopian birr');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7078ecf5-b04f-4cf7-8ce8-9e13dcadfb3a', N'BWP', N'Botswana pula');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'f61d32db-3303-4bfb-bbf3-a01e56e3fb55', N'BOB', N'Boliviano');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8d8a06ce-0cf8-4935-9516-a1326bbd553d', N'HTG', N'Haitian ;urde');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'10797893-4150-40a9-a76a-a3fda60167e6', N'MYR', N'Malaysian ringgit');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'32c3368b-ba22-4e34-b3e2-a41f180196e4', N'GEL', N'Georgian lari');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'efbd5ee9-587b-45ef-89ba-a509f50f0f1a', N'XUA', N'ADB Unit of Account');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'aa42be66-4431-4045-9841-a5b981754618', N'PHP', N'Philippine peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7d3d2606-1dfc-48b0-8e77-a7b341f27ebc', N'BMD', N'Bermudian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'2d3346d3-3352-49c2-9929-a9e572c53372', N'BAM', N'Bosnia and Herze;vina convertible mark');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'dba5b9a4-85a7-48cc-83f0-af693909c739', N'WST', N'Samoan tala');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a0330d9e-ce81-48a5-9ccf-b06227f3951b', N'USD', N'United States dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c65135e7-fa70-44de-91f9-b2c0264e2c8e', N'MVR', N'Maldivian rufiyaa');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'1e462cc8-0bd3-49ff-a4b2-b736a24d872e', N'GHS', N'Ghanaian cedi');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'335eaa64-7bac-4268-8894-b74269351dbb', N'FJD', N'Fiji dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'45a15fe3-9a85-49ef-8e46-b8dc914b9328', N'YER', N'Yemeni rial');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'91d11e5a-faf8-4a19-a996-ba02f0461f83', N'PAB', N'Panamanian balboa');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'f33dfdfa-0c58-48cd-9986-bb2da00b0a39', N'KES', N'Kenyan shilling');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'35ac4455-fa6a-4558-bef7-bc4ab6bae9f1', N'PYG', N'Paraguayan guaranÃ­');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'21dc7d97-12d4-407f-9046-be98ce3c4271', N'XTS', N'Code reserved for testing');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'5ecf49de-fce0-4f0e-a554-c24a95ebf9ec', N'MRU', N'Mauritanian ouguiya');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd0dbf0a2-6e5b-4e50-874a-c2f610d6c8e6', N'TOP', N'Tongan paÊ»anga');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'8ef88a7f-5c30-4bfb-bbd2-c36d69a93032', N'DKK', N'Danish krone');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3af80ddb-b1b1-4702-9113-c36d70af1d17', N'SVC', N'Salvadoran colÃ³n');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'84d60cdb-47ec-41bd-998e-c4026ecc87a2', N'RON', N'Romanian leu');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'5a44b92f-0dcd-4837-909c-c4cf06c552ec', N'MZN', N'Mozambican metical');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c54efb88-242c-4753-a531-c4fdc9d1565e', N'UAH', N'Ukrainian hryvnia');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e3affb05-1929-43db-8942-c69ceecf43c0', N'KPW', N'North Korean won');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'09332c69-b0cf-4ab8-8fa2-c7becfc59e29', N'SYP', N'Syrian pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'f184706b-e5a7-4796-b87d-cc1a87ef8afc', N'CZK', N'Czech koruna');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'55006d7d-056d-4f87-9734-cd46ab65a3dd', N'RWF', N'Rwandan franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd9f7017c-b2b9-44ac-b4ad-cdb198b1b186', N'BHD', N'Bahraini dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7dfc1888-d6f7-49c9-be64-cedafdf163fa', N'KZT', N'Kazakhstani tenge');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e17bbd93-c598-4c3e-8e96-cf0bb0b1f337', N'LAK', N'Lao kip');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c89c7ced-3d48-4e5b-a753-cf1ae9aa87f2', N'ARS', N'Argentine peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'197af9e7-b240-47d4-9aa8-cf2778028e24', N'GYD', N'Guyanese dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'ce887e1b-764e-4363-b2f5-cfd104064f6d', N'BSD', N'Bahamian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'518293b7-e9a6-4830-9b9b-d1b59a9d4408', N'XBA', N'European Composite Unit');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'21e42917-2bbb-4e10-b0d1-d2b042f39df6', N'KGS', N'Kyrgyzstani som');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'56e9529b-7a1a-48f9-a869-d48533eb59cc', N'STN', N'SÃ£o TomÃ© and PrÃ­ncipe dobra');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'bf5a19d7-b4d5-4adf-9917-d769eb243e84', N'IQD', N'Iraqi dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'32a32049-d096-4ce9-ba96-da478bb7c953', N'MOP', N'Macanese pataca');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'2ff3fef4-9263-4edf-9bd6-da50feaeae22', N'GBP', N'Pound sterling');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'26765de4-2a8b-4c73-ad6b-dd2831c72a9e', N'NAD', N'Namibian dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'16f1f4c3-cae1-475a-8b57-de88d0e606be', N'THB', N'Thai baht');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'9048bcd4-8534-40ea-b065-e028e86af32d', N'VUV', N'Vanuatu vatu');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'23cf7108-c464-458b-8a81-e2a6c265c28a', N'MXN', N'Mexican peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'802b6efa-41dd-4db3-9ee7-e34101e2adb0', N'MAD', N'Moroccan dirham');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd4909a1e-601e-4b08-a964-e38ad79f7d69', N'LSL', N'Lesotho loti');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'05b108f6-dc7b-45ba-b712-e50c7fa92879', N'UZS', N'Uzbekistan som');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'0161c850-800c-442e-8b7d-e93ceda3511f', N'COP', N'Colombian peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fb751fa0-e5b8-4701-9322-ea18fec10889', N'DOP', N'Dominican peso');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'd70601d1-9872-414d-a974-eb189a2a0148', N'XCD', N'East Caribbean dollar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'2e0be2a1-5324-4f16-b742-ed7fe1550df1', N'DJF', N'Djiboutian franc');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'aa26d093-f14f-48b3-8820-f0dd6468277e', N'GIP', N'Gibraltar pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'e0c3c112-9919-40a8-a554-f14d7740b2b5', N'AMD', N'Armenian dram');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'83b5e6a8-8d7f-4f86-a431-f1ef42bc6ed2', N'JOD', N'Jordanian dinar');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'55fb491d-a70d-403b-8f42-f2954f4b6eca', N'HRK', N'Croatian kuna');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'2642414a-030f-49f5-b235-f3c4ea2eb532', N'MWK', N'Malawian kwacha');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'b2797a14-2b38-4f79-b3f5-f5d2348a1cf6', N'NPR', N'Nepalese rupee');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'fe2d1a0d-dd75-4add-9c9e-f69af8802736', N'SHP', N'Saint Helena pound');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'7e0ede61-4d88-4f01-a622-f6fa293e3c2b', N'IRR', N'Iranian rial');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'6d0dcf44-4472-4657-ab25-f847334f907b', N'IDR', N'Indonesian rupiah');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'65058c8d-cc91-4f8a-a430-fdb8dbb1bbd1', N'XAF', N'CFA franc BEAC');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'c0486d0c-a874-4635-82f7-fe6f561a1976', N'XDR', N'Special drawing rights');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'3624e94b-21e2-4774-9ee5-ff2e0995625e', N'MXV', N'Mexican Unidad de Inversion (UDI) (funds code)');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'da00b4a8-5406-466d-acd9-ff5aaece4337', N'CNY', N'Chinese yuan`8`');
INSERT `Currencies` (`Id`, `Symbol`, `Name`) VALUES (N'a77a5232-dee8-4fba-860e-ffb3fe3d71de', N'RSD', N'Serbian dinar');
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6236cb8e-fc21-4f74-a1d2-0072d726009d', N'Tunisia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b30b7b46-6c2c-43a3-b76d-016388d0569b', N'Italy', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a2309321-2721-462f-9799-01b4a94c1321', N'Jamaica', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7e2b1b89-2a1c-4563-b286-0218acda6e22', N'Bahrain', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1a614e3b-a3fb-48a2-9830-023a3c74b2b5', N'Haiti', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3a5e0e26-3921-486a-b028-056685deaf2c', N'Australia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'014a3dc9-5270-4c57-bdde-06c98aa75e24', N'Central African Republic', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2915677b-376f-4a9e-b413-07691a9b301e', N'Jordan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b550ba3d-40de-4585-93fe-086ea63ab652', N'Chile', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b57b2be6-b7f5-47eb-ad1c-08d48e746d16', N'Zaire (former)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'328bc9b6-26ac-411e-b9d3-09d1dc7f74d3', N'Ecuador', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f303552f-75e2-4035-b33e-09e159fa5941', N'Saint Helena', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e9bf43ad-44d3-481d-8560-0cf9f9ca2c59', N'Oman', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'65ea381b-856c-4624-8072-0de0e6cfcdb6', N'To;', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8474a0e5-e5c1-4812-bc24-0dfcb8929d0c', N'Singapore', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a668f5b2-ade0-4654-8ab2-0e4d321d8996', N'Martinique', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'edaf9b42-7b02-4e37-b05c-0f192106aca6', N'Netherlands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'26a682f6-f02e-42ea-aae6-110c6ece3b26', N'Portugal', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'83b1034b-6c25-4bce-91f5-15ae8528d06f', N'Costa Rica', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f0172c5a-7810-47c7-bb97-15afeec04c38', N'Panama', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'97124f69-6865-4ade-978e-16bbc35a13a6', N'Ukraine', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9a958c28-5b20-46e7-b4b5-17ded65e9a45', N'Chad', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f3c3ce27-24e3-43ed-8325-1a36ed957968', N'Ethiopia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e45ab241-2585-45b6-a4c6-1b93cb60b4c6', N'Montserrat', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6867c243-44ab-4aff-ae63-1be210749e74', N'Lebanon', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd59b7699-f5d6-45b6-a052-1c05a626a60a', N'Kiribati', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd4e01055-d91f-41c4-afb2-1c9b6117f34a', N'Bolivia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'58146ff9-aa34-4d49-a331-1df10c7eb7ca', N'Afghanistan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'87bd8aa2-6ad1-473f-874e-22b19f1260ae', N'Liechtenstein', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4f7bb352-f248-446e-a901-23f65203d99b', N'Mozambique', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b318fdde-ba73-47e9-90d3-246503a47cfd', N'Virgin Islands (British)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ec3bff3b-1cd9-437f-993b-2536448c7591', N'Nigeria', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dd823256-b560-4e08-bf4b-25b4a7e930b8', N'Niue', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0e8be4cb-fae0-40e5-a4ef-278569cae136', N'Libya', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd6f1df02-fb71-4fc7-902e-293ad8946128', N'Germany', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ef97ac54-5ca4-4106-b711-2a956e18a194', N'Grenada', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'01198567-6445-4dd3-bd0a-2af18e21d887', N'Croatia (Hrvatska)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fd556678-af5c-45a4-bc46-2cf7cfda82ef', N'Great Britain (UK)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'54a10441-7132-4b63-af92-2d20114dd6c3', N'Mauritius', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2c43ca3c-1269-4752-a5ba-2ebc22e048af', N'Northern Mariana Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cd2f791e-4427-449f-b58e-2f469456ddd0', N'An;la', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2c40e5f6-89ff-4104-a545-2f73940260b9', N'Morocco', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1e5735e9-a56e-42a0-be2c-2fd8f4e2edcf', N'Kuwait', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'44004d3a-b7f5-4e55-80c5-3001fbb3f228', N'Saudi Arabia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b1c94d2c-6857-4d97-9d92-30ae80450c80', N'Brunei Darussalam', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2b6a1253-fc24-4848-ba0d-30e4d8708cd6', N'Philippines', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'017c4d7a-8f05-4113-84e0-36487032fc4c', N'Comoros', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0a48d2cc-e44f-43e0-9ec0-366f6c6f4041', N'Algeria', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5d5b49a8-850c-496b-b2dd-3ae3c4e77724', N'Niger', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4d70fbcf-72a1-4c33-9688-3c041b2e9e0c', N'Senegal', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd423db7d-e041-4952-98fe-3c1029d764a3', N'Guadeloupe', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'09cf123d-7fd8-4a8d-bc19-3ced86258550', N'Botswana', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'34aba518-26a9-4a25-a482-3d3f53b56155', N'Nicaragua', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd2a06d07-914b-4221-9480-3e275dae27a8', N'Liberia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9e70497b-c850-4258-911f-3f07a0f93b40', N'Suriname', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'972ac81c-349b-45f8-aa1f-3ffe42676469', N'Turks and Caicos Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'12e5e9f6-9f91-4d88-8fd4-405e43fef418', N'Slovenia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'15c14a9a-32cd-455d-812c-40c670b3932b', N'Eritrea', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'40d2bbee-fc5e-416d-bfd5-40f8ef72057b', N'France', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'01ac914c-131a-4634-b32b-413aad1349d9', N'Malaysia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'532b392c-dc54-4447-8254-4247f13dc97c', N'Cayman Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'07e6c8c0-a99b-4735-aa81-42e18dfbc716', N'Paraguay', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5a913f1f-e52a-4106-ac0d-4326e7460d8e', N'Czech Republic', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'885a85d2-46ba-4b23-ba68-434b89c7743b', N'Thailand', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b6e7ca46-6cf7-4b97-9b59-44055920e93d', N'Antigua and Barbuda', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b567f4ff-e116-4d0c-bad2-445d467f39c9', N'Syria', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'18018a79-9385-41a8-8c83-44832e41cdc5', N'Korea (North)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a65eed82-20d8-47fb-9666-44cbf88ab35f', N'Marshall Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8bac7657-4aa4-44fd-aaea-4567d6fe7b8b', N'Sweden', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8d2a850b-c9cd-4f57-9ace-459295728223', N'Turkey', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd6747098-f783-4e7b-9ea5-4647b4e7ccee', N'Dominican Republic', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cbf87654-e283-46ff-8a21-46940390c79c', N'Gibraltar', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'75d3e1a5-dba5-4f15-9da6-48ce7832184b', N'Mauritania', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'de3edb00-7f43-4c25-948c-49aa15ae8700', N'Finland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c6068713-e458-4cf0-a6d9-49d186b68b6e', N'Belarus', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'26efd8a5-1723-45e5-834d-4a0f8536a145', N'United States of America', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'21f03bf4-a117-426f-9261-4e5703dd2709', N'Saint Kitts and Nevis', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7a1cb1a6-73a7-490f-8744-4e6318c304ab', N'Bulgaria', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1192926c-0d87-484c-9ac0-4e798aa6074e', N'Korea (South)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7c9ca0d3-0cdc-49b8-b263-4e92985f6f3a', N'Hungary', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5f015065-1f30-4405-b054-4fbe06bc64d2', N'Con;', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'06c742e3-a112-4b3a-bdfa-51e6d82d9808', N'Cote D''Ivoire (Ivory Coast)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cdf97912-dc83-4c66-910c-52809d32bda5', N'Democratic Republic of the Con;', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'08350933-2171-4837-94be-54734520418c', N'Papua New Guinea', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a9f9c5e7-9c6d-4e71-bc62-5497bda54a64', N'Bhutan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'70948486-354b-4e1c-b40d-54bd35f99898', N'Cape Verde', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f754e9c4-074e-4a2e-a8c4-54c951934afe', N'El Salvador', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0b48eecd-b044-4986-8921-58ac1a42a8c1', N'Rwanda', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f2dc8676-1e6c-4ec7-bfe0-5a8e3194f991', N'Austria', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f30284e9-fbe9-4054-9631-5d4bbecda105', N'Bahamas', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'36dd7689-34f3-43c9-a789-5dae4553b244', N'Reunion', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0bae6b07-8cd1-4187-be4a-5e7046a271f4', N'Belize', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'12093c6b-bf76-4d06-9efb-5ed18e8a5b1b', N'Cyprus', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9ada087f-4b0d-444d-84df-5ef59bbcf1d0', N'Ghana', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2b24beb5-00cd-4ba8-aa99-5f131f0b9ec0', N'Bermuda', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cce88533-cb93-47f9-a71a-5f4c00d662ff', N'Uzbekistan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'783687ee-7f7f-474c-a330-5f99c0431ece', N'Pakistan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'778bffe1-9182-4f21-add3-612f866a03d5', N'Guinea-Bissau', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'571a4e72-e6ff-417c-bc01-629284d5ce7b', N'Canada', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8ed0808e-40b8-4eb8-973e-62bc5d62ad25', N'Sri Lanka', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dd363771-a880-4abc-8df5-64a96d7a4a29', N'Cambodia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c0ede753-f2c6-4c00-b157-65fc4aed006d', N'French Southern Territories', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1acaecde-57ee-4e11-a209-67cb7cf4e066', N'Guyana', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c4e9e77b-c56b-4882-911f-6985a48fe748', N'French Guiana', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3013495b-7647-468b-832e-6a5219c9cbe7', N'Russian Federation', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3d8f4b11-b325-45a8-ae5f-6bdd1981b240', N'Barbados', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'94260764-0072-412c-a5e5-6fe3d3bd3e66', N'Spain', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'25d51e4a-9433-4a91-bf66-703528246863', N'Swaziland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a1ff9789-d963-4ba2-ab99-71abdda0a315', N'Mali', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'17987a5d-15c3-4863-8cc5-720f7f307e7f', N'Tajikistan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9311ee3e-acc4-46cb-b68a-7281174231c3', N'Djibouti', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ca1da9ec-9b38-40d0-988f-72b7512c0d24', N'Uruguay', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'de6d207b-5a3e-4c12-8e71-72dee2364f03', N'Burkina Faso', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ef62f641-ffad-4244-b439-744114523add', N'Nepal', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'415ce1be-515d-445e-bd7d-77a4d1f895e8', N'Qatar', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'42e823f0-ce4f-4d4d-9aa5-79010567528f', N'Samoa', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6c376827-927d-43a0-a068-7a7478cba0a7', N'Fiji', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5b5416aa-f66c-438c-a3eb-7afadb3384a6', N'Armenia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cac819c0-9a83-4f0c-8da5-7b0e6aca9e93', N'Saint Vincent and the Grenadines', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5e534f51-cc36-4db3-bbec-7dafff995e7b', N'Benin', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4edb9a43-38f2-45a9-88fe-7e531c5ae8b8', N'Sudan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'62d4035f-a1e4-448b-984d-7ed6e9f682fd', N'Malawi', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'70129a25-de68-4bed-898b-813d486daee6', N'Solomon Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bc25461b-9b70-49e7-8672-87769a0764bf', N'Kyrgyzstan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd7f9e7f9-8a24-4354-bba3-8d13c273c578', N'Belgium', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'252bd48f-7e9a-40fa-8149-8f92858e51f0', N'China', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f5836b55-e905-4c96-8860-9023fcdb5788', N'San Marino', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5a58ec7b-248a-47a0-a52b-914e693b007a', N'Tanzania', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'031d78bb-030a-4e24-8c90-91a2a9fd9753', N'Latvia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e73eada0-a12d-4a01-a9eb-93d29249fff5', N'Colombia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ef5842d3-7951-4b9a-8c35-951e56fa3120', N'Norfolk Island', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'719b0d48-eccd-4526-ab56-a0df4b88c150', N'Dominica', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5700f685-94df-4837-bbd6-a15eeb17d223', N'Denmark', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ad66cdae-31b7-4a1d-a098-a1e8e58a1a0a', N'Trinidad and Toba;', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ceb3c7c3-f102-4445-8eaa-a24beeaf21e7', N'Tonga', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'82c4bec7-290a-4ff8-b552-a25f5db6b6f1', N'Peru', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fe6cc339-2370-4700-8a64-a2d2b83a1270', N'Andorra', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a179685a-488a-41de-ae04-a47b24808e5c', N'French Polynesia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5d3ec650-0104-4dca-936c-ab082479a3f1', N'Virgin Islands (U.S.)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'269483a2-fd23-4f32-a7df-acd895346caf', N'Ireland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9b3947c6-b15d-4d74-9db9-acdd0832f97f', N'Anguilla', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'85885805-6ab1-4082-8a95-adcd982fcc60', N'Yemen', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2499f86b-a555-4278-888e-ae157c6c66aa', N'Lithuania', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7c211fb4-8cfc-4cf8-9e67-b24d4e13ad20', N'Kenya', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'137a2dc1-074a-4d6e-a486-b2ab9bf6d5dd', N'Sierra Leone', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5c6cfb7c-06f3-407f-8717-b2ddbf9b0d78', N'Laos', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'967cfb6b-8d36-4ac4-9d9b-b4641c7c9092', N'Burundi', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f10467db-5d42-4bf0-a97a-b4ddc54f137a', N'Honduras', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'420061ff-b017-4645-8622-b60f59fb46a6', N'Zimbabwe', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'84e33ddb-bbbc-4135-a877-b820e44eba09', N'Cuba', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0d93bc4d-e873-44e3-abab-b88e680a5db1', N'Guinea', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'977235d5-75e2-40d1-bc1a-b8f780432b26', N'Palestinian Territory', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'e3c9564e-5514-483f-8730-b97f55da94b9', N'Svalbard and Jan Mayen', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5cee0360-e895-44ad-a8a5-ba1f20757fdc', N'Namibia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5e61d827-2a05-4493-8744-baaf0e526218', N'Guernsey', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd6d40893-d50f-4e11-ae1f-bb62d0dbc956', N'Luxembourg', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'15677a06-a86a-4e13-84fb-bb780fbc5067', N'Azerbaijan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0bd07c8a-6cd7-4427-880a-bc147b75bd6d', N'Albania', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2f6cf3c0-30a6-4710-8f89-bd34f6091295', N'Georgia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'4e4236ae-7952-41f2-865a-bf910d671b71', N'Saint Lucia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3cde5bd0-249f-4c02-9062-c04a163cf71e', N'Palau', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'10bbcf63-512d-4397-a525-c2133dd7fb2f', N'Romania', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b86ff4ce-73ed-4dbb-9008-c22282df53b0', N'Faroe Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'7c2d68ca-d506-4089-9324-c35b109ef193', N'Maldives', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ef093bd0-ffd5-43bc-b73e-c3e736ec3955', N'Estonia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a322c01e-4c78-4b16-a104-c41c87a88f76', N'Slovakia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'12dc8101-6ac9-46f0-a5e9-c564d81da38c', N'Vanuatu', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c23a5c3a-4f45-48d7-8f49-c5c245c0e25b', N'Myanmar', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd7a1fcb6-76e7-449e-a689-c6dde0ed05f6', N'Falkland Islands (Malvinas)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'ee9b93a3-b6e8-4229-8a07-c866649e1a3e', N'Iran', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dbfe56b3-729c-41a4-9b5b-c9e82e945c2a', N'Moldova', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1fe1f991-0fcd-4729-8aa0-caf8f4556039', N'Madagascar', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8f530f6f-c2d2-4f8c-92d3-cbf925a81288', N'Mexico', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8174ae67-bf8e-4755-8aa7-ccbd725c7032', N'Federated States of Micronesia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a7d757f9-9571-42ab-ad3a-cd5ee3838d8e', N'Bangladesh', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bfed7f83-5e7d-4220-a39d-ceb8106f3f8f', N'Mayotte', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bb40e9ba-8196-4531-831b-d0b9071d36a4', N'Kazakhstan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bf8b6fae-e7e2-479b-b9d2-d15afc0e668c', N'Egypt', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bc019ba2-db77-490d-8f4f-d3693f9837db', N'Cameroon', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a82f1819-e3ef-41a3-9077-d379bd5a693a', N'Equatorial Guinea', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a084e84e-52e4-4b70-80ff-d50282315e53', N'Venezuela', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3694cbd0-45d0-4a76-8d6b-d721f847f1d3', N'Cook Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'bc879fbc-2773-4199-894f-d7d60fa4b400', N'Netherlands Antilles', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'1599226d-91fa-41df-b1fa-d842b7c27b41', N'Israel', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'0a60c8df-5dd3-4604-8457-d8e4f24636ce', N'United Arab Emirates', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'3469b4ad-8917-4933-adbf-d96d05d8d892', N'Tokelau', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b6ed5bfb-c227-4a04-ab48-d9f9f3af031e', N'Hong Kong', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9375ca6e-c41b-4ea2-84ea-da91fbc0c844', N'Monaco', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'79395ff8-2eb0-4a33-9009-db99ff73adf0', N'Sao Tome and Principe', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd2c3af23-6182-48ca-b0db-dc009f8d0467', N'Iceland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'6ec9ffb0-a368-47b2-a543-dc71edae5b55', N'South Africa', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'c3d88a5f-abfc-4855-a477-ddedd9964b8c', N'Zambia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd761646e-7b5d-41e6-91f8-de66156c95d0', N'Tuvalu', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'badf02e4-67ca-413b-b6b7-de6f36287ed9', N'Turkmenistan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5c3a45f8-44a6-4c2a-8d41-de902906602c', N'Nauru', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'026d5ed0-b5e4-4c59-87ab-df8c82d56e97', N'Bosnia and Herze;vina', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f43458cf-7402-492a-93a1-dffa4229fb0a', N'Wallis and Futuna', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'85dee916-b902-4779-af14-e1faa1d995d4', N'Aruba', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'91d60671-72b7-4336-ab8b-e2e4cb16ffb7', N'Guatemala', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd824ba81-9fce-4997-bab6-e4759a173956', N'Lesotho', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'8e425eba-1f9f-47b0-8a4f-e520f178eceb', N'Switzerland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'27acc4b1-244b-49bb-8f6d-e52e5d4af5d0', N'Somalia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'020f819d-0422-4b42-a1ce-e5891d5c7893', N'Greenland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'09dacdb3-dcbf-478d-92d2-e7287a55cfc3', N'Macedonia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'deba1503-73a4-4331-93a0-e8b8d865eb09', N'Malta', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cf80760e-8949-46ef-a882-e9dd3ebd47eb', N'Taiwan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd40862ec-8859-430a-8be8-ea500f57627f', N'India', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'2c3c7e6b-47f7-4141-89fe-ec2329d0f0b7', N'Mon;lia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'97e55f1b-daa6-4c5d-b0ff-ee00d2f4299f', N'Indonesia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'073fa6a5-26db-42f4-866f-ef0142c8bbb2', N'Uganda', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'f1df66cb-45b4-4dc9-99a0-eff73a085edc', N'Argentina', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'b67cf349-9079-430b-ae52-f03d8938d9dc', N'New Caledonia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'cea783f0-cfb9-47fc-aded-f03f5979713f', N'Poland', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fe1ca4d6-944d-41a0-b2a1-f07037a0a506', N'Pitcairn', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'339f8fbb-9a37-4c9c-9f79-f0bbcdfa8494', N'Seychelles', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9f2e9dae-b6cc-4680-896c-f0ed35b907f2', N'Iraq', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd4dc48c9-b24f-4b6f-9fb4-f288bf476692', N'Gambia', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'd267e41d-bdf5-47b2-9c6d-f2fd8ee6ed60', N'Christmas Island', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'72ab2b4a-a9db-40ef-9a95-f37371ca3fb6', N'Norway', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'5f7460da-5df6-43f7-b0bc-f652f6008c8a', N'Cocos (Keeling) Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'fd6d5001-fa3b-46d2-81fb-f69a28e4e120', N'Viet Nam', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'afd944dc-23db-4500-8cac-f850edd88373', N'Greece', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'dd1372ea-47ec-45c2-be75-f941393f0247', N'S. Georgia and S. Sandwich Islands', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'9ee3ca11-0828-4417-8bf0-f9ba2487a062', N'Western Sahara', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a3c4f092-1cbc-40b3-bd4b-fb23c5ece311', N'Macao', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'498b6f01-53ad-446d-889e-fb2a24d3a54b', N'Gabon', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'38cc2d1a-905c-4982-8bad-fbe8a9c59e8e', N'New Zealand (Aotearoa)', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'52e63a07-a324-486c-9e54-fc9b56c23b1a', N'Brazil', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'33270a9a-6cc0-4eb8-90bb-fd7188269027', N'Saint Pierre and Miquelon', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Countries` (`Id`, `CountryName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'a16d46c9-9bd1-4956-857f-fddc420dd74f', N'Japan', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', CAST(N'2021-04-27T18:24:36.9833333' AS DateTime), N'1a5cf5b9-ead8-495c-8719-2d8be776f452', NULL, NULL, 0);
INSERT `Customers` (`Id`, `CustomerName`, `ContactPerson`, `Email`, `Fax`, `MobileNo`, `PhoneNo`, `Website`, `Description`, `Url`, `IsVarified`, `IsUnsubscribe`, `CustomerProfile`, `Address`, `CountryName`, `CityName`, `CountryId`, `CityId`, `IsWalkIn`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `DeletedDate`, `DeletedBy`, `IsDeleted`) VALUES (N'332b959a-a2d8-4989-bdaf-08dabf26e560', N'Walk-in customer', N'', N'walkin@gmail.com', NULL, N'123123123', N'', N'', N'', N'', 1, 0, NULL, N'', N'', N'', NULL, NULL, 1, CAST(N'2022-11-05T12:11:40.6166244' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', CAST(N'2022-11-05T12:11:40.6169674' AS DateTime), N'4b352b37-332a-40c6-ab05-e38fcf109719', NULL, NULL, 0);

CREATE DEFINER=`root`@`localhost` PROCEDURE `NLog_AddEntry_p`(
  p_machineName nvarchar(200),
  p_logged datetime(3),
  p_level varchar(5),
  p_message longtext,
  p_logger nvarchar(300),
  p_properties longtext,
  p_callsite nvarchar(300),
  p_exception longtext
)
BEGIN
  INSERT INTO NLog (
	`Id`,
    `MachineName`,
    `Logged`,
    `Level`,
    `Message`,
    `Logger`,
    `Properties`,
    `Callsite`,
    `Exception`,
	`Source`
  ) VALUES (
    uuid(),
    p_machineName,
    p_logged,
    p_level,
    p_message,
    p_logger,
    p_properties,
    p_callsite,
    p_exception,
	'.Net Core'
  );
  END;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20221105122702_Initial_Data', '6.0.7');

COMMIT;

