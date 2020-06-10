## 基于docker-compose安装superset

### docker-compose.yaml
```
version: '2'

services:
  tomcat:
    #restart: always
    image: amancevice/superset:latest
    ports:
      - "10001:8088"
    networks:       
      - work_net
    volumes:
      - /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-data/docker-superset/data:/home/superset

networks:
  work_net:
    external: true
```

### 安装步骤

- docker-copmose up
```
macbook-pro-6:docker-superset tanxinzheng$ docker ps
CONTAINER ID        IMAGE                                         COMMAND                  CREATED             STATUS                          PORTS                     NAMES
40616da9fbce        amancevice/superset:latest                    "gunicorn superset:a…"   11 minutes ago      Up 11 minutes (healthy)         0.0.0.0:10001->8088/tcp   docker-superset_tomcat_1
666e7dab5d1d        registry.cn-hangzhou.aliyuncs.com/anoy/yapi   "node server/app.js"     2 weeks ago         Up 9 days                       0.0.0.0:3000->3000/tcp    yapi
6628b1888817        mongo-express                                 "tini -- /docker-ent…"   2 weeks ago         Restarting (1) 45 seconds ago                             mongo-express
a6ecb4ad4cb7        portainer/portainer:latest                    "/portainer"             3 weeks ago         Up 9 days                       0.0.0.0:1000->9000/tcp    portainer-app
d290e2244a87        mysql:5.7.19                                  "docker-entrypoint.s…"   4 months ago        Up 9 days                       0.0.0.0:3306->3306/tcp    mysql
aed87588b858        daocloud.io/redis                             "docker-entrypoint.s…"   5 months ago        Up 9 days                       0.0.0.0:6379->6379/tcp    local-redis
4c7fe9f2197e        v2tec/watchtower                              "/watchtower --clean…"   5 months ago        Up 9 days                                                 portainer-watchtower
macbook-pro-6:docker-superset tanxinzheng$ docker exec -it 40616da9fbce fabmanager create-admin --app superset
fabmanager is going to be deprecated in 2.2.X, you can use the same commands on the improved 'flask fab <command>'
Username [admin]: admin
User first name [admin]: admin
User last name [user]: admin
Email [admin@fab.org]: admin@test.com
Password:
Repeat for confirmation:
/usr/local/lib/python3.6/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
  """)
2020-04-14 14:51:04,924:INFO:root:logging was configured successfully
2020-04-14 14:51:05,059:INFO:root:Configured event logger of type <class 'superset.utils.log.DBEventLogger'>
2020-04-14 14:51:05,379:DEBUG:asyncio:Using selector: EpollSelector
Recognized Database Authentications.
Admin User admin created.
```
- 设置用户名和密码(admin/admin123)(docker exec -it 容器ID fabmanager create-admin –app superset)
```
macbook-pro-6:docker-superset tanxinzheng$ docker exec -it 40616da9fbce fabmanager create-admin --app superset
fabmanager is going to be deprecated in 2.2.X, you can use the same commands on the improved 'flask fab <command>'
Username [admin]: admin
User first name [admin]: admin
User last name [user]: admin
Email [admin@fab.org]: admin@test.com
Password:
Repeat for confirmation:
/usr/local/lib/python3.6/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
  """)
2020-04-14 14:51:04,924:INFO:root:logging was configured successfully
2020-04-14 14:51:05,059:INFO:root:Configured event logger of type <class 'superset.utils.log.DBEventLogger'>
2020-04-14 14:51:05,379:DEBUG:asyncio:Using selector: EpollSelector
Recognized Database Authentications.
Admin User admin created.
```
- 初始化数据库（docker exec -it 容器ID superset db upgrade）
```
macbook-pro-6:docker-superset tanxinzheng$ docker exec -it 40616da9fbce superset db upgrade
/usr/local/lib/python3.6/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
  """)
2020-04-14 14:51:56,166:INFO:root:logging was configured successfully
2020-04-14 14:51:56,320:INFO:root:Configured event logger of type <class 'superset.utils.log.DBEventLogger'>
2020-04-14 14:51:56,643:DEBUG:asyncio:Using selector: EpollSelector
INFO  [alembic.runtime.migration] Context impl SQLiteImpl.
INFO  [alembic.runtime.migration] Will assume transactional DDL.
INFO  [alembic.runtime.migration] Running upgrade  -> 4e6a06bad7a8, Init
INFO  [alembic.runtime.migration] Running upgrade 4e6a06bad7a8 -> 5a7bad26f2a7, empty message
INFO  [alembic.runtime.migration] Running upgrade 5a7bad26f2a7 -> 1e2841a4128, empty message
INFO  [alembic.runtime.migration] Running upgrade 1e2841a4128 -> 2929af7925ed, TZ offsets in data sources
INFO  [alembic.runtime.migration] Running upgrade 2929af7925ed -> 289ce07647b, Add encrypted password field
INFO  [alembic.runtime.migration] Running upgrade 289ce07647b -> 1a48a5411020, adding slug to dash
INFO  [alembic.runtime.migration] Running upgrade 1a48a5411020 -> 315b3f4da9b0, adding log model
INFO  [alembic.runtime.migration] Running upgrade 315b3f4da9b0 -> 55179c7f25c7, sqla_descr
INFO  [alembic.runtime.migration] Running upgrade 55179c7f25c7 -> 12d55656cbca, is_featured
/usr/local/lib/python3.6/site-packages/alembic/ddl/sqlite.py:39: UserWarning: Skipping unsupported ALTER for creation of implicit constraint
  "Skipping unsupported ALTER for "
INFO  [alembic.runtime.migration] Running upgrade 12d55656cbca -> 2591d77e9831, user_id
INFO  [alembic.runtime.migration] Running upgrade 2591d77e9831 -> 8e80a26a31db, empty message
INFO  [alembic.runtime.migration] Running upgrade 8e80a26a31db -> 7dbf98566af7, empty message
INFO  [alembic.runtime.migration] Running upgrade 7dbf98566af7 -> 43df8de3a5f4, empty message
INFO  [alembic.runtime.migration] Running upgrade 43df8de3a5f4 -> d827694c7555, css templates
INFO  [alembic.runtime.migration] Running upgrade d827694c7555 -> 430039611635, log more
INFO  [alembic.runtime.migration] Running upgrade 430039611635 -> 18e88e1cc004, making audit nullable
INFO  [alembic.runtime.migration] Running upgrade 18e88e1cc004 -> 836c0bf75904, cache_timeouts
INFO  [alembic.runtime.migration] Running upgrade 18e88e1cc004 -> a2d606a761d9, adding favstar model
INFO  [alembic.runtime.migration] Running upgrade a2d606a761d9, 836c0bf75904 -> d2424a248d63, empty message
INFO  [alembic.runtime.migration] Running upgrade d2424a248d63 -> 763d4b211ec9, fixing audit fk
INFO  [alembic.runtime.migration] Running upgrade d2424a248d63 -> 1d2ddd543133, log dt
INFO  [alembic.runtime.migration] Running upgrade 1d2ddd543133, 763d4b211ec9 -> fee7b758c130, empty message
INFO  [alembic.runtime.migration] Running upgrade fee7b758c130 -> 867bf4f117f9, Adding extra field to Database model
INFO  [alembic.runtime.migration] Running upgrade 867bf4f117f9 -> bb51420eaf83, add schema to table model
INFO  [alembic.runtime.migration] Running upgrade bb51420eaf83 -> b4456560d4f3, change_table_unique_constraint
INFO  [alembic.runtime.migration] Running upgrade b4456560d4f3 -> 4fa88fe24e94, owners_many_to_many
INFO  [alembic.runtime.migration] Running upgrade 4fa88fe24e94 -> c3a8f8611885, Materializing permission
INFO  [alembic.runtime.migration] Running upgrade c3a8f8611885 -> f0fbf6129e13, Adding verbose_name to tablecolumn
INFO  [alembic.runtime.migration] Running upgrade f0fbf6129e13 -> 956a063c52b3, adjusting key length
INFO  [alembic.runtime.migration] Running upgrade 956a063c52b3 -> 1226819ee0e3, Fix wrong constraint on table columns
INFO  [alembic.runtime.migration] Running upgrade 1226819ee0e3 -> d8bc074f7aad, Add new field 'is_restricted' to SqlMetric and DruidMetric
INFO  [alembic.runtime.migration] Running upgrade d8bc074f7aad -> 27ae655e4247, Make creator owners
INFO  [alembic.runtime.migration] Running upgrade 27ae655e4247 -> 960c69cb1f5b, add dttm_format related fields in table_columns
INFO  [alembic.runtime.migration] Running upgrade 960c69cb1f5b -> f162a1dea4c4, d3format_by_metric
INFO  [alembic.runtime.migration] Running upgrade f162a1dea4c4 -> ad82a75afd82, Update models to support storing the queries.
INFO  [alembic.runtime.migration] Running upgrade ad82a75afd82 -> 3c3ffe173e4f, add_sql_string_to_table
INFO  [alembic.runtime.migration] Running upgrade 3c3ffe173e4f -> 41f6a59a61f2, database options for sql lab
INFO  [alembic.runtime.migration] Running upgrade 41f6a59a61f2 -> 4500485bde7d, allow_run_sync_async
INFO  [alembic.runtime.migration] Running upgrade 4500485bde7d -> 65903709c321, allow_dml
INFO  [alembic.runtime.migration] Running upgrade 41f6a59a61f2 -> 33d996bcc382, update slice model
INFO  [alembic.runtime.migration] Running upgrade 33d996bcc382, 65903709c321 -> b347b202819b, empty message
INFO  [alembic.runtime.migration] Running upgrade b347b202819b -> 5e4a03ef0bf0, Add access_request table to manage requests to access datastores.
INFO  [alembic.runtime.migration] Running upgrade 5e4a03ef0bf0 -> eca4694defa7, sqllab_setting_defaults
INFO  [alembic.runtime.migration] Running upgrade eca4694defa7 -> ab3d66c4246e, add_cache_timeout_to_druid_cluster
INFO  [alembic.runtime.migration] Running upgrade eca4694defa7 -> 3b626e2a6783, Sync DB with the models.py.
WARNI [root] Constraint must have a name
INFO  [alembic.runtime.migration] Running upgrade 3b626e2a6783, ab3d66c4246e -> ef8843b41dac, empty message
INFO  [alembic.runtime.migration] Running upgrade ef8843b41dac -> b46fa1b0b39e, Add json_metadata to the tables table.
INFO  [alembic.runtime.migration] Running upgrade b46fa1b0b39e -> 7e3ddad2a00b, results_key to query
INFO  [alembic.runtime.migration] Running upgrade 7e3ddad2a00b -> ad4d656d92bc, Add avg() to default metrics
INFO  [alembic.runtime.migration] Running upgrade ad4d656d92bc -> c611f2b591b8, dim_spec
INFO  [alembic.runtime.migration] Running upgrade c611f2b591b8 -> e46f2d27a08e, materialize perms
INFO  [alembic.runtime.migration] Running upgrade e46f2d27a08e -> f1f2d4af5b90, Enable Filter Select
INFO  [alembic.runtime.migration] Running upgrade e46f2d27a08e -> 525c854f0005, log_this_plus
INFO  [alembic.runtime.migration] Running upgrade 525c854f0005, f1f2d4af5b90 -> 6414e83d82b7, empty message
INFO  [alembic.runtime.migration] Running upgrade 6414e83d82b7 -> 1296d28ec131, Adds params to the datasource (druid) table
INFO  [alembic.runtime.migration] Running upgrade 1296d28ec131 -> f18570e03440, Add index on the result key to the query table.
INFO  [alembic.runtime.migration] Running upgrade f18570e03440 -> bcf3126872fc, Add keyvalue table
INFO  [alembic.runtime.migration] Running upgrade f18570e03440 -> db0c65b146bd, update_slice_model_json
INFO  [alembic.runtime.migration] Running upgrade db0c65b146bd -> a99f2f7c195a, rewriting url from shortner with new format
INFO  [alembic.runtime.migration] Running upgrade a99f2f7c195a, bcf3126872fc -> d6db5a5cdb5d, empty message
INFO  [alembic.runtime.migration] Running upgrade d6db5a5cdb5d -> b318dfe5fb6c, adding verbose_name to druid column
INFO  [alembic.runtime.migration] Running upgrade d6db5a5cdb5d -> 732f1c06bcbf, add fetch values predicate
INFO  [alembic.runtime.migration] Running upgrade 732f1c06bcbf, b318dfe5fb6c -> ea033256294a, empty message
INFO  [alembic.runtime.migration] Running upgrade b318dfe5fb6c -> db527d8c4c78, Add verbose name to DruidCluster and Database
INFO  [alembic.runtime.migration] Running upgrade db527d8c4c78, ea033256294a -> 979c03af3341, empty message
INFO  [alembic.runtime.migration] Running upgrade 979c03af3341 -> a6c18f869a4e, query.start_running_time
INFO  [alembic.runtime.migration] Running upgrade a6c18f869a4e -> 2fcdcb35e487, saved_queries
INFO  [alembic.runtime.migration] Running upgrade 2fcdcb35e487 -> a65458420354, add_result_backend_time_logging
INFO  [alembic.runtime.migration] Running upgrade a65458420354 -> ca69c70ec99b, tracking_url
INFO  [alembic.runtime.migration] Running upgrade ca69c70ec99b -> a9c47e2c1547, add impersonate_user to dbs
INFO  [alembic.runtime.migration] Running upgrade ca69c70ec99b -> ddd6ebdd853b, annotations
INFO  [alembic.runtime.migration] Running upgrade a9c47e2c1547, ddd6ebdd853b -> d39b1e37131d, empty message
INFO  [alembic.runtime.migration] Running upgrade ca69c70ec99b -> 19a814813610, Adding metric warning_text
INFO  [alembic.runtime.migration] Running upgrade 19a814813610, a9c47e2c1547 -> 472d2f73dfd4, empty message
INFO  [alembic.runtime.migration] Running upgrade 472d2f73dfd4, d39b1e37131d -> f959a6652acd, empty message
INFO  [alembic.runtime.migration] Running upgrade f959a6652acd -> 4736ec66ce19, empty message
/usr/local/lib/python3.6/site-packages/sqlalchemy/dialects/sqlite/base.py:1842: SAWarning: WARNING: SQL-parsed foreign key constraint '('datasource_name', 'datasources', 'datasource_name')' could not be located in PRAGMA foreign_keys for table metrics
  "foreign_keys for table %s" % (sig, table_name)
INFO  [alembic.runtime.migration] Running upgrade 4736ec66ce19 -> 67a6ac9b727b, update_spatial_params
INFO  [alembic.runtime.migration] Running upgrade 67a6ac9b727b -> 21e88bc06c02
INFO  [alembic.runtime.migration] Running upgrade 21e88bc06c02 -> e866bd2d4976, smaller_grid
Revision ID: e866bd2d4976
Revises: 21e88bc06c02
Create Date: 2018-02-13 08:07:40.766277
INFO  [alembic.runtime.migration] Running upgrade e866bd2d4976 -> e68c4473c581, allow_multi_schema_metadata_fetch
INFO  [alembic.runtime.migration] Running upgrade e68c4473c581 -> f231d82b9b26, empty message
INFO  [alembic.runtime.migration] Running upgrade f231d82b9b26 -> bf706ae5eb46, cal_heatmap_metric_to_metrics
INFO  [alembic.runtime.migration] Running upgrade f231d82b9b26 -> 30bb17c0dc76, empty message
INFO  [alembic.runtime.migration] Running upgrade 30bb17c0dc76, bf706ae5eb46 -> c9495751e314, empty message
INFO  [alembic.runtime.migration] Running upgrade f231d82b9b26 -> 130915240929, is_sqllab_view
INFO  [alembic.runtime.migration] Running upgrade 130915240929, c9495751e314 -> 5ccf602336a0, empty message
INFO  [alembic.runtime.migration] Running upgrade 5ccf602336a0 -> e502db2af7be, add template_params to tables
INFO  [alembic.runtime.migration] Running upgrade e502db2af7be -> c5756bec8b47, Time grain SQLA
INFO  [alembic.runtime.migration] Running upgrade c5756bec8b47 -> afb7730f6a9c, remove empty filters
INFO  [alembic.runtime.migration] Running upgrade afb7730f6a9c -> 80a67c5192fa, single pie chart metric
INFO  [alembic.runtime.migration] Running upgrade 80a67c5192fa -> bddc498dd179, adhoc filters
INFO  [alembic.runtime.migration] Running upgrade bddc498dd179 -> 3dda56f1c4c6, Migrate num_period_compare and period_ratio_type
INFO  [alembic.runtime.migration] Running upgrade 3dda56f1c4c6 -> 1d9e835a84f9, empty message
INFO  [alembic.runtime.migration] Running upgrade bddc498dd179 -> 4451805bbaa1, remove double percents
INFO  [alembic.runtime.migration] Running upgrade 4451805bbaa1, 1d9e835a84f9 -> 705732c70154, empty message
INFO  [alembic.runtime.migration] Running upgrade 4451805bbaa1, 1d9e835a84f9 -> fc480c87706c, empty message
INFO  [alembic.runtime.migration] Running upgrade fc480c87706c -> bebcf3fed1fe, Migrate dashboard position_json data from V1 to V2
INFO  [alembic.runtime.migration] Running upgrade bebcf3fed1fe, 705732c70154 -> ec1f88a35cc6, empty message
INFO  [alembic.runtime.migration] Running upgrade 4451805bbaa1, 1d9e835a84f9 -> e3970889f38e, empty message
INFO  [alembic.runtime.migration] Running upgrade 705732c70154, e3970889f38e -> 46ba6aaaac97, empty message
INFO  [alembic.runtime.migration] Running upgrade 46ba6aaaac97, ec1f88a35cc6 -> c18bd4186f15, empty message
INFO  [alembic.runtime.migration] Running upgrade c18bd4186f15 -> 7fcdcde0761c, Reduce position_json size by remove extra space and component id prefix
INFO  [alembic.runtime.migration] Running upgrade 7fcdcde0761c -> 0c5070e96b57, add user attributes table
INFO  [alembic.runtime.migration] Running upgrade 0c5070e96b57 -> 1a1d627ebd8e, position_json
INFO  [alembic.runtime.migration] Running upgrade 1a1d627ebd8e -> 55e910a74826, add_metadata_column_to_annotation_model.py
INFO  [alembic.runtime.migration] Running upgrade 55e910a74826 -> 4ce8df208545, empty message
INFO  [alembic.runtime.migration] Running upgrade 4ce8df208545 -> 46f444d8b9b7, remove_coordinator_from_druid_cluster_model.py
INFO  [alembic.runtime.migration] Running upgrade 46f444d8b9b7 -> a61b40f9f57f, remove allow_run_sync
INFO  [alembic.runtime.migration] Running upgrade a61b40f9f57f -> 6c7537a6004a, models for email reports
INFO  [alembic.runtime.migration] Running upgrade 6c7537a6004a -> 3e1b21cd94a4, change_owner_to_m2m_relation_on_datasources.py
INFO  [alembic.runtime.migration] Running upgrade 6c7537a6004a -> cefabc8f7d38, Increase size of name column in ab_view_menu
INFO  [alembic.runtime.migration] Running upgrade 55e910a74826 -> 0b1f1ab473c0, Add extra column to Query
INFO  [alembic.runtime.migration] Running upgrade 0b1f1ab473c0, cefabc8f7d38, 3e1b21cd94a4 -> de021a1ca60d, empty message
INFO  [alembic.runtime.migration] Running upgrade de021a1ca60d -> fb13d49b72f9, better_filters
INFO  [alembic.runtime.migration] Running upgrade fb13d49b72f9 -> a33a03f16c4a, Add extra column to SavedQuery
INFO  [alembic.runtime.migration] Running upgrade 4451805bbaa1, 1d9e835a84f9 -> c829ff0b37d0, empty message
INFO  [alembic.runtime.migration] Running upgrade c829ff0b37d0 -> 7467e77870e4, remove_aggs
INFO  [alembic.runtime.migration] Running upgrade 7467e77870e4, de021a1ca60d -> fbd55e0f83eb, empty message
INFO  [alembic.runtime.migration] Running upgrade fbd55e0f83eb, fb13d49b72f9 -> 8b70aa3d0f87, empty message
INFO  [alembic.runtime.migration] Running upgrade 8b70aa3d0f87, a33a03f16c4a -> 18dc26817ad2, empty message
INFO  [alembic.runtime.migration] Running upgrade 18dc26817ad2 -> c617da68de7d, form nullable
INFO  [alembic.runtime.migration] Running upgrade c617da68de7d -> c82ee8a39623, Add implicit tags
INFO  [alembic.runtime.migration] Running upgrade 18dc26817ad2 -> e553e78e90c5, add_druid_auth_py.py
INFO  [alembic.runtime.migration] Running upgrade e553e78e90c5, c82ee8a39623 -> 45e7da7cfeba, empty message
INFO  [alembic.runtime.migration] Running upgrade 45e7da7cfeba -> 80aa3f04bc82, Add Parent ids in dashboard layout metadata
INFO  [alembic.runtime.migration] Running upgrade 80aa3f04bc82 -> d94d33dbe938, form strip
INFO  [alembic.runtime.migration] Running upgrade d94d33dbe938 -> 937d04c16b64, update datasources
INFO  [alembic.runtime.migration] Running upgrade 937d04c16b64 -> 7f2635b51f5d, update base columns
INFO  [alembic.runtime.migration] Running upgrade 7f2635b51f5d -> e9df189e5c7e, update base metrics
INFO  [alembic.runtime.migration] Running upgrade e9df189e5c7e -> afc69274c25a, update the sql, select_sql, and executed_sql columns in the
   query table in mysql dbs to be long text columns
INFO  [alembic.runtime.migration] Running upgrade afc69274c25a -> d7c1a0d6f2da, Remove limit used from query model
INFO  [alembic.runtime.migration] Running upgrade d7c1a0d6f2da -> ab8c66efdd01, resample
INFO  [alembic.runtime.migration] Running upgrade ab8c66efdd01 -> b4a38aa87893, deprecate database expression
INFO  [alembic.runtime.migration] Running upgrade b4a38aa87893 -> d6ffdf31bdd4, Add published column to dashboards
INFO  [alembic.runtime.migration] Running upgrade d6ffdf31bdd4 -> 190188938582, Remove duplicated entries in dashboard_slices table and add unique constraint
INFO  [alembic.runtime.migration] Running upgrade 190188938582 -> def97f26fdfb, Add index to tagged_object
INFO  [alembic.runtime.migration] Running upgrade def97f26fdfb -> 11c737c17cc6, deprecate_restricted_metrics
INFO  [alembic.runtime.migration] Running upgrade 11c737c17cc6 -> 258b5280a45e, form strip leading and trailing whitespace
INFO  [alembic.runtime.migration] Running upgrade 258b5280a45e -> 1495eb914ad3, time range
INFO  [alembic.runtime.migration] Running upgrade 1495eb914ad3 -> b6fa807eac07, make_names_non_nullable
```
- superset初始化（docker exec -it 容器ID superset init）
```
macbook-pro-6:docker-superset tanxinzheng$ docker exec -it 40616da9fbce superset init
/usr/local/lib/python3.6/site-packages/psycopg2/__init__.py:144: UserWarning: The psycopg2 wheel package will be renamed from release 2.8; in order to keep installing from binary please use "pip install psycopg2-binary" instead. For details see: <http://initd.org/psycopg/docs/install.html#binary-install-from-pypi>.
  """)
2020-04-14 14:52:25,439:INFO:root:logging was configured successfully
2020-04-14 14:52:25,573:INFO:root:Configured event logger of type <class 'superset.utils.log.DBEventLogger'>
2020-04-14 14:52:25,877:DEBUG:asyncio:Using selector: EpollSelector
2020-04-14 14:52:26,765:INFO:root:Creating database reference for examples
2020-04-14 14:52:35,695:INFO:root:Syncing role definition
2020-04-14 14:52:35,758:INFO:root:Syncing Admin perms
2020-04-14 14:52:35,840:INFO:root:Syncing Alpha perms
2020-04-14 14:52:36,164:INFO:root:Syncing Gamma perms
2020-04-14 14:52:36,478:INFO:root:Syncing granter perms
2020-04-14 14:52:36,746:INFO:root:Syncing sql_lab perms
2020-04-14 14:52:37,045:INFO:root:Fetching a set of all perms to lookup which ones are missing
2020-04-14 14:52:37,112:INFO:root:Creating missing datasource permissions.
2020-04-14 14:52:37,117:INFO:root:Creating missing database permissions.
2020-04-14 14:52:37,137:INFO:root:Creating missing metrics permissions
2020-04-14 14:52:37,141:INFO:root:Cleaning faulty perms
```
- 开启superset服务（docker exec -it 容器ID superset runserver）

