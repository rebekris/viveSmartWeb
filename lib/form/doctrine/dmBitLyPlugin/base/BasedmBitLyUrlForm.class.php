<?php

/**
 * dmBitLyUrl form base class.
 *
 * @method dmBitLyUrl getObject() Returns the current form's model object
 *
 * @package    viveSmart
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasedmBitLyUrlForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'       => new sfWidgetFormInputHidden(),
      'short'    => new sfWidgetFormInputText(),
      'expanded' => new sfWidgetFormTextarea(),
    ));

    $this->setValidators(array(
      'id'       => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'short'    => new sfValidatorString(array('max_length' => 32)),
      'expanded' => new sfValidatorString(array('max_length' => 1000)),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'dmBitLyUrl', 'column' => array('short')))
    );

    $this->widgetSchema->setNameFormat('dm_bit_ly_url[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'dmBitLyUrl';
  }

}
