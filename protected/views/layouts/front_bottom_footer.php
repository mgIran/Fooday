<?/*
<?php if ( getOptionA('disabled_subscription') == ""):?>
<form method="POST" id="frm-subscribe" class="frm-subscribe" onsubmit="return false;">
<?php echo CHtml::hiddenField('action','subscribeNewsletter')?>
<div class="sections section-subcribe">
  <div class="container">
      <h2><?php echo t("Subscribe to our newsletter") ?></h2>
      <div class="subscribe-footer">
          <div class="row border">
             <div class="col-md-3 border col-md-offset-4 ">
               <?php echo CHtml::textField('subscriber_email','',array(
                 'placeholder'=>t("E-mail"),
                 'required'=>true,
                 'class'=>"email"
               ))?>
             </div>
             <div class="col-md-2 border">
               <button class="green-button rounded">
                <?php echo t("Subscribe")?>
               </button>               
             </div>
          </div>
      </div>
  </div>
  

<img src="<?php echo assetsURL()."/images/divider.png"?>" class="footer-divider">
  
</div> <!--section-browse-resto-->
</form>
<?php endif;?>


<div class="sections section-footer">
  <div class="container">
      <div class="row">
         <div class="col-md-4 ">
         <?php FunctionsV3::getFooterAddress();?>
         
        <?php 
        if ($show_language<>1){
        	if ( $theme_lang_pos=="bottom" || $theme_lang_pos==""){
		        echo CHtml::dropDownList('language-options','',
		         (array)FunctionsV3::getLanguage()
		         ,array(
		         'class'=>"language-options selectpicker",
		         'title'=>t("Select language")
		        ));
        	}
        }
        ?>
         
         </div> <!--col-->
         
         
         <div class="col-md-3 border">
           <?php if ($theme_hide_footer_section1!=2):?>
           <h3><?php echo t("Menu")?></h3>
          
           <?php if (is_array($menu) && count($menu)>=1):?>
           <?php foreach ($menu as $val):?>
           <li>
             <a 
               href="<?php echo FunctionsV3::customPageUrl($val)?>" <?php FunctionsV3::openAsNewTab($val)?> >
              <?php echo $val['page_name']?></a>
           </li>
           <?php endforeach;?>
           <?php endif;?>
           
           <?php endif;?>
         </div> <!--col-->
                  
         <div class="col-md-3 border">
         <?php if ($theme_hide_footer_section2!=2):?>
         <h3><?php echo t("Others")?></h3>
         
           <?php if (is_array($others_menu) && count($others_menu)>=1):?>
           <?php foreach ($others_menu as $val):?>
           <li>
             <a 
               href="<?php echo FunctionsV3::customPageUrl($val)?>" <?php FunctionsV3::openAsNewTab($val)?> >
              <?php echo $val['page_name']?></a>
           </li>
           <?php endforeach;?>
           <?php endif;?>
         
         <?php endif;?>  
         </div> <!--col-->
         
         <?php if ($social_flag<>1):?>
         <div class="col-md-2 border">
         <h3><?php echo t("Connect with us")?></h3>
         
         <div class="mytable social-wrap">
           <?php if (!empty($google_page)):?>
           <div class="mycol border">
             <a target="_blank" href="<?php echo FunctionsV3::prettyUrl($google_page)?>"><i class="ion-social-googleplus"></i></a>
           </div> <!--col-->
           <?php endif;?>
           
           <?php if (!empty($twitter_page)):?>
           <div class="mycol border">
             <a target="_blank" href="<?php echo FunctionsV3::prettyUrl($twitter_page)?>"><i class="ion-social-twitter"></i></a>
           </div> <!--col-->
           <?php endif;?>
           
           <?php if (!empty($fb_page)):?>
           <div class="mycol border">
            <a target="_blank" href="<?php echo FunctionsV3::prettyUrl($fb_page)?>"><i class="ion-social-facebook"></i></a>
           </div> <!--col-->
           <?php endif;?>
           
           
           <?php if (!empty($intagram_page)):?>
           <div class="mycol border">
            <a target="_blank" href="<?php echo FunctionsV3::prettyUrl($intagram_page)?>"><i class="ion-social-instagram"></i></a>
           </div> <!--col-->
           <?php endif;?>
           
           <?php if (!empty($youtube_url)):?>
           <div class="mycol border">
            <a target="_blank" href="<?php echo FunctionsV3::prettyUrl($youtube_url)?>"><i class="ion-social-youtube-outline"></i></a>
           </div> <!--col-->
           <?php endif;?>
           
         </div> <!--social wrap-->
         
         </div> <!--col-->
         <?php endif;?>
         
      </div> <!--row-->
  </div> <!--container-->
</div> <!--section-footer-->*/?>




