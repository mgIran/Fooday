<?php
$this->renderPartial('/front/banner-receipt',array(
   'h1'=>t("Payment"),
   'sub_text'=>t("")
));

$this->renderPartial('/front/order-progress-bar',array(
   'step'=>4,
   'show_bar'=>true
));
?>

<div class="sections section-grey2 section-orangeform">
  <div class="container">  
    <div class="row top30">
       <div class="inner">
          <h1><?php echo t("Review your order")?></h1>
          <div class="box-grey rounded">	     

              <?php $model = Transactions::model()->findByAttributes(array('ref_id' => $_POST['RefId']));
              $result = NULL;
              if($_POST['ResCode'] == 0) {
                  $result = Yii::app()->mellat->VerifyRequest($model->order_id, $_POST['SaleOrderId'], $_POST['SaleReferenceId']);
              }
              if($result != NULL) {
                  $RecourceCode = (!is_array($result) ? $result : $result['responseCode']);
                  if($RecourceCode == 0) {
                      $model->status = 'paid';
                      // Settle Payment
                      $settle = Yii::app()->mellat->SettleRequest($model->order_id, $_POST['SaleOrderId'], $_POST['SaleReferenceId']);
                      if($settle) {
                          $model->settle = 1;

                          $command = Yii::app()->db->createCommand();
                          $params=array('status'=>'paid');
                          $command->update('{{order}}' , $params ,
                              'order_id=:order_id' , array(':order_id'=> addslashes($model->order_id) ));

                          /*POINTS PROGRAM*/
                          if (FunctionsV3::hasModuleAddon("pointsprogram")){
                              PointsProgram::updatePoints($this->data['order_id']);
                          }

                          /*Driver app*/
                          if (FunctionsV3::hasModuleAddon("driver")){
                              Yii::app()->setImport(array(
                                  'application.modules.driver.components.*',
                              ));
                              Driver::addToTask($this->data['order_id']);
                          }
                      }
                  }
              } else {
                  $RecourceCode = $_POST['ResCode'];
              }
              $model->res_code = $RecourceCode;
              $model->sale_reference_id = $_POST['SaleReferenceId'];
              $model->update();
              ?>

           <?php if ($_POST['ResCode'] == 0):?>
                    <?php $order_id=$model->order_id;?>
                   <?php if ( $data=Yii::app()->functions->getOrder($order_id)):?>
                   <?php 
                    $merchant_id=$data['merchant_id'];
					$json_details=!empty($data['json_details'])?json_decode($data['json_details'],true):false;					
                    ?>
                    <?php if ( $json_details !=false):?>
                    
                    <?php 
                    Yii::app()->functions->displayOrderHTML(array(
			       'merchant_id'=>$data['merchant_id'],
			       'order_id'=>$order_id,
			       'delivery_type'=>$data['trans_type'],
			       'delivery_charge'=>$data['delivery_charge'],
			       'packaging'=>$data['packaging'],
			       'cart_tip_value'=>$data['cart_tip_value'],
				   'cart_tip_percentage'=>$data['cart_tip_percentage'],
				   'card_fee'=>$data['card_fee']
				    ),$json_details,true,$order_id);
					
					$data2=Yii::app()->functions->details;
                    ?>      

                    <div class="row top10">
                      <div class="col-md-4 border" ><?php echo t("Order Id")?></div>
                      <div class="col-md-8 border" ><?php echo $model->order_id?></div>
                    </div>

                    <div class="row top10">
                      <div class="col-md-4 border" ><?php echo t("Transaction Status")?></div>
                      <div class="col-md-8 border" ><?php echo $model->res_code == 0?'موفق':'نا موفق' ?></div>
                    </div>
                    
                    <div class="row top10">
                      <div class="col-md-4 border" ><?php echo t("Tracking Code")?></div>
                      <div class="col-md-8 border" ><?php echo $model->sale_reference_id?$model->sale_reference_id:$model->ref_id?></div>
                    </div>
                    
                    <div class="top10">
                    <?php echo $data2['html'];?>                                       
                    </div>
                    
                    <form method="POST" id="forms" class="forms" onsubmit="return false;">				
					<input type="hidden" name="token" value="<?php echo $_GET['token']?>">
					<input type="hidden" name="payerid" value="<?php echo $res_paypal['PAYERID']?>">
					<input type="hidden" name="amount" value="<?php echo $res_paypal['AMT']?>">
					<?php echo CHtml::hiddenField('action','paypalCheckoutPayment')?>
					<?php echo CHtml::hiddenField('currentController','store')?>
					<input type="hidden" name="order_id" value="<?php echo $order_id;?>">
					
					<div class="top10">
					<input type="submit" value="<?php echo t("Pay Now")?>" class="paypal_paynow black-button medium inline">
					</div>					
					</form>
					                    
                    <?php endif;?>
                   <?php else :?>
                     <p class="text-danger"><?php echo t("ERROR: Cannot get order details.")?></p>
                   <?php endif;?>
           <?php else :?>
               <p class="text-danger"><?php echo Yii::app()->mellat->getResponseText($model->res_code);?></p>
           <?php endif;?>
          
          </div> <!--box-->
       </div> <!--inner-->
    </div> <!--row-->
  </div> <!--container-->
</div><!-- sections-->
