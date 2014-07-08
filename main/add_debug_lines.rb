file_names = [
  'KC-RELEASE-3_2-SCRIPT/KC-RELEASE-3_2-Upgrade-ORACLE',
  'KC-RELEASE-3_2-SCRIPT/KR-RELEASE-3_2-SR-ORACLE',
  'KC-RELEASE-3_2-SCRIPT/KR-RELEASE-3_2-Upgrade-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KC-RELEASE-4_0-Upgrade-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KC_RICE-RELEASE-4_0-Upgrade-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KR-RELEASE-4_0-SR-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KR-RELEASE-4_0-Upgrade-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KRC_RICE-RELEASE-4_0-Upgrade-ORACLE',
  'KC-RELEASE-4_0-SCRIPT/KR_RICE-RELEASE-4_0-Upgrade-ORACLE',
  'KC-RELEASE-5_0-SCRIPT/KC-RELEASE-5_0-Upgrade-ORACLE',
  'KC-RELEASE-5_0-SCRIPT/KR-RELEASE-5_0-Upgrade-ORACLE',
  'KC-RELEASE-5_0-SCRIPT/KRC_RICE-RELEASE-5_0-Upgrade-ORACLE',
  'KC-RELEASE-5_0-SCRIPT/KR_RICE-RELEASE-5_0-Upgrade-ORACLE',
  'KC-RELEASE-5_0_1-SCRIPT/KC-RELEASE-5_0_1-Upgrade-ORACLE',
  'KC-RELEASE-5_0_1-SCRIPT/KR-RELEASE-5_0_1-Upgrade-ORACLE',
  'KC-RELEASE-5_1_0-SCRIPT/KC-RELEASE-5_1_0-Upgrade-ORACLE',
  'KC-RELEASE-5_1_0-SCRIPT/KR-RELEASE-5_1_0-Upgrade-ORACLE',
  'KC-RELEASE-5_1_0-SCRIPT/KRC_RICE-RELEASE-5_1_0-Upgrade-ORACLE',
  'KC-RELEASE-5_1_0-SCRIPT/KR_RICE-RELEASE-5_1_0-Upgrade-ORACLE',
  'KC-RELEASE-5_1_1-SCRIPT/KC-RELEASE-5_1_1-Upgrade-ORACLE',
  'KC-RELEASE-5_1_1-SCRIPT/KR-RELEASE-5_1_1-Upgrade-ORACLE',
  'KC-RELEASE-5_1_1-SCRIPT/KRC_RICE-RELEASE-5_1_1-Upgrade-ORACLE',
  'KC-RELEASE-5_1_1-SCRIPT/KR_RICE-RELEASE-5_1_1-Upgrade-ORACLE',
  'KC-RELEASE-5_2_0-SCRIPT/KC-RELEASE-5_2_0-Upgrade-ORACLE',
  'KC-RELEASE-5_2_0-SCRIPT/KR-RELEASE-5_2_0-Upgrade-ORACLE',
  'KC-RELEASE-5_2_0-SCRIPT/KRC_RICE-RELEASE-5_2_0-Upgrade-ORACLE',
  'KC-RELEASE-5_2_0-SCRIPT/KR_RICE-RELEASE-5_2_0-Upgrade-ORACLE',
  'KC-RELEASE-5_2_1-SCRIPT/KC-RELEASE-5_2_1-Upgrade-ORACLE',
  'KC-RELEASE-5_2_1-SCRIPT/KR-RELEASE-5_2_1-Upgrade-ORACLE',
  'KC-RELEASE-0_0_0-SCRIPT/KR-RELEASE-0_0_0-Upgrade-ORACLE'
]

file_names.each do |file_name|
  new_file_lines = []

  File.open("#{file_name}.sql", "r") do |file_handle|
    file_handle.each_line do |line|
      #@oracle/constraints/KC_TYPE_SUBAWARD_CLOSEOUT.sql
      if ( line =~ /^\@oracle\/.*\/([\.|\w|\_|\-|\d]+\.sql)$/ )
        script_name = $1
        #new_file_lines.push "PRINT 'Begin #{script_name}';\r\n"
        new_file_lines.push line
        #new_file_lines.push "PRINT 'End #{script_name}';\r\n"
      else
        new_file_lines.push line
      end
    end
  end

  File.open("#{file_name}.modified.sql", "w") do |modified_file_handle|
    modified_file_handle.write "set echo on\r\n"
    new_file_lines.each do |line|
      modified_file_handle.write line
    end
  end
end
