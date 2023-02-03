package com.zty.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysUserLikeMapper;
import com.zty.system.domain.SysUserLike;
import com.zty.system.service.ISysUserLikeService;

/**
 * 用户点赞关联Service业务层处理
 * 
 * @author zty
 * @date 2023-02-03
 */
@Service
public class SysUserLikeServiceImpl implements ISysUserLikeService 
{
    @Autowired
    private SysUserLikeMapper sysUserLikeMapper;

    /**
     * 新增用户点赞关联
     * 
     * @param sysUserLike 用户点赞关联
     * @return 结果
     */
    @Override
    public int insertSysUserLike(SysUserLike sysUserLike)
    {
        return sysUserLikeMapper.insertSysUserLike(sysUserLike);
    }


    /**
     * 删除用户点赞关联信息
     * 
     * @param userId 用户点赞关联主键
     * @return 结果
     */
    @Override
    public int deleteSysUserLikeByUserId(Long userId)
    {
        return sysUserLikeMapper.deleteSysUserLikeByUserId(userId);
    }
}
