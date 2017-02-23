
<div class="search-wraps single-search">
    <h1 id="brand-name">fooday<small>- Good Day! Good Food! -</small></h1>
  <h2><?php echo $home_search_text;?></h2>
  <p><?php echo $home_search_subtext;?></p>
    
  <form method="GET" class="forms-search" id="forms-search" action="<?php echo Yii::app()->createUrl('store/searcharea')?>">
  <div class="search-input-wraps rounded30">
     <div class="row">
        <div class=" border col-sm-11 col-xs-10">
        <?php echo CHtml::textField('s',$kr_search_adrress,array(
         'placeholder'=>$placholder_search,
         'required'=>true
        ))?>        
        </div>        
        <div class=" relative border col-sm-1 col-xs-2">
          <button type="submit"><i class="ion-ios-search"></i></button>         
        </div>
     </div>
  </div> <!--search-input-wrap-->
  </form>
  <a href="#" class="find-near-restaurant"><i class="icon"></i>رستوران های نزدیک من</a>
</div> <!--search-wrapper-->