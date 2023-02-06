package com.zty.core.controller.student;

import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.SecurityUtils;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.system.domain.Student;
import com.zty.system.domain.vo.StudentVo;
import com.zty.system.service.IStudentService;
import com.zty.system.service.ISysUserCollectService;
import com.zty.system.service.ISysUserLikeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zty.common.annotation.Log;
import com.zty.common.core.controller.BaseController;
import com.zty.common.core.domain.AjaxResult;
import com.zty.common.enums.BusinessType;
import com.zty.common.core.page.TableDataInfo;

import java.util.List;

/**
 * 学生信息Controller
 * 
 * @author zty
 * @date 2022-12-25
 */
@RestController
@RequestMapping("/core/student")
public class StudentController extends BaseController
{
    @Autowired
    private IStudentService studentService;

    @Autowired
    private ISysUserLikeService userLikeService;

    @Autowired
    private ISysUserCollectService userCollectService;

    /**
     * 查询学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(Student student)
    {
        startPage();
        List<StudentVo> list = studentService.selectStudentList(student);
        return getDataTable(list);
    }

    /**
     * 导出学生信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:student:export')")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Student student)
    {
        List<StudentVo> list = studentService.selectStudentList(student);
        ExcelUtil<StudentVo> util = new ExcelUtil<StudentVo>(StudentVo.class);
        util.exportExcel(response, list, "学生信息数据");
    }

    /**
     * 获取学生信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('core:student:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        AjaxResult ajax = AjaxResult.success(studentService.selectStudentByUserId(userId));
        Long loginUserId = SecurityUtils.getUserId();
        ajax.put("isLike",userLikeService.selectSysUserLikeByUserIdAndLikeId(loginUserId,userId));
        ajax.put("likeNum", userLikeService.selectSysUserLikeNum(userId));
        ajax.put("isCollect",userCollectService.selectSysUserCollectByUserIdAndCollectId(loginUserId,userId));
        ajax.put("collectNum", userCollectService.selectSysUserCollectNum(userId));
        return ajax;
    }

    /**
     * 新增学生信息
     */
    @PreAuthorize("@ss.hasPermi('core:student:add')")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Student student)
    {
        return toAjax(studentService.insertStudent(student));
    }

    /**
     * 修改学生信息
     */
    @PreAuthorize("@ss.hasPermi('core:student:edit')")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Student student)
    {
        return toAjax(studentService.updateStudent(student));
    }

    /**
     * 删除学生信息
     */
    @PreAuthorize("@ss.hasPermi('core:student:remove')")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(studentService.deleteStudentByUserIds(userIds));
    }

    /**
     * 根据用户id查询认证状态
     */
    @GetMapping(value = "/getAuthStatus/{userId}")
    public AjaxResult getAuthStatus(@PathVariable("userId") Long userId)
    {
        return AjaxResult.success(studentService.getAuthStatus(userId));
    }
}
