<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
// use think\Request;

class User extends Controller
{
    public function index(){
        // 原生代码
        // $list = Db::query("select * from lamp_user");

        // DB
        $list = Db::table('lamp_user')->order(['id'=>'desc'])->select();

        // 助手函数
        // $list = db('user')->field(['id', 'name'])->select();
        dump($list);
    }
}

