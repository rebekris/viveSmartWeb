<?php

/**
 * DmGroupTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class DmGroupTable extends PluginDmGroupTable
{
    /**
     * Returns an instance of this class.
     *
     * @return DmGroupTable The table object
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DmGroup');
    }
}