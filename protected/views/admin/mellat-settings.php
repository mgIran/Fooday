<?php
$enabled_mellat=Yii::app()->functions->getOptionAdmin('admin_enabled_mellat');
?>

<div id="error-message-wrapper"></div>

<form class="uk-form uk-form-horizontal forms" id="forms">
<?php echo CHtml::hiddenField('action','saveAdminMellatSettings')?>

<!--<div class="uk-form-row">
  <label class="uk-form-label"><?php echo Yii::t("default","Enabled Mellat?")?></label>
  <?php 
  echo CHtml::checkBox('admin_enabled_mellat',
      $enabled_mellat=="yes"?true:false
  ,array(
    'value'=>"yes",
    'class'=>"icheck"
  ))
  ?> 
</div>-->
  
<div class="uk-form-row">
  <label class="uk-form-label"><?php echo Yii::t("default","Disabled Mellat")?>?</label>
  <?php 
  echo CHtml::checkBox('admin_enabled_mellat',
  Yii::app()->functions->getOptionAdmin('admin_enabled_mellat')=="yes"?true:false
  ,array(
    'value'=>"yes",
    'class'=>"icheck"
  ))
  ?> 
</div>

<div class="uk-form-row">
  <label class="uk-form-label"><?php echo Yii::t("default","Mellat Terminal Num")?></label>
  <?php
  echo CHtml::textField('admin_mellat_terminal_num',
      Yii::app()->functions->getOptionAdmin('admin_mellat_terminal_num')
      ,array(
          'class'=>"uk-form-width-large"
      ))
  ?>
</div>

<div class="uk-form-row">
  <label class="uk-form-label"><?php echo Yii::t("default","Mellat Username")?></label>
  <?php 
  echo CHtml::textField('admin_mellat_username',
  Yii::app()->functions->getOptionAdmin('admin_mellat_username')
  ,array(
    'class'=>"uk-form-width-large"
  ))
  ?>
</div>

<div class="uk-form-row">
  <label class="uk-form-label"><?php echo Yii::t("default","Mellat Password")?></label>
  <?php
  echo CHtml::textField('admin_mellat_password',
      Yii::app()->functions->getOptionAdmin('admin_mellat_password')
      ,array(
          'class'=>"uk-form-width-large"
      ))
  ?>
</div>

<div class="uk-form-row">
<label class="uk-form-label"></label>
<input type="submit" value="<?php echo Yii::t("default","Save")?>" class="uk-button uk-form-width-medium uk-button-success">
</div>

</form>