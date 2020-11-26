# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_26_133514) do

  create_table "ACT_EVT_LOG", primary_key: "LOG_NR_", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.timestamp "TIME_STAMP_", precision: 3, default: -> { "CURRENT_TIMESTAMP(3)" }, null: false
    t.string "USER_ID_"
    t.binary "DATA_", size: :long
    t.string "LOCK_OWNER_"
    t.timestamp "LOCK_TIME_", precision: 3
    t.integer "IS_PROCESSED_", limit: 1, default: 0
  end

  create_table "ACT_GE_BYTEARRAY", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "NAME_"
    t.string "DEPLOYMENT_ID_", limit: 64
    t.binary "BYTES_", size: :long
    t.integer "GENERATED_", limit: 1
  end

  create_table "ACT_GE_PROPERTY", primary_key: "NAME_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "VALUE_", limit: 300
    t.integer "REV_"
  end

  create_table "ACT_HI_ACTINST", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.string "PROC_INST_ID_", limit: 64, null: false
    t.string "EXECUTION_ID_", limit: 64, null: false
    t.string "ACT_ID_", null: false
    t.string "TASK_ID_", limit: 64
    t.string "CALL_PROC_INST_ID_", limit: 64
    t.string "ACT_NAME_"
    t.string "ACT_TYPE_", null: false
    t.string "ASSIGNEE_"
    t.datetime "START_TIME_", precision: 3, null: false
    t.datetime "END_TIME_", precision: 3
    t.bigint "DURATION_"
    t.string "DELETE_REASON_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["END_TIME_"], name: "ACT_IDX_HI_ACT_INST_END"
    t.index ["EXECUTION_ID_", "ACT_ID_"], name: "ACT_IDX_HI_ACT_INST_EXEC"
    t.index ["PROC_INST_ID_", "ACT_ID_"], name: "ACT_IDX_HI_ACT_INST_PROCINST"
    t.index ["START_TIME_"], name: "ACT_IDX_HI_ACT_INST_START"
  end

  create_table "ACT_HI_ATTACHMENT", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "USER_ID_"
    t.string "NAME_"
    t.string "DESCRIPTION_", limit: 4000
    t.string "TYPE_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "URL_", limit: 4000
    t.string "CONTENT_ID_", limit: 64
    t.datetime "TIME_", precision: 3
  end

  create_table "ACT_HI_COMMENT", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_"
    t.datetime "TIME_", precision: 3, null: false
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "ACTION_"
    t.string "MESSAGE_", limit: 4000
    t.binary "FULL_MSG_", size: :long
  end

  create_table "ACT_HI_DETAIL", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_", null: false
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "ACT_INST_ID_", limit: 64
    t.string "NAME_", null: false
    t.string "VAR_TYPE_"
    t.integer "REV_"
    t.datetime "TIME_", precision: 3, null: false
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.index ["ACT_INST_ID_"], name: "ACT_IDX_HI_DETAIL_ACT_INST"
    t.index ["NAME_"], name: "ACT_IDX_HI_DETAIL_NAME"
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_DETAIL_PROC_INST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_DETAIL_TASK_ID"
    t.index ["TIME_"], name: "ACT_IDX_HI_DETAIL_TIME"
  end

  create_table "ACT_HI_IDENTITYLINK", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "GROUP_ID_"
    t.string "TYPE_"
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_IDENT_LNK_PROCINST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_IDENT_LNK_TASK"
    t.index ["USER_ID_"], name: "ACT_IDX_HI_IDENT_LNK_USER"
  end

  create_table "ACT_HI_PROCINST", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_INST_ID_", limit: 64, null: false
    t.string "BUSINESS_KEY_"
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.datetime "START_TIME_", precision: 3, null: false
    t.datetime "END_TIME_", precision: 3
    t.bigint "DURATION_"
    t.string "START_USER_ID_"
    t.string "START_ACT_ID_"
    t.string "END_ACT_ID_"
    t.string "SUPER_PROCESS_INSTANCE_ID_", limit: 64
    t.string "DELETE_REASON_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.string "NAME_"
    t.index ["BUSINESS_KEY_"], name: "ACT_IDX_HI_PRO_I_BUSKEY"
    t.index ["END_TIME_"], name: "ACT_IDX_HI_PRO_INST_END"
    t.index ["PROC_INST_ID_"], name: "PROC_INST_ID_", unique: true
  end

  create_table "ACT_HI_TASKINST", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64
    t.string "TASK_DEF_KEY_"
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "NAME_"
    t.string "PARENT_TASK_ID_", limit: 64
    t.string "DESCRIPTION_", limit: 4000
    t.string "OWNER_"
    t.string "ASSIGNEE_"
    t.datetime "START_TIME_", precision: 3, null: false
    t.datetime "CLAIM_TIME_", precision: 3
    t.datetime "END_TIME_", precision: 3
    t.bigint "DURATION_"
    t.string "DELETE_REASON_", limit: 4000
    t.integer "PRIORITY_"
    t.datetime "DUE_DATE_", precision: 3
    t.string "FORM_KEY_"
    t.string "CATEGORY_"
    t.string "TENANT_ID_", default: ""
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_TASK_INST_PROCINST"
  end

  create_table "ACT_HI_VARINST", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "NAME_", null: false
    t.string "VAR_TYPE_", limit: 100
    t.integer "REV_"
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.datetime "CREATE_TIME_", precision: 3
    t.datetime "LAST_UPDATED_TIME_", precision: 3
    t.index ["NAME_", "VAR_TYPE_"], name: "ACT_IDX_HI_PROCVAR_NAME_TYPE"
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_PROCVAR_PROC_INST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_PROCVAR_TASK_ID"
  end

  create_table "ACT_PROCDEF_INFO", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.integer "REV_"
    t.string "INFO_JSON_ID_", limit: 64
    t.index ["PROC_DEF_ID_"], name: "ACT_IDX_INFO_PROCDEF"
    t.index ["PROC_DEF_ID_"], name: "ACT_UNIQ_INFO_PROCDEF", unique: true
  end

  create_table "ACT_RE_DEPLOYMENT", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "NAME_"
    t.string "CATEGORY_"
    t.string "KEY_"
    t.string "TENANT_ID_", default: ""
    t.timestamp "DEPLOY_TIME_", precision: 3
    t.string "ENGINE_VERSION_"
  end

  create_table "ACT_RE_MODEL", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "NAME_"
    t.string "KEY_"
    t.string "CATEGORY_"
    t.timestamp "CREATE_TIME_", precision: 3
    t.timestamp "LAST_UPDATE_TIME_", precision: 3
    t.integer "VERSION_"
    t.string "META_INFO_", limit: 4000
    t.string "DEPLOYMENT_ID_", limit: 64
    t.string "EDITOR_SOURCE_VALUE_ID_", limit: 64
    t.string "EDITOR_SOURCE_EXTRA_VALUE_ID_", limit: 64
    t.string "TENANT_ID_", default: ""
  end

  create_table "ACT_RE_PROCDEF", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "CATEGORY_"
    t.string "NAME_"
    t.string "KEY_", null: false
    t.integer "VERSION_", null: false
    t.string "DEPLOYMENT_ID_", limit: 64
    t.string "RESOURCE_NAME_", limit: 4000
    t.string "DGRM_RESOURCE_NAME_", limit: 4000
    t.string "DESCRIPTION_", limit: 4000
    t.integer "HAS_START_FORM_KEY_", limit: 1
    t.integer "HAS_GRAPHICAL_NOTATION_", limit: 1
    t.integer "SUSPENSION_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "ENGINE_VERSION_"
    t.index ["KEY_", "VERSION_", "TENANT_ID_"], name: "ACT_UNIQ_PROCDEF", unique: true
  end

  create_table "ACT_RU_DEADLETTER_JOB", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_", precision: 3
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
  end

  create_table "ACT_RU_EVENT_SUBSCR", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "EVENT_TYPE_", null: false
    t.string "EVENT_NAME_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "ACTIVITY_ID_", limit: 64
    t.string "CONFIGURATION_"
    t.timestamp "CREATED_", precision: 3, default: -> { "CURRENT_TIMESTAMP(3)" }, null: false
    t.string "PROC_DEF_ID_", limit: 64
    t.string "TENANT_ID_", default: ""
    t.index ["CONFIGURATION_"], name: "ACT_IDX_EVENT_SUBSCR_CONFIG_"
  end

  create_table "ACT_RU_EXECUTION", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "PROC_INST_ID_", limit: 64
    t.string "BUSINESS_KEY_"
    t.string "PARENT_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "SUPER_EXEC_", limit: 64
    t.string "ROOT_PROC_INST_ID_", limit: 64
    t.string "ACT_ID_"
    t.integer "IS_ACTIVE_", limit: 1
    t.integer "IS_CONCURRENT_", limit: 1
    t.integer "IS_SCOPE_", limit: 1
    t.integer "IS_EVENT_SCOPE_", limit: 1
    t.integer "IS_MI_ROOT_", limit: 1
    t.integer "SUSPENSION_STATE_"
    t.integer "CACHED_ENT_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "NAME_"
    t.datetime "START_TIME_", precision: 3
    t.string "START_USER_ID_"
    t.timestamp "LOCK_TIME_", precision: 3
    t.integer "IS_COUNT_ENABLED_", limit: 1
    t.integer "EVT_SUBSCR_COUNT_"
    t.integer "TASK_COUNT_"
    t.integer "JOB_COUNT_"
    t.integer "TIMER_JOB_COUNT_"
    t.integer "SUSP_JOB_COUNT_"
    t.integer "DEADLETTER_JOB_COUNT_"
    t.integer "VAR_COUNT_"
    t.integer "ID_LINK_COUNT_"
    t.index ["BUSINESS_KEY_"], name: "ACT_IDX_EXEC_BUSKEY"
    t.index ["ROOT_PROC_INST_ID_"], name: "ACT_IDC_EXEC_ROOT"
  end

  create_table "ACT_RU_IDENTITYLINK", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "GROUP_ID_"
    t.string "TYPE_"
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.index ["GROUP_ID_"], name: "ACT_IDX_IDENT_LNK_GROUP"
    t.index ["PROC_DEF_ID_"], name: "ACT_IDX_ATHRZ_PROCEDEF"
    t.index ["USER_ID_"], name: "ACT_IDX_IDENT_LNK_USER"
  end

  create_table "ACT_RU_JOB", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.timestamp "LOCK_EXP_TIME_", precision: 3
    t.string "LOCK_OWNER_"
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_", precision: 3
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
  end

  create_table "ACT_RU_SUSPENDED_JOB", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_", precision: 3
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
  end

  create_table "ACT_RU_TASK", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "NAME_"
    t.string "PARENT_TASK_ID_", limit: 64
    t.string "DESCRIPTION_", limit: 4000
    t.string "TASK_DEF_KEY_"
    t.string "OWNER_"
    t.string "ASSIGNEE_"
    t.string "DELEGATION_", limit: 64
    t.integer "PRIORITY_"
    t.timestamp "CREATE_TIME_", precision: 3
    t.datetime "DUE_DATE_", precision: 3
    t.string "CATEGORY_"
    t.integer "SUSPENSION_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "FORM_KEY_"
    t.datetime "CLAIM_TIME_", precision: 3
    t.index ["CREATE_TIME_"], name: "ACT_IDX_TASK_CREATE"
  end

  create_table "ACT_RU_TIMER_JOB", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.timestamp "LOCK_EXP_TIME_", precision: 3
    t.string "LOCK_OWNER_"
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_", precision: 3
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
  end

  create_table "ACT_RU_VARIABLE", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.string "NAME_", null: false
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.index ["TASK_ID_"], name: "ACT_IDX_VARIABLE_TASK_ID"
  end

  create_table "QRTZ_BLOB_TRIGGERS", primary_key: ["sched_name", "trigger_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.binary "blob_data"
  end

  create_table "QRTZ_CALENDARS", primary_key: ["sched_name", "calendar_name"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "calendar_name", limit: 200, null: false
    t.binary "calendar", null: false
  end

  create_table "QRTZ_CRON_TRIGGERS", primary_key: ["sched_name", "trigger_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.string "cron_expression", limit: 200, null: false
    t.string "time_zone_id", limit: 80
  end

  create_table "QRTZ_FIRED_TRIGGERS", primary_key: ["sched_name", "entry_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "entry_id", limit: 95, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.string "instance_name", limit: 200, null: false
    t.bigint "fired_time", null: false
    t.bigint "sched_time", null: false
    t.integer "priority", null: false
    t.string "state", limit: 16, null: false
    t.string "job_name", limit: 200
    t.string "job_group", limit: 200
    t.string "is_nonconcurrent", limit: 1
    t.string "requests_recovery", limit: 1
  end

  create_table "QRTZ_JOB_DETAILS", primary_key: ["sched_name", "job_name", "job_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "job_name", limit: 200, null: false
    t.string "job_group", limit: 200, null: false
    t.string "description", limit: 250
    t.string "job_class_name", limit: 250, null: false
    t.string "is_durable", limit: 1, null: false
    t.string "is_nonconcurrent", limit: 1, null: false
    t.string "is_update_data", limit: 1, null: false
    t.string "requests_recovery", limit: 1, null: false
    t.binary "job_data"
  end

  create_table "QRTZ_LOCKS", primary_key: ["sched_name", "lock_name"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "lock_name", limit: 40, null: false
  end

  create_table "QRTZ_PAUSED_TRIGGER_GRPS", primary_key: ["sched_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_group", limit: 200, null: false
  end

  create_table "QRTZ_SCHEDULER_STATE", primary_key: ["sched_name", "instance_name"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "instance_name", limit: 200, null: false
    t.bigint "last_checkin_time", null: false
    t.bigint "checkin_interval", null: false
  end

  create_table "QRTZ_SIMPLE_TRIGGERS", primary_key: ["sched_name", "trigger_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.bigint "repeat_count", null: false
    t.bigint "repeat_interval", null: false
    t.bigint "times_triggered", null: false
  end

  create_table "QRTZ_SIMPROP_TRIGGERS", primary_key: ["sched_name", "trigger_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.string "str_prop_1", limit: 512
    t.string "str_prop_2", limit: 512
    t.string "str_prop_3", limit: 512
    t.integer "int_prop_1"
    t.integer "int_prop_2"
    t.bigint "long_prop_1"
    t.bigint "long_prop_2"
    t.decimal "dec_prop_1", precision: 13, scale: 4
    t.decimal "dec_prop_2", precision: 13, scale: 4
    t.string "bool_prop_1", limit: 1
    t.string "bool_prop_2", limit: 1
  end

  create_table "QRTZ_TRIGGERS", primary_key: ["sched_name", "trigger_name", "trigger_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sched_name", limit: 120, null: false
    t.string "trigger_name", limit: 200, null: false
    t.string "trigger_group", limit: 200, null: false
    t.string "job_name", limit: 200, null: false
    t.string "job_group", limit: 200, null: false
    t.string "description", limit: 250
    t.bigint "next_fire_time"
    t.bigint "prev_fire_time"
    t.integer "priority"
    t.string "trigger_state", limit: 16, null: false
    t.string "trigger_type", limit: 8, null: false
    t.bigint "start_time", null: false
    t.bigint "end_time"
    t.string "calendar_name", limit: 200
    t.integer "misfire_instr", limit: 2
    t.binary "job_data"
    t.index ["sched_name", "job_name", "job_group"], name: "sched_name"
  end

  create_table "act_evt_log", primary_key: "LOG_NR_", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.timestamp "TIME_STAMP_", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "USER_ID_"
    t.binary "DATA_", size: :long
    t.string "LOCK_OWNER_"
    t.timestamp "LOCK_TIME_"
    t.integer "IS_PROCESSED_", limit: 1, default: 0
  end

  create_table "act_ge_bytearray", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "NAME_"
    t.string "DEPLOYMENT_ID_", limit: 64
    t.binary "BYTES_", size: :long
    t.integer "GENERATED_", limit: 1
    t.index ["DEPLOYMENT_ID_"], name: "ACT_FK_BYTEARR_DEPL"
  end

  create_table "act_ge_property", primary_key: "NAME_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "VALUE_", limit: 300
    t.integer "REV_"
  end

  create_table "act_hi_actinst", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.string "PROC_INST_ID_", limit: 64, null: false
    t.string "EXECUTION_ID_", limit: 64, null: false
    t.string "ACT_ID_", null: false
    t.string "TASK_ID_", limit: 64
    t.string "CALL_PROC_INST_ID_", limit: 64
    t.string "ACT_NAME_"
    t.string "ACT_TYPE_", null: false
    t.string "ASSIGNEE_"
    t.datetime "START_TIME_", null: false
    t.datetime "END_TIME_"
    t.bigint "DURATION_"
    t.string "DELETE_REASON_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["END_TIME_"], name: "ACT_IDX_HI_ACT_INST_END"
    t.index ["EXECUTION_ID_", "ACT_ID_"], name: "ACT_IDX_HI_ACT_INST_EXEC"
    t.index ["PROC_INST_ID_", "ACT_ID_"], name: "ACT_IDX_HI_ACT_INST_PROCINST"
    t.index ["START_TIME_"], name: "ACT_IDX_HI_ACT_INST_START"
  end

  create_table "act_hi_attachment", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "USER_ID_"
    t.string "NAME_"
    t.string "DESCRIPTION_", limit: 4000
    t.string "TYPE_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "URL_", limit: 4000
    t.string "CONTENT_ID_", limit: 64
    t.datetime "TIME_"
  end

  create_table "act_hi_comment", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_"
    t.datetime "TIME_", null: false
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "ACTION_"
    t.string "MESSAGE_", limit: 4000
    t.binary "FULL_MSG_", size: :long
  end

  create_table "act_hi_detail", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "TYPE_", null: false
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "ACT_INST_ID_", limit: 64
    t.string "NAME_", null: false
    t.string "VAR_TYPE_"
    t.integer "REV_"
    t.datetime "TIME_", null: false
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.index ["ACT_INST_ID_"], name: "ACT_IDX_HI_DETAIL_ACT_INST"
    t.index ["NAME_"], name: "ACT_IDX_HI_DETAIL_NAME"
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_DETAIL_PROC_INST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_DETAIL_TASK_ID"
    t.index ["TIME_"], name: "ACT_IDX_HI_DETAIL_TIME"
  end

  create_table "act_hi_identitylink", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "GROUP_ID_"
    t.string "TYPE_"
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_IDENT_LNK_PROCINST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_IDENT_LNK_TASK"
    t.index ["USER_ID_"], name: "ACT_IDX_HI_IDENT_LNK_USER"
  end

  create_table "act_hi_procinst", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_INST_ID_", limit: 64, null: false
    t.string "BUSINESS_KEY_"
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.datetime "START_TIME_", null: false
    t.datetime "END_TIME_"
    t.bigint "DURATION_"
    t.string "START_USER_ID_"
    t.string "START_ACT_ID_"
    t.string "END_ACT_ID_"
    t.string "SUPER_PROCESS_INSTANCE_ID_", limit: 64
    t.string "DELETE_REASON_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.string "NAME_"
    t.index ["BUSINESS_KEY_"], name: "ACT_IDX_HI_PRO_I_BUSKEY"
    t.index ["END_TIME_"], name: "ACT_IDX_HI_PRO_INST_END"
    t.index ["PROC_INST_ID_"], name: "PROC_INST_ID_", unique: true
  end

  create_table "act_hi_taskinst", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64
    t.string "TASK_DEF_KEY_"
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "NAME_"
    t.string "PARENT_TASK_ID_", limit: 64
    t.string "DESCRIPTION_", limit: 4000
    t.string "OWNER_"
    t.string "ASSIGNEE_"
    t.datetime "START_TIME_", null: false
    t.datetime "CLAIM_TIME_"
    t.datetime "END_TIME_"
    t.bigint "DURATION_"
    t.string "DELETE_REASON_", limit: 4000
    t.integer "PRIORITY_"
    t.datetime "DUE_DATE_"
    t.string "FORM_KEY_"
    t.string "CATEGORY_"
    t.string "TENANT_ID_", default: ""
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_TASK_INST_PROCINST"
  end

  create_table "act_hi_varinst", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_INST_ID_", limit: 64
    t.string "EXECUTION_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "NAME_", null: false
    t.string "VAR_TYPE_", limit: 100
    t.integer "REV_"
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.datetime "CREATE_TIME_"
    t.datetime "LAST_UPDATED_TIME_"
    t.index ["NAME_", "VAR_TYPE_"], name: "ACT_IDX_HI_PROCVAR_NAME_TYPE"
    t.index ["PROC_INST_ID_"], name: "ACT_IDX_HI_PROCVAR_PROC_INST"
    t.index ["TASK_ID_"], name: "ACT_IDX_HI_PROCVAR_TASK_ID"
  end

  create_table "act_id_group", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "NAME_"
    t.string "TYPE_"
  end

  create_table "act_id_info", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "USER_ID_", limit: 64
    t.string "TYPE_", limit: 64
    t.string "KEY_"
    t.string "VALUE_"
    t.binary "PASSWORD_", size: :long
    t.string "PARENT_ID_"
  end

  create_table "act_id_membership", primary_key: ["USER_ID_", "GROUP_ID_"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "USER_ID_", limit: 64, default: "", null: false
    t.string "GROUP_ID_", limit: 64, default: "", null: false
    t.index ["GROUP_ID_"], name: "ACT_FK_MEMB_GROUP"
  end

  create_table "act_id_user", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "FIRST_"
    t.string "LAST_"
    t.string "EMAIL_"
    t.string "PWD_"
    t.string "PICTURE_ID_", limit: 64
  end

  create_table "act_procdef_info", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "PROC_DEF_ID_", limit: 64, null: false
    t.integer "REV_"
    t.string "INFO_JSON_ID_", limit: 64
    t.index ["INFO_JSON_ID_"], name: "ACT_FK_INFO_JSON_BA"
    t.index ["PROC_DEF_ID_"], name: "ACT_IDX_INFO_PROCDEF"
    t.index ["PROC_DEF_ID_"], name: "ACT_UNIQ_INFO_PROCDEF", unique: true
  end

  create_table "act_re_deployment", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.string "NAME_"
    t.string "CATEGORY_"
    t.string "KEY_"
    t.string "TENANT_ID_", default: ""
    t.timestamp "DEPLOY_TIME_"
    t.string "ENGINE_VERSION_"
  end

  create_table "act_re_model", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "NAME_"
    t.string "KEY_"
    t.string "CATEGORY_"
    t.timestamp "CREATE_TIME_"
    t.timestamp "LAST_UPDATE_TIME_"
    t.integer "VERSION_"
    t.string "META_INFO_", limit: 4000
    t.string "DEPLOYMENT_ID_", limit: 64
    t.string "EDITOR_SOURCE_VALUE_ID_", limit: 64
    t.string "EDITOR_SOURCE_EXTRA_VALUE_ID_", limit: 64
    t.string "TENANT_ID_", default: ""
    t.index ["DEPLOYMENT_ID_"], name: "ACT_FK_MODEL_DEPLOYMENT"
    t.index ["EDITOR_SOURCE_EXTRA_VALUE_ID_"], name: "ACT_FK_MODEL_SOURCE_EXTRA"
    t.index ["EDITOR_SOURCE_VALUE_ID_"], name: "ACT_FK_MODEL_SOURCE"
  end

  create_table "act_re_procdef", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "CATEGORY_"
    t.string "NAME_"
    t.string "KEY_", null: false
    t.integer "VERSION_", null: false
    t.string "DEPLOYMENT_ID_", limit: 64
    t.string "RESOURCE_NAME_", limit: 4000
    t.string "DGRM_RESOURCE_NAME_", limit: 4000
    t.string "DESCRIPTION_", limit: 4000
    t.integer "HAS_START_FORM_KEY_", limit: 1
    t.integer "HAS_GRAPHICAL_NOTATION_", limit: 1
    t.integer "SUSPENSION_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "ENGINE_VERSION_"
    t.index ["KEY_", "VERSION_", "TENANT_ID_"], name: "ACT_UNIQ_PROCDEF", unique: true
  end

  create_table "act_ru_deadletter_job", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_"
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["EXCEPTION_STACK_ID_"], name: "ACT_FK_DEADLETTER_JOB_EXCEPTION"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_DEADLETTER_JOB_EXECUTION"
    t.index ["PROCESS_INSTANCE_ID_"], name: "ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_DEADLETTER_JOB_PROC_DEF"
  end

  create_table "act_ru_event_subscr", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "EVENT_TYPE_", null: false
    t.string "EVENT_NAME_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "ACTIVITY_ID_", limit: 64
    t.string "CONFIGURATION_"
    t.timestamp "CREATED_", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "PROC_DEF_ID_", limit: 64
    t.string "TENANT_ID_", default: ""
    t.index ["CONFIGURATION_"], name: "ACT_IDX_EVENT_SUBSCR_CONFIG_"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_EVENT_EXEC"
  end

  create_table "act_ru_execution", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "PROC_INST_ID_", limit: 64
    t.string "BUSINESS_KEY_"
    t.string "PARENT_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "SUPER_EXEC_", limit: 64
    t.string "ROOT_PROC_INST_ID_", limit: 64
    t.string "ACT_ID_"
    t.integer "IS_ACTIVE_", limit: 1
    t.integer "IS_CONCURRENT_", limit: 1
    t.integer "IS_SCOPE_", limit: 1
    t.integer "IS_EVENT_SCOPE_", limit: 1
    t.integer "IS_MI_ROOT_", limit: 1
    t.integer "SUSPENSION_STATE_"
    t.integer "CACHED_ENT_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "NAME_"
    t.datetime "START_TIME_"
    t.string "START_USER_ID_"
    t.timestamp "LOCK_TIME_"
    t.integer "IS_COUNT_ENABLED_", limit: 1
    t.integer "EVT_SUBSCR_COUNT_"
    t.integer "TASK_COUNT_"
    t.integer "JOB_COUNT_"
    t.integer "TIMER_JOB_COUNT_"
    t.integer "SUSP_JOB_COUNT_"
    t.integer "DEADLETTER_JOB_COUNT_"
    t.integer "VAR_COUNT_"
    t.integer "ID_LINK_COUNT_"
    t.index ["BUSINESS_KEY_"], name: "ACT_IDX_EXEC_BUSKEY"
    t.index ["PARENT_ID_"], name: "ACT_FK_EXE_PARENT"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_EXE_PROCDEF"
    t.index ["PROC_INST_ID_"], name: "ACT_FK_EXE_PROCINST"
    t.index ["ROOT_PROC_INST_ID_"], name: "ACT_IDC_EXEC_ROOT"
    t.index ["SUPER_EXEC_"], name: "ACT_FK_EXE_SUPER"
  end

  create_table "act_ru_identitylink", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "GROUP_ID_"
    t.string "TYPE_"
    t.string "USER_ID_"
    t.string "TASK_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.index ["GROUP_ID_"], name: "ACT_IDX_IDENT_LNK_GROUP"
    t.index ["PROC_DEF_ID_"], name: "ACT_IDX_ATHRZ_PROCEDEF"
    t.index ["PROC_INST_ID_"], name: "ACT_FK_IDL_PROCINST"
    t.index ["TASK_ID_"], name: "ACT_FK_TSKASS_TASK"
    t.index ["USER_ID_"], name: "ACT_IDX_IDENT_LNK_USER"
  end

  create_table "act_ru_job", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.timestamp "LOCK_EXP_TIME_"
    t.string "LOCK_OWNER_"
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_"
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["EXCEPTION_STACK_ID_"], name: "ACT_FK_JOB_EXCEPTION"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_JOB_EXECUTION"
    t.index ["PROCESS_INSTANCE_ID_"], name: "ACT_FK_JOB_PROCESS_INSTANCE"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_JOB_PROC_DEF"
  end

  create_table "act_ru_suspended_job", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_"
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["EXCEPTION_STACK_ID_"], name: "ACT_FK_SUSPENDED_JOB_EXCEPTION"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_SUSPENDED_JOB_EXECUTION"
    t.index ["PROCESS_INSTANCE_ID_"], name: "ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_SUSPENDED_JOB_PROC_DEF"
  end

  create_table "act_ru_task", primary_key: "ID_", id: :string, limit: 64, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.string "NAME_"
    t.string "PARENT_TASK_ID_", limit: 64
    t.string "DESCRIPTION_", limit: 4000
    t.string "TASK_DEF_KEY_"
    t.string "OWNER_"
    t.string "ASSIGNEE_"
    t.string "DELEGATION_", limit: 64
    t.integer "PRIORITY_"
    t.timestamp "CREATE_TIME_"
    t.datetime "DUE_DATE_"
    t.string "CATEGORY_"
    t.integer "SUSPENSION_STATE_"
    t.string "TENANT_ID_", default: ""
    t.string "FORM_KEY_"
    t.datetime "CLAIM_TIME_"
    t.index ["CREATE_TIME_"], name: "ACT_IDX_TASK_CREATE"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_TASK_EXE"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_TASK_PROCDEF"
    t.index ["PROC_INST_ID_"], name: "ACT_FK_TASK_PROCINST"
  end

  create_table "act_ru_timer_job", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.timestamp "LOCK_EXP_TIME_"
    t.string "LOCK_OWNER_"
    t.boolean "EXCLUSIVE_"
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROCESS_INSTANCE_ID_", limit: 64
    t.string "PROC_DEF_ID_", limit: 64
    t.integer "RETRIES_"
    t.string "EXCEPTION_STACK_ID_", limit: 64
    t.string "EXCEPTION_MSG_", limit: 4000
    t.timestamp "DUEDATE_"
    t.string "REPEAT_"
    t.string "HANDLER_TYPE_"
    t.string "HANDLER_CFG_", limit: 4000
    t.string "TENANT_ID_", default: ""
    t.index ["EXCEPTION_STACK_ID_"], name: "ACT_FK_TIMER_JOB_EXCEPTION"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_TIMER_JOB_EXECUTION"
    t.index ["PROCESS_INSTANCE_ID_"], name: "ACT_FK_TIMER_JOB_PROCESS_INSTANCE"
    t.index ["PROC_DEF_ID_"], name: "ACT_FK_TIMER_JOB_PROC_DEF"
  end

  create_table "act_ru_variable", primary_key: "ID_", id: :string, limit: 64, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin", force: :cascade do |t|
    t.integer "REV_"
    t.string "TYPE_", null: false
    t.string "NAME_", null: false
    t.string "EXECUTION_ID_", limit: 64
    t.string "PROC_INST_ID_", limit: 64
    t.string "TASK_ID_", limit: 64
    t.string "BYTEARRAY_ID_", limit: 64
    t.float "DOUBLE_", limit: 53
    t.bigint "LONG_"
    t.string "TEXT_", limit: 4000
    t.string "TEXT2_", limit: 4000
    t.index ["BYTEARRAY_ID_"], name: "ACT_FK_VAR_BYTEARRAY"
    t.index ["EXECUTION_ID_"], name: "ACT_FK_VAR_EXE"
    t.index ["PROC_INST_ID_"], name: "ACT_FK_VAR_PROCINST"
    t.index ["TASK_ID_"], name: "ACT_IDX_VARIABLE_TASK_ID"
  end

  create_table "biz_leave", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 1, comment: "请假类型"
    t.string "title", limit: 100, comment: "标题"
    t.string "reason", limit: 500, comment: "原因"
    t.datetime "start_time", comment: "开始时间"
    t.datetime "end_time", comment: "结束时间"
    t.bigint "total_time", comment: "请假时长，单位秒"
    t.string "instance_id", limit: 32, comment: "流程实例ID"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "apply_user", limit: 64, comment: "申请人"
    t.datetime "apply_time", comment: "申请时间"
    t.datetime "reality_start_time", comment: "实际开始时间"
    t.datetime "reality_end_time", comment: "实际结束时间"
  end

  create_table "biz_todo_item", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "待办事项表", force: :cascade do |t|
    t.string "item_name", limit: 100, comment: "事项标题"
    t.string "item_content", limit: 500, comment: "事项内容"
    t.string "module", limit: 50, comment: "模块名称 (必须以 uri 一致)"
    t.string "task_id", limit: 64, comment: "任务 ID"
    t.string "task_name", limit: 50, comment: "任务名称 (必须以表单页面名称一致)"
    t.string "node_name", limit: 50, comment: "节点名称"
    t.string "is_view", limit: 1, default: "0", comment: "是否查看 default 0 (0 否 1 是)"
    t.string "is_handle", limit: 1, default: "0", comment: "是否处理 default 0 (0 否 1 是)"
    t.string "todo_user_id", limit: 20, comment: "待办人 ID"
    t.string "todo_user_name", limit: 30, comment: "待办人名称"
    t.string "handle_user_id", limit: 20, comment: "处理人 ID"
    t.string "handle_user_name", limit: 30, comment: "处理人名称"
    t.datetime "todo_time", comment: "通知时间"
    t.datetime "handle_time", comment: "处理时间"
  end

  create_table "emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "sender_name", null: false
    t.string "sender_email", null: false
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "send_time", null: false
    t.index ["id"], name: "index_emails_on_id", unique: true
  end

  create_table "gen_table", primary_key: "table_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "代码生成业务表", force: :cascade do |t|
    t.string "table_name", limit: 200, default: "", comment: "表名称"
    t.string "table_comment", limit: 500, default: "", comment: "表描述"
    t.string "class_name", limit: 100, default: "", comment: "实体类名称"
    t.string "tpl_category", limit: 200, default: "crud", comment: "使用的模板（crud单表操作 tree树表操作）"
    t.string "package_name", limit: 100, comment: "生成包路径"
    t.string "module_name", limit: 30, comment: "生成模块名"
    t.string "business_name", limit: 30, comment: "生成业务名"
    t.string "function_name", limit: 50, comment: "生成功能名"
    t.string "function_author", limit: 50, comment: "生成功能作者"
    t.string "options", limit: 1000, comment: "其它生成选项"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "gen_table_column", primary_key: "column_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "代码生成业务表字段", force: :cascade do |t|
    t.string "table_id", limit: 64, comment: "归属表编号"
    t.string "column_name", limit: 200, comment: "列名称"
    t.string "column_comment", limit: 500, comment: "列描述"
    t.string "column_type", limit: 100, comment: "列类型"
    t.string "java_type", limit: 500, comment: "JAVA类型"
    t.string "java_field", limit: 200, comment: "JAVA字段名"
    t.string "is_pk", limit: 1, comment: "是否主键（1是）"
    t.string "is_increment", limit: 1, comment: "是否自增（1是）"
    t.string "is_required", limit: 1, comment: "是否必填（1是）"
    t.string "is_insert", limit: 1, comment: "是否为插入字段（1是）"
    t.string "is_edit", limit: 1, comment: "是否编辑字段（1是）"
    t.string "is_list", limit: 1, comment: "是否列表字段（1是）"
    t.string "is_query", limit: 1, comment: "是否查询字段（1是）"
    t.string "query_type", limit: 200, default: "EQ", comment: "查询方式（等于、不等于、大于、小于、范围）"
    t.string "html_type", limit: 200, comment: "显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）"
    t.string "dict_type", limit: 200, default: "", comment: "字典类型"
    t.integer "sort", comment: "排序"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
  end

  create_table "sys_config", primary_key: "config_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "参数配置表", force: :cascade do |t|
    t.string "config_name", limit: 100, default: "", comment: "参数名称"
    t.string "config_key", limit: 100, default: "", comment: "参数键名"
    t.string "config_value", limit: 500, default: "", comment: "参数键值"
    t.string "config_type", limit: 1, default: "N", comment: "系统内置（Y是 N否）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "sys_cost_time", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "class_name", comment: "类名"
    t.string "method_name", comment: "方法名"
    t.integer "spend_time", comment: "消耗的时间"
  end

  create_table "sys_dept", primary_key: "dept_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "部门表", force: :cascade do |t|
    t.bigint "parent_id", default: 0, comment: "父部门id"
    t.string "ancestors", limit: 50, default: "", comment: "祖级列表"
    t.string "dept_name", limit: 30, default: "", comment: "部门名称"
    t.integer "order_num", default: 0, comment: "显示顺序"
    t.string "leader", limit: 20, comment: "负责人"
    t.string "phone", limit: 11, comment: "联系电话"
    t.string "email", limit: 50, comment: "邮箱"
    t.string "status", limit: 1, default: "0", comment: "部门状态（0正常 1停用）"
    t.string "del_flag", limit: 1, default: "0", comment: "删除标志（0代表存在 2代表删除）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
  end

  create_table "sys_dict_data", primary_key: "dict_code", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "字典数据表", force: :cascade do |t|
    t.integer "dict_sort", default: 0, comment: "字典排序"
    t.string "dict_label", limit: 100, default: "", comment: "字典标签"
    t.string "dict_value", limit: 100, default: "", comment: "字典键值"
    t.string "dict_type", limit: 100, default: "", comment: "字典类型"
    t.string "css_class", limit: 100, comment: "样式属性（其他样式扩展）"
    t.string "list_class", limit: 100, comment: "表格回显样式"
    t.string "is_default", limit: 1, default: "N", comment: "是否默认（Y是 N否）"
    t.string "status", limit: 1, default: "0", comment: "状态（0正常 1停用）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "sys_dict_type", primary_key: "dict_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "字典类型表", force: :cascade do |t|
    t.string "dict_name", limit: 100, default: "", comment: "字典名称"
    t.string "dict_type", limit: 100, default: "", comment: "字典类型"
    t.string "status", limit: 1, default: "0", comment: "状态（0正常 1停用）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
    t.index ["dict_type"], name: "dict_type", unique: true
  end

  create_table "sys_job", primary_key: ["job_id", "job_name", "job_group"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "定时任务调度表", force: :cascade do |t|
    t.bigint "job_id", null: false, comment: "任务ID", auto_increment: true
    t.string "job_name", limit: 64, default: "", null: false, comment: "任务名称"
    t.string "job_group", limit: 64, default: "DEFAULT", null: false, comment: "任务组名"
    t.string "invoke_target", limit: 500, null: false, comment: "调用目标字符串"
    t.string "cron_expression", default: "", comment: "cron执行表达式"
    t.string "misfire_policy", limit: 20, default: "3", comment: "计划执行错误策略（1立即执行 2执行一次 3放弃执行）"
    t.string "concurrent", limit: 1, default: "1", comment: "是否并发执行（0允许 1禁止）"
    t.string "status", limit: 1, default: "0", comment: "状态（0正常 1暂停）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, default: "", comment: "备注信息"
  end

  create_table "sys_job_log", primary_key: "job_log_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "定时任务调度日志表", force: :cascade do |t|
    t.string "job_name", limit: 64, null: false, comment: "任务名称"
    t.string "job_group", limit: 64, null: false, comment: "任务组名"
    t.string "invoke_target", limit: 500, null: false, comment: "调用目标字符串"
    t.string "job_message", limit: 500, comment: "日志信息"
    t.string "status", limit: 1, default: "0", comment: "执行状态（0正常 1失败）"
    t.string "exception_info", limit: 2000, default: "", comment: "异常信息"
    t.datetime "create_time", comment: "创建时间"
  end

  create_table "sys_logininfor", primary_key: "info_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "系统访问记录", force: :cascade do |t|
    t.string "login_name", limit: 50, default: "", comment: "登录账号"
    t.string "ipaddr", limit: 50, default: "", comment: "登录IP地址"
    t.string "login_location", default: "", comment: "登录地点"
    t.string "browser", limit: 50, default: "", comment: "浏览器类型"
    t.string "os", limit: 50, default: "", comment: "操作系统"
    t.string "status", limit: 1, default: "0", comment: "登录状态（0成功 1失败）"
    t.string "msg", default: "", comment: "提示消息"
    t.datetime "login_time", comment: "访问时间"
  end

  create_table "sys_menu", primary_key: "menu_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "菜单权限表", force: :cascade do |t|
    t.string "menu_name", limit: 50, null: false, comment: "菜单名称"
    t.bigint "parent_id", default: 0, comment: "父菜单ID"
    t.integer "order_num", default: 0, comment: "显示顺序"
    t.string "url", limit: 200, default: "#", comment: "请求地址"
    t.string "target", limit: 20, default: "", comment: "打开方式（menuItem页签 menuBlank新窗口）"
    t.string "menu_type", limit: 1, default: "", comment: "菜单类型（M目录 C菜单 F按钮）"
    t.string "visible", limit: 1, default: "0", comment: "菜单状态（0显示 1隐藏）"
    t.string "perms", limit: 100, comment: "权限标识"
    t.string "icon", limit: 100, default: "#", comment: "菜单图标"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, default: "", comment: "备注"
  end

  create_table "sys_notice", primary_key: "notice_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "通知公告表", force: :cascade do |t|
    t.string "notice_title", limit: 50, null: false, comment: "公告标题"
    t.string "notice_type", limit: 1, null: false, comment: "公告类型（1通知 2公告）"
    t.string "notice_content", limit: 2000, comment: "公告内容"
    t.string "status", limit: 1, default: "0", comment: "公告状态（0正常 1关闭）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", comment: "备注"
  end

  create_table "sys_oper_log", primary_key: "oper_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "操作日志记录", force: :cascade do |t|
    t.string "title", limit: 50, default: "", comment: "模块标题"
    t.integer "business_type", default: 0, comment: "业务类型（0其它 1新增 2修改 3删除）"
    t.string "method", limit: 100, default: "", comment: "方法名称"
    t.string "request_method", limit: 10, default: "", comment: "请求方式"
    t.integer "operator_type", default: 0, comment: "操作类别（0其它 1后台用户 2手机端用户）"
    t.string "oper_name", limit: 50, default: "", comment: "操作人员"
    t.string "dept_name", limit: 50, default: "", comment: "部门名称"
    t.string "oper_url", default: "", comment: "请求URL"
    t.string "oper_ip", limit: 50, default: "", comment: "主机地址"
    t.string "oper_location", default: "", comment: "操作地点"
    t.string "oper_param", limit: 2000, default: "", comment: "请求参数"
    t.string "json_result", limit: 2000, default: "", comment: "返回参数"
    t.integer "status", default: 0, comment: "操作状态（0正常 1异常）"
    t.string "error_msg", limit: 2000, default: "", comment: "错误消息"
    t.datetime "oper_time", comment: "操作时间"
  end

  create_table "sys_post", primary_key: "post_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "岗位信息表", force: :cascade do |t|
    t.string "post_code", limit: 64, null: false, comment: "岗位编码"
    t.string "post_name", limit: 50, null: false, comment: "岗位名称"
    t.integer "post_sort", null: false, comment: "显示顺序"
    t.string "status", limit: 1, null: false, comment: "状态（0正常 1停用）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "sys_role", primary_key: "role_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "角色信息表", force: :cascade do |t|
    t.string "role_name", limit: 30, null: false, comment: "角色名称"
    t.string "role_key", limit: 100, null: false, comment: "角色权限字符串"
    t.integer "role_sort", null: false, comment: "显示顺序"
    t.string "data_scope", limit: 1, default: "1", comment: "数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）"
    t.string "status", limit: 1, null: false, comment: "角色状态（0正常 1停用）"
    t.string "del_flag", limit: 1, default: "0", comment: "删除标志（0代表存在 2代表删除）"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "sys_role_dept", primary_key: ["role_id", "dept_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "角色和部门关联表", force: :cascade do |t|
    t.bigint "role_id", null: false, comment: "角色ID"
    t.bigint "dept_id", null: false, comment: "部门ID"
  end

  create_table "sys_role_menu", primary_key: ["role_id", "menu_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "角色和菜单关联表", force: :cascade do |t|
    t.bigint "role_id", null: false, comment: "角色ID"
    t.bigint "menu_id", null: false, comment: "菜单ID"
  end

  create_table "sys_user", primary_key: "user_id", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户信息表", force: :cascade do |t|
    t.bigint "dept_id", comment: "部门ID"
    t.string "login_name", limit: 30, null: false, comment: "登录账号"
    t.string "user_name", limit: 30, null: false, comment: "用户昵称"
    t.string "user_type", limit: 2, default: "00", comment: "用户类型（00系统用户）"
    t.string "email", limit: 50, default: "", comment: "用户邮箱"
    t.string "phonenumber", limit: 11, default: "", comment: "手机号码"
    t.string "sex", limit: 1, default: "0", comment: "用户性别（0男 1女 2未知）"
    t.string "avatar", limit: 100, default: "", comment: "头像路径"
    t.string "password", limit: 50, default: "", comment: "密码"
    t.string "salt", limit: 20, default: "", comment: "盐加密"
    t.string "status", limit: 1, default: "0", comment: "帐号状态（0正常 1停用）"
    t.string "del_flag", limit: 1, default: "0", comment: "删除标志（0代表存在 2代表删除）"
    t.string "login_ip", limit: 50, default: "", comment: "最后登陆IP"
    t.datetime "login_date", comment: "最后登陆时间"
    t.string "create_by", limit: 64, default: "", comment: "创建者"
    t.datetime "create_time", comment: "创建时间"
    t.string "update_by", limit: 64, default: "", comment: "更新者"
    t.datetime "update_time", comment: "更新时间"
    t.string "remark", limit: 500, comment: "备注"
  end

  create_table "sys_user_online", primary_key: "sessionId", id: :string, limit: 50, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "在线用户记录", force: :cascade do |t|
    t.string "login_name", limit: 50, default: "", comment: "登录账号"
    t.string "dept_name", limit: 50, default: "", comment: "部门名称"
    t.string "ipaddr", limit: 50, default: "", comment: "登录IP地址"
    t.string "login_location", default: "", comment: "登录地点"
    t.string "browser", limit: 50, default: "", comment: "浏览器类型"
    t.string "os", limit: 50, default: "", comment: "操作系统"
    t.string "status", limit: 10, default: "", comment: "在线状态on_line在线off_line离线"
    t.datetime "start_timestamp", comment: "session创建时间"
    t.datetime "last_access_time", comment: "session最后访问时间"
    t.integer "expire_time", default: 0, comment: "超时时间，单位为分钟"
  end

  create_table "sys_user_post", primary_key: ["user_id", "post_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户与岗位关联表", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "用户ID"
    t.bigint "post_id", null: false, comment: "岗位ID"
  end

  create_table "sys_user_role", primary_key: ["user_id", "role_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户和角色关联表", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "用户ID"
    t.bigint "role_id", null: false, comment: "角色ID"
  end

  create_table "tb_print_template", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "打印模板", force: :cascade do |t|
    t.string "type", limit: 20, comment: "模板类别：10认筹、01预订、03合同，02认购单、04收款信息、05换房、06付款方式变更、07退单 08客户更名 09折扣报批 11收据"
    t.integer "project_id"
    t.datetime "create_time"
    t.text "content", size: :long
    t.string "operator", limit: 40
    t.string "state", limit: 20, null: false, comment: "状态：0启用 1停用"
    t.datetime "update_time"
    t.string "remark"
    t.string "print_mode", limit: 20, comment: "打印方式 01空白纸打印  02套打"
  end

  create_table "tb_print_template_content", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "打印模板-套打内容表", force: :cascade do |t|
    t.integer "temp_id"
    t.text "content", size: :long
  end

  create_table "tb_receipts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "收据管理", force: :cascade do |t|
    t.string "company_name", comment: "交款单位(或姓名)"
    t.datetime "receipt_date", comment: "收据日期"
    t.string "receipt_no", limit: 20, comment: "收据号"
    t.string "receipt_mode", limit: 20, comment: "收款方式"
    t.decimal "receipt_rmb", precision: 16, scale: 4, comment: "人民币"
    t.string "receipt_rmb_upp", limit: 100, comment: "人民币大写"
    t.string "remark_type", limit: 20, comment: "备注事项"
    t.string "remark", comment: "备注"
    t.string "cashier", limit: 20, comment: "出纳"
    t.string "operator", limit: 20, comment: "经办人"
    t.index ["id"], name: "pk_id", unique: true
  end

  create_table "v_io_app_non_runtime_task", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PKID"
    t.string "DESCRIPTION"
    t.string "ACREG"
    t.string "ACTYPE"
    t.datetime "CREATETIME"
    t.string "DISCOVERYSITE"
    t.string "LOCATION"
    t.integer "USERID"
    t.string "PICTURES"
    t.string "REMARK"
  end

  create_table "v_io_app_submit", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME"
    t.string "DEPT"
  end

  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "sched_name", primary_key: "sched_name", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_group", primary_key: "trigger_group", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_name", primary_key: "trigger_name", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "sched_name", primary_key: "sched_name", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_group", primary_key: "trigger_group", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_name", primary_key: "trigger_name", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "sched_name", primary_key: "sched_name", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_group", primary_key: "trigger_group", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_name", primary_key: "trigger_name", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "sched_name", primary_key: "sched_name", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_group", primary_key: "trigger_group", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "trigger_name", primary_key: "trigger_name", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "job_group", primary_key: "job_group", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "job_name", primary_key: "job_name", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "sched_name", primary_key: "sched_name", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "act_ge_bytearray", "act_re_deployment", column: "DEPLOYMENT_ID_", primary_key: "ID_", name: "ACT_FK_BYTEARR_DEPL"
  add_foreign_key "act_id_membership", "act_id_group", column: "GROUP_ID_", primary_key: "ID_", name: "ACT_FK_MEMB_GROUP"
  add_foreign_key "act_id_membership", "act_id_user", column: "USER_ID_", primary_key: "ID_", name: "ACT_FK_MEMB_USER"
  add_foreign_key "act_procdef_info", "act_ge_bytearray", column: "INFO_JSON_ID_", primary_key: "ID_", name: "ACT_FK_INFO_JSON_BA"
  add_foreign_key "act_procdef_info", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_INFO_PROCDEF"
  add_foreign_key "act_re_model", "act_ge_bytearray", column: "EDITOR_SOURCE_EXTRA_VALUE_ID_", primary_key: "ID_", name: "ACT_FK_MODEL_SOURCE_EXTRA"
  add_foreign_key "act_re_model", "act_ge_bytearray", column: "EDITOR_SOURCE_VALUE_ID_", primary_key: "ID_", name: "ACT_FK_MODEL_SOURCE"
  add_foreign_key "act_re_model", "act_re_deployment", column: "DEPLOYMENT_ID_", primary_key: "ID_", name: "ACT_FK_MODEL_DEPLOYMENT"
  add_foreign_key "act_ru_deadletter_job", "act_ge_bytearray", column: "EXCEPTION_STACK_ID_", primary_key: "ID_", name: "ACT_FK_DEADLETTER_JOB_EXCEPTION"
  add_foreign_key "act_ru_deadletter_job", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_DEADLETTER_JOB_PROC_DEF"
  add_foreign_key "act_ru_deadletter_job", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_DEADLETTER_JOB_EXECUTION"
  add_foreign_key "act_ru_deadletter_job", "act_ru_execution", column: "PROCESS_INSTANCE_ID_", primary_key: "ID_", name: "ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE"
  add_foreign_key "act_ru_event_subscr", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_EVENT_EXEC"
  add_foreign_key "act_ru_execution", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_EXE_PROCDEF"
  add_foreign_key "act_ru_execution", "act_ru_execution", column: "PARENT_ID_", primary_key: "ID_", name: "ACT_FK_EXE_PARENT", on_delete: :cascade
  add_foreign_key "act_ru_execution", "act_ru_execution", column: "PROC_INST_ID_", primary_key: "ID_", name: "ACT_FK_EXE_PROCINST", on_update: :cascade, on_delete: :cascade
  add_foreign_key "act_ru_execution", "act_ru_execution", column: "SUPER_EXEC_", primary_key: "ID_", name: "ACT_FK_EXE_SUPER", on_delete: :cascade
  add_foreign_key "act_ru_identitylink", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_ATHRZ_PROCEDEF"
  add_foreign_key "act_ru_identitylink", "act_ru_execution", column: "PROC_INST_ID_", primary_key: "ID_", name: "ACT_FK_IDL_PROCINST"
  add_foreign_key "act_ru_identitylink", "act_ru_task", column: "TASK_ID_", primary_key: "ID_", name: "ACT_FK_TSKASS_TASK"
  add_foreign_key "act_ru_job", "act_ge_bytearray", column: "EXCEPTION_STACK_ID_", primary_key: "ID_", name: "ACT_FK_JOB_EXCEPTION"
  add_foreign_key "act_ru_job", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_JOB_PROC_DEF"
  add_foreign_key "act_ru_job", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_JOB_EXECUTION"
  add_foreign_key "act_ru_job", "act_ru_execution", column: "PROCESS_INSTANCE_ID_", primary_key: "ID_", name: "ACT_FK_JOB_PROCESS_INSTANCE"
  add_foreign_key "act_ru_suspended_job", "act_ge_bytearray", column: "EXCEPTION_STACK_ID_", primary_key: "ID_", name: "ACT_FK_SUSPENDED_JOB_EXCEPTION"
  add_foreign_key "act_ru_suspended_job", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_SUSPENDED_JOB_PROC_DEF"
  add_foreign_key "act_ru_suspended_job", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_SUSPENDED_JOB_EXECUTION"
  add_foreign_key "act_ru_suspended_job", "act_ru_execution", column: "PROCESS_INSTANCE_ID_", primary_key: "ID_", name: "ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE"
  add_foreign_key "act_ru_task", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_TASK_PROCDEF"
  add_foreign_key "act_ru_task", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_TASK_EXE"
  add_foreign_key "act_ru_task", "act_ru_execution", column: "PROC_INST_ID_", primary_key: "ID_", name: "ACT_FK_TASK_PROCINST"
  add_foreign_key "act_ru_timer_job", "act_ge_bytearray", column: "EXCEPTION_STACK_ID_", primary_key: "ID_", name: "ACT_FK_TIMER_JOB_EXCEPTION"
  add_foreign_key "act_ru_timer_job", "act_re_procdef", column: "PROC_DEF_ID_", primary_key: "ID_", name: "ACT_FK_TIMER_JOB_PROC_DEF"
  add_foreign_key "act_ru_timer_job", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_TIMER_JOB_EXECUTION"
  add_foreign_key "act_ru_timer_job", "act_ru_execution", column: "PROCESS_INSTANCE_ID_", primary_key: "ID_", name: "ACT_FK_TIMER_JOB_PROCESS_INSTANCE"
  add_foreign_key "act_ru_variable", "act_ge_bytearray", column: "BYTEARRAY_ID_", primary_key: "ID_", name: "ACT_FK_VAR_BYTEARRAY"
  add_foreign_key "act_ru_variable", "act_ru_execution", column: "EXECUTION_ID_", primary_key: "ID_", name: "ACT_FK_VAR_EXE"
  add_foreign_key "act_ru_variable", "act_ru_execution", column: "PROC_INST_ID_", primary_key: "ID_", name: "ACT_FK_VAR_PROCINST"
end
