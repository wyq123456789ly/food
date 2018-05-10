<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/8
 * Time: 9:45
 */
namespace Home\Controller;
class CommunityController extends ComController{
    public function index(){
        $db=M('community');
        $communitylist=$db->select();
        $this->assign('communitylist',$communitylist);
        $this->display();
    }
}