<!-- Foter -->
<footer class="small-section bg-gray-lighter footer pb-60">
    <div class="container">

        <div class="row mb-40 align-right">

            <div class="col-sm-12">
                <div class="row">

                    <!-- Phone -->
                    <div class="col-sm-6 col-lg-3 pt-20 pb-20 pb-xs-0">
                        <div class="contact-item">
                            <div class="ci-icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="ci-title font-alt">شماره تماس پشتیبانی سفارش</div>
                            <div class="ci-text"><?php echo getOptionA('website_contact_phone');?></div>
                        </div>
                    </div>
                    <!-- End Phone -->

                    <!-- Email -->
                    <div class="col-sm-6 col-lg-3 pt-20 pb-20 pb-xs-0">
                        <div class="contact-item">
                            <div class="ci-icon">
                                <i class="fa fa-envelope"></i>
                            </div>
                            <div class="ci-title font-alt">ایمیل</div>
                            <div class="ci-text">
                                <a href="mailto:hi@fooday.ir"><?php echo getOptionA('website_contact_email');?></a>
                            </div>
                        </div>
                    </div>
                    <!-- End Email -->

                    <!-- Address -->
                    <div class="col-sm-6 col-lg-3 pt-20 pb-20 pb-xs-0">
                        <div class="contact-item">
                            <div class="ci-icon">
                                <i class="fa fa-map-marker"></i>
                            </div>
                            <div class="ci-title font-alt">آدرس</div>
                            <div class="ci-text"><?php echo getOptionA('website_address');?></div>
                        </div>
                    </div>
                    <!-- End Address -->

                    <!-- Opening Time -->
                    <div class="col-sm-6 col-lg-3 pt-20 pb-20 pb-xs-0">
                        <div class="contact-item">
                            <div class="ci-icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <div class="ci-title font-alt">ساعات کاری</div>
                            <div class="ci-text">هر روز از ساعت ۸ الی ۲۴</div>
                        </div>
                    </div>
                    <!-- End Opening Time -->

                </div>
            </div>

        </div>

        <!-- Divider -->
        <hr class="mt-0 mb-60 " />
        <!-- End Divider -->

        <?php if ($social_flag<>1):?>
        <!-- Social Links -->
        <div class="footer-social-links mb-30">
            <?php if (!empty($google_page)):?>
                <a href="<?php echo FunctionsV3::prettyUrl($google_page)?>" title="Google" target="_blank"><i class="fa fa-google"></i></a>
            <?php endif;?>

            <?php if (!empty($twitter_page)):?>
                <a href="<?php echo FunctionsV3::prettyUrl($twitter_page)?>" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
            <?php endif;?>

            <?php if (!empty($fb_page)):?>
                <a href="<?php echo FunctionsV3::prettyUrl($fb_page)?>" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
            <?php endif;?>

            <?php if (!empty($intagram_page)):?>
                <a href="<?php echo FunctionsV3::prettyUrl($intagram_page)?>" title="Instagram" target="_blank"><i class="fa fa-instagram"></i></a>
            <?php endif;?>

            <?php if (!empty($youtube_url)):?>
                <a href="<?php echo FunctionsV3::prettyUrl($youtube_url)?>" title="Youtube" target="_blank"><i class="fa fa-youtube"></i></a>
            <?php endif;?>
        </div>
        <!-- End Social Links -->
        <?php endif;?>

        <!-- Footer Text -->
        <div class="footer-text">

            <!-- Copyright -->
            <div class="footer-copy font-alt">
                <a href="#" target="_blank">ریتم ۲۰۱۷</a>
            </div>
            <!-- End Copyright -->

            <div class="footer-made">
                ساخته شده با هنر و تکنولوژی جهانی
            </div>

        </div>
        <!-- End Footer Text -->

    </div>

    <!-- Top Link -->
    <div class="local-scroll">
        <a href="#top" class="link-to-top"><i class="fa fa-caret-up"></i></a>
    </div>
    <!-- End Top Link -->

</footer>
<!-- End Foter -->