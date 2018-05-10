<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/5
 * Time: 11:25
 */
namespace Qwadmin\Controller;
class CommunityController extends ComController{
    public function index()
    {
        $p = isset($_GET['p']) ? intval($_GET['p']) : '1';

        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $field = isset($_GET['field']) ? $_GET['field'] : '';
        $prefix = C('DB_PREFIX');
        $where = '';

        if ($keyword <> '') {
            if ($field == 'community_title') {
                $where = "{$prefix}community.community_title LIKE '%$keyword%'";
            }


        }


        $new = M('community');
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

        $cid = isset($_GET['cid']) ? intval($_GET['cid']) : false;

        if ($cid) {
            $communitylist = M('community')->where("id='$cid'")->find();

        } else {
            $this->error('参数错误！');
        }

        $this->assign('communitylist', $communitylist);
        $this->display('form');
    }


    public function update($ajax = '')
    {
        $cid = isset($_POST['cid']) ? intval($_POST['cid']) : false;

        $data['community_title'] = isset($_POST['community_title']) ? trim($_POST['community_title']) : '';
        $data['community_content'] = isset($_POST['content']) ? trim($_POST['content']) : '';

        $head = I('post.head', '', 'strip_tags');
        $data['image'] = $head ? $head : '';
        $data['t'] = time();
        if (!$cid) {
            $cid = M('community')->data($data)->add();
        } else {
            M('community')->data($data)->where("id=$cid")->save();
        }
        addlog('新增成功!');
        $url = U('Community/index');
        header("Location: $url");
    }


    public function add()
    {

        $this->display('form');
    }

    public function del()
    {

        $cids = isset($_REQUEST['cids']) ? $_REQUEST['cids'] : false;
        //uid为1的禁止删除
        if (!$cids) {
            $this->error('参数错误！');
        }
        if (is_array($cids)) {
            foreach ($cids as $k => $v) {
                $cids[$k] = intval($v);
            }
            if (!$cids) {
                $this->error('参数错误！');
                $cids = implode(',', $cids);
            }
        }

        $map['id'] = array('in', $cids);
        if (M('community')->where($map)->delete()) {
            addlog('删除UID：' . $cids);
            $this->success('恭喜，社区信息删除成功！');
        } else {
            $this->error('参数错误！');
        }
    }
}