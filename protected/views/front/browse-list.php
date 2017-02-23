<div class="row">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
    <?php echo CHtml::beginForm();?>
    <div class="filter-container">
        <h5>مرتب کردن بر اساس</h5>
        <ul>
            <li>
                <?php echo CHtml::checkBox("Filter[with-discounts]", isset($_POST['Filter']['with-discounts']), array("id"=>"with-discounts", "onclick"=>"$(this).parents('form').submit();"));?>
                <?php echo CHtml::label(t("With discounts"), "with-discounts");?>
            </li>
            <li>
                <?php echo CHtml::checkBox("Filter[newest]", isset($_POST['Filter']['newest']), array("id"=>"newest", "onclick"=>"$(this).parents('form').submit();"));?>
                <?php echo CHtml::label(t("Newest"), "newest");?>
            </li>
            <li>
                <?php echo CHtml::checkBox("Filter[max-rate]", isset($_POST['Filter']['max-rate']), array("id"=>"max-rate", "onclick"=>"$(this).parents('form').submit();"));?>
                <?php echo CHtml::label(t("Max Rate"), "max-rate");?>
            </li>
<!--            <li>-->
<!--                --><?php //echo CHtml::checkBox("with-vegetarian-meal", isset($_POST['with-vegetarian-meal']), array("id"=>"with-vegetarian-meal", "onclick"=>"$(this).parents('form').submit();"));?>
<!--                --><?php //echo CHtml::label(t("With Vegetarian Meal"), "with-vegetarian-meal");?>
<!--            </li>-->
        </ul>
    </div>
    <div class="filter-container">
        <h5>نوع غذا</h5>
        <ul>
            <?php foreach(Yii::app()->functions->Cuisine(true) as $id=>$cuisine):?>
                <?php $cuisineName=strtolower(preg_replace(array('/[^a-z0-9]/i', '/[-]+/') , '-', $cuisine));?>
                <li>
                    <?php echo CHtml::checkBox("Filter[type][$cuisineName]", isset($_POST['Filter']['type'][$cuisineName]), array("value"=>$id, "id"=>$cuisineName, "onclick"=>"$(this).parents('form').submit();"));?>
                    <?php echo CHtml::label(t($cuisine), $cuisineName);?>
                </li>
            <?php endforeach;?>
        </ul>
    </div>
    <?php echo CHtml::endForm();?>
