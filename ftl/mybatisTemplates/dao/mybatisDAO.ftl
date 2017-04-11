<@pp.dropOutputFile />
<#list model.classes.class as item>
<@pp.changeOutputFile name="${item.name?cap_first}Mapper.java" />
    void deleteBatch(List list);
    
    int countForSearch(${item.name?cap_first}Example example);
    
    List pagingQueryForSearch(PaginatorEx paginatorex);
</#list>