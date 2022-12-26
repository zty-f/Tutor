package com.zty.core.mapper;

import java.util.List;
import com.zty.core.domain.Student;
import com.zty.core.domain.SysStudent;

/**
 * 学生信息Mapper接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface StudentMapper 
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
     * 删除学生信息
     * 
     * @param userId 学生信息主键
     * @return 结果
     */
    public int deleteStudentByUserId(Long userId);

    /**
     * 批量删除学生信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentByUserIds(Long[] userIds);

    /**
     * 批量删除学生家教信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysStudentByUserIds(Long[] userIds);
    
    /**
     * 批量新增学生家教信息
     * 
     * @param sysStudent 学生家教信息列表
     * @return 结果
     */
    public int batchSysStudent(SysStudent sysStudent);
    

    /**
     * 通过学生信息主键删除学生家教信息信息
     * 
     * @param userId 学生信息ID
     * @return 结果
     */
    public int deleteSysStudentByUserId(Long userId);
}