</div>
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 result-merchant infinite-container row" id="restuarant-list">
    <?php foreach ($list['list'] as $val):?>
    <?php
    $merchant_id=$val['merchant_id'];
    $ratings=Yii::app()->functions->getRatings($merchant_id);
    $merchant_delivery_distance=getOption($merchant_id,'merchant_delivery_miles');
    $distance_type='';

    /*fallback*/
    if ( empty($val['latitude'])){
        if ($lat_res=Yii::app()->functions->geodecodeAddress($val['merchant_address'])){
            $val['latitude']=$lat_res['lat'];
            $val['lontitude']=$lat_res['long'];
        }
    }
    ?>
    <div class="infinite-item col-lg-4 col-md-4 col-sm-4 col-xs-12">
       <div class="inner">

       <?php if ( $val['is_sponsored']==2):?>
           <div class="ribbon"><span>Sponsored</span></div>
        <?php endif;?>

        <?php if ($offer=FunctionsV3::getOffersByMerchant($merchant_id)):?>
           <div class="ribbon-offer"><span><?php echo $offer;?></span></div>
        <?php endif;?>

         <div class="">
            <div class="borderx">

             <div class="borderx">
                 <div class="borderx ">
                   <!--<a href="<?php echo Yii::app()->createUrl('store/menu/merchant/'.$val['restaurant_slug'])?>">-->
                   <a href="<?php echo Yii::app()->createUrl("/menu-". trim($val['restaurant_slug']))?>">
                    <img class="logo-small"src="<?php echo FunctionsV3::getMerchantLogo($merchant_id);?>">
                   </a>
    <!--		       <div class="top10">--><?php //echo FunctionsV3::displayServicesList($val['service'])?><!--</div>		               -->

    <!--		       <div class="top10">-->
    <!--		         --><?php //FunctionsV3::displayCashAvailable($merchant_id)?>
    <!--		       </div>-->

                 </div> <!--col-->
                 <div class="borderx">

                     <h2><?php echo clearString($val['restaurant_name'])?></h2>

                     <div class="mytable">
                         <div class="mycol">
                            <div class="rating-stars text-center" data-score="<?php echo $ratings['ratings']?>"></div>
                         </div>
    <!--                     <div class="mycol">-->
    <!--                        <p>--><?php //echo $ratings['votes']." ".t("Reviews")?><!--</p>-->
    <!--                     </div>-->
    <!--                     <div class="mycol">-->
    <!--                        --><?php //echo FunctionsV3::merchantOpenTag($merchant_id)?>
    <!--                     </div>-->
                     </div> <!--mytable-->

                  <p class="cuisine bold">
                  <?php echo FunctionsV3::displayCuisine($val['cuisine']);?>
                  </p>

                     <p class="merchant-address concat-text"><?php echo $val['merchant_address']?></p>

    <!--              <p>--><?php //echo t("Minimum Order").": ".FunctionsV3::prettyPrice($val['minimum_order'])?><!--</p>-->
    <!--              -->
    <!--              --><?php //if($val['service']!=3):?>
    <!--              <p>--><?php //echo t("Delivery Est")?><!--: --><?php //echo FunctionsV3::getDeliveryEstimation($merchant_id)?><!--</p>-->
    <!--              --><?php //endif;?>
    <!--              -->
    <!--              <p>-->
    <!--		        --><?php //
    //		        if($val['service']!=3){
    //			        if (!empty($merchant_delivery_distance)){
    //			        	echo t("Delivery Distance").": ".$merchant_delivery_distance." $distance_type";
    //			        } else echo  t("Delivery Distance").": ".t("not available");
    //		        }
    //		        ?>
    <!--		       </p>-->

    <!--		       --><?php //if($val['service']!=3):?>
    <!--		        <p class="top15">--><?php //echo FunctionsV3::getFreeDeliveryTag($merchant_id)?><!--</p>-->
    <!--		       --><?php //endif;?>

                    <a href="<?php echo Yii::app()->createUrl("/menu-". trim($val['restaurant_slug']))?>"
                    class="orange-button rounded3 medium bottom10 inline-block">
                    <?php echo t("View menu")?>
                    </a>

                 </div> <!--col-->
             </div> <!--row-->

            </div> <!--col-->

            <!--MAP-->
    <!--        <div class="col-md-6 with-padleft" >
              <div class="browse-list-map active"
                    data-lat="<?php //echo $val['latitude']?>" data-long="<?php //echo $val['lontitude']?>">

              </div> <!--browse-list-map-->
    <!--        </div> <!--col-->

         </div> <!--row-->
       </div> <!--inner-->
    </div> <!--infinite-item-->
    <?php endforeach;?>
    </div> <!--result-merchant-->

    <div class="search-result-loader">
        <i></i>
        <p><?php echo t("Loading more restaurant...")?></p>
     </div> <!--search-result-loader-->

    <?php
    if (isset($cuisine_page)){
        //$page_link=Yii::app()->createUrl('store/cuisine/'.$category.'/?');
        $page_link=Yii::app()->createUrl('store/cuisine/?category='.urlencode($_GET['category']));
    } else $page_link=Yii::app()->createUrl('store/browse/?tab='.$tabs);

     echo CHtml::hiddenField('current_page_url',$page_link);
     require_once('pagination.class.php');
     $attributes                 =   array();
     $attributes['wrapper']      =   array('id'=>'pagination','class'=>'pagination');
     $options                    =   array();
     $options['attributes']      =   $attributes;
     $options['items_per_page']  =   FunctionsV3::getPerPage();
     $options['maxpages']        =   1;
     $options['jumpers']=false;
     $options['link_url']=$page_link.'&page=##ID##';
     $pagination =   new pagination( $list['total'] ,((isset($_GET['page'])) ? $_GET['page']:1),$options);
     $data   =   $pagination->render();
     ?>
</div>