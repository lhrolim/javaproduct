package br.com.amlabs.pilaoec.util.jdbc;

@java.lang.annotation.Target(value = { java.lang.annotation.ElementType.TYPE })
@java.lang.annotation.Retention(value = java.lang.annotation.RetentionPolicy.RUNTIME)
public @interface JDBCEntity {

	String table();
}
