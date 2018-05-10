<?php
/**
 * Created by PhpStorm.
 * User: Successful
 * Date: 2017-12-28
 * Time: 14:36
 */

namespace Home\Controller;


class ApiController extends ComController
{
    public function api(){
        $image=I('url');
        $url='http://'.$_SERVER['SERVER_NAME'];
        return json_encode($url);
    }

}