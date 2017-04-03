<?php

/**
 * dmBitLyUrl filter form base class.
 *
 * @package    viveSmart
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 24171 2009-11-19 16:37:50Z Kris.Wallsmith $
 */
abstract class BasedmBitLyUrlFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {


		if($this->needsWidget('id')){
			$this->setWidget('id', new sfWidgetFormDmFilterInput());
			$this->setValidator('id', new sfValidatorDoctrineChoice(array('required' => false, 'model' => 'dmBitLyUrl', 'column' => 'id')));
		}
		if($this->needsWidget('short')){
			$this->setWidget('short', new sfWidgetFormDmFilterInput());
			$this->setValidator('short', new sfValidatorSchemaFilter('text', new sfValidatorString(array('required' => false))));
		}
		if($this->needsWidget('expanded')){
			$this->setWidget('expanded', new sfWidgetFormDmFilterInput());
			$this->setValidator('expanded', new sfValidatorSchemaFilter('text', new sfValidatorString(array('required' => false))));
		}




    

    $this->widgetSchema->setNameFormat('dm_bit_ly_url_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'dmBitLyUrl';
  }

  public function getFields()
  {
    return array(
      'id'       => 'Number',
      'short'    => 'Text',
      'expanded' => 'Text',
    );
  }
}
