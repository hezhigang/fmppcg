package com.anegr.dao;

import com.anegr.domain.Poet;
import com.anegr.domain.PoetExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PoetMapper extends BaseDAO {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int countByExample(PoetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int deleteByExample(PoetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int insert(Poet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int insertSelective(Poet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    List<Poet> selectByExample(PoetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    Poet selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int updateByExampleSelective(@Param("record") Poet record, @Param("example") PoetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int updateByExample(@Param("record") Poet record, @Param("example") PoetExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int updateByPrimaryKeySelective(Poet record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table poets
     *
     * @mbggenerated Tue Aug 08 15:58:48 CST 2017
     */
    int updateByPrimaryKey(Poet record);
    
    void deleteBatch(List list);
    
    int countForSearch(PoetExample example);
    
    List pagingQueryForSearch(PaginatorEx paginatorex);    
}