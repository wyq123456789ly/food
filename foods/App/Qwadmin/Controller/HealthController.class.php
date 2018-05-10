<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/5
 * Time: 11:00
 */
namespace Qwadmin\Controller;
class HealthController extends ComController{
    public function index()
    {
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where = '';

        if ($keyword <> '') {
            if ($field == 'health_title') {
                $where = "{$prefix}health.health_title LIKE '%$keyword%'";
            }


        }


        $new = M('health');
        $list = $new->where($where)->select();
        $pagesize = 15;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $count = $new->count();

        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('page', $page);
        $this->assign('list', $list);

        $this->display();
    }

    public function edit()
    {

        $hid = isset($_GET['hid']) ? intval($_GET['hid']) : false;

        if ($hid) {
            $healthlist = M('health')->where("id='$hid'")->find();

        } else {
            $this->error('参数错误！');
        }

        $this->assign('healthlist', $healthlist);
        $this->display('form');
    }


    public function update($ajax = '')
    {
        $hid = isset($_POST['hid']) ? intval($_POST['hid']) : false;

        $data['health_title'] = isset($_POST['health_title']) ? trim($_POST['health_title']) : '';
        $data['health_content'] = isset($_POST['content']) ? trim($_POST['content']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$hid) {
            $hid = M('health')->data($data)->add();
        } else {
            M('health')->data($data)->where("id=$hid")->save();
        }
        addlog('新增成功!');
        $url = U('health/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $hids = isset($_REQUEST['hids']) ? $_REQUEST['hids'] : false;
        //uid为1的禁止删除
        if (!$hids) {
            $this->error('参数错误！');
        }
        if (is_array($hids)) {
            foreach ($hids as $k => $v) {
                $hids[$k] = intval($v);
            }
            if (!$hids) {
                $this->error('参数错误！');
                $hids = implode(',', $hids);
            }
        }

        $map['id'] = array('in', $hids);
        if (M('health')->where($map)->delete()) {
            addlog('删除UID：' . $hids);
            $this->success('恭喜，没事简介删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}