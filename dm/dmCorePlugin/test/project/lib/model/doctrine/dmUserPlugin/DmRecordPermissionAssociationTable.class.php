<?php

/**
 * DmRecordPermissionAssociationTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class DmRecordPermissionAssociationTable extends PluginDmRecordPermissionAssociationTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object DmRecordPermissionAssociationTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DmRecordPermissionAssociation');
    }
}