<?/*
<div class="top-menu-wrapper <?php echo "top-".$action;?>">

<div class="container border" >
  <div class="col-md-3 col-xs-3 border col-a">
    <?php if ( $theme_hide_logo<>2):?>
    <a href="<?php echo Yii::app()->createUrl('/store/home')?>">
     <img src="<?php echo FunctionsV3::getDesktopLogo();?>" class="logo logo-desktop">
     <img src="<?php echo FunctionsV3::getMobileLogo();?>" class="logo logo-mobile">
    </a>
    <?php endif;?>
  </div>

  <div class="col-xs-1 menu-nav-mobile border relative">
     <a href="#"><i class="ion-android-menu"></i></a>
  </div> <!--menu-nav-mobile-->

  <?php if ( Yii::app()->controller->action->id =="menu"):?>
  <div class="col-xs-1 cart-mobile-handle border relative">
      <div class="badge cart_count"></div>
     <a href="javascript:;">
       <i class="ion-ios-cart"></i>
     </a>
  </div> <!--cart-mobile-handle-->
  <?php endif;?>


  <div class="col-md-9 border col-b">
    <?php $this->widget('zii.widgets.CMenu', FunctionsV3::getMenu() );?>
    <div class="clear"></div>
  </div>

</div> <!--container-->

</div> <!--END top-menu-->

<div class="menu-top-menu">
    <?php $this->widget('zii.widgets.CMenu', FunctionsV3::getMenu('mobile-menu') );?>
    <div class="clear"></div>
</div> <!--menu-top-menu-->*/?>



<!-- Navigation panel -->
<nav class="main-nav dark transparent stick-fixed">
    <div class="full-wrapper relative clearfix">
        <!-- Logo ( * your text or image into link tag *) -->
        <?php if ( $theme_hide_logo<>2):?>
        <div class="nav-logo-wrap local-scroll">
            <a href="#top" class="logo">
                <img src="<?php echo FunctionsV3::getDesktopLogo();?>" alt="" />
            </a>
        </div>
        <?php endif;?>
        <div class="mobile-nav">
            <i class="fa fa-bars"></i>
        </div>
        <!-- Main Menu -->
        <div class="inner-nav desktop-nav">
            <?php $menu=FunctionsV3::getMenu(); $menu['htmlOptions']=array('class'=>'clearlist scroll-nav local-scroll');?>
            <?php $this->widget('zii.widgets.CMenu', $menu);?>
<!--            <ul class="clearlist scroll-nav local-scroll">-->
<!--                <li class="active"><a href="#home">خانه</a></li>-->
<!--                <li><a href="#about">درباره ما</a></li>-->
<!--                <li><a href="#menu">ثبت رستوران</a></li>-->
<!--                <li><a href="#location">سوالات متداول</a></li>-->
<!--                <li><a href="#location">تماس با ما</a></li>-->
<!---->
<!--                <!-- Button -->
<!--                <li>-->
<!--                    <a href="/blog" target="_blank"><span class="btn btn-mod btn-circle btn-w">وبلاگ</span></a>-->
<!--                </li>-->
<!--                <!-- End Button -->
<!---->
<!--            </ul>-->



        </div>

        <div class="span-4 left-pane">
            <nav class="menu white-mode" ng-class="{'white-mode': !menuFixed}">

                    <span class="not-link support">
                        <a href="#">
                            <i class="fa fa-lg fa-phone-square"></i>
                            ۸۶۰۳۶۹۲۴ - ۰۲۱

                        </a>
                    </span>
<!--                    <span class="not-link">-->
<!--                        <i class="fa fa-user"></i><a href="#login-modal" data-toggle="modal">ورود</a>-->
<!--                    </span>-->
<!--                <i class="fa fa-dot-circle-o"></i><a href="#signup-modal" data-toggle="modal">ثبت نام</a>-->
            </nav>
        </div>
    </div>
</nav>
<!-- End Navigation panel -->
