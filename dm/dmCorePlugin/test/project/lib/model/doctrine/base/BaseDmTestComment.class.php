<?php

/**
 * BaseDmTestComment
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $post_id
 * @property string $author
 * @property clob $body
 * @property boolean $is_active
 * @property DmTestPost $Post
 * 
 * @method integer       getPostId()    Returns the current record's "post_id" value
 * @method string        getAuthor()    Returns the current record's "author" value
 * @method clob          getBody()      Returns the current record's "body" value
 * @method boolean       getIsActive()  Returns the current record's "is_active" value
 * @method DmTestPost    getPost()      Returns the current record's "Post" value
 * @method DmTestComment setPostId()    Sets the current record's "post_id" value
 * @method DmTestComment setAuthor()    Sets the current record's "author" value
 * @method DmTestComment setBody()      Sets the current record's "body" value
 * @method DmTestComment setIsActive()  Sets the current record's "is_active" value
 * @method DmTestComment setPost()      Sets the current record's "Post" value
 * 
 * @package    retest
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmTestComment extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_test_comment');
        $this->hasColumn('post_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('author', 'string', 255, array(
             'type' => 'string',
             'length' => 255,
             ));
        $this->hasColumn('body', 'clob', null, array(
             'type' => 'clob',
             ));
        $this->hasColumn('is_active', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmTestPost as Post', array(
             'local' => 'post_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $dmversionable0 = new Doctrine_Template_DmVersionable(array(
             'fields' => NULL,
             ));
        $this->actAs($timestampable0);
        $this->actAs($dmversionable0);
    }
}