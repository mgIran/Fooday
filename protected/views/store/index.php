<?php/*
$kr_search_adrress = FunctionsV3::getSessionAddress();

$home_search_text=Yii::app()->functions->getOptionAdmin('home_search_text');
if (empty($home_search_text)){
	$home_search_text=Yii::t("default","Find restaurants near you");
}

$home_search_subtext=Yii::app()->functions->getOptionAdmin('home_search_subtext');
if (empty($home_search_subtext)){
	$home_search_subtext=Yii::t("default","Order Delivery Food Online From Local Restaurants");
}

$home_search_mode=Yii::app()->functions->getOptionAdmin('home_search_mode');
$placholder_search=Yii::t("default","Street Address,City,State");
if ( $home_search_mode=="postcode" ){
	$placholder_search=Yii::t("default","Enter your postcode");
}
$placholder_search=Yii::t("default",$placholder_search);
?>

<img class="mobile-home-banner" src="<?php echo assetsURL()."/images/banner.jpg"?>">

<div id="parallax-wrap" class="parallax-container parallax-home" 
data-parallax="scroll" data-position="top" data-bleed="10" 
data-image-src="<?php echo assetsURL()."/images/banner.jpg"?>">

<?php 
if ( $home_search_mode=="address" || $home_search_mode=="") { 
	if ( $enabled_advance_search=="yes"){
		$this->renderPartial('/front/advance_search',array(
		  'home_search_text'=>$home_search_text,
		  'kr_search_adrress'=>$kr_search_adrress,
		  'placholder_search'=>$placholder_search,
		  'home_search_subtext'=>$home_search_subtext,
		  'theme_search_merchant_name'=>getOptionA('theme_search_merchant_name'),
		  'theme_search_street_name'=>getOptionA('theme_search_street_name'),
		  'theme_search_cuisine'=>getOptionA('theme_search_cuisine'),
		  'theme_search_foodname'=>getOptionA('theme_search_foodname'),
		  'theme_search_merchant_address'=>getOptionA('theme_search_merchant_address'),
		));
	} else $this->renderPartial('/front/single_search',array(
	      'home_search_text'=>$home_search_text,
		  'kr_search_adrress'=>$kr_search_adrress,
		  'placholder_search'=>$placholder_search,
		  'home_search_subtext'=>$home_search_subtext
	));
} else {
	$this->renderPartial('/front/search_postcode',array(
	      'home_search_text'=>$home_search_text,
		  'placholder_search'=>$placholder_search,
		  'home_search_subtext'=>t("Enter your post code")
	));
}
?>

</div> <!--parallax-container-->

<?php if ($theme_hide_how_works<>2):?>
<!--HOW IT WORKS SECTIONS-->
<div class="sections section-how-it-works">
<div class="container">
 <h2><?php echo t("How it works")?></h2>
 <p class="center"><?php echo t("Get your favourite food in 4 simple steps")?></p>
 
 <div class="row">
   <div class="col-md-3 col-sm-3 center">
      <div class="steps step1-icon">
        <img src="<?php echo assetsURL()."/images/step1.png"?>">
      </div>
      <h3><?php echo t("Search")?></h3>
      <p><?php echo t("Find all restaurants available near you")?></p>
   </div>
   <div class="col-md-3 col-sm-3 center">
      <div class="steps step2-icon">
         <img src="<?php echo assetsURL()."/images/step2.png"?>">
      </div>
      <h3><?php echo t("Choose")?></h3>
      <p><?php echo t("Browse hundreds of menus to find the food you like")?></p>
   </div>
   <div class="col-md-3 col-sm-3  center">
      <div class="steps step2-icon">
        <img src="<?php echo assetsURL()."/images/step3.png"?>">
      </div>
      <h3><?php echo t("Pay")?></h3>
      <p><?php echo t("It's quick, secure and easy")?></p>
   </div>
   <div class="col-md-3 col-sm-3  center">
     <div class="steps step2-icon">
       <img src="<?php echo assetsURL()."/images/step4.png"?>">
     </div>
      <h3><?php echo t("Enjoy")?></h3>
      <p><?php echo t("Food is prepared & delivered to your door")?></p>
   </div>   
 </div>

 </div> <!--container-->
</div> <!--section-how-it-works-->
<?php endif;?>


<!--FEATURED RESTAURANT SECIONS-->
<?php if ($disabled_featured_merchant==""):?>
<?php if ( getOptionA('disabled_featured_merchant')!="yes"):?>
<?php if ($res=Yii::app()->functions->getFeatureMerchant2()):?>
<div class="sections section-feature-resto">
<div class="container">


  <h2><?php echo t("Featured Restaurants")?></h2>
  
  <div class="row">
  <?php foreach ($res as $val): //dump($val);?>
  <?php $address= $val['street']." ".$val['city'];
        $address.=" ".$val['state']." ".$val['post_code'];
        
        $ratings=Yii::app()->functions->getRatings($val['merchant_id']);
  ?>   
  
    <!--<a href="<?php echo Yii::app()->createUrl('/store/menu/merchant/'. trim($val['restaurant_slug']) )?>">-->
    <a href="<?php echo Yii::app()->createUrl("/menu-". trim($val['restaurant_slug']))?>">
    <div class="col-md-5 border-light ">
    
        <div class="col-md-3 col-sm-3">
           <img class="logo-small" src="<?php echo FunctionsV3::getMerchantLogo($val['merchant_id']);?>">
        </div> <!--col-->
        
        <div class="col-md-9 col-sm-9">
        
          <div class="row">
              <div class="col-sm-5">
		          <div class="rating-stars" data-score="<?php echo $ratings['ratings']?>"></div>   
	          </div>
	          <div class="col-sm-2 merchantopentag">
	          <?php echo FunctionsV3::merchantOpenTag($val['merchant_id'])?>   
	          </div>
          </div>
          
          <h4 class="concat-text"><?php echo clearString($val['restaurant_name'])?></h4>
          
          <p class="concat-text">
          <?php //echo wordwrap(FunctionsV3::displayCuisine($val['cuisine']),50,"<br />\n");?>
          <?php echo FunctionsV3::displayCuisine($val['cuisine']);?>
          </p>
          <p class="concat-text"><?php echo $address?></p>                             
          <?php echo FunctionsV3::displayServicesList($val['service'])?>          
        </div> <!--col-->
        
    </div> <!--col-6-->
    </a>
    <div class="col-md-1"></div>
      
  <?php endforeach;?>
  </div> <!--end row-->

  
</div> <!--container-->
</div>
<?php endif;?>
<?php endif;?>
<?php endif;?>
<!--END FEATURED RESTAURANT SECIONS-->


<?php if ($theme_hide_cuisine<>2):?>
<!--CUISINE SECTIONS-->
<?php if ( $list=FunctionsV3::getCuisine() ): ?>
<div class="sections section-cuisine">
<div class="container  nopad">

<div class="col-md-3 nopad">
<img src="<?php echo assetsURL()."/images/cuisine.png"?>" class="img-cuisine">
</div>

<div class="col-md-9  nopad">

  <h2><?php echo t("Browse by cuisine")?></h2>
  <p class="sub-text center"><?php echo t("choose from your favorite cuisine")?></p>
  
  <div class="row">
    <?php $x=1;?>
    <?php foreach ($list as $val): ?>
    <div class="col-md-4 col-sm-4 indent-5percent nopad">
      <a href="<?php echo Yii::app()->createUrl('/store/cuisine',array("category"=>$val['cuisine_id']))?>" 
     class="<?php echo ($x%2)?"even":'odd'?>">
      <?php 
      $cuisine_json['cuisine_name_trans']=!empty($val['cuisine_name_trans'])?json_decode($val['cuisine_name_trans'],true):'';	 
      echo qTranslate($val['cuisine_name'],'cuisine_name',$cuisine_json);
      if($val['total']>0){
      	echo "<span>(".$val['total'].")</span>";
      }
      ?>
      </a>
    </div>   
    <?php $x++;?>
    <?php endforeach;?>
  </div> 

</div>
  
</div> <!--container-->
</div> <!--section-cuisine-->
<?php endif;?>
<?php endif;?>


<?php if ($theme_show_app==2):?>
<!--MOBILE APP SECTION-->
<div id="mobile-app-sections" class="container">
<div class="container-medium">
  <div class="row">
     <div class="col-xs-5 into-row border app-image-wrap">
       <img class="app-phone" src="<?php echo assetsURL()."/images/getapp-2.jpg"?>">
     </div> <!--col-->
     <div class="col-xs-7 into-row border">
       <h2><?php echo getOptionA('website_title')." ".t("in your mobile")?>! </h2>
       <h3 class="green-text"><?php echo t("Get our app, it's the fastest way to order food on the go")?>.</h3>
       
       <div class="row border" id="getapp-wrap">
       <?php if(!empty($theme_app_ios) && $theme_app_ios!="http://"):?>
         <div class="col-xs-4 border">                      
           <a href="<?php echo $theme_app_ios?>" target="_blank">
           <img class="get-app" src="<?php echo assetsURL()."/images/get-app-store.png"?>">
           </a>           
         </div>
         <?php endif;?>
         
         <?php if(!empty($theme_app_android) && $theme_app_android!="http://"):?>
         <div class="col-xs-4 border">
           <a href="<?php echo $theme_app_android?>" target="_blank">
             <img class="get-app" src="<?php echo assetsURL()."/images/get-google-play.png"?>">
           </a>
         </div>
         <?php endif;?>
         
       </div> <!--row-->
       
     </div> <!--col-->
  </div> <!--row-->
  </div> <!--container-medium-->
  
  <div class="mytable border" id="getapp-wrap2">
     <?php if(!empty($theme_app_ios) && $theme_app_ios!="http://"):?>
     <div class="mycol border">
           <a href="<?php echo $theme_app_ios?>" target="_blank">
           <img class="get-app" src="<?php echo assetsURL()."/images/get-app-store.png"?>">
           </a>
     </div> <!--col-->
     <?php endif;?>
     <?php if(!empty($theme_app_android) && $theme_app_android!="http://"):?>
     <div class="mycol border">
          <a href="<?php echo $theme_app_android?>" target="_blank">
             <img class="get-app" src="<?php echo assetsURL()."/images/get-google-play.png"?>">
           </a>
     </div> <!--col-->
     <?php endif;?>
  </div> <!--mytable-->
  
  
</div> <!--container-->
<!--END MOBILE APP SECTION-->
<?php endif;*/?>












