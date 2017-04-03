<?php

/**
 * BaseDmMediaFolder
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $rel_path
 * @property Doctrine_Collection $Medias
 * 
 * @method string              getRelPath()  Returns the current record's "rel_path" value
 * @method Doctrine_Collection getMedias()   Returns the current record's "Medias" collection
 * @method DmMediaFolder       setRelPath()  Sets the current record's "rel_path" value
 * @method DmMediaFolder       setMedias()   Sets the current record's "Medias" collection
 * 
 * @package    viveSmart
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmMediaFolder extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_media_folder');
        $this->hasColumn('rel_path', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'unique' => true,
             'length' => 255,
             ));

        $this->option('symfony', array(
             'filter' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('DmMedia as Medias', array(
             'local' => 'id',
             'foreign' => 'dm_media_folder_id'));

        $nestedset0 = new Doctrine_Template_NestedSet(array(
             ));
        $this->actAs($nestedset0);
    }
}