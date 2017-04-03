<?php

/**
 * BaseDmGroup
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property string $description
 * @property Doctrine_Collection $Users
 * @property Doctrine_Collection $Permissions
 * @property Doctrine_Collection $Records
 * @property Doctrine_Collection $RecordsPermissionsAssociations
 * 
 * @method string              getName()                           Returns the current record's "name" value
 * @method string              getDescription()                    Returns the current record's "description" value
 * @method Doctrine_Collection getUsers()                          Returns the current record's "Users" collection
 * @method Doctrine_Collection getPermissions()                    Returns the current record's "Permissions" collection
 * @method Doctrine_Collection getRecords()                        Returns the current record's "Records" collection
 * @method Doctrine_Collection getRecordsPermissionsAssociations() Returns the current record's "RecordsPermissionsAssociations" collection
 * @method DmGroup             setName()                           Sets the current record's "name" value
 * @method DmGroup             setDescription()                    Sets the current record's "description" value
 * @method DmGroup             setUsers()                          Sets the current record's "Users" collection
 * @method DmGroup             setPermissions()                    Sets the current record's "Permissions" collection
 * @method DmGroup             setRecords()                        Sets the current record's "Records" collection
 * @method DmGroup             setRecordsPermissionsAssociations() Sets the current record's "RecordsPermissionsAssociations" collection
 * 
 * @package    viveSmart
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmGroup extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_group');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'unique' => true,
             'length' => 255,
             ));
        $this->hasColumn('description', 'string', 1000, array(
             'type' => 'string',
             'length' => 1000,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('DmUser as Users', array(
             'refClass' => 'DmUserGroup',
             'local' => 'dm_group_id',
             'foreign' => 'dm_user_id'));

        $this->hasMany('DmPermission as Permissions', array(
             'refClass' => 'DmGroupPermission',
             'local' => 'dm_group_id',
             'foreign' => 'dm_permission_id'));

        $this->hasMany('DmRecordPermission as Records', array(
             'refClass' => 'DmRecordPermissionGroup',
             'local' => 'dm_group_id',
             'foreign' => 'dm_record_permission_id'));

        $this->hasMany('DmRecordPermissionAssociation as RecordsPermissionsAssociations', array(
             'refClass' => 'DmRecordPermissionAssociationGroup',
             'local' => 'dm_group_id',
             'foreign' => 'dm_record_permission_association_id'));

        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}