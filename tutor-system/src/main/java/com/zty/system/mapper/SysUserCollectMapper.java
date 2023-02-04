package com.zty.system.mapper;

import java.util.List;
import com.zty.system.domain.SysUserCollect;
import com.zty.system.domain.SysUserCollect;
import com.zty.system.domain.SysUserLike;

/**
 * 用户收藏关联Mapper接口
 * 
 * @author zty
 * @date 2023-02-04
 */
public interface SysUserCollectMapper 
{

    /**
     * 查询用户收藏关联
     */
    public int selectSysUserCollectByUserIdAndCollectId(SysUserCollect sysUserCollect);

    /**
     * 查询用户收藏获取数量
     */
    public int selectSysUserCollectNum(Long userId);

    /**
     * 新增用户收藏关联
     * 
     * @param sysUserCollect 用户收藏关联
     * @return 结果
     */
    public int insertSysUserCollect(SysUserCollect sysUserCollect);


    /**
     * 删除用户收藏关联
     * 
     * @param userId 用户收藏关联主键
     * @return 结果
     */
    public int deleteSysUserCollect(SysUserCollect sysUserCollect);
}
