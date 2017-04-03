<?php

/**
 * BaseDmRecordPermissionAssociation
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $dm_secure_action
 * @property string $dm_secure_module
 * @property string $dm_secure_model
 * @property Doctrine_Collection $Groups
 * @property Doctrine_Collection $Users
 * 
 * @method string                        getDmSecureAction()   Returns the current record's "dm_secure_action" value
 * @method string                        getDmSecureModule()   Returns the current record's "dm_secure_module" value
 * @method string                        getDmSecureModel()    Returns the current record's "dm_secure_model" value
 * @method Doctrine_Collection           getGroups()           Returns the current record's "Groups" collection
 * @method Doctrine_Collection           getUsers()            Returns the current record's "Users" collection
 * @method DmRecordPermissionAssociation setDmSecureAction()   Sets the current record's "dm_secure_action" value
 * @method DmRecordPermissionAssociation setDmSecureModule()   Sets the current record's "dm_secure_module" value
 * @method DmRecordPermissionAssociation setDmSecureModel()    Sets the current record's "dm_secure_model" value
 * @method DmRecordPermissionAssociation setGroups()           Sets the current record's "Groups" collection
 * @method DmRecordPermissionAssociation setUsers()            Sets the current record's "Users" collection
 * 
 * @package    viveSmart
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmRecordPermissionAssociation extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_record_permission_association');
        $this->hasColumn('dm_secure_action', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('dm_secure_module', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('dm_secure_model', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('DmGroup as Groups', array(
             'refClass' => 'DmRecordPermissionAssociationGroup',
             'local' => 'dm_record_permission_association_id',
             'foreign' => 'dm_group_id'));

        $this->hasMany('DmUser as Users', array(
             'refClass' => 'DmRecordPermissionAssociationUser',
             'local' => 'dm_record_permission_association_id',
             'foreign' => 'dm_user_id'));
    }
}