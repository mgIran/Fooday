<?/*<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<head>

<!-- IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title><?php echo CHtml::encode($this->pageTitle); ?></title>
<link rel="shortcut icon" href="<?php echo  Yii::app()->request->baseUrl; ?>/favicon.ico?ver=1.1" />
<?php
/*add the analytic codes */
/*Widgets::analyticsCode();
?>
</head>
<body>*/?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Roman Kirichik">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <title><?php echo CHtml::encode($this->pageTitle); ?></title>
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

    <!-- Favicons -->
    <link rel="shortcut icon" href="<?php echo  Yii::app()->request->baseUrl; ?>/favicon.ico?ver=1.1">
    <link rel="apple-touch-icon" href="<?php echo  Yii::app()->request->baseUrl; ?>/assets/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo  Yii::app()->request->baseUrl; ?>/assets/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo  Yii::app()->request->baseUrl; ?>/assets/images/apple-touch-icon-114x114.png">

    <?php
    /*add the analytic codes */
    Widgets::analyticsCode();
    ?>
</head>

<body class="appear-animate">