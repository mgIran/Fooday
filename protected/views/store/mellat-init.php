<?php
$this->renderPartial('/front/banner-receipt',array(
   'h1'=>t("Payment"),
   'sub_text'=>t("")
));

$this->renderPartial('/front/order-progress-bar',array(
   'step'=>4,
   'show_bar'=>true
));

$data='';
$data2='';
$params='';
$error='';
$merchant_id='';
$ok=false;

if ( $data=Yii::app()->functions->getOrder($_GET['id'])){
	$merchant_id=$data['merchant_id'];	
	$json_details=!empty($data['json_details'])?json_decode($data['json_details'],true):false;
	//dump($json_details);
		
	if ( $json_details !=false){
		$p_arams=array( 
		   'merchant_id'=>$data['merchant_id'],
		   'delivery_type'=>$data['trans_type']
		);		
		Yii::app()->functions->displayOrderHTML($p_arams,$json_details,true);
		if ( Yii::app()->functions->code==1){
			$ok=true;
		}
	}	
}

if ( $ok==TRUE){
   $data2=Yii::app()->functions->details['raw'];
   $mellat_con=Yii::app()->functions->getMellatConnection();
    $amount=0;

   if ( !empty($mellat_con['terminal_num']) and !empty($mellat_con['username']) and !empty($mellat_con['password'])){
	   if (is_array($data2) && count($data2)>=1){
	   	   $x=0;	   	   
	   	   foreach ($data2['item'] as $val) {   	      
	   	      $params['L_NAME'.$x]=isIsset($val['item_name']);
	          $params['L_NUMBER'.$x]=isset($val['item_id'])?$val['item_id']:"";
	          $params['L_DESC'.$x]='';
	          $params['L_AMT'.$x]=isIsset( normalPrettyPrice($val['discounted_price']) );
	          $params['L_QTY'.$x]=isIsset($val['qty']);
               $amount+=isIsset($val['qty'])*isIsset( normalPrettyPrice($val['discounted_price']) );
	          
	          if (is_array($val['sub_item']) && count($val['sub_item'])>=1){
	          	  foreach ($val['sub_item'] as $cat_id=>$val_sub) {
	          	  	$x++;          	  	
	          	  	$params['L_NAME'.$x]=isIsset($val_sub['addon_name']);
	                $params['L_NUMBER'.$x]='';
	                $params['L_DESC'.$x]='';
	                $params['L_AMT'.$x]=isIsset(  normalPrettyPrice($val_sub['addon_price']) );
	                $params['L_QTY'.$x]=isIsset($val_sub['addon_qty']);
                      $amount+=isIsset($val_sub['addon_qty'])*isIsset(  normalPrettyPrice($val_sub['addon_price']) );
	          	  }
	          }          
	   	      $x++;
	   	   }
	   	   	   	   
	   	   if (isset($_SESSION['voucher_code'])){
	   	   	   if (is_array($_SESSION['voucher_code'])){
	   	   	       $less_voucher=$_SESSION['less_voucher'];	   	   	       
	   	   	       $params['L_NAME'.$x]=Yii::t("default","Less Voucher");  	  	  
	  	  	       $params['L_AMT'.$x]="-".normalPrettyPrice($less_voucher);
	  	  	       $params['L_QTY'.$x]=1;	  	  	       
	  	  	       $x++;
                   $amount-=normalPrettyPrice($less_voucher);
	   	   	   }
	   	   }
	   	   
	   	   $data2['total']['delivery_charges']=isIsset($data2['total']['delivery_charges']);
	   	   $data2['total']['tax']=isIsset($data2['total']['tax']);
	   	   
	   	   if ($data2['total']['delivery_charges']>0){
		   	   $params['L_NAME'.$x]=Yii::t("default","Delivery Charges");  	  	  
	  	  	   $params['L_AMT'.$x]=isIsset(  normalPrettyPrice($data2['total']['delivery_charges']) );
	  	  	   $params['L_QTY'.$x]=1;
	  	  	   $x++;
               $amount+=isIsset(  normalPrettyPrice($data2['total']['delivery_charges']) );
		   }
		   
	   	   if ($data2['total']['taxable_total']>0){
		  	   $params['L_NAME'.$x]=Yii::t("default","TAX");  	  	  
	  	  	   $params['L_AMT'.$x]=isIsset( normalPrettyPrice($data2['total']['taxable_total']) );
	  	  	   $params['L_QTY'.$x]=1;
               $amount+=isIsset( normalPrettyPrice($data2['total']['taxable_total']) );
		   }
		   
		   if ($data2['total']['merchant_packaging_charge']>0){		   	
		   	   $x++;
		  	   $params['L_NAME'.$x]=Yii::t("default","Packaging");  	  	  
	  	  	   $params['L_AMT'.$x]=isIsset( normalPrettyPrice($data2['total']['merchant_packaging_charge']) );
	  	  	   $params['L_QTY'.$x]=1;
               $amount+=isIsset( normalPrettyPrice($data2['total']['merchant_packaging_charge']) );
		   }
		   		   
		   if ($data2['total']['discounted_amount']>0){		   	
		   	   $x++;
		  	   $params['L_NAME'.$x]=Yii::t("default","Discount");  	  	  
	  	  	   $params['L_AMT'.$x]="-".isIsset( normalPrettyPrice($data2['total']['discounted_amount']) );
	  	  	   $params['L_QTY'.$x]=1;
               $amount-=isIsset( normalPrettyPrice($data2['total']['discounted_amount']) );
		   }		
		   		   
		   /** add tips */
		   if ($data['cart_tip_value']>=0.1){
		   	   $x++;
		  	   $params['L_NAME'.$x]=Yii::t("default","Tip");  	  	  
	  	  	   $params['L_AMT'.$x]=isIsset( normalPrettyPrice($data['cart_tip_value']) );
	  	  	   $params['L_QTY'.$x]=1;
	  	  	   $data2['total']['total']+=$data['cart_tip_value'];
               $amount+=isIsset( normalPrettyPrice($data['cart_tip_value']) );
		   }
		   
		   /*POINTS PROGRAM*/
		   if (FunctionsV3::hasModuleAddon("pointsprogram")){
			   if (isset($_SESSION['pts_redeem_amt'])){
			   	  if ($_SESSION['pts_redeem_amt']>0){
				   	  $x++;
				  	  $params['L_NAME'.$x]=t("Points Discount");
			  	  	  $params['L_AMT'.$x]="-".isIsset( normalPrettyPrice($_SESSION['pts_redeem_amt']));
			  	  	  $params['L_QTY'.$x]=1;
                      $amount-=isIsset( normalPrettyPrice($_SESSION['pts_redeem_amt']));
			   	  }
			   }
		   }
		   	   	   
		   $params['AMT']=isIsset(  normalPrettyPrice($data2['total']['total']) );
		   $params['RETURNURL']="http://".$_SERVER['HTTP_HOST'].Yii::app()->request->baseUrl."/store/mellatVerify";
		   $params['CANCELURL']="http://".$_SERVER['HTTP_HOST'].Yii::app()->request->baseUrl."/store/PaymentOption";	  	  
		   $params['NOSHIPPING']='1';
	       $params['LANDINGPAGE']='Billing';
	       $params['SOLUTIONTYPE']='Sole';
	       $params['CURRENCYCODE']=Yii::app()->functions->adminCurrencyCode();
	       
	       
	       /** add card fee */
	       if ( Yii::app()->functions->isMerchantCommission($merchant_id)){
	       	   $card_fee=Yii::app()->functions->getOptionAdmin('admin_paypal_fee');
	       } else $card_fee=Yii::app()->functions->getOption('merchant_paypal_fee',$merchant_id);	       	       
	       
	       if (!empty($card_fee) && $card_fee>=0.1){
	       	   $x++;
			   $params['L_NAME'.$x]=t("Card Fee");						
			   $params['L_DESC'.$x]=t("Card Fee");
			   $params['L_AMT'.$x]=normalPrettyPrice($card_fee);
	           $params['L_QTY'.$x]=1;					
			   $params['AMT']=$params['AMT']+$card_fee;
	       }
	       
	       /*dump($params);
	       die();*/

           /*
            * در صورت وجود مشکل در مبلغ تراکنش ارسال شده به درگاه فایل paypal-init.php در پوشه views بررسی شود.
            * قبل از ارسال اطلاعات به paypal فیلدی تحت عنوان $params['AMT'] وجود دارد
            * */

           $transaction=new Transactions();
           $transaction->amount=$amount;
           $transaction->date=time();
           $transaction->status='unpaid';
           $transaction->order_id=$_GET['id'];
           $transaction->save();
           $CallbackURL = "http://".$_SERVER['HTTP_HOST'].Yii::app()->request->baseUrl."/store/mellatVerify";
           $result = Yii::app()->mellat->PayRequest($amount, $transaction->id, $CallbackURL);
           if (!$result['error']) {
               $transaction->setScenario('update');
               $transaction->ref_id=$result['responseCode'];
               $transaction->save();

               $ref_id = $result['responseCode'];
               $this->render('ext.mellatPayment.views._redirect', array('ReferenceId' => $result['responseCode']));
           } else
               $error=Yii::app()->mellat->getResponseText($result['responseCode']);
	   }
   } else $error=Yii::t("default","Mellat Credential not yet been set.");
}
?>

<div class="sections section-grey2 section-orangeform">
  <div class="container">  
    <div class="row top30">
       <div class="inner">
          <h1><?php echo t("Pay using Mellat")?></h1>
          <div class="box-grey rounded">	
          
          <?php if ( !empty($error)):?>
           <p class="text-danger"><?php echo $error;?></p>  
          <?php else :?> 
           <p><?php echo t("Please wait while we redirect you to mellat.")?></p>
          <?php endif;?>
               
          </div> <!--box-->
       </div> <!--inner-->
    </div> <!--row-->
  </div> <!--container-->
</div><!-- sections-->
