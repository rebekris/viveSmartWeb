<?php

/**
 * DmBehaviorTranslation form base class.
 *
 * @method DmBehaviorTranslation getObject() Returns the current form's model object
 *
 * @package    viveSmart
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id$
 * @generator  Diem 1.1 RC
 * @gen-file   /home/guena/www/viveSmart/dm/dmCorePlugin/data/generator/dmDoctrineForm/default/template/sfDoctrineFormGeneratedTemplate.php */
abstract class BaseDmBehaviorTranslationForm extends BaseFormDoctrine
{
  public function setup()
  {
    parent::setup();

		//column
		if($this->needsWidget('dm_behavior_enabled')){
			$this->setWidget('dm_behavior_enabled', new sfWidgetFormInputCheckbox());
			$this->setValidator('dm_behavior_enabled', new sfValidatorBoolean(array('required' => false)));
		}
		//column
		if($this->needsWidget('dm_behavior_value')){
			$this->setWidget('dm_behavior_value', new sfWidgetFormTextarea());
			$this->setValidator('dm_behavior_value', new sfValidatorString(array('max_length' => 60000, 'required' => false)));
		}
		//column
		if($this->needsWidget('lang')){
			$this->setWidget('lang', new sfWidgetFormInputHidden());
			$this->setValidator('lang', new sfValidatorChoice(array('choices' => array($this->getObject()->get('lang')), 'empty_value' => $this->getObject()->get('lang'), 'required' => false)));
		}



		//one to one
		if($this->needsWidget('id')){
			$this->setWidget('id', new sfWidgetFormDmDoctrineChoice(array('multiple' => false, 'model' => 'DmBehavior', 'expanded' => false)));
			$this->setValidator('id', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmBehavior', 'required' => false)));
		}




    $this->widgetSchema->setNameFormat('dm_behavior_translation[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }


  protected function doBind(array $values)
  {
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
  }

  public function getModelName()
  {
    return 'DmBehaviorTranslation';
  }

}
