<@pp.dropOutputFile />
<#list model.classes.class as item>
<@pp.changeOutputFile name="${item.name}Mapper.xml" />
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.anegr.dao.${item.name?cap_first}Mapper">
  <select id="getTotalCount" resultType="java.lang.Integer">
  	select count(*) from ${item.dbTable}
  </select>
  <select id="pagingQuery" parameterType="com.anegr.dao.Paginator" resultMap="BaseResultMap">
	<![CDATA[
	select * from ${item.dbTable} order by ${item.tbkey} asc limit ${r"#{offset}"},${r"#{rowsperpage}"}	
	]]>
  </select>
  <delete id="deleteBatch" parameterType="java.util.List">
    delete from ${item.dbTable} where ${item.tbkey} in 
	<foreach item="item" index="index" collection="list" open="(" separator="," close=")">
	${r"#{item}"}
	</foreach>    
  </delete>
  <sql id="Count_Search_Where_Clause">
    <where>
      <foreach collection="oredCriteria" item="criteria" separator="and">
        <if test="criteria.valid">
          <trim prefix="(" prefixOverrides="and" suffix=")">
            <foreach collection="criteria.criteria" item="criterion">
              <choose>
                <when test="criterion.noValue">
                  and ${r"${criterion.condition}"}
                </when>
                <when test="criterion.singleValue">
                  and ${r"${criterion.condition}"} ${r"#{criterion.value}"}
                </when>
                <when test="criterion.betweenValue">
                  and ${r"${criterion.condition}"} ${r"#{criterion.value}"} and ${r"#{criterion.secondValue}"}
                </when>
                <when test="criterion.listValue">
                  and ${r"${criterion.condition}"}
                  <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                    ${r"#{listItem}"}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <select id="countForSearch" parameterType="com.anegr.domain.${item.name?cap_first}Example" resultType="java.lang.Integer">
    select count(*) from ${item.dbTable}
    <if test="_parameter != null">
      <include refid="Count_Search_Where_Clause" />
    </if>
  </select>  
  <sql id="Search_Where_Clause">
    <where>
      <foreach collection="example.oredCriteria" item="criteria" separator="and">
        <if test="criteria.valid">
          <trim prefix="(" prefixOverrides="and" suffix=")">
            <foreach collection="criteria.criteria" item="criterion">
              <choose>
                <when test="criterion.noValue">
                  and ${r"${criterion.condition}"}
                </when>
                <when test="criterion.singleValue">
                  and ${r"${criterion.condition}"} ${r"#{criterion.value}"}
                </when>
                <when test="criterion.betweenValue">
                  and ${r"${criterion.condition}"} ${r"#{criterion.value}"} and ${r"#{criterion.secondValue}"}
                </when>
                <when test="criterion.listValue">
                  and ${r"${criterion.condition}"}
                  <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                    ${r"#{listItem}"}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <select id="pagingQueryForSearch" parameterType="com.anegr.dao.PaginatorEx" resultMap="BaseResultMap">
	<![CDATA[
	select * from ${item.dbTable}
	]]>
    <if test="_parameter != null">
      <include refid="Search_Where_Clause" />
    </if>
    <![CDATA[
    order by ${item.tbkey} asc limit ${r"#{offset}"},${r"#{rowsperpage}"}	
	]]>
  </select>
</mapper>
</#list>