<?php

/**
 * DmRecordPermissionGroupTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class DmRecordPermissionGroupTable extends PluginDmRecordPermissionGroupTable
{
    /**
     * Returns an instance of this class.
     *
     * @return DmRecordPermissionGroupTable The table object
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DmRecordPermissionGroup');
    }
}