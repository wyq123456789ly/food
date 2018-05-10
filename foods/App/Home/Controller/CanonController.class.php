<?php
/**
 * Created by PhpStorm.
 * User: Successful
 * Date: 2018-04-08
 * Time: 14:09
 */
namespace Home\Controller;
class CanonController extends ComController{
    public function index(){
        $db=M('new');
        $image=$db->select();
        $this->assign('image',$image);
        $this->display();
    }
}