<?php
$kr_search_adrress = FunctionsV3::getSessionAddress();

$home_search_text=Yii::app()->functions->getOptionAdmin('home_search_text');
if (empty($home_search_text)){
$home_search_text=Yii::t("default","Find restaurants near you");
}

$home_search_subtext=Yii::app()->functions->getOptionAdmin('home_search_subtext');
if (empty($home_search_subtext)){
$home_search_subtext=Yii::t("default","Order Delivery Food Online From Local Restaurants");
}

$home_search_mode=Yii::app()->functions->getOptionAdmin('home_search_mode');
$placholder_search=Yii::t("default","Street Address,City,State");
if ( $home_search_mode=="postcode" ){
$placholder_search=Yii::t("default","Enter your postcode");
}
$placholder_search=Yii::t("default",$placholder_search);
?>
<!-- Home Section -->
<section class="home-section bg-dark bg-dark-alfa-30" data-background="<?php echo assetsURL()."/images/banner.jpg"?>" id="home">
    <div class="js-height-full container">

        <!-- Hero Content -->
        <div class="home-content">
            <div class="row">
                <?php
                if ( $home_search_mode=="address" || $home_search_mode=="") {
                    if ($enabled_advance_search == "yes") {
                        $this->renderPartial('/front/advance_search', array(
                            'home_search_text' => $home_search_text,
                            'kr_search_adrress' => $kr_search_adrress,
                            'placholder_search' => $placholder_search,
                            'home_search_subtext' => $home_search_subtext,
                            'theme_search_merchant_name' => getOptionA('theme_search_merchant_name'),
                            'theme_search_street_name' => getOptionA('theme_search_street_name'),
                            'theme_search_cuisine' => getOptionA('theme_search_cuisine'),
                            'theme_search_foodname' => getOptionA('theme_search_foodname'),
                            'theme_search_merchant_address' => getOptionA('theme_search_merchant_address'),
                        ));
                    } else $this->renderPartial('/front/single_search', array(
                        'home_search_text' => $home_search_text,
                        'kr_search_adrress' => $kr_search_adrress,
                        'placholder_search' => $placholder_search,
                        'home_search_subtext' => $home_search_subtext
                    ));
                } else {
                    $this->renderPartial('/front/search_postcode', array(
                        'home_search_text' => $home_search_text,
                        'placholder_search' => $placholder_search,
                        'home_search_subtext' => t("Enter your post code")
                    ));
                }
                ?>
            </div>
            <!-- End Hero Content -->

            <!-- Scroll Down -->
            <div class="local-scroll">
                <a href="#about" class="scroll-down"><i class="fa fa-angle-down scroll-down-icon"></i></a>
            </div>
            <!-- End Scroll Down -->

        </div>
</section>
<!-- End Home Section -->

<?php if ($theme_hide_how_works<>2):?>
<!-- Process Section -->
<section class="page-section padding-sm">
    <div class="container relative">

        <!-- Features Grid -->
        <div class="row alt-features-grid">

            <!-- Text Item -->
            <div class="col-sm-3">
                <div class="alt-features-item align-center">
                    <div class="alt-features-descr align-right">
                        <h4 class="bottommargin-sm font-alt"><?php echo t("How it works")?></h4>
                        <?php echo t("Get your favourite food in 4 simple steps")?>
                    </div>
                </div>
            </div>
            <!-- End Text Item -->

            <div class="col-sm-9">
                <!-- Features Item -->
                <div class="col-sm-3">
                    <div class="alt-features-item align-center">
                        <div class="alt-features-icon">
                            <span class="icon-search"></span>
                        </div>
                        <h3 class="alt-features-title font-alt"><?php echo t("Search")?><small><?php echo t("Find all restaurants available near you")?></small></h3>
                    </div>
                </div>
                <!-- End Features Item -->

                <!-- Features Item -->
                <div class="col-sm-3">
                    <div class="alt-features-item align-center">
                        <div class="alt-features-icon">
                            <span class="icon-browser"></span>
                        </div>
                        <h3 class="alt-features-title font-alt"><?php echo t("Choose")?><small><?php echo t("Browse hundreds of menus to find the food you like")?></small></h3>
                    </div>
                </div>
                <!-- End Features Item -->

                <!-- Features Item -->
                <div class="col-sm-3">
                    <div class="alt-features-item align-center">
                        <div class="alt-features-icon">
                            <span class="icon-wallet"></span>
                        </div>
                        <h3 class="alt-features-title font-alt"><?php echo t("Pay")?><small><?php echo t("It's quick, secure and easy")?></small></h3>
                    </div>
                </div>
                <!-- End Features Item -->

                <!-- Features Item -->
                <div class="col-sm-3">
                    <div class="alt-features-item align-center">
                        <div class="alt-features-icon">
                            <span class="icon-heart"></span>
                        </div>
                        <h3 class="alt-features-title font-alt"><?php echo t("Enjoy")?><small><?php echo t("Food is prepared & delivered to your door")?></small></h3>
                    </div>
                </div>
                <!-- End Features Item -->
            </div>

        </div>
        <!-- End Features Grid -->

    </div>
</section>
<!-- End Process Section -->
<?php endif;?>

<div class="white_bg">
    <div class="container margin_60">

        <div class="main_title">
            <h2 class="nomargin_top">انتخاب از بین محبوب ترین ها</h2>
            <p>
                از بین محبوب ترین  رستوران ها، غذای مورد علاقه خود را پیدا کنید
            </p>
        </div>

        <div class="row">
            <div class="col-md-6">
                <a href="detail_page.html" class="strip_list">
                    <div class="ribbon_1">Popular</div>
                    <div class="desc">
                        <div class="thumb_strip">
                            <img src="http://www.ansonika.com/quickfood/img/thumb_restaurant.jpg" alt="">
                        </div>
                        <div class="rating">
                            <i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw"></i></i>
                        </div>
                        <h3>قرمه سبزی</h3>
                        <div class="type">
                            ایرانی / سنتی
                        </div>
                        <div class="location">
                            بلوار هاشمیه٬هاشمیه ۲۷ <span class="opening">شروع کار از ساعت ۷:۰۰</span>
                        </div>
                        <ul>
                            <li>آماده سفارش<i class="fa fa-fw ok"></i></li>
                            <li>ارسال غذا<i class="fa fa-fw ok"></i></li>
                        </ul>
                    </div>
                    <!-- End desc-->
                </a>
                <!-- End strip_list-->
                <a href="detail_page.html" class="strip_list">
                    <div class="ribbon_1">Popular</div>
                    <div class="desc">
                        <div class="thumb_strip">
                            <img src="http://www.ansonika.com/quickfood/img/thumb_restaurant_2.jpg" alt="">
                        </div>
                        <div class="rating">
                            <i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw"></i></i>
                        </div>
                        <h3>قرمه سبزی</h3>
                        <div class="type">
                            ایرانی / سنتی
                        </div>
                        <div class="location">
                            بلوار هاشمیه٬هاشمیه ۲۷ <span class="opening">شروع کار از ساعت ۷:۰۰</span>
                        </div>
                        <ul>
                            <li>آماده سفارش<i class="fa fa-fw ok"></i></li>
                            <li>ارسال غذا<i class="fa fa-fw ok"></i></li>
                        </ul>
                    </div>
                    <!-- End desc-->
                </a>
                <!-- End strip_list-->

            </div>
            <!-- End col-md-6-->
            <div class="col-md-6">
                <a href="detail_page.html" class="strip_list">
                    <div class="ribbon_1">Popular</div>
                    <div class="desc">
                        <div class="thumb_strip">
                            <img src="http://www.ansonika.com/quickfood/img/thumb_restaurant_4.jpg" alt="">
                        </div>
                        <div class="rating">
                            <i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw"></i></i>
                        </div>
                        <h3>قرمه سبزی</h3>
                        <div class="type">
                            ایرانی / سنتی
                        </div>
                        <div class="location">
                            بلوار هاشمیه٬هاشمیه ۲۷ <span class="opening">شروع کار از ساعت ۷:۰۰</span>
                        </div>
                        <ul>
                            <li>آماده سفارش<i class="fa fa-fw ok"></i></li>
                            <li>ارسال غذا<i class="fa fa-fw ok"></i></li>
                        </ul>
                    </div>
                    <!-- End desc-->
                </a>
                <!-- End strip_list-->
                <a href="detail_page.html" class="strip_list">
                    <div class="ribbon_1">Popular</div>
                    <div class="desc">
                        <div class="thumb_strip">
                            <img src="http://www.ansonika.com/quickfood/img/thumb_restaurant_5.jpg" alt="">
                        </div>
                        <div class="rating">
                            <i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw voted"></i></i><i class="fa fa-fw"></i></i>
                        </div>
                        <h3>قرمه سبزی</h3>
                        <div class="type">
                            ایرانی / سنتی
                        </div>
                        <div class="location">
                            بلوار هاشمیه٬هاشمیه ۲۷ <span class="opening">شروع کار از ساعت ۷:۰۰</span>
                        </div>
                        <ul>
                            <li>آماده سفارش<i class="fa fa-fw ok"></i></li>
                            <li>ارسال غذا<i class="fa fa-fw ok"></i></li>
                        </ul>
                    </div>
                    <!-- End desc-->
                </a>
                <!-- End strip_list-->

            </div>
        </div>
        <!-- End row -->

    </div>
    <!-- End container -->
</div>
<!-- End white_bg -->

<!-- Call Action Section -->
<section class="page-section bottommargin-sm bg-dark bg-dark-alfa-50" data-background="<?php echo assetsURL()."/images/full-width-images/section-bg-2.jpg"?>">
    <div class="container relative">

        <div class="align-center">
            <h3 class="banner-heading font-alt mb-40">از غذاها و کیفیت سرویس سفارش آنلاین لذت ببرید</h3>
            <div class="local-scroll">
                <a href="<?php echo Yii::app()->createUrl('browse');?>" class="btn btn-mod btn-w btn-medium btn-round">مشاهده تمام رستوران ها</a>
            </div>
        </div>

    </div>
</section>
<!-- End Call Action Section -->



<section>
    <div id="cbx-special" class="cbx-special">
        <div class="cbx-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="cbx-heading">
                            <h2>
                                <span class="watermark">ویژه</span>
                                <span class="heading">غذاهای</span>
                            </h2>
                        </div>
                    </div>
                    <!--//.col-->
                </div>
                <!--//.main row-->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="special-area">
                            <div class="special-single special-one">
                                <figure>
                                    <a href="#"><img src="<?php echo assetsURL()."/rtl/images/food/t1.jpg"?>" alt="special food"></a>
                                    <figcaption>
                                        <div class="speacial-info">
                                            <h4 class="subtitle">غذای ایتالیایی</h4>
                                            <h3 class="title"><a href="#">دوبل برگر ایتالیایی</a></h3>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                            <div class="special-single special-two ">
                                <figure>
                                    <a href="#"><img src="<?php echo assetsURL()."/rtl/images/food/t2.jpg"?>" alt="special food"></a>
                                    <figcaption>
                                        <div class="speacial-info">
                                            <h4 class="subtitle">غذای ایتالیایی</h4>
                                            <h3 class="title"><a href="#">دوبل برگر ایتالیایی</a></h3>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                            <div class="special-single special-three">
                                <figure>
                                    <a href="#"><img src="<?php echo assetsURL()."/rtl/images/food/t3.jpg"?>" alt="special food"></a>
                                    <figcaption>
                                        <div class="speacial-info">
                                            <h4 class="subtitle">غذای ایتالیایی</h4>
                                            <h3 class="title"><a href="#">دوبل برگر ایتالیایی</a></h3>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                            <div class="special-single special-four">
                                <figure>
                                    <a href="#"><img src="<?php echo assetsURL()."/rtl/images/food/t4.jpg"?>" alt="special food"></a>
                                    <figcaption>
                                        <div class="speacial-info">
                                            <h4 class="subtitle">غذای ایتالیایی</h4>
                                            <h3 class="title"><a href="#">دوبل برگر ایتالیایی</a></h3>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                            <div class="special-single special-five">
                                <figure>
                                    <a href="#"><img src="<?php echo assetsURL()."/rtl/images/food/t5.jpg"?>" alt="special food"></a>
                                    <figcaption>
                                        <div class="speacial-info">
                                            <h4 class="subtitle">غذای ایتالیایی</h4>
                                            <h3 class="title"><a href="#">دوبل برگر ایتالیایی</a></h3>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>
                    </div>
                    <!--//.col-->
                </div>
                <!--//.main row-->
            </div>
            <!--//.container-->
        </div>
        <!--//.cbx-inner-->
    </div>
    <!--//.cbx-header-->
</section>

<div class="testimonial-section container-fluid no-padding ">
    <div class="section-padding"></div>
    <!-- Container -->
    <div class="container">
        <!-- Main Carousel -->

        <div id="main-carousel1" class="carousel slide carousel-fade" data-ride="carousel">
            <div role="listbox" class="carousel-inner">
                <div class="item active">
                    <div class="testimonial-content">
                        <img src="http://premiumlayers.net/demo/html/pizzakitchen/images/testi-author.jpg" alt="testi-author" width="160" height="170">
                        <div class="testi-box">
                            <p>
                                لورم ایپسوم یا طرح‌نما عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید،</p>
                            <h3>علی خرامان</h3>
                            <h5>طراح رابط کاربری</h5>
                            <span><i class="fa fa-quote-left" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#main-carousel1" role="button" data-slide="prev">
                    <i class="fa fa-angle-left" aria-hidden="true"></i>
                </a>
                <a class="right carousel-control" href="#main-carousel1" role="button" data-slide="next">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                </a>

            </div>
        </div>
        <!-- Main Carousel /-  -->
    </div>
    <!-- Container /- -->
    <div class="section-padding"></div>
</div>

<section class="page-section bg-dark bg-dark-alfa-50" data-background="<?php echo assetsURL()."/images/dish.jpg"?>">
    <div class="container relative">

        <div class="col-sm-6">

            <div class="mt-140 mt-lg-80 mb-140 mb-lg-80">
                <div class="banner-content">
                    <h3 class="banner-heading font-alt">به دنبال دسترسی راحت تری هستید؟</h3>
                    <div class="banner-decription">
                        لورم ایپسوم یا طرح‌نما به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود. طراح گرافیک از این متن به عنوان عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید                                </div>
                    <div class="local-scroll">
                        <a href="#contact" class="btn btn-mod btn-w btn-medium btn-round">شروع گفتگو</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-sm-6 banner-image wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
            <img src="<?php echo assetsURL()."images/iphone.png"?>" alt="">
        </div>

    </div>

    </div>
</section>

<?php if ( getOptionA('disabled_subscription') == ""):?>
    <section class="small-section bg-gray-lighter">
        <div class="container relative">

            <form method="POST" id="frm-subscribe" class="form align-center frm-subscribe" onsubmit="return false;" novalidate="true">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">

                        <div class="newsletter-label font-alt"><?php echo t("Subscribe to our newsletter") ?></div>

                        <div class="mb-20">
                            <?php echo CHtml::textField('subscriber_email','',array(
                                'placeholder'=>t("E-mail"),
                                'required'=>true,
                                'pattern'=>'.{5,100}',
                                'class'=>"newsletter-field form-control input-md round mb-xs-10 email"
                            ))?>

                            <button type="submit" class="btn btn-mod btn-medium btn-round mb-xs-10"><?php echo t("Subscribe")?></button>
                        </div>

                        <div class="form-tip">
                            <i class="fa fa-info-circle"></i> مطمئن باشید ما برای شما اسپم ارسال نمیکنیم
                        </div>

                        <div id="subscribe-result"></div>

                    </div>
                </div>
            </form>

        </div>
    </section>
<?php endif;?>





<!-- Google Map -->
<section class="page-section pt-0 pb-0" id="location">
    <div class="google-map">
        <div data-address="ایران٬تهران٬تهران" id="map-canvas"></div>
    </div>
</section>
<!-- End Google Map -->