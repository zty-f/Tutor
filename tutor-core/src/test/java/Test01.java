import com.zty.common.utils.DateUtils;
import org.junit.jupiter.api.Test;

/**
 * @version V1.0
 * @ClassName: PACKAGE_NAME.Test01.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2022-12-28 17:24
 * @Description: 测试
 */
public class Test01 {

    @Test
    public void test01(){
        System.out.println(DateUtils.dateTimeNow());
        System.out.println(DateUtils.getNowDate());
        System.out.println(DateUtils.dateTime());
    }
}
