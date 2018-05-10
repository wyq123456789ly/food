<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/6
 * Time: 20:18
 */
namespace Home\Controller;
class SiftController extends ComController{
    public function index(){
        $db=M('sift');
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $pagesize = 24;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $count = $db->count();
        $siftlist = $db->order('id desc')->limit($offset . ',' . $pagesize)->select();
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('siftlist', $siftlist);
        $this->assign('page', $page);
        $this->display();
    }
}