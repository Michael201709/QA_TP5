<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
use app\admin\model\User as UserModel;

class Index extends Base
{
    public function index()
    {
        // 助手函数
        // return view('admin@index/login');
        return $this->view->fetch();
    }

    // 验证登录 $this->validate($data,$rule,$msg)
    public function checkLogin(Request $request)
    {
        // 初始化返回参数、
        $status = 0;
        $result = '';
        $data = $request->param();

        // 验证规则：必填项
        $rule = [
            'username|用户名' => 'require',
            'userpass|密码' => 'require'
        ];

        // 验证失败的提示信息
        $msg = [
            'username' => ['require' => '登录名不能为空哟，请检查后重试！'],
            'userpass' => ['require' => '请输入密码！']
        ];

        // 进行验证
        $result = $this->validate($data, $rule, $msg);

        // 如果验证通过则执行
        if ($result === true) {
            // 构造查询条件
            $map = [
                'username' => $data['name'],
                'userpass' => md5($data['userpass'])
            ];

            // 查询用户信息
            $list = UserModel::get($map);
            if ($list === null) {
                $result = '没有找到该用户';
            } else {
                $status = 1;
                $result = '验证通过，点击【确定】进入';
            }
        }

        return ['data' => $data, 'rule' => $rule, 'msg' => $msg];

        // return ['status' => $status, 'message' => $result, 'data' => $data];
    }

}
