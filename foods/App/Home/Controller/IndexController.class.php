<?php
namespace Home\Controller;

class IndexController extends ComController
{
    public function index()
    {


        $db=M('new');
        $image=$db->select();
        $this->assign('image',$image);
        $this->display('index');
        $db=M('sift');
        $siftlist=$db->order('id desc')->limit('3')->select();
        $this->assign('siftlist',$siftlist);
    }

}