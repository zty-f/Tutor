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
     * 查询用户点赞关联
     */
    @Override
    public boolean selectSysUserLikeByUserIdAndLikeId(Long userId, Long likeId)
    {
        SysUserLike sysUserLike = new SysUserLike(userId, likeId);
        return sysUserLikeMapper.selectSysUserLikeByUserIdAndLikeId(sysUserLike) > 0;
    }

    /**
     * 查询用户点赞数量
     */
    @Override
    public int selectSysUserLikeNum(Long userId)
    {
        return sysUserLikeMapper.selectSysUserLikeNum(userId);
    }

    /**
     * 查询用户喜欢列表id
     */
    public List<Long> selectSysUserLikeIds(Long userId){
        return sysUserLikeMapper.selectSysUserLikeIds(userId);
    }

    /**
     * 查询用户粉丝列表id
     */
    public List<Long> selectSysUserFansIds(Long userId){
        return sysUserLikeMapper.selectSysUserFansIds(userId);
    }

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
     */
    @Override
    public int deleteSysUserLike(SysUserLike sysUserLike)
    {
        return sysUserLikeMapper.deleteSysUserLike(sysUserLike);
    }
}
