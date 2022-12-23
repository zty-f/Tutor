package com.zty.quartz.util;

import org.quartz.JobExecutionContext;
import com.zty.quartz.domain.SysJob;

/**
 * 定时任务处理（允许并发执行）
 * 
 * @author zty
 *
 */
public class QuartzJobExecution extends AbstractQuartzJob
{
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception
    {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
