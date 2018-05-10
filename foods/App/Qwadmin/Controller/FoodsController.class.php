<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/5
 * Time: 9:41
 */
namespace Qwadmin\Controller;
class FoodsController extends ComController{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where='';

        if ($keyword <> '') {
            if ($field == 'foods_title') {
                $where = "{$prefix}foods.foods_title LIKE '%$keyword%'";
            }


        }




        $new = M('foods');
        $list=$new->where($where)->select();
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

        $fid = isset($_GET['fid']) ? intval($_GET['fid']) : false;

        if ($fid) {
            $foodslist = M('foods')->where("id='$fid'")->find();

        } else {
            $this->error('参数错误！');
        }

        $this->assign('foodslist', $foodslist);
        $this->display('form');
    }


    public function update($ajax='')
    {
        $fid = isset($_POST['fid']) ? intval($_POST['fid']) : false;

        $data['foods_title'] = isset($_POST['foods_title']) ? trim($_POST['foods_title']) : '';
        $data['foods_content'] = isset($_POST['content']) ? trim($_POST['content']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$fid) {
            $fid=M('foods')->data($data)->add();
        } else {
            M('foods')->data($data)->where("id=$fid")->save();
        }
        addlog('新增成功!');
        $url = U('Foods/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $fids = isset($_REQUEST['fids']) ? $_REQUEST['fids'] : false;
        //uid为1的禁止删除
        if (!$fids) {
            $this->error('参数错误！');
        }
        if (is_array($fids)) {
            foreach ($fids as $k => $v) {
                $fids[$k] = intval($v);
            }
            if (!$fids) {
                $this->error('参数错误！');
                $fids = implode(',', $fids);
            }
        }

        $map['id'] = array('in', $fids);
        if (M('foods')->where($map)->delete()) {
            addlog('删除UID：' . $fids);
            $this->success('恭喜，没事简介删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}