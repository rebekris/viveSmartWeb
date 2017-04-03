<?php

/**
 * DmBehavior filter form base class.
 *
 * @package    viveSmart
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BaseDmBehaviorFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {


		if($this->needsWidget('id')){
			$this->setWidget('id', new sfWidgetFormDmFilterInput());
			$this->setValidator('id', new sfValidatorDoctrineChoice(array('required' => false, 'model' => 'DmBehavior', 'column' => 'id')));
		}
		if($this->needsWidget('dm_behavior_key')){
			$this->setWidget('dm_behavior_key', new sfWidgetFormDmFilterInput());
			$this->setValidator('dm_behavior_key', new sfValidatorSchemaFilter('text', new sfValidatorString(array('required' => false))));
		}
		if($this->needsWidget('dm_behavior_attached_to')){
			$this->setWidget('dm_behavior_attached_to', new sfWidgetFormChoice(array('multiple' => true, 'choices' => array('' => '', 'page' => 'page', 'area' => 'area', 'zone' => 'zone', 'widget' => 'widget'))));
			$this->setValidator('dm_behavior_attached_to', new sfValidatorChoice(array('required' => false, 'multiple' => true , 'choices' => array('page' => 'page', 'area' => 'area', 'zone' => 'zone', 'widget' => 'widget'))));
		}
		if($this->needsWidget('dm_behavior_attached_to_selector')){
			$this->setWidget('dm_behavior_attached_to_selector', new sfWidgetFormDmFilterInput());
			$this->setValidator('dm_behavior_attached_to_selector', new sfValidatorSchemaFilter('text', new sfValidatorString(array('required' => false))));
		}
		if($this->needsWidget('position')){
			$this->setWidget('position', new sfWidgetFormDmFilterInput());
			$this->setValidator('position', new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))));
		}
		if($this->needsWidget('updated_at')){
			$this->setWidget('updated_at', new sfWidgetFormChoice(array('choices' => array(
        ''      => '',
        'today' => $this->getI18n()->__('Today'),
        'week'  => $this->getI18n()->__('Past %number% days', array('%number%' => 7)),
        'month' => $this->getI18n()->__('This month'),
        'year'  => $this->getI18n()->__('This year')
      ))));
			$this->setValidator('updated_at', new sfValidatorChoice(array('required' => false, 'choices' => array_keys($this->widgetSchema['updated_at']->getOption('choices')))));
		}



		if($this->needsWidget('page_list')){
			$this->setWidget('page_list', new sfWidgetFormDoctrineChoice(array('multiple' => false, 'model' => 'DmPage', 'expanded' => false)));
			$this->setValidator('page_list', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmPage', 'required' => true)));
		}
		if($this->needsWidget('area_list')){
			$this->setWidget('area_list', new sfWidgetFormDoctrineChoice(array('multiple' => false, 'model' => 'DmArea', 'expanded' => false)));
			$this->setValidator('area_list', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmArea', 'required' => true)));
		}
		if($this->needsWidget('zone_list')){
			$this->setWidget('zone_list', new sfWidgetFormDoctrineChoice(array('multiple' => false, 'model' => 'DmZone', 'expanded' => false)));
			$this->setValidator('zone_list', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmZone', 'required' => true)));
		}
		if($this->needsWidget('widget_list')){
			$this->setWidget('widget_list', new sfWidgetFormDoctrineChoice(array('multiple' => false, 'model' => 'DmWidget', 'expanded' => false)));
			$this->setValidator('widget_list', new sfValidatorDoctrineChoice(array('multiple' => false, 'model' => 'DmWidget', 'required' => true)));
		}

    
    $this->mergeI18nForm();


    $this->widgetSchema->setNameFormat('dm_behavior_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmBehavior';
  }

  public function getFields()
  {
    return array(
      'id'                               => 'Number',
      'dm_behavior_key'                  => 'Text',
      'dm_behavior_attached_to'          => 'Enum',
      'dm_behavior_attached_to_selector' => 'Text',
      'dm_page_id'                       => 'ForeignKey',
      'dm_area_id'                       => 'ForeignKey',
      'dm_zone_id'                       => 'ForeignKey',
      'dm_widget_id'                     => 'ForeignKey',
      'position'                         => 'Number',
      'updated_at'                       => 'Date',
      'id'                               => 'Number',
      'dm_behavior_enabled'              => 'Boolean',
      'dm_behavior_value'                => 'Text',
      'lang'                             => 'Text',
    );
  }
}
