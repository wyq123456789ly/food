<?php
/**
 * Created by PhpStorm.
 * User: Successful
 * Date: 2017-12-28
 * Time: 9:48
 */

namespace Qwadmin\Controller;

use Vendor\Tree;
class PayController extends ComController
{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';




        $new = M('pay');
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

         $pid = isset($_GET['pid']) ? intval($_GET['pid']) : false;

         if ($pid) {
             $paylist = M('pay')->where("id=$pid")->find();

         } else {
             $this->error('参数错误！');
         }

         $this->assign('paylist', $paylist);
         $this->display('form');
     }


    public function update($ajax = '')
    {
        $pid = isset($_POST['pid']) ? intval($_POST['pid']) : false;

        $data['stutas'] = isset($_POST['stutas']) ? intval($_POST['stutas']) : 0;

        $head = I('post.head', '', 'strip_tags');
        $data['pay'] = $head ? $head : '';
        $data['t'] = time();
        if ($pid) {
            $pid=M('pay')->data($data)->add();
        } else {
            M('pay')->data($data)->where("id=$pid")->save();
        }
        $this->success('操作成功！');
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $pids = isset($_REQUEST['pids']) ? $_REQUEST['pids'] : false;
        //uid为1的禁止删除
        if (!$pids) {
            $this->error('参数错误！');
        }
        if (is_array($pids)) {
            foreach ($pids as $k => $v) {
                $uids[$k] = intval($v);
            }
            if (!$pids) {
                $this->error('参数错误！');
                $nids = implode(',', $pids);
            }
        }

        $map['id'] = array('in', $pids);
        if (M('pay')->where($map)->delete()) {
            addlog('删除UID：' . $pids);
            $this->success('恭喜，二维码删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }

}