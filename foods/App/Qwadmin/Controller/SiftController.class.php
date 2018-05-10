<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/5
 * Time: 8:42
 */
namespace Qwadmin\Controller;
class SiftController extends ComController{
    public function index(){
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where='';

        if ($keyword <> '') {
            if ($field == 'sift_title') {
                $where = "{$prefix}Sift.sift_title LIKE '%$keyword%'";
            }


        }




        $new = M('sift');
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

        $sid = isset($_GET['sid']) ? intval($_GET['sid']) : false;

        if ($sid) {
            $siftlist = M('new')->where("id='$sid'")->find();

        } else {
            $this->error('参数错误！');
        }

        $this->assign('newlist', $siftlist);
        $this->display('form');
    }


    public function update($ajax='')
    {
        $sid = isset($_POST['sid']) ? intval($_POST['sid']) : false;

        $data['sift_title'] = isset($_POST['sift_title']) ? trim($_POST['sift_title']) : '';
        $data['sift_content'] = isset($_POST['content']) ? trim($_POST['content']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$sid) {
            $sid=M('sift')->data($data)->add();
        } else {
            M('sift')->data($data)->where("id=$sid")->save();
        }
        addlog('新增成功!');
        $url = U('Sift/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $sids = isset($_REQUEST['sids']) ? $_REQUEST['sids'] : false;
        //uid为1的禁止删除
        if (!$sids) {
            $this->error('参数错误！');
        }
        if (is_array($sids)) {
            foreach ($sids as $k => $v) {
                $sids[$k] = intval($v);
            }
            if (!$sids) {
                $this->error('参数错误！');
                $sids = implode(',', $sids);
            }
        }

        $map['id'] = array('in', $sids);
        if (M('sift')->where($map)->delete()) {
            addlog('删除UID：' . $sids);
            $this->success('恭喜，精选删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }

}