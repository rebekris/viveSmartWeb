<?php

require_once '/home/guena/www/viveSmart/dm/dmCorePlugin/lib/core/dm.php';
dm::start();

class ProjectConfiguration extends dmProjectConfiguration
{

  public function setup()
  {
    parent::setup();
    
    $this->enablePlugins(array(
      // add plugins you want to enable here
    ));

    $this->setWebDir(sfConfig::get('sf_root_dir').'/web');
  }
  
}