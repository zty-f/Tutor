package com.zty.system.service.impl;

import com.zty.common.utils.DateUtils;
import com.zty.common.utils.StringUtils;
import com.zty.system.domain.Parent;
import com.zty.system.domain.Student;
import com.zty.system.domain.SysStudent;
import com.zty.system.domain.vo.ParentVo;
import com.zty.system.domain.vo.StudentVo;
import com.zty.system.mapper.*;
import com.zty.system.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 学生信息Service业务层处理
 *
 * @author zty
 * @date 2022-12-25
 */
@Service
public class StudentServiceImpl implements IStudentService {
    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private SysDeptMapper deptMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;

    /**
     * 查询学生信息
     *
     * @param userId 学生信息主键
     * @return 学生信息
     */
    @Override
    public Student selectStudentByUserId(Long userId) {
        return studentMapper.selectStudentByUserId(userId);
    }

    /**
     * 查询学生信息列表
     *
     * @param student 学生信息
     * @return 学生信息
     */
    @Override
    public List<StudentVo> selectStudentList(Student student) {
        List<Student> students = studentMapper.selectStudentList(student);
        List<StudentVo> res = new ArrayList<>();
        Long selectDeptId = student.getDeptId();
        for (Student s : students) {
            if (selectDeptId!=null&&s.getDeptId()<selectDeptId)continue;
            StudentVo studentVo = new StudentVo(s);
            studentVo.setDeptName(deptMapper.selectDeptById(s.getDeptId()).getDeptName());
            studentVo.setRoleName(roleMapper.selectRolePermissionByUserId(s.getUserId()).get(0).getRoleName());
            studentVo.setPosts(postMapper.selectPostsByUserId(s.getUserId()));
            res.add(studentVo);
        }
        return res;
    }

    /**
     * 新增学生信息
     *
     * @param student 学生信息
     * @return 结果
     */
    @Transactional
    @Override
    public int insertStudent(Student student) {
        student.setCreateTime(DateUtils.getNowDate());
        int rows = studentMapper.insertStudent(student);
        insertSysStudent(student);
        return rows;
    }

    /**
     * 修改学生信息
     *
     * @param student 学生信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updateStudent(Student student) {
        student.setUpdateTime(DateUtils.getNowDate());
        studentMapper.deleteSysStudentByUserId(student.getUserId());
        insertSysStudent(student);
        return studentMapper.updateStudent(student);
    }

    /**
     * 批量删除学生信息
     *
     * @param userIds 需要删除的学生信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStudentByUserIds(Long[] userIds) {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPost(userIds);
        studentMapper.deleteSysStudentByUserIds(userIds);
        return studentMapper.deleteStudentByUserIds(userIds);
    }

    /**
     * 删除学生信息信息
     *
     * @param userId 学生信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteStudentByUserId(Long userId) {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 删除用户与岗位表
        userPostMapper.deleteUserPostByUserId(userId);
        studentMapper.deleteSysStudentByUserId(userId);
        return studentMapper.deleteStudentByUserId(userId);
    }

    /**
     * 新增学生家教信息信息
     *
     * @param student 学生信息对象
     */
    public void insertSysStudent(Student student) {
        SysStudent sysStudent = student.getSysStudent();
        Long userId = student.getUserId();
        if (StringUtils.isNotNull(sysStudent)) {
            sysStudent.setUserId(userId);
            sysStudent.setCreateTime(DateUtils.getNowDate());
            studentMapper.batchSysStudent(sysStudent);
        }
    }
}
