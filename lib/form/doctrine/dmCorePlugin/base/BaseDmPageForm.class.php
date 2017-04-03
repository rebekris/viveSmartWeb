<?php

/**
 * DmPage form base class.
 *
 * @method DmPage getObject() Returns the current form's model object
 *
 * @package    viveSmart
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id$
 * @generator  Diem 1.1 RC
 * @gen-file   /home/guena/www/viveSmart/dm/dmCorePlugin/data/generator/dmDoctrineForm/default/template/sfDoctrineFormGeneratedTemplate.php */
abstract class BaseDmPageForm extends BaseFormDoctrine
{
  public function setup()
  {
    parent::setup();

		//column
		if($this->needsWidget('id')){
			$this->setWidget('id', new sfWidgetFormInputHidden());
			$this->setValidator('id', new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)));
		}
		//column
		if($this->needsWidget('module')){
			$this->setWidget('module', new sfWidgetFormInputText());
			$this->setValidator('module', new sfValidatorString(array('max_length' => 127)));
		}
		//column
		if($this->needsWidget('action')){
			$this->setWidget('action', new sfWidgetFormInputText());
			$this->setValidator('action', new sfValidatorString(array('max_length' => 127)));
		}
		//column
		if($this->needsWidget('record_id')){
			$this->setWidget('record_id', new sfWidgetFormInputText());
			$this->setValidator('record_id', new sfValidatorInteger(array('required' => false)));
		}
		//column
		if($this->needsWidget('credentials')){
			$this->setWidget('credentials', new sfWidgetFormInputText());
			$this->setValidator('credentials', new sfValidatorString(array('max_length' => 255, 'required' => false)));
		}
		//column
		if($this->needsWidget('lft')){
			$this->setWidget('lft', new sfWidgetFormInputText());
			$this->setValidator('lft', new sfValidatorInteger(array('required' => false)));
		}
		//column
		if($this->needsWidget('rgt')){
			$this->setWidget('rgt', new sfWidgetFormInputText());
			$this->setValidator('rgt', new sfValidatorInteger(array('required' => false)));
		}
		//column
		if($this->needsWidget('level')){
			$this->setWidget('level', new sfWidgetFormInputText());
			$this->setValidator('level', new sfValidatorInteger(array('required' => false)));
		}


		//one to many
		if($this->needsWidget('behaviors_list')){
			$this->setWidget('behaviors_list', new sfWidgetFormDmPaginatedDoctrineChoice(array('multiple' => true, 'model' => 'DmBehavior', 'expanded' => true)));
			$this->setValidator('behaviors_list', new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmBehavior', 'required' => false)));
		}





    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'DmPage', 'column' => array('module', 'action', 'record_id')))
    );

    if('embed' == sfConfig::get('dm_i18n_form'))
    {
      $this->embedI18n(sfConfig::get('dm_i18n_cultures'));
    }
    else
    {
      $this->mergeI18nForm();
    }

    $this->widgetSchema->setNameFormat('dm_page[%s]');

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
    return 'DmPage';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['behaviors_list']))
    {
        $this->setDefault('behaviors_list', array_merge((array)$this->getDefault('behaviors_list'),$this->object->Behaviors->getPrimaryKeys()));
    }

    if (isset($this->widgetSchema['translation_list']))
    {
        $this->setDefault('translation_list', array_merge((array)$this->getDefault('translation_list'),$this->object->Translation->getPrimaryKeys()));
    }

  }

  protected function doSave($con = null)
  {
    $this->saveBehaviorsList($con);
    $this->saveTranslationList($con);

    parent::doSave($con);
  }

  public function saveBehaviorsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['behaviors_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Behaviors->getPrimaryKeys();
    $values = $this->getValue('behaviors_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Behaviors', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Behaviors', array_values($link));
    }
  }

  public function saveTranslationList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['translation_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Translation->getPrimaryKeys();
    $values = $this->getValue('translation_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Translation', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Translation', array_values($link));
    }
  }

}
