<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/5
 * Time: 10:47
 */
namespace Qwadmin\Controller;
class MenusController extends ComController
{
    public function index()
    {
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where = '';

        if ($keyword <> '') {
            if ($field == 'menus_title') {
                $where = "{$prefix}menus.menus_title LIKE '%$keyword%'";
            }


        }


        $new = M('menus');
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

        $mid = isset($_GET['mid']) ? intval($_GET['mid']) : false;

        if ($mid) {
            $menuslist = M('menus')->where("id='$mid'")->find();

        } else {
            $this->error('参数错误！');
        }

        $this->assign('menuslist', $menuslist);
        $this->display('form');
    }


    public function update($ajax = '')
    {
        $mid = isset($_POST['mid']) ? intval($_POST['mid']) : false;

        $data['menus_title'] = isset($_POST['menus_title']) ? trim($_POST['menus_title']) : '';
        $data['menus_content'] = isset($_POST['content']) ? trim($_POST['content']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$mid) {
            $mid = M('menus')->data($data)->add();
        } else {
            M('menus')->data($data)->where("id=$mid")->save();
        }
        addlog('新增成功!');
        $url = U('Menus/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $mids = isset($_REQUEST['mids']) ? $_REQUEST['mids'] : false;
        //uid为1的禁止删除
        if (!$mids) {
            $this->error('参数错误！');
        }
        if (is_array($mids)) {
            foreach ($mids as $k => $v) {
                $mids[$k] = intval($v);
            }
            if (!$mids) {
                $this->error('参数错误！');
                $mids = implode(',', $mids);
            }
        }

        $map['id'] = array('in', $mids);
        if (M('menus')->where($map)->delete()) {
            addlog('删除UID：' . $mids);
            $this->success('恭喜，没事简介删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}