<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/11
 * Time: 22:37
 */
namespace Qwadmin\Controller;
class MajorController extends ComController{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where='';

        if ($keyword <> '') {
            if ($field == 'major_name') {
                $where = "{$prefix}major.major_name LIKE '%$keyword%'";
            }
        }
        $db=M('major');
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
            $major= M('major')->where("id='$mid'")->find();

//            $custorm = M('custorm');
//            $custormlist = $custorm->select();

        } else {
            $this->error('参数错误！');
        }



        $this->assign('major', $major);
        $this->display('form');
    }

    public function update($ajax = '')
    {
        $mid = isset($_POST['mid']) ? intval($_POST['mid']) : false;
        $data['major_name'] = isset($_POST['major_name']) ? trim($_POST['major_name']) : '';


        if (!$mid) {
            M('major')->data($data)->add();


        } else {

            M('major')->data($data)->where("id=$mid")->save();

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

                $uids[$k] = intval($v);
            }
            if (!$mids) {
                $this->error('参数错误！');
                $uids = implode(',', $mids);
            }
        }

        $map['mid'] = array('in', $mids);
        if (M('major')->where($map)->delete()) {

            $this->success('恭喜，专业分类删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}