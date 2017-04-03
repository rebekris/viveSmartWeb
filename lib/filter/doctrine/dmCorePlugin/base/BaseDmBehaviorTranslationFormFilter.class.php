<?php

/**
 * DmBehaviorTranslation filter form base class.
 *
 * @package    viveSmart
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseDmBehaviorTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {


		if($this->needsWidget('dm_behavior_enabled')){
			$this->setWidget('dm_behavior_enabled', new sfWidgetFormChoice(array('choices' => array('' => $this->getI18n()->__('yes or no', array(), 'dm'), 1 => $this->getI18n()->__('yes', array(), 'dm'), 0 => $this->getI18n()->__('no', array(), 'dm')))));
			$this->setValidator('dm_behavior_enabled', new sfValidatorChoice(array('required' => false, 'choices' => array(0, 1))));
		}
		if($this->needsWidget('dm_behavior_value')){
			$this->setWidget('dm_behavior_value', new sfWidgetFormDmFilterInput());
			$this->setValidator('dm_behavior_value', new sfValidatorSchemaFilter('text', new sfValidatorString(array('required' => false))));
		}
		if($this->needsWidget('lang')){
			$this->setWidget('lang', new sfWidgetFormDmFilterInput());
			$this->setValidator('lang', new sfValidatorDoctrineChoice(array('required' => false, 'model' => 'DmBehaviorTranslation', 'column' => 'lang')));
		}



		if($this->needsWidget('dm_behavior_list')){
			$this->setWidget('dm_behavior_list', new sfWidgetFormDoctrineChoice(array('multiple' => false, 'model' => 'DmBehavior', 'expanded' => false)));
			$this->setValidator('dm_behavior_list', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmBehavior', 'required' => true)));
		}

    

    $this->widgetSchema->setNameFormat('dm_behavior_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmBehaviorTranslation';
  }

  public function getFields()
  {
    return array(
      'id'                  => 'Number',
      'dm_behavior_enabled' => 'Boolean',
      'dm_behavior_value'   => 'Text',
      'lang'                => 'Text',
    );
  }
}
