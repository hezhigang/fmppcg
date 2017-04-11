<@pp.dropOutputFile />
<@pp.changeOutputFile name="applicationContext_a.xml" />
<#assign domainlist=model.classes.class>
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
	<!-- DAO -->
<#list domainlist as item>
	<bean id="${item.name?uncap_first}Dao" class="org.mybatis.spring.mapper.MapperFactoryBean">
		<property name="sqlSessionFactory" ref="sqlSessionFactory" />
		<property name="mapperInterface" value="com.anegr.dao.${item.name?cap_first}Mapper" />
	</bean>
</#list>
</beans>