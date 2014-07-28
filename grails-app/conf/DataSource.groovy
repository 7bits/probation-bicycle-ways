dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/likeBike?useUnicode=yes&characterEncoding=UTF-8"
            username = "likebike"
            password = "likebike"
        }
        hibernate {
            show_sql = true
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/likeBike?useUnicode=yes&characterEncoding=UTF-8"
            username = "likebike"
            password = "likebike"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/likeBike?useUnicode=yes&characterEncoding=UTF-8"
            username = "likebike"
            password = "likebike"
        }
    }
}