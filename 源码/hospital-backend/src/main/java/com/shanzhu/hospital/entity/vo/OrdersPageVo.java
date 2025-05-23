package com.shanzhu.hospital.entity.vo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shanzhu.hospital.entity.po.Orders;
import com.shanzhu.hospital.entity.vo.base.PageBase;
import lombok.Data;

import java.util.List;

/**
 * 挂号单分页 返回对象
 *
 * @author: ShanZhu
 * @date: 2023-11-15
 */
@Data
public class OrdersPageVo extends PageBase {

    /**
     * 挂号单数据
     */
    private List<Orders> orders;

    /**
     * 填充分页信息
     *
     * @param iPage 分页对象
     */
    public void populatePage(IPage iPage) {
        super.populatePage(iPage);
        this.orders = iPage.getRecords();
    }

}

  