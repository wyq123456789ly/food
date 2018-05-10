<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/6
 * Time: 22:03
 */
namespace Home\Controller;
class FoodsController extends ComController{
    public function index(){
        $db=M('foods');
        $foodslist=$db->select();
        $this->assign('foodslist',$foodslist);
        $this->display();
    }
}