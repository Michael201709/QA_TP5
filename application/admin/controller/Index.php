<?php

namespace app\admin\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        // 助手函数
        return view('admin@index/login');
    }
}
