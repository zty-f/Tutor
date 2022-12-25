package com.zty.core.service;

import java.util.List;
import com.zty.core.domain.Student;

/**
 * 学生信息Service接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface IStudentService 
{
    /**
     * 查询学生信息
     * 
     * @param userId 学生信息主键
     * @return 学生信息
     */
    public Student selectStudentByUserId(Long userId);

    /**
     * 查询学生信息列表
     * 
     * @param student 学生信息
     * @return 学生信息集合
     */
    public List<Student> selectStudentList(Student student);

    /**
     * 新增学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    public int insertStudent(Student student);

    /**
     * 修改学生信息
     * 
     * @param student 学生信息
     * @return 结果
     */
    public int updateStudent(Student student);

    /**
     * 批量删除学生信息
     * 
     * @param userIds 需要删除的学生信息主键集合
     * @return 结果
     */
    public int deleteStudentByUserIds(Long[] userIds);

    /**
     * 删除学生信息信息
     * 
     * @param userId 学生信息主键
     * @return 结果
     */
    public int deleteStudentByUserId(Long userId);
}
