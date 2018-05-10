<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/8
 * Time: 9:18
 */
namespace Home\Controller;
class MenusController extends ComController{
    public function index(){
        $db=M('menus');
        $menuslist=$db->select();
        $this->assign('menuslist',$menuslist);
        $this->display();
    }
}