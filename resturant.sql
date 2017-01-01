/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : res_test

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2017-01-01 11:32:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mt_address_book
-- ----------------------------
DROP TABLE IF EXISTS `mt_address_book`;
CREATE TABLE `mt_address_book` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `as_default` int(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_address_book
-- ----------------------------

-- ----------------------------
-- Table structure for mt_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `mt_admin_user`;
CREATE TABLE `mt_admin_user` (
  `admin_id` int(14) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `user_lang` int(14) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `lost_password_code` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL,
  `user_access` text NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_admin_user
-- ----------------------------
INSERT INTO `mt_admin_user` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '', '', '', '2016-11-30 00:33:11', '2016-11-30 19:00:10', '::1', '2', '', '', '', '0000-00-00 00:00:00', '[\"autologin\",\"dashboard\",\"merchant\",\"sponsoredMerchantList\",\"packages\",\"Cuisine\",\"dishes\",\"OrderStatus\",\"settings\",\"commisionsettings\",\"voucher\",\"merchantcommission\",\"withdrawal\",\"incomingwithdrawal\",\"withdrawalsettings\",\"emailsettings\",\"emailtpl\",\"customPage\",\"Ratings\",\"ContactSettings\",\"SocialSettings\",\"ManageCurrency\",\"ManageLanguage\",\"Seo\",\"analytics\",\"customerlist\",\"subscriberlist\",\"reviews\",\"bankdeposit\",\"paymentgatewaysettings\",\"paymentgateway\",\"paypalSettings\",\"stripeSettings\",\"mercadopagoSettings\",\"sisowsettings\",\"payumonenysettings\",\"obdsettings\",\"payserasettings\",\"payondelivery\",\"barclay\",\"epaybg\",\"authorize\",\"sms\",\"smsSettings\",\"smsPackage\",\"smstransaction\",\"smslogs\",\"fax\",\"faxtransaction\",\"faxpackage\",\"faxlogs\",\"faxsettings\",\"reports\",\"rptMerchantReg\",\"rptMerchantPayment\",\"rptMerchanteSales\",\"rptmerchantsalesummary\",\"rptbookingsummary\",\"userList\"]\n');

-- ----------------------------
-- Table structure for mt_bank_deposit
-- ----------------------------
DROP TABLE IF EXISTS `mt_bank_deposit`;
CREATE TABLE `mt_bank_deposit` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `branch_code` varchar(100) NOT NULL,
  `date_of_deposit` date NOT NULL,
  `time_of_deposit` varchar(50) NOT NULL,
  `amount` float(14,4) NOT NULL,
  `scanphoto` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` date NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `transaction_type` varchar(255) NOT NULL DEFAULT 'merchant_signup',
  `client_id` int(14) NOT NULL,
  `order_id` int(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_bank_deposit
-- ----------------------------

-- ----------------------------
-- Table structure for mt_barclay_trans
-- ----------------------------
DROP TABLE IF EXISTS `mt_barclay_trans`;
CREATE TABLE `mt_barclay_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `transaction_type` varchar(255) NOT NULL DEFAULT 'signup',
  `date_created` date NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` text NOT NULL,
  `param3` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_barclay_trans
-- ----------------------------

-- ----------------------------
-- Table structure for mt_bookingtable
-- ----------------------------
DROP TABLE IF EXISTS `mt_bookingtable`;
CREATE TABLE `mt_bookingtable` (
  `booking_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `number_guest` int(14) NOT NULL,
  `date_booking` date NOT NULL,
  `booking_time` varchar(50) NOT NULL,
  `booking_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `booking_notes` text NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_bookingtable
-- ----------------------------

-- ----------------------------
-- Table structure for mt_category
-- ----------------------------
DROP TABLE IF EXISTS `mt_category`;
CREATE TABLE `mt_category` (
  `cat_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `sequence` int(14) NOT NULL,
  `date_created` varchar(50) NOT NULL,
  `date_modified` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `spicydish` int(2) NOT NULL DEFAULT '1',
  `spicydish_notes` text NOT NULL,
  `dish` text NOT NULL,
  `category_name_trans` text NOT NULL,
  `category_description_trans` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_category
-- ----------------------------

-- ----------------------------
-- Table structure for mt_client
-- ----------------------------
DROP TABLE IF EXISTS `mt_client`;
CREATE TABLE `mt_client` (
  `client_id` int(14) NOT NULL AUTO_INCREMENT,
  `social_strategy` varchar(100) NOT NULL DEFAULT 'web',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(100) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `location_name` text NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `lost_password_token` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `token` varchar(255) NOT NULL,
  `mobile_verification_code` int(14) NOT NULL,
  `mobile_verification_date` datetime NOT NULL,
  `custom_field1` varchar(255) NOT NULL,
  `custom_field2` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_client
-- ----------------------------

-- ----------------------------
-- Table structure for mt_client_cc
-- ----------------------------
DROP TABLE IF EXISTS `mt_client_cc`;
CREATE TABLE `mt_client_cc` (
  `cc_id` int(14) NOT NULL AUTO_INCREMENT,
  `client_id` int(14) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `credit_card_number` varchar(20) NOT NULL,
  `expiration_month` varchar(5) NOT NULL,
  `expiration_yr` varchar(5) NOT NULL,
  `cvv` varchar(20) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_client_cc
-- ----------------------------

-- ----------------------------
-- Table structure for mt_cooking_ref
-- ----------------------------
DROP TABLE IF EXISTS `mt_cooking_ref`;
CREATE TABLE `mt_cooking_ref` (
  `cook_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `cooking_name` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `ip_address` varchar(50) NOT NULL,
  `cooking_name_trans` text NOT NULL,
  PRIMARY KEY (`cook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_cooking_ref
-- ----------------------------

-- ----------------------------
-- Table structure for mt_cuisine
-- ----------------------------
DROP TABLE IF EXISTS `mt_cuisine`;
CREATE TABLE `mt_cuisine` (
  `cuisine_id` int(14) NOT NULL AUTO_INCREMENT,
  `cuisine_name` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`cuisine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_cuisine
-- ----------------------------
INSERT INTO `mt_cuisine` VALUES ('1', 'American', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('2', 'Deli', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('3', 'Indian', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('4', 'Mediterranean', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('5', 'Sandwiches', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('6', 'Barbeque', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('7', 'Diner', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('8', 'Italian', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('9', 'Mexican', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('10', 'Sushi', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('11', 'Burgers', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('12', 'Greek', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('13', 'Japanese', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('14', 'Middle Eastern', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('15', 'Thai', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('16', 'Chinese', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('17', 'Healthy', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('18', 'Korean', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('19', 'Pizza', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_cuisine` VALUES ('20', 'Vegetarian', '0', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');

-- ----------------------------
-- Table structure for mt_currency
-- ----------------------------
DROP TABLE IF EXISTS `mt_currency`;
CREATE TABLE `mt_currency` (
  `currency_code` varchar(3) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_currency
-- ----------------------------
INSERT INTO `mt_currency` VALUES ('AUD', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('CAD', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('CNY', '&yen;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('EUR', '&euro;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('HKD', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('IRR', 'ریال', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('JPY', '&yen;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('MXN', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('MYR', '&#82;&#77;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('NZD', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_currency` VALUES ('USD', '&#36;', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');

-- ----------------------------
-- Table structure for mt_custom_page
-- ----------------------------
DROP TABLE IF EXISTS `mt_custom_page`;
CREATE TABLE `mt_custom_page` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `slug_name` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `icons` varchar(255) NOT NULL,
  `assign_to` varchar(50) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `open_new_tab` int(11) NOT NULL DEFAULT '1',
  `is_custom_link` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_custom_page
-- ----------------------------

-- ----------------------------
-- Table structure for mt_dishes
-- ----------------------------
DROP TABLE IF EXISTS `mt_dishes`;
CREATE TABLE `mt_dishes` (
  `dish_id` int(14) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_dishes
-- ----------------------------

-- ----------------------------
-- Table structure for mt_fax_broadcast
-- ----------------------------
DROP TABLE IF EXISTS `mt_fax_broadcast`;
CREATE TABLE `mt_fax_broadcast` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `faxno` varchar(50) NOT NULL,
  `recipname` varchar(32) NOT NULL,
  `faxurl` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `jobid` varchar(255) NOT NULL,
  `api_raw_response` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_process` datetime NOT NULL,
  `date_postback` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_fax_broadcast
-- ----------------------------

-- ----------------------------
-- Table structure for mt_fax_package
-- ----------------------------
DROP TABLE IF EXISTS `mt_fax_package`;
CREATE TABLE `mt_fax_package` (
  `fax_package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(14,4) NOT NULL,
  `promo_price` float(14,4) NOT NULL,
  `fax_limit` int(14) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`fax_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_fax_package
-- ----------------------------

-- ----------------------------
-- Table structure for mt_fax_package_trans
-- ----------------------------
DROP TABLE IF EXISTS `mt_fax_package_trans`;
CREATE TABLE `mt_fax_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `fax_package_id` int(14) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `package_price` float(14,4) NOT NULL,
  `fax_limit` int(14) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `payment_reference` varchar(255) NOT NULL,
  `payment_gateway_response` text NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_fax_package_trans
-- ----------------------------

-- ----------------------------
-- Table structure for mt_ingredients
-- ----------------------------
DROP TABLE IF EXISTS `mt_ingredients`;
CREATE TABLE `mt_ingredients` (
  `ingredients_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `ingredients_name` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `ip_address` varchar(50) NOT NULL,
  `ingredients_name_trans` text NOT NULL,
  PRIMARY KEY (`ingredients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_ingredients
-- ----------------------------

-- ----------------------------
-- Table structure for mt_item
-- ----------------------------
DROP TABLE IF EXISTS `mt_item`;
CREATE TABLE `mt_item` (
  `item_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `category` text NOT NULL,
  `price` text NOT NULL,
  `addon_item` text NOT NULL,
  `cooking_ref` text NOT NULL,
  `discount` varchar(14) NOT NULL,
  `multi_option` text NOT NULL,
  `multi_option_value` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `ingredients` text NOT NULL,
  `spicydish` int(2) NOT NULL DEFAULT '1',
  `two_flavors` int(2) NOT NULL,
  `two_flavors_position` text NOT NULL,
  `require_addon` text NOT NULL,
  `dish` text NOT NULL,
  `item_name_trans` text NOT NULL,
  `item_description_trans` text NOT NULL,
  `non_taxable` int(1) NOT NULL DEFAULT '1',
  `not_available` int(1) NOT NULL DEFAULT '1',
  `gallery_photo` text NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_item
-- ----------------------------

-- ----------------------------
-- Table structure for mt_languages
-- ----------------------------
DROP TABLE IF EXISTS `mt_languages`;
CREATE TABLE `mt_languages` (
  `lang_id` int(14) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(14) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `source_text` text NOT NULL,
  `is_assign` int(1) NOT NULL DEFAULT '2',
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_languages
-- ----------------------------
INSERT INTO `mt_languages` VALUES ('1', 'ES', 'Spanish', '1480463208-spanish.php', '2', '2016-11-30 03:17:12', '0000-00-00 00:00:00', 'publish', '::1');
INSERT INTO `mt_languages` VALUES ('2', 'IR', 'Persian', '1480504467-mt_language_file.php', '2', '2016-11-30 14:44:32', '0000-00-00 00:00:00', 'publish', '::1');

-- ----------------------------
-- Table structure for mt_merchant
-- ----------------------------
DROP TABLE IF EXISTS `mt_merchant`;
CREATE TABLE `mt_merchant` (
  `merchant_id` int(14) NOT NULL AUTO_INCREMENT,
  `restaurant_slug` varchar(255) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL,
  `restaurant_phone` varchar(100) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(100) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `street` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `post_code` varchar(100) NOT NULL,
  `cuisine` text NOT NULL,
  `service` varchar(255) NOT NULL,
  `free_delivery` int(1) NOT NULL DEFAULT '2',
  `delivery_estimation` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `activation_key` varchar(50) NOT NULL,
  `activation_token` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_activated` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `package_id` int(14) NOT NULL,
  `package_price` float(14,5) NOT NULL,
  `membership_expired` date NOT NULL,
  `payment_steps` int(1) NOT NULL DEFAULT '1',
  `is_featured` int(1) NOT NULL DEFAULT '1',
  `is_ready` int(1) NOT NULL DEFAULT '1',
  `is_sponsored` int(2) NOT NULL DEFAULT '1',
  `sponsored_expiration` date NOT NULL,
  `lost_password_code` varchar(50) NOT NULL,
  `user_lang` int(14) NOT NULL,
  `membership_purchase_date` datetime NOT NULL,
  `sort_featured` int(14) NOT NULL,
  `is_commission` int(1) NOT NULL DEFAULT '1',
  `percent_commision` float(14,5) NOT NULL,
  `abn` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `commision_type` varchar(50) NOT NULL DEFAULT 'percentage',
  PRIMARY KEY (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_merchant
-- ----------------------------

-- ----------------------------
-- Table structure for mt_merchant_cc
-- ----------------------------
DROP TABLE IF EXISTS `mt_merchant_cc`;
CREATE TABLE `mt_merchant_cc` (
  `mt_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `credit_card_number` varchar(20) NOT NULL,
  `expiration_month` varchar(5) NOT NULL,
  `expiration_yr` varchar(5) NOT NULL,
  `cvv` varchar(20) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`mt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_merchant_cc
-- ----------------------------

-- ----------------------------
-- Table structure for mt_merchant_user
-- ----------------------------
DROP TABLE IF EXISTS `mt_merchant_user`;
CREATE TABLE `mt_merchant_user` (
  `merchant_user_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_access` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `last_login` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  PRIMARY KEY (`merchant_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_merchant_user
-- ----------------------------

-- ----------------------------
-- Table structure for mt_newsletter
-- ----------------------------
DROP TABLE IF EXISTS `mt_newsletter`;
CREATE TABLE `mt_newsletter` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_newsletter
-- ----------------------------

-- ----------------------------
-- Table structure for mt_offers
-- ----------------------------
DROP TABLE IF EXISTS `mt_offers`;
CREATE TABLE `mt_offers` (
  `offers_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `offer_percentage` float(14,4) NOT NULL,
  `offer_price` float(14,4) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`offers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_offers
-- ----------------------------

-- ----------------------------
-- Table structure for mt_option
-- ----------------------------
DROP TABLE IF EXISTS `mt_option`;
CREATE TABLE `mt_option` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_option
-- ----------------------------
INSERT INTO `mt_option` VALUES ('1', '0', 'website_title', 'Iranian3.2');
INSERT INTO `mt_option` VALUES ('2', '0', 'admin_country_set', 'IR');
INSERT INTO `mt_option` VALUES ('3', '0', 'website_address', 'Qom');
INSERT INTO `mt_option` VALUES ('4', '0', 'website_contact_phone', '6574422');
INSERT INTO `mt_option` VALUES ('5', '0', 'website_contact_email', 'yusef.mobasheri@gmail.com');
INSERT INTO `mt_option` VALUES ('6', '0', 'admin_currency_set', 'IRR');
INSERT INTO `mt_option` VALUES ('7', '0', 'website_disbaled_auto_cart', '');
INSERT INTO `mt_option` VALUES ('8', '0', 'website_enabled_mobile_verification', '');
INSERT INTO `mt_option` VALUES ('9', '0', 'website_date_picker_format', 'yy-mm-dd');
INSERT INTO `mt_option` VALUES ('10', '0', 'website_time_picker_format', '24');
INSERT INTO `mt_option` VALUES ('11', '0', 'website_date_format', 'Y/m/d');
INSERT INTO `mt_option` VALUES ('12', '0', 'website_time_format', 'H:i:s');
INSERT INTO `mt_option` VALUES ('13', '0', 'merchant_sigup_status', 'pending');
INSERT INTO `mt_option` VALUES ('14', '0', 'merchant_email_verification', '');
INSERT INTO `mt_option` VALUES ('15', '0', 'merchant_payment_enabled', '');
INSERT INTO `mt_option` VALUES ('16', '0', 'admin_enabled_paypal', '');
INSERT INTO `mt_option` VALUES ('17', '0', 'admin_enabled_card', '');
INSERT INTO `mt_option` VALUES ('18', '0', 'home_search_text', '');
INSERT INTO `mt_option` VALUES ('19', '0', 'home_search_subtext', '');
INSERT INTO `mt_option` VALUES ('20', '0', 'home_search_mode', '');
INSERT INTO `mt_option` VALUES ('21', '0', 'website_logo', '');
INSERT INTO `mt_option` VALUES ('22', '0', 'admin_decimal_place', '0');
INSERT INTO `mt_option` VALUES ('23', '0', 'admin_use_separators', 'yes');
INSERT INTO `mt_option` VALUES ('24', '0', 'google_auto_address', '');
INSERT INTO `mt_option` VALUES ('25', '0', 'home_search_radius', '');
INSERT INTO `mt_option` VALUES ('26', '0', 'home_search_unit_type', 'mi');
INSERT INTO `mt_option` VALUES ('27', '0', 'google_default_country', '');
INSERT INTO `mt_option` VALUES ('28', '0', 'enabled_advance_search', '');
INSERT INTO `mt_option` VALUES ('29', '0', 'disabled_share_location', '');
INSERT INTO `mt_option` VALUES ('30', '0', 'enabled_search_map', '');
INSERT INTO `mt_option` VALUES ('31', '0', 'admin_currency_position', 'right');
INSERT INTO `mt_option` VALUES ('32', '0', 'merchant_default_country', 'IR');
INSERT INTO `mt_option` VALUES ('33', '0', 'merchant_specific_country', '');
INSERT INTO `mt_option` VALUES ('34', '0', 'map_marker', '');
INSERT INTO `mt_option` VALUES ('35', '0', 'global_admin_sender_email', '');
INSERT INTO `mt_option` VALUES ('36', '0', 'merchant_disabled_registration', '');
INSERT INTO `mt_option` VALUES ('37', '0', 'disabled_subscription', '');
INSERT INTO `mt_option` VALUES ('38', '0', 'disabled_featured_merchant', '');
INSERT INTO `mt_option` VALUES ('39', '0', 'merchant_days_can_edit_status', '');
INSERT INTO `mt_option` VALUES ('40', '0', 'disabled_website_ordering', '');
INSERT INTO `mt_option` VALUES ('41', '0', 'admin_activated_menu', '');
INSERT INTO `mt_option` VALUES ('42', '0', 'website_hide_foodprice', '');
INSERT INTO `mt_option` VALUES ('43', '0', 'disabled_cc_management', '');
INSERT INTO `mt_option` VALUES ('44', '0', 'merchant_reg_abn', '');
INSERT INTO `mt_option` VALUES ('45', '0', 'spicydish', '');
INSERT INTO `mt_option` VALUES ('46', '0', 'website_timezone', 'Asia/Tehran');
INSERT INTO `mt_option` VALUES ('47', '0', 'website_admin_mutiple_login', '');
INSERT INTO `mt_option` VALUES ('48', '0', 'website_merchant_mutiple_login', '');
INSERT INTO `mt_option` VALUES ('49', '0', 'website_disabled_guest_checkout', '');
INSERT INTO `mt_option` VALUES ('50', '0', 'website_reviews_actual_purchase', '');
INSERT INTO `mt_option` VALUES ('51', '0', 'website_terms_merchant', '');
INSERT INTO `mt_option` VALUES ('52', '0', 'website_terms_merchant_url', '');
INSERT INTO `mt_option` VALUES ('53', '0', 'website_terms_customer', '');
INSERT INTO `mt_option` VALUES ('54', '0', 'website_terms_customer_url', '');
INSERT INTO `mt_option` VALUES ('55', '0', 'admin_thousand_separator', '');
INSERT INTO `mt_option` VALUES ('56', '0', 'admin_decimal_separator', '');
INSERT INTO `mt_option` VALUES ('57', '0', 'website_disabled_login_popup', '');
INSERT INTO `mt_option` VALUES ('58', '0', 'merchant_can_edit_reviews', '');
INSERT INTO `mt_option` VALUES ('59', '0', 'website_enabled_rcpt', '');
INSERT INTO `mt_option` VALUES ('60', '0', 'website_receipt_logo', '');
INSERT INTO `mt_option` VALUES ('61', '0', 'disabled_cart_sticky', '');
INSERT INTO `mt_option` VALUES ('62', '0', 'search_result_bydistance', '');
INSERT INTO `mt_option` VALUES ('63', '0', 'google_geo_api_key', 'AIzaSyAiKycGx9fAqmw5l9K1f7pnjsP6bq1wfNI');
INSERT INTO `mt_option` VALUES ('64', '0', 'website_enabled_map_address', '');
INSERT INTO `mt_option` VALUES ('65', '0', 'client_custom_field_name1', '');
INSERT INTO `mt_option` VALUES ('66', '0', 'client_custom_field_name2', '');
INSERT INTO `mt_option` VALUES ('67', '0', 'merchant_days_can_edit_status_basedon', '1');
INSERT INTO `mt_option` VALUES ('68', '0', 'merchant_status_disabled', '');
INSERT INTO `mt_option` VALUES ('69', '0', 'view_map_disabled', '');
INSERT INTO `mt_option` VALUES ('70', '0', 'view_map_default_zoom', '');
INSERT INTO `mt_option` VALUES ('71', '0', 'view_map_default_zoom_s', '');
INSERT INTO `mt_option` VALUES ('72', '0', 'receipt_default_subject', '');
INSERT INTO `mt_option` VALUES ('73', '0', 'merchant_tbl_book_disabled', '');
INSERT INTO `mt_option` VALUES ('74', '0', 'merchant_changeorder_sms', '');
INSERT INTO `mt_option` VALUES ('75', '0', 'customer_ask_address', '');
INSERT INTO `mt_option` VALUES ('76', '0', 'captcha_site_key', '6LcJUg0UAAAAAK1VWfB-P25C-DiZctbrg25h23Fd');
INSERT INTO `mt_option` VALUES ('77', '0', 'captcha_secret', '6LcJUg0UAAAAAEuBWA3E-5ycyNux2Pbpyks8F295');
INSERT INTO `mt_option` VALUES ('78', '0', 'captcha_lang', 'fa_ir');
INSERT INTO `mt_option` VALUES ('79', '0', 'captcha_customer_signup', '');
INSERT INTO `mt_option` VALUES ('80', '0', 'captcha_merchant_signup', '');
INSERT INTO `mt_option` VALUES ('81', '0', 'captcha_customer_login', '');
INSERT INTO `mt_option` VALUES ('82', '0', 'captcha_merchant_login', '');
INSERT INTO `mt_option` VALUES ('83', '0', 'captcha_admin_login', '');
INSERT INTO `mt_option` VALUES ('84', '0', 'captcha_order', '');
INSERT INTO `mt_option` VALUES ('85', '0', 'blocked_email_add', '');
INSERT INTO `mt_option` VALUES ('86', '0', 'blocked_mobile', '');
INSERT INTO `mt_option` VALUES ('87', '0', 'admin_zipcode_searchtype', '1');
INSERT INTO `mt_option` VALUES ('88', '0', 'mobilelogo', '');
INSERT INTO `mt_option` VALUES ('89', '0', 'theme_enabled_email_verification', '');
INSERT INTO `mt_option` VALUES ('90', '0', 'google_distance_method', 'straight_line');
INSERT INTO `mt_option` VALUES ('91', '0', 'google_use_curl', '2');
INSERT INTO `mt_option` VALUES ('92', '0', 'admin_menu_allowed_merchant', '');
INSERT INTO `mt_option` VALUES ('93', '0', 'show_language', '');
INSERT INTO `mt_option` VALUES ('94', '0', 'default_language', '2');
INSERT INTO `mt_option` VALUES ('95', '0', 'set_lang_id', '[\\\"-9999\\\",\\\"2\\\"]');
INSERT INTO `mt_option` VALUES ('96', '0', 'enabled_multiple_translation', '');
INSERT INTO `mt_option` VALUES ('97', '0', 'default_language_backend', '2');
INSERT INTO `mt_option` VALUES ('98', '0', 'show_language_backend', '');
INSERT INTO `mt_option` VALUES ('99', '0', 'paymentgateway', '[\\\"pyp\\\"]');

-- ----------------------------
-- Table structure for mt_order
-- ----------------------------
DROP TABLE IF EXISTS `mt_order`;
CREATE TABLE `mt_order` (
  `order_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `client_id` int(14) NOT NULL,
  `json_details` text NOT NULL,
  `trans_type` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `sub_total` float(14,4) NOT NULL,
  `tax` float(14,4) NOT NULL,
  `taxable_total` decimal(14,4) NOT NULL,
  `total_w_tax` float(14,4) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `stats_id` int(14) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT '1',
  `delivery_charge` float(14,4) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_time` varchar(100) NOT NULL,
  `delivery_asap` varchar(14) NOT NULL,
  `delivery_instruction` varchar(255) NOT NULL,
  `voucher_code` varchar(100) NOT NULL,
  `voucher_amount` float(14,4) NOT NULL,
  `voucher_type` varchar(100) NOT NULL,
  `cc_id` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `order_change` float(14,4) NOT NULL,
  `payment_provider_name` varchar(255) NOT NULL,
  `discounted_amount` float(14,5) NOT NULL,
  `discount_percentage` float(14,5) NOT NULL,
  `percent_commision` float(14,4) NOT NULL,
  `total_commission` float(14,4) NOT NULL,
  `commision_ontop` int(2) NOT NULL DEFAULT '2',
  `merchant_earnings` float(14,4) NOT NULL,
  `packaging` float(14,4) NOT NULL,
  `cart_tip_percentage` float(14,4) NOT NULL,
  `cart_tip_value` float(14,4) NOT NULL,
  `card_fee` float(14,4) NOT NULL,
  `donot_apply_tax_delivery` int(1) NOT NULL DEFAULT '1',
  `order_locked` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order
-- ----------------------------

-- ----------------------------
-- Table structure for mt_order_delivery_address
-- ----------------------------
DROP TABLE IF EXISTS `mt_order_delivery_address`;
CREATE TABLE `mt_order_delivery_address` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `client_id` int(14) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `contact_phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order_delivery_address
-- ----------------------------

-- ----------------------------
-- Table structure for mt_order_details
-- ----------------------------
DROP TABLE IF EXISTS `mt_order_details`;
CREATE TABLE `mt_order_details` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `client_id` int(14) NOT NULL,
  `item_id` int(14) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `order_notes` text NOT NULL,
  `normal_price` float(14,4) NOT NULL,
  `discounted_price` float(14,4) NOT NULL,
  `size` varchar(255) NOT NULL,
  `qty` int(14) NOT NULL,
  `cooking_ref` varchar(255) NOT NULL,
  `addon` text NOT NULL,
  `ingredients` text NOT NULL,
  `non_taxable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order_details
-- ----------------------------

-- ----------------------------
-- Table structure for mt_order_history
-- ----------------------------
DROP TABLE IF EXISTS `mt_order_history`;
CREATE TABLE `mt_order_history` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order_history
-- ----------------------------

-- ----------------------------
-- Table structure for mt_order_sms
-- ----------------------------
DROP TABLE IF EXISTS `mt_order_sms`;
CREATE TABLE `mt_order_sms` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(50) NOT NULL,
  `code` int(4) NOT NULL,
  `session` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session` (`session`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order_sms
-- ----------------------------

-- ----------------------------
-- Table structure for mt_order_status
-- ----------------------------
DROP TABLE IF EXISTS `mt_order_status`;
CREATE TABLE `mt_order_status` (
  `stats_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`stats_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_order_status
-- ----------------------------
INSERT INTO `mt_order_status` VALUES ('1', '0', 'pending', '2016-11-30', '0000-00-00', '::1');
INSERT INTO `mt_order_status` VALUES ('2', '0', 'cancelled', '2016-11-30', '0000-00-00', '::1');
INSERT INTO `mt_order_status` VALUES ('3', '0', 'delivered', '2016-11-30', '0000-00-00', '::1');
INSERT INTO `mt_order_status` VALUES ('4', '0', 'paid', '2016-11-30', '0000-00-00', '::1');

-- ----------------------------
-- Table structure for mt_packages
-- ----------------------------
DROP TABLE IF EXISTS `mt_packages`;
CREATE TABLE `mt_packages` (
  `package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(14,4) NOT NULL,
  `promo_price` float(14,4) NOT NULL,
  `expiration` int(14) NOT NULL,
  `expiration_type` varchar(50) NOT NULL DEFAULT 'days',
  `unlimited_post` int(1) NOT NULL DEFAULT '2',
  `post_limit` int(14) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `sell_limit` int(14) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_packages
-- ----------------------------

-- ----------------------------
-- Table structure for mt_package_trans
-- ----------------------------
DROP TABLE IF EXISTS `mt_package_trans`;
CREATE TABLE `mt_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `package_id` int(14) NOT NULL,
  `merchant_id` int(14) NOT NULL,
  `price` float(14,4) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `mt_id` int(14) NOT NULL,
  `TOKEN` varchar(255) NOT NULL,
  `membership_expired` date NOT NULL,
  `TRANSACTIONID` varchar(255) NOT NULL,
  `TRANSACTIONTYPE` varchar(100) NOT NULL,
  `PAYMENTSTATUS` varchar(100) NOT NULL,
  `PAYPALFULLRESPONSE` text NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `fee` float(14,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_package_trans
-- ----------------------------

-- ----------------------------
-- Table structure for mt_payment_order
-- ----------------------------
DROP TABLE IF EXISTS `mt_payment_order`;
CREATE TABLE `mt_payment_order` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(10) CHARACTER SET utf8 NOT NULL,
  `payment_reference` varchar(255) CHARACTER SET utf8 NOT NULL,
  `order_id` int(14) NOT NULL,
  `raw_response` text CHARACTER SET utf8 NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mt_payment_order
-- ----------------------------

-- ----------------------------
-- Table structure for mt_payment_provider
-- ----------------------------
DROP TABLE IF EXISTS `mt_payment_provider`;
CREATE TABLE `mt_payment_provider` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(255) NOT NULL,
  `payment_logo` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'publish',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_payment_provider
-- ----------------------------

-- ----------------------------
-- Table structure for mt_paypal_checkout
-- ----------------------------
DROP TABLE IF EXISTS `mt_paypal_checkout`;
CREATE TABLE `mt_paypal_checkout` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `token` varchar(255) NOT NULL,
  `paypal_request` text NOT NULL,
  `paypal_response` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'checkout',
  `date_created` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_paypal_checkout
-- ----------------------------

-- ----------------------------
-- Table structure for mt_paypal_payment
-- ----------------------------
DROP TABLE IF EXISTS `mt_paypal_payment`;
CREATE TABLE `mt_paypal_payment` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `TOKEN` varchar(255) NOT NULL,
  `TRANSACTIONID` varchar(100) NOT NULL,
  `TRANSACTIONTYPE` varchar(100) NOT NULL,
  `PAYMENTTYPE` varchar(100) NOT NULL,
  `ORDERTIME` varchar(100) NOT NULL,
  `AMT` varchar(14) NOT NULL,
  `FEEAMT` varchar(14) NOT NULL,
  `TAXAMT` varchar(14) NOT NULL,
  `CURRENCYCODE` varchar(3) NOT NULL,
  `PAYMENTSTATUS` varchar(100) NOT NULL,
  `CORRELATIONID` varchar(100) NOT NULL,
  `TIMESTAMP` varchar(100) NOT NULL,
  `json_details` text NOT NULL,
  `date_created` varchar(50) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_paypal_payment
-- ----------------------------

-- ----------------------------
-- Table structure for mt_rating
-- ----------------------------
DROP TABLE IF EXISTS `mt_rating`;
CREATE TABLE `mt_rating` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `ratings` float(14,1) NOT NULL,
  `client_id` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_rating
-- ----------------------------

-- ----------------------------
-- Table structure for mt_rating_meaning
-- ----------------------------
DROP TABLE IF EXISTS `mt_rating_meaning`;
CREATE TABLE `mt_rating_meaning` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `rating_start` float(14,1) NOT NULL,
  `rating_end` float(14,1) NOT NULL,
  `meaning` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_rating_meaning
-- ----------------------------
INSERT INTO `mt_rating_meaning` VALUES ('1', '1.0', '1.9', 'poor', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_rating_meaning` VALUES ('2', '2.0', '2.9', 'good', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_rating_meaning` VALUES ('3', '3.0', '4.0', 'very good', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');
INSERT INTO `mt_rating_meaning` VALUES ('4', '4.1', '5.0', 'excellent', '2016-11-30 00:33:07', '0000-00-00 00:00:00', '::1');

-- ----------------------------
-- Table structure for mt_review
-- ----------------------------
DROP TABLE IF EXISTS `mt_review`;
CREATE TABLE `mt_review` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `client_id` int(14) NOT NULL,
  `review` text NOT NULL,
  `rating` float(14,1) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'publish',
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `order_id` varchar(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_review
-- ----------------------------

-- ----------------------------
-- Table structure for mt_shipping_rate
-- ----------------------------
DROP TABLE IF EXISTS `mt_shipping_rate`;
CREATE TABLE `mt_shipping_rate` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `distance_from` int(14) NOT NULL,
  `distance_to` int(14) NOT NULL,
  `shipping_units` varchar(5) NOT NULL,
  `distance_price` float(14,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_shipping_rate
-- ----------------------------

-- ----------------------------
-- Table structure for mt_size
-- ----------------------------
DROP TABLE IF EXISTS `mt_size`;
CREATE TABLE `mt_size` (
  `size_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `size_name` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'published',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `size_name_trans` text NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_size
-- ----------------------------

-- ----------------------------
-- Table structure for mt_sms_broadcast
-- ----------------------------
DROP TABLE IF EXISTS `mt_sms_broadcast`;
CREATE TABLE `mt_sms_broadcast` (
  `broadcast_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `send_to` int(14) NOT NULL,
  `list_mobile_number` text CHARACTER SET utf8 NOT NULL,
  `sms_alert_message` varchar(255) CHARACTER SET utf8 NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`broadcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

-- ----------------------------
-- Records of mt_sms_broadcast
-- ----------------------------

-- ----------------------------
-- Table structure for mt_sms_broadcast_details
-- ----------------------------
DROP TABLE IF EXISTS `mt_sms_broadcast_details`;
CREATE TABLE `mt_sms_broadcast_details` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `broadcast_id` int(14) NOT NULL,
  `client_id` int(14) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `contact_phone` varchar(50) NOT NULL,
  `sms_message` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `gateway_response` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_executed` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `gateway` varchar(255) NOT NULL DEFAULT 'twilio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_sms_broadcast_details
-- ----------------------------

-- ----------------------------
-- Table structure for mt_sms_package
-- ----------------------------
DROP TABLE IF EXISTS `mt_sms_package`;
CREATE TABLE `mt_sms_package` (
  `sms_package_id` int(14) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(14,4) NOT NULL,
  `promo_price` float(14,4) NOT NULL,
  `sms_limit` int(14) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  PRIMARY KEY (`sms_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_sms_package
-- ----------------------------

-- ----------------------------
-- Table structure for mt_sms_package_trans
-- ----------------------------
DROP TABLE IF EXISTS `mt_sms_package_trans`;
CREATE TABLE `mt_sms_package_trans` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `sms_package_id` int(14) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `package_price` float(14,4) NOT NULL,
  `sms_limit` int(14) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `payment_reference` varchar(255) NOT NULL,
  `payment_gateway_response` text NOT NULL,
  `date_created` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_sms_package_trans
-- ----------------------------

-- ----------------------------
-- Table structure for mt_stripe_logs
-- ----------------------------
DROP TABLE IF EXISTS `mt_stripe_logs`;
CREATE TABLE `mt_stripe_logs` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `order_id` int(14) NOT NULL,
  `json_result` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mt_stripe_logs
-- ----------------------------

-- ----------------------------
-- Table structure for mt_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `mt_subcategory`;
CREATE TABLE `mt_subcategory` (
  `subcat_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `subcategory_description` text NOT NULL,
  `discount` varchar(20) NOT NULL,
  `sequence` int(14) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'publish',
  `subcategory_name_trans` text NOT NULL,
  `subcategory_description_trans` text NOT NULL,
  PRIMARY KEY (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_subcategory
-- ----------------------------

-- ----------------------------
-- Table structure for mt_subcategory_item
-- ----------------------------
DROP TABLE IF EXISTS `mt_subcategory_item`;
CREATE TABLE `mt_subcategory_item` (
  `sub_item_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `sub_item_name` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` varchar(15) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `sequence` int(14) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `sub_item_name_trans` text NOT NULL,
  `item_description_trans` text NOT NULL,
  PRIMARY KEY (`sub_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_subcategory_item
-- ----------------------------

-- ----------------------------
-- Table structure for mt_voucher
-- ----------------------------
DROP TABLE IF EXISTS `mt_voucher`;
CREATE TABLE `mt_voucher` (
  `voucher_id` int(14) NOT NULL AUTO_INCREMENT,
  `voucher_name` varchar(255) NOT NULL,
  `merchant_id` int(14) NOT NULL,
  `number_of_voucher` int(14) NOT NULL,
  `amount` float NOT NULL,
  `voucher_type` varchar(100) NOT NULL DEFAULT 'fixed amount',
  `status` varchar(100) NOT NULL,
  `date_created` varchar(50) NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for mt_voucher_list
-- ----------------------------
DROP TABLE IF EXISTS `mt_voucher_list`;
CREATE TABLE `mt_voucher_list` (
  `voucher_id` int(14) NOT NULL,
  `voucher_code` varchar(50) NOT NULL,
  `status` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'unused',
  `client_id` int(14) NOT NULL,
  `date_used` varchar(50) NOT NULL,
  `order_id` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_voucher_list
-- ----------------------------

-- ----------------------------
-- Table structure for mt_voucher_new
-- ----------------------------
DROP TABLE IF EXISTS `mt_voucher_new`;
CREATE TABLE `mt_voucher_new` (
  `voucher_id` int(14) NOT NULL AUTO_INCREMENT,
  `voucher_owner` varchar(255) NOT NULL DEFAULT 'merchant',
  `merchant_id` int(14) NOT NULL,
  `joining_merchant` text NOT NULL,
  `voucher_name` varchar(255) NOT NULL,
  `voucher_type` varchar(255) NOT NULL,
  `amount` float(14,4) NOT NULL,
  `expiration` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `used_once` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`voucher_id`),
  KEY `voucher_name` (`voucher_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_voucher_new
-- ----------------------------
INSERT INTO `mt_voucher_new` VALUES ('1', 'admin', '0', '', 'asss', 'fixed amount', '10000.0000', '2016-11-25', 'publish', '2016-11-30 00:59:29', '0000-00-00 00:00:00', '::1', '2');

-- ----------------------------
-- Table structure for mt_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `mt_withdrawal`;
CREATE TABLE `mt_withdrawal` (
  `withdrawal_id` int(14) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(14) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` float(14,4) NOT NULL,
  `current_balance` float(14,4) NOT NULL,
  `balance` float(14,4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `account` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `bank_account_number` varchar(255) NOT NULL,
  `swift_code` varchar(100) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `bank_country` varchar(50) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `viewed` int(2) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_to_process` date NOT NULL,
  `date_process` datetime NOT NULL,
  `api_raw_response` text NOT NULL,
  `withdrawal_token` text NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `bank_type` varchar(255) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`withdrawal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_withdrawal
-- ----------------------------

-- ----------------------------
-- Table structure for mt_zipcode
-- ----------------------------
DROP TABLE IF EXISTS `mt_zipcode`;
CREATE TABLE `mt_zipcode` (
  `zipcode_id` int(14) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(255) NOT NULL,
  `country_code` varchar(5) NOT NULL,
  `city` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `stree_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  PRIMARY KEY (`zipcode_id`),
  KEY `country_code` (`country_code`),
  KEY `area` (`area`),
  KEY `stree_name` (`stree_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_zipcode
-- ----------------------------

-- ----------------------------
-- View structure for mt_view_ratings
-- ----------------------------
DROP VIEW IF EXISTS `mt_view_ratings`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mt_view_ratings` AS select
merchant_id,
SUM(ratings)/COUNT(*) AS ratings
from
mt_rating
group by merchant_id ;


-- ----------------------------
-- View structure for mt_view_merchant
-- ----------------------------
DROP VIEW IF EXISTS `mt_view_merchant`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mt_view_merchant` AS SELECT a.*,
b.option_value as latitude,
c.option_value as lontitude,
d.option_value as delivery_charges,
e.option_value as minimum_order,
f.ratings

FROM
mt_merchant a
left join mt_option b
ON 
a.merchant_id =b.merchant_id 	
and b.option_name='merchant_latitude'

left join mt_option c
ON 
a.merchant_id =c.merchant_id 	
and c.option_name='merchant_longtitude'

left join mt_option d
ON 
a.merchant_id =d.merchant_id 	
and d.option_name='merchant_delivery_charges'

left join mt_option e
ON 
a.merchant_id =e.merchant_id 	
and e.option_name='merchant_minimum_order'

left join mt_view_ratings f
ON 
a.merchant_id =f.merchant_id ;

-- ----------------------------
-- View structure for mt_view_order_details
-- ----------------------------
DROP VIEW IF EXISTS `mt_view_order_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `mt_view_order_details` AS select a.* ,

(
select merchant_id 	
from
mt_order
where
order_id=a.order_id
limit 0,1
) as merchant_id,

(
select status 	
from
mt_order
where
order_id=a.order_id
limit 0,1
) as status,

(
select date_created 	
from
mt_order
where
order_id=a.order_id
limit 0,1
) as date_created


from
mt_order_details a ;