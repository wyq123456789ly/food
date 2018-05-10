<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/11
 * Time: 22:37
 */
namespace Qwadmin\Controller;
class MessageController extends ComController{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where='';

        if ($keyword <> '') {
            if ($field == 'entry_name') {
                $where = "{$prefix}Order.entry_name LIKE '%$keyword%'";
            }
        }
        $db=M('message');
        $pagesize = 15;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $count=$db->count();
        $list=$db->where($where)->select();
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('page', $page);
        $this->assign('list',$list);
        $this->display();
    }


    public function edit()
    {

        $mid = isset($_GET['mid']) ? intval($_GET['mid']) : false;

        if ($mid) {
            $message = M('message')->where("id='$mid'")->find();

//            $custorm = M('custorm');
//            $custormlist = $custorm->select();

        } else {
            $this->error('参数错误！');
        }



        $this->assign('message', $message);
        $this->display('form');
    }

    public function update($ajax = '')
    {
        $mid = isset($_POST['mid']) ? intval($_POST['mid']) : false;
        $data['status'] = isset($_POST['status']) ? intval($_POST['status']) : 2;


        if (!$mid) {


        } else {

            M('message')->data($data)->where("id=$mid")->save();

        }
        $this->success('操作成功！');
    }


    public function add()
    {
        $this->display('form');
    }


    public function del()
    {

        $mids = isset($_REQUEST['mids']) ? $_REQUEST['mids'] : false;

        if (is_array($mids)) {
            foreach ($mids as $k => $v) {

                $mids[$k] = intval($v);
            }
            if (!$mids) {
                $this->error('参数错误！');
                $mids = implode(',', $mids);
            }
        }

        $map['mid'] = array('in', $mids);
        if (M('message')->where($map)->delete()) {

            $this->success('恭喜，用户删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}