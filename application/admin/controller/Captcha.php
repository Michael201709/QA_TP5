<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;

class Captcha extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */

    // 验证码表单
    public function index()
    {
        return $this->fetch();
    }

    // 验证码检测
    public function check(Request $request)
    {
        if (true !== $this->validate($request->param(), [
                'code|验证码' => 'require|captcha'
            ])) {
            $this->error('验证码错误');
        } else {
            $this->success('验证码正确');
        }
    }


/**
 * 显示创建资源表单页.
 *
 * @return \think\Response
 */
public
function create()
{
    //
}

/**
 * 保存新建的资源
 *
 * @param  \think\Request $request
 * @return \think\Response
 */
public
function save(Request $request)
{
    //
}

/**
 * 显示指定的资源
 *
 * @param  int $id
 * @return \think\Response
 */
public
function read($id)
{
    //
}

/**
 * 显示编辑资源表单页.
 *
 * @param  int $id
 * @return \think\Response
 */
public
function edit($id)
{
    //
}

/**
 * 保存更新的资源
 *
 * @param  \think\Request $request
 * @param  int $id
 * @return \think\Response
 */
public
function update(Request $request, $id)
{
    //
}

/**
 * 删除指定资源
 *
 * @param  int $id
 * @return \think\Response
 */
public
function delete($id)
{
    //
}
}
