package com.zty.system.domain.vo;

import com.zty.common.annotation.Excel;
import com.zty.system.domain.Parent;
import com.zty.system.domain.Student;

import java.util.List;

/**
 * @version V1.0
 * @ClassName: com.zty.system.domain.vo.StudentVo.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2022-12-29 15:47
 * @Description: 学生信息数据传输对象
 */
public class StudentVo {
    private static final long serialVersionUID = 1L;

    /** 职级*/
    @Excel(name = "职级")
    private String deptName;

    /** 岗位 */
    private List<String> posts;

    /** 角色*/
    @Excel(name = "角色")
    private String roleName;

    /** 学员信息 */
    private Student student;

    public StudentVo() {
    }

    public StudentVo(Student student) {
        this.student = student;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<String> getPosts() {
        return posts;
    }

    public void setPosts(List<String> posts) {
        this.posts = posts;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "ParentVo{" +
                "deptName='" + deptName + '\'' +
                ", posts=" + posts +
                ", roleName='" + roleName + '\'' +
                ", student=" + student +
                '}';
    }
}
