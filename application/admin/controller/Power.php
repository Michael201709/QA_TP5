<?php

namespace app\admin\controller;

use app\admin\controller\Base;

use think\Db;
use think\Request;

class Power extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $arr = Db::table('lamp_node')->order(['id' => 'desc'])->select();
        //
        return view('admin@main/power', [
            'title' => "权限管理",
            'arr' => $arr
        ]);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        // dump($_POST);
        $p = $request->post();

        $data = [
            'name' => $p['name'],
            'mname' => $p['mname'],
            'aname' => $p['aname'],
            'status' => $p['status']
        ];

        // 执行添加保存
        $result = Db::name('node')->data($data)->insert();

        // 判断结果
        if ($result > 0) {
            return $this->success('添加成功', url('admin/power/index'));
        } else {
            return $this->error('添加失败');
        }
    }

    /**
     * 显示指定的资源
     *
     * @param  int $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int $id
     * @return \think\Response
     */
    public function edit($id)
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
