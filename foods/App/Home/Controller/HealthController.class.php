<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/8
 * Time: 9:45
 */
namespace Home\Controller;
class HealthController extends ComController {
    public function index(){
        $db=M('health');
        $healthlist=$db->select();
        $this->assign('healthlist',$healthlist);
        $this->display();
    }
}