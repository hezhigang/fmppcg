fmppcg
========

A simple code generator for SpringMVC + MyBatis + jQuery + Bootstrap CRUD demo,  by FMPP & FreeMarker & Ant.

# main tools

## FMPP

The latest released version is FMPP 0.9.15 (comes with FreeMarker 2.3.21, but you can replace it with a later version).

FMPP is a Java application so it requires Java to be installed on your machine (version 1.4 or later).

The FMPP Ant task (ignore if you don't know what Ant is) requires Ant 1.5.1 or later.

FMPP - FreeMarker-based file PreProcessor
<https://github.com/freemarker/fmpp>

FMPP - FreeMarker-based file PreProcessor
<http://fmpp.sourceforge.net/>

# howto

## database

hxgdzyuyi/tang_poetry
全唐诗数据库
<https://github.com/hxgdzyuyi/tang_poetry>

A mysql database of Chinese poetry of the Tang Dynasty, crawled from Internet.

## MyBatis Generator

mybatis-generator-core-1.3.3.jar can download from <http://www.mybatis.org/generator/>

## FMPP lib

to download from <http://fmpp.sourceforge.net/>

## fmppgc

### model file as xml config

+ fmppConfig/javaMeta.xml: for gen java and xml config fragment
+ fmppConfig/webPageMeta.xml: for gen jsp file with Bootstrap CSS

### freemarker template

ftl/*.ftl

## Ant build xml

+ retreive-dependencies-jar-to-lib-folder.xml: retrive jar lib by ivy，ivy.xml need to modify by your environment and need
+ ant_mybatis_generator.xml：produce MyBatis ORM Mapping files
+ codeGenerator.xml：code gen
+ CodeScaffold_FMPP_Ant.xml: partial code gen

# ref

1. [Code generator with ant FMPP and FreeMarker](http://blog.quidquid.fr/2009/01/code-generator-with-ant-fmpp-and-freemarker/)
2. [Fmpp+Ant生成类文件](http://jasonright.iteye.com/blog/723195)
3. [Role of Code Generation in Java Application Development](https://www.infoq.com/news/2009/09/codegen-java-development)