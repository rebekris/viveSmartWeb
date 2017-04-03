<?php

/**
 * BaseDmUserPermission
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $dm_user_id
 * @property integer $dm_permission_id
 * @property DmUser $User
 * @property DmPermission $Permission
 * 
 * @method integer          getDmUserId()         Returns the current record's "dm_user_id" value
 * @method integer          getDmPermissionId()   Returns the current record's "dm_permission_id" value
 * @method DmUser           getUser()             Returns the current record's "User" value
 * @method DmPermission     getPermission()       Returns the current record's "Permission" value
 * @method DmUserPermission setDmUserId()         Sets the current record's "dm_user_id" value
 * @method DmUserPermission setDmPermissionId()   Sets the current record's "dm_permission_id" value
 * @method DmUserPermission setUser()             Sets the current record's "User" value
 * @method DmUserPermission setPermission()       Sets the current record's "Permission" value
 * 
 * @package    retest
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmUserPermission extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_user_permission');
        $this->hasColumn('dm_user_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));
        $this->hasColumn('dm_permission_id', 'integer', null, array(
             'type' => 'integer',
             'primary' => true,
             ));

        $this->option('symfony', array(
             'form' => false,
             'filter' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmUser as User', array(
             'local' => 'dm_user_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $this->hasOne('DmPermission as Permission', array(
             'local' => 'dm_permission_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));
    }
}