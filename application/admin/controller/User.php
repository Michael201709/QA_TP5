<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

// use think\Request;

class User extends Controller
{
    public function index()
    {
        // 原生代码
        // $list = Db::query("select * from lamp_user");

        // DB
        $list = Db::table('lamp_admin')->select();

        $arr = Db::table('lamp_user')->select();

        // 助手函数
        // $list = db('thinkask_admin')->select();

        // dump($list);

        return view('admin@main/user', [
            'title' => "用户管理",
            'list' => $list,
            'arr' => $arr
        ]);
    }

    public function save(Request $request)
    {
        // dump($_POST);
        $p = $request->post();

        $data = [
            'username' => $p['username'],
            'userpass' => md5($p['userpass']),
            'name' => $p['name'],
            'sex' => $p['sex']
        ];

        // 执行添加保存
        $result = Db::name('admin')->data($data)->insert();

        // 判断结果
        if ($result > 0) {
            return $this->success('添加成功', url('admin/user/index'));
        } else {
            return $this->error('添加失败');
        }
    }


}