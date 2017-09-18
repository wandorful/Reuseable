package com.atguigu.bookstore.bean;

import java.util.List;

/**
 * 分页查询封装类，应该具有的属性: 
 *  1.每页显示的条目数 
 *  2.当前的页数
 *  3.总的条目数
 *  4.总的页码数
 *  5.查询后，每页的条目的集合
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class Page<T> {

    public static final int PAGE_SIZE = 4;//每页显示的条目数 
    private int pageNo;//当前的页数
    private int totalNo;//总的条目数
    private int totalPageNo;//总的页码数，需要根据totalNo得到
    private List<T> listItems;//查询后，每页的条目的集合

    public int getPageNo() {
        if(pageNo <= 0) {
            return 1;
        } else if(pageNo > getTotalPageNo()) {
            return getTotalPageNo();
        } else {
            return pageNo;
        }
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    // 该值是通过其他的值计算得出的
    public int getTotalPageNo() {
        if(totalNo % PAGE_SIZE == 0) {
            totalPageNo = totalNo / PAGE_SIZE;
        } else {
            totalPageNo = totalNo / PAGE_SIZE + 1;
        }
        return totalPageNo;
    }

    public int getTotalNo() {
        return totalNo;
    }

    public void setTotalNo(int totalNo) {
        this.totalNo = totalNo;
    }

    public List<T> getListItems() {
        return listItems;
    }

    public void setListItems(List<T> listItems) {
        this.listItems = listItems;
    }

}
