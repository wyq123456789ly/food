<?php
/**
 * Created by PhpStorm.
 * User: Successful
 * Date: 2017-12-28
 * Time: 9:48
 */

namespace Qwadmin\Controller;

use Vendor\Tree;
class NewController extends ComController
{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';
        $new = M('new');
        $list=$new->select();
        $pagesize = 15;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $count = $new->count();

        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('page', $page);
        $this->assign('list',$list);

        $this->display();
    }

    public function edit()
     {

         $nid = isset($_GET['nid']) ? intval($_GET['nid']) : false;

         if ($nid) {
             $newlist = M('new')->where("id='$nid'")->find();

         } else {
             $this->error('参数错误！');
         }

         $this->assign('newlist', $newlist);
         $this->display('form');
     }


    public function update($ajax='')
    {
        $nid = isset($_POST['nid']) ? intval($_POST['nid']) : false;

        $data['path'] = isset($_POST['path']) ? trim($_POST['path']) : '';
        $data['miaoshu_one'] = isset($_POST['miaoshu_one']) ? trim($_POST['miaoshu_one']) : '';
        $data['miaoshu_two'] = isset($_POST['miaoshu_two']) ? trim($_POST['miaoshu_two']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$nid) {
            $nid=M('new')->data($data)->add();
        } else {
            M('new')->data($data)->where("id=$nid")->save();
        }
        addlog('新增成功!');
        $url = U('New/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $nids = isset($_REQUEST['nids']) ? $_REQUEST['nids'] : false;
        //uid为1的禁止删除
        if (!$nids) {
            $this->error('参数错误！');
        }
        if (is_array($nids)) {
            foreach ($nids as $k => $v) {
                $uids[$k] = intval($v);
            }
            if (!$nids) {
                $this->error('参数错误！');
                $nids = implode(',', $nids);
            }
        }

        $map['id'] = array('in', $nids);
        if (M('new')->where($map)->delete()) {
            addlog('删除UID：' . $nids);
            $this->success('恭喜，广告删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }

}