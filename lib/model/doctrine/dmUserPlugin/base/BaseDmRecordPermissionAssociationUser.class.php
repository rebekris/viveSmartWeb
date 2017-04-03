<?php

/**
 * BaseDmRecordPermissionAssociationUser
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $dm_user_id
 * @property integer $dm_record_permission_association_id
 * @property DmRecordPermissionAssociation $Association
 * @property DmUser $User
 * 
 * @method integer                           getDmUserId()                            Returns the current record's "dm_user_id" value
 * @method integer                           getDmRecordPermissionAssociationId()     Returns the current record's "dm_record_permission_association_id" value
 * @method DmRecordPermissionAssociation     getAssociation()                         Returns the current record's "Association" value
 * @method DmUser                            getUser()                                Returns the current record's "User" value
 * @method DmRecordPermissionAssociationUser setDmUserId()                            Sets the current record's "dm_user_id" value
 * @method DmRecordPermissionAssociationUser setDmRecordPermissionAssociationId()     Sets the current record's "dm_record_permission_association_id" value
 * @method DmRecordPermissionAssociationUser setAssociation()                         Sets the current record's "Association" value
 * @method DmRecordPermissionAssociationUser setUser()                                Sets the current record's "User" value
 * 
 * @package    viveSmart
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmRecordPermissionAssociationUser extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_record_permission_association_user');
        $this->hasColumn('dm_user_id', 'integer', 11, array(
             'type' => 'integer',
             'notnull' => true,
             'length' => 11,
             ));
        $this->hasColumn('dm_record_permission_association_id', 'integer', 11, array(
             'type' => 'integer',
             'notnull' => true,
             'length' => 11,
             ));

        $this->option('symfony', array(
             'form' => false,
             'filter' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmRecordPermissionAssociation as Association', array(
             'local' => 'dm_record_permission_association_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $this->hasOne('DmUser as User', array(
             'local' => 'dm_user_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));
    }
}