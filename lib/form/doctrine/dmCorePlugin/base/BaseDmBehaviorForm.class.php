<?php

/**
 * DmBehavior form base class.
 *
 * @method DmBehavior getObject() Returns the current form's model object
 *
 * @package    viveSmart
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseDmBehaviorForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                               => new sfWidgetFormInputHidden(),
      'dm_behavior_key'                  => new sfWidgetFormInputText(),
      'dm_behavior_attached_to'          => new sfWidgetFormChoice(array('choices' => array('page' => 'page', 'area' => 'area', 'zone' => 'zone', 'widget' => 'widget'))),
      'dm_behavior_attached_to_selector' => new sfWidgetFormInputText(),
      'dm_page_id'                       => new sfWidgetFormDmDoctrineChoice(array('model' => $this->getRelatedModelName('Page'), 'add_empty' => true)),
      'dm_area_id'                       => new sfWidgetFormDmDoctrineChoice(array('model' => $this->getRelatedModelName('Area'), 'add_empty' => true)),
      'dm_zone_id'                       => new sfWidgetFormDmDoctrineChoice(array('model' => $this->getRelatedModelName('Zone'), 'add_empty' => true)),
      'dm_widget_id'                     => new sfWidgetFormDmDoctrineChoice(array('model' => $this->getRelatedModelName('Widget'), 'add_empty' => true)),
      'position'                         => new sfWidgetFormInputText(),
      'updated_at'                       => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                               => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'dm_behavior_key'                  => new sfValidatorString(array('max_length' => 255)),
      'dm_behavior_attached_to'          => new sfValidatorChoice(array('choices' => array(0 => 'page', 1 => 'area', 2 => 'zone', 3 => 'widget'))),
      'dm_behavior_attached_to_selector' => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'dm_page_id'                       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Page'), 'required' => false)),
      'dm_area_id'                       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Area'), 'required' => false)),
      'dm_zone_id'                       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Zone'), 'required' => false)),
      'dm_widget_id'                     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Widget'), 'required' => false)),
      'position'                         => new sfValidatorInteger(array('required' => false)),
      'updated_at'                       => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('dm_behavior[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmBehavior';
  }

}
