--liquibase formatted sql

--changeset aishu:1557304170118-1
CREATE TABLE Activities (id INT NOT NULL, uuid UUID NOT NULL, caption VARCHAR(1024) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, is_starred BOOLEAN NOT NULL, is_public BOOLEAN NOT NULL, is_complete BOOLEAN NOT NULL, web_link VARCHAR(1024) NOT NULL, due_at TIMESTAMP WITH TIME ZONE, status INT NOT NULL, image_url VARCHAR(1024), activity_category_id UUID, parent_activity_id UUID, place_id UUID, user_id UUID NOT NULL, description CLOB, originated_at TIMESTAMP WITH TIME ZONE, originated_from_id UUID, list_category_id UUID, copied_from_id UUID, copied_from_user_id UUID, CONSTRAINT Activities_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-2
CREATE TABLE ActivityAssets (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, asset_url VARCHAR(1024), asset_type VARCHAR(50) NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, source INT NOT NULL, CONSTRAINT ActivityAssets_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-3
CREATE TABLE ActivityCategories (id INT NOT NULL, uuid UUID NOT NULL, image_url VARCHAR(1024) NOT NULL, name VARCHAR(50) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, sequence INT NOT NULL, parent_activity_category_id UUID, CONSTRAINT ActivityCategories_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-4
CREATE TABLE ActivityLists (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, "order" INT NOT NULL, CONSTRAINT ActivityLists_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-5
CREATE TABLE ApplicationConfigs (id INT NOT NULL, inbox_polling_time INT, page_size INT NOT NULL, device_id_id UUID, distance_in VARCHAR(25) NOT NULL, followee_saves_entry_list BOOLEAN NOT NULL, follower_saves_entry_list BOOLEAN NOT NULL, non_followee_saves_entry BOOLEAN NOT NULL, notify_when_new_follower BOOLEAN NOT NULL, shared BOOLEAN NOT NULL, user_id UUID, invite_on_to_collaborate BOOLEAN NOT NULL, non_follower_saves_entry BOOLEAN NOT NULL, notify_collab_privacy_change BOOLEAN NOT NULL, notify_list_follow BOOLEAN NOT NULL, notify_new_collab_user_invite BOOLEAN NOT NULL, notify_on_collab_list_admin BOOLEAN NOT NULL, CONSTRAINT ApplicationConfigs_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-6
CREATE TABLE ArchivedUrls (id INT NOT NULL, url VARCHAR(1024), created_at TIMESTAMP WITH TIME ZONE NOT NULL, CONSTRAINT ArchivedUrls_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-7
CREATE TABLE CollaborativeListActivities (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, is_starred BOOLEAN NOT NULL, is_complete BOOLEAN NOT NULL, activity_id UUID NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT CollaborativeListActivities_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-8
CREATE TABLE CollaborativeListGeoFences (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, proximity FLOAT8 NOT NULL, activate_after TIMESTAMP WITH TIME ZONE NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, status INT NOT NULL, end_time TIMESTAMP WITH TIME ZONE, end_repeat INT NOT NULL, activity_id UUID NOT NULL, place_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT CollaborativeListGeoFences_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-9
CREATE TABLE CollaborativeListReminders (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, alert_at TIMESTAMP WITH TIME ZONE NOT NULL, is_alert_on BOOLEAN NOT NULL, send_to_sms BOOLEAN NOT NULL, send_to_email BOOLEAN NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, repeat INT NOT NULL, end_time TIMESTAMP WITH TIME ZONE, end_repeat INT NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, snooze_start_time TIMESTAMP WITH TIME ZONE, CONSTRAINT CollaborativeListReminders_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-10
CREATE TABLE CollaborativeListRoles (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, is_approved BOOLEAN NOT NULL, role INT NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, deleted_by_id UUID, invited_by_id UUID, CONSTRAINT CollaborativeListRoles_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-11
CREATE TABLE CompelldConfigurations (id INT NOT NULL, aws_s3_bucket VARCHAR(100) NOT NULL, aws_s3_url VARCHAR(100) NOT NULL, aws_access_key VARCHAR(255) NOT NULL, aws_secret_key VARCHAR(255) NOT NULL, google_client_id VARCHAR(255) NOT NULL, facebook_api_key VARCHAR(255) NOT NULL, mail_chimp_sender VARCHAR(100) NOT NULL, mail_chimp_key VARCHAR(255) NOT NULL, mail_chimp_list_id VARCHAR(255) NOT NULL, account_verification_template_name VARCHAR(255) NOT NULL, password_reset_template_name VARCHAR(255) NOT NULL, mandrill_api_key VARCHAR(255) NOT NULL, file_upload_path VARCHAR(255) NOT NULL, app_config_min_version VARCHAR(25) NOT NULL, CONSTRAINT CompelldConfigurations_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-12
CREATE TABLE CompelldEmailSettings (id INT NOT NULL, save_entry_email VARCHAR(30) NOT NULL, save_entry_email_password VARCHAR(30) NOT NULL, CONSTRAINT CompelldEmailSettings_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-13
CREATE TABLE DeviceInfos (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, device_id VARCHAR(255) NOT NULL, notification_token VARCHAR(1024), os_version VARCHAR(50), device_type VARCHAR(50), user_id UUID, CONSTRAINT DeviceInfos_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-14
CREATE TABLE FeaturedLists (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, "order" INT NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT FeaturedLists_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-15
CREATE TABLE FeaturedUsers (id INT NOT NULL, uuid UUID NOT NULL, cover_image_url VARCHAR(1024), status INT NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, user_id UUID NOT NULL, CONSTRAINT FeaturedUsers_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-16
CREATE TABLE FeaturedUsersLists (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, featured_order INT NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT FeaturedUsersLists_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-17
CREATE TABLE Followers (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, followed_reason INT NOT NULL, status INT NOT NULL, is_approved BOOLEAN NOT NULL, followed_by_id UUID NOT NULL, followee_id UUID NOT NULL, CONSTRAINT Followers_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-18
CREATE TABLE FriendLists (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, name VARCHAR(50) NOT NULL, email VARCHAR(50), phone_number VARCHAR(20), provider VARCHAR(50) NOT NULL, provider_id VARCHAR(1024), is_followed BOOLEAN NOT NULL, last_updated TIMESTAMP WITH TIME ZONE NOT NULL, invite_sent_on TIMESTAMP WITH TIME ZONE, profile_pic VARCHAR(1024), compelld_user_id UUID, user_id UUID NOT NULL, status INT NOT NULL, CONSTRAINT FriendLists_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-19
CREATE TABLE FriendListsTemp ();

--changeset aishu:1557304170118-20
CREATE TABLE FriendSearchKeywords (id INT NOT NULL, keyword CLOB NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, user_id UUID NOT NULL, frequency INT NOT NULL, CONSTRAINT FriendSearchKeywords_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-21
CREATE TABLE GeoFences (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, proximity FLOAT8 NOT NULL, activate_after TIMESTAMP WITH TIME ZONE NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, place_id UUID NOT NULL, user_id UUID NOT NULL, end_repeat INT NOT NULL, end_time TIMESTAMP WITH TIME ZONE, CONSTRAINT GeoFences_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-22
CREATE TABLE HomeModules (id INT NOT NULL, uuid UUID NOT NULL, name VARCHAR(100) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, CONSTRAINT HomeModules_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-23
CREATE TABLE ListCategories (id INT NOT NULL, uuid UUID NOT NULL, image_url VARCHAR(1024) NOT NULL, name VARCHAR(50) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, sequence INT NOT NULL, parent_list_category_id UUID, collection_ideas _VARCHAR(100) NOT NULL, cta_entry VARCHAR(50) NOT NULL, CONSTRAINT ListCategories_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-24
CREATE TABLE ListFollowers (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, followed_by_id UUID NOT NULL, list_id UUID NOT NULL, CONSTRAINT ListFollowers_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-25
CREATE TABLE ListMappings (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, "order" INT NOT NULL, child_list_id UUID NOT NULL, parent_list_id UUID NOT NULL, user_id UUID NOT NULL, is_owner BOOLEAN NOT NULL, CONSTRAINT ListMapping_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-26
CREATE TABLE Lists (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, name VARCHAR(50) NOT NULL, cover_art_url VARCHAR(1024), is_public BOOLEAN NOT NULL, status INT NOT NULL, parent_list_id UUID, user_id UUID NOT NULL, is_collaborative BOOLEAN NOT NULL, is_root BOOLEAN NOT NULL, originated_at TIMESTAMP WITH TIME ZONE, originated_from_id UUID, list_category_id UUID, CONSTRAINT Lists_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-27
CREATE TABLE PlaceTypes (id INT NOT NULL, uuid UUID NOT NULL, name VARCHAR(50) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, CONSTRAINT PlaceTypes_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-28
CREATE TABLE Places (id INT NOT NULL, uuid UUID NOT NULL, lat FLOAT8, lng FLOAT8, name VARCHAR(1024) NOT NULL, source VARCHAR(1024), source_place_id VARCHAR(1024), image_url VARCHAR(1024), created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, address CLOB, display_address CLOB, city VARCHAR(255), state VARCHAR(255), phone_number VARCHAR(50), website VARCHAR(1024), place_type_id UUID, CONSTRAINT Places_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-29
CREATE TABLE Ratings (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, rating INT NOT NULL, activity_id UUID, place_id UUID, user_id UUID NOT NULL, CONSTRAINT Ratings_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-30
CREATE TABLE Reminders (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, alert_at TIMESTAMP WITH TIME ZONE NOT NULL, is_alert_on BOOLEAN NOT NULL, send_to_sms BOOLEAN NOT NULL, send_to_email BOOLEAN NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, repeat INT NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, end_repeat INT NOT NULL, end_time TIMESTAMP WITH TIME ZONE, snooze_start_time TIMESTAMP WITH TIME ZONE, CONSTRAINT Reminders_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-31
CREATE TABLE SearchKeywords (id INT NOT NULL, keyword CLOB NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, user_id UUID, frequency INT NOT NULL, CONSTRAINT SearchKeywords_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-32
CREATE TABLE Shares (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, activity_id UUID, list_id UUID, shared_by_id UUID NOT NULL, shared_with_id UUID NOT NULL, CONSTRAINT Shares_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-33
CREATE TABLE TermsOfServices (id INT NOT NULL, uuid UUID NOT NULL, url VARCHAR(1024) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, major_version INT NOT NULL, minor_version INT NOT NULL, patch_version INT NOT NULL, CONSTRAINT TermsOfServices_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-34
CREATE TABLE UserHomeModules (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, "order" INT NOT NULL, home_module_id UUID NOT NULL, user_id UUID, CONSTRAINT UserHomeModules_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-35
CREATE TABLE UserInboxes (id INT NOT NULL, uuid UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, message VARCHAR(1024), message_type INT NOT NULL, delivered BOOLEAN NOT NULL, read BOOLEAN NOT NULL, status INT NOT NULL, activity_id UUID, from_user_id UUID, list_id UUID, to_user_id UUID NOT NULL, followed_user_id UUID, parent_list_id UUID, CONSTRAINT UserInboxes_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-36
CREATE TABLE UserVerifications (token_id UUID NOT NULL, expires_in INT NOT NULL, user_id UUID NOT NULL, CONSTRAINT UserVerifications_pkey PRIMARY KEY (token_id));

--changeset aishu:1557304170118-37
CREATE TABLE Users (last_login TIMESTAMP WITH TIME ZONE, is_superuser BOOLEAN NOT NULL, id INT NOT NULL, uuid UUID NOT NULL, email CLOB NOT NULL, first_name CLOB NOT NULL, last_name CLOB NOT NULL, oauth_provider VARCHAR(10), password CLOB NOT NULL, phone_number VARCHAR(20), screen_name CLOB NOT NULL, profile_image_url VARCHAR(1024), description CLOB, location CLOB, account_type INT, organization_name VARCHAR(255) NOT NULL, organization_type INT, last_login_at TIMESTAMP WITH TIME ZONE, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, default_timezone VARCHAR(50), status INT NOT NULL, access_token CLOB, refresh_token CLOB, media_user_id VARCHAR(1024), expires_in INT NOT NULL, verified BOOLEAN NOT NULL, is_email_verified BOOLEAN NOT NULL, is_public BOOLEAN NOT NULL, mailchimp_subscriber_id VARCHAR(255), is_featured BOOLEAN NOT NULL, website CLOB, last_password_at TIMESTAMP WITH TIME ZONE, is_gdpr_compliant BOOLEAN NOT NULL, terms_of_services_id UUID, CONSTRAINT Users_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-38
CREATE TABLE Users_groups (id INT NOT NULL, user_id INT NOT NULL, group_id INT NOT NULL, CONSTRAINT Users_groups_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-39
CREATE TABLE Users_user_permissions (id INT NOT NULL, user_id INT NOT NULL, permission_id INT NOT NULL, CONSTRAINT Users_user_permissions_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-40
CREATE TABLE auth_group (id INT NOT NULL, name VARCHAR(80) NOT NULL, CONSTRAINT auth_group_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-41
CREATE TABLE auth_group_permissions (id INT NOT NULL, group_id INT NOT NULL, permission_id INT NOT NULL, CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-42
CREATE TABLE auth_permission (id INT NOT NULL, name VARCHAR(255) NOT NULL, content_type_id INT NOT NULL, codename VARCHAR(100) NOT NULL, CONSTRAINT auth_permission_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-43
CREATE TABLE background_task (id INT NOT NULL, task_name VARCHAR(190) NOT NULL, task_params CLOB NOT NULL, task_hash VARCHAR(40) NOT NULL, verbose_name VARCHAR(255), priority INT NOT NULL, run_at TIMESTAMP WITH TIME ZONE NOT NULL, repeat BIGINT NOT NULL, repeat_until TIMESTAMP WITH TIME ZONE, queue VARCHAR(190), attempts INT NOT NULL, failed_at TIMESTAMP WITH TIME ZONE, last_error CLOB NOT NULL, locked_by VARCHAR(64), locked_at TIMESTAMP WITH TIME ZONE, creator_object_id INT, creator_content_type_id INT, CONSTRAINT background_task_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-44
CREATE TABLE background_task_completedtask (id INT NOT NULL, task_name VARCHAR(190) NOT NULL, task_params CLOB NOT NULL, task_hash VARCHAR(40) NOT NULL, verbose_name VARCHAR(255), priority INT NOT NULL, run_at TIMESTAMP WITH TIME ZONE NOT NULL, repeat BIGINT NOT NULL, repeat_until TIMESTAMP WITH TIME ZONE, queue VARCHAR(190), attempts INT NOT NULL, failed_at TIMESTAMP WITH TIME ZONE, last_error CLOB NOT NULL, locked_by VARCHAR(64), locked_at TIMESTAMP WITH TIME ZONE, creator_object_id INT, creator_content_type_id INT, CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-45
CREATE TABLE compelld_app_activity (id UUID NOT NULL, caption VARCHAR(255) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, is_starred BOOLEAN NOT NULL, is_public BOOLEAN NOT NULL, web_link VARCHAR(255) NOT NULL, status INT NOT NULL, activity_category_id UUID NOT NULL, parent_activity_id UUID, place_id UUID, user_id UUID NOT NULL, due_at TIMESTAMP WITH TIME ZONE, is_complete BOOLEAN NOT NULL, image_url VARCHAR(200), CONSTRAINT compelld_app_activity_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-46
CREATE TABLE compelld_app_activityasset (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, asset_url VARCHAR(200), asset_type VARCHAR(50) NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT compelld_app_activityasset_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-47
CREATE TABLE compelld_app_activitycategory (id UUID NOT NULL, image_url VARCHAR(200) NOT NULL, name VARCHAR(50) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, parent_activity_category_id UUID, sequence INT NOT NULL, CONSTRAINT compelld_app_activitycategory_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-48
CREATE TABLE compelld_app_activitylist (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, list_id UUID NOT NULL, user_id UUID NOT NULL, CONSTRAINT compelld_app_activitylist_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-49
CREATE TABLE compelld_app_applicationconfigs (id INT NOT NULL, inbox_polling_time INT NOT NULL, page_size INT NOT NULL, CONSTRAINT compelld_app_applicationconfigs_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-50
CREATE TABLE compelld_app_compelldconfigurations (id INT NOT NULL, aws_s3_bucket VARCHAR(100) NOT NULL, aws_s3_url VARCHAR(100) NOT NULL, aws_access_key VARCHAR(255) NOT NULL, aws_secret_key VARCHAR(255) NOT NULL, google_client_id VARCHAR(255) NOT NULL, mail_chimp_sender VARCHAR(100) NOT NULL, mail_chimp_key VARCHAR(255) NOT NULL, mail_chimp_list_id VARCHAR(255) NOT NULL, facebook_api_key VARCHAR(255) NOT NULL, account_verification_template_name VARCHAR(255) NOT NULL, mandrill_api_key VARCHAR(255) NOT NULL, password_reset_template_name VARCHAR(255) NOT NULL, file_upload_path VARCHAR(255) NOT NULL, CONSTRAINT compelld_app_compelldconfigurations_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-51
CREATE TABLE compelld_app_deviceinfo (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, device_id VARCHAR(255) NOT NULL, notification_token VARCHAR(1024), os_version VARCHAR(50), device_type VARCHAR(50), user_id UUID, CONSTRAINT compelld_app_deviceinfo_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-52
CREATE TABLE compelld_app_follower (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, followed_reason INT NOT NULL, status INT NOT NULL, followee_id UUID NOT NULL, followed_by_id UUID NOT NULL, is_approved BOOLEAN NOT NULL, CONSTRAINT compelld_app_follower_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-53
CREATE TABLE compelld_app_friendlist (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, name VARCHAR(50) NOT NULL, email VARCHAR(50), phone_number VARCHAR(20), provider VARCHAR(50) NOT NULL, provider_id VARCHAR(1024), is_followed BOOLEAN NOT NULL, last_updated TIMESTAMP WITH TIME ZONE NOT NULL, invite_sent_on TIMESTAMP WITH TIME ZONE, profile_pic VARCHAR(200), compelld_user_id UUID, user_id UUID NOT NULL, CONSTRAINT compelld_app_friendlist_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-54
CREATE TABLE compelld_app_geofence (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, proximity FLOAT8 NOT NULL, activate_after TIMESTAMP WITH TIME ZONE NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, place_id UUID NOT NULL, CONSTRAINT compelld_app_geofence_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-55
CREATE TABLE compelld_app_list (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, name VARCHAR(50) NOT NULL, cover_art_url VARCHAR(200), is_public BOOLEAN NOT NULL, status INT NOT NULL, user_id UUID NOT NULL, parent_list_id UUID, CONSTRAINT compelld_app_list_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-56
CREATE TABLE compelld_app_place (id UUID NOT NULL, lat FLOAT8, lng FLOAT8, name VARCHAR(1024) NOT NULL, source VARCHAR(1024), source_place_id VARCHAR(1024), created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, place_type_id UUID, image_url VARCHAR(200), address CLOB, display_address CLOB, phone_number VARCHAR(20), website VARCHAR(200), city VARCHAR(255), state VARCHAR(255), CONSTRAINT compelld_app_place_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-57
CREATE TABLE compelld_app_placetype (id UUID NOT NULL, name VARCHAR(50) NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, CONSTRAINT compelld_app_placetype_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-58
CREATE TABLE compelld_app_ratings (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, rating INT NOT NULL, activity_id UUID, place_id UUID, user_id UUID NOT NULL, CONSTRAINT compelld_app_ratings_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-59
CREATE TABLE compelld_app_reminder (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, alert_at TIMESTAMP WITH TIME ZONE NOT NULL, send_to_sms BOOLEAN NOT NULL, send_to_email BOOLEAN NOT NULL, last_triggered_at TIMESTAMP WITH TIME ZONE, snooze_status INT NOT NULL, max_retry INT NOT NULL, status INT NOT NULL, activity_id UUID NOT NULL, user_id UUID NOT NULL, repeat INT NOT NULL, is_alert_on BOOLEAN NOT NULL, CONSTRAINT compelld_app_reminder_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-60
CREATE TABLE compelld_app_share (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, status INT NOT NULL, activity_id UUID, shared_by_id UUID NOT NULL, list_id UUID, shared_with_id UUID NOT NULL, CONSTRAINT compelld_app_share_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-61
CREATE TABLE compelld_app_user (id UUID NOT NULL, email CLOB NOT NULL, first_name CLOB NOT NULL, last_name CLOB NOT NULL, oauth_provider VARCHAR(10), password CLOB NOT NULL, phone_number VARCHAR(20), screen_name CLOB NOT NULL, profile_image_url VARCHAR(200), account_type INT, organization_name VARCHAR(255) NOT NULL, organization_type INT, last_login_at TIMESTAMP WITH TIME ZONE, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, default_timezone VARCHAR(50), status INT NOT NULL, access_token CLOB, refresh_token CLOB, expires_in INT NOT NULL, verified BOOLEAN NOT NULL, is_email_verified BOOLEAN NOT NULL, last_login TIMESTAMP WITH TIME ZONE, is_superuser BOOLEAN NOT NULL, media_user_id VARCHAR(1024), description CLOB, location CLOB, is_public BOOLEAN NOT NULL, mailchimp_subscriber_id VARCHAR(255), CONSTRAINT compelld_app_user_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-62
CREATE TABLE compelld_app_user_groups (id INT NOT NULL, user_id UUID NOT NULL, group_id INT NOT NULL, CONSTRAINT compelld_app_user_groups_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-63
CREATE TABLE compelld_app_user_user_permissions (id INT NOT NULL, user_id UUID NOT NULL, permission_id INT NOT NULL, CONSTRAINT compelld_app_user_user_permissions_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-64
CREATE TABLE compelld_app_userinbox (id UUID NOT NULL, created_at TIMESTAMP WITH TIME ZONE NOT NULL, updated_at TIMESTAMP WITH TIME ZONE NOT NULL, message VARCHAR(1024) NOT NULL, message_type INT NOT NULL, delivered BOOLEAN NOT NULL, read BOOLEAN NOT NULL, from_user_id UUID, to_user_id UUID NOT NULL, status INT NOT NULL, activity_id UUID, list_id UUID, CONSTRAINT compelld_app_userinbox_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-65
CREATE TABLE compelld_app_userverification (token_id UUID NOT NULL, expires_in INT NOT NULL, user_id UUID NOT NULL, CONSTRAINT compelld_app_userverification_pkey PRIMARY KEY (token_id));

--changeset aishu:1557304170118-66
CREATE TABLE department (id INT NOT NULL, dept_name VARCHAR(50) NOT NULL, CONSTRAINT department_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-67
CREATE TABLE django_admin_log (id INT NOT NULL, action_time TIMESTAMP WITH TIME ZONE NOT NULL, object_id CLOB, object_repr VARCHAR(200) NOT NULL, action_flag SMALLINT NOT NULL, change_message CLOB NOT NULL, content_type_id INT, user_id INT, CONSTRAINT django_admin_log_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-68
CREATE TABLE django_content_type (id INT NOT NULL, app_label VARCHAR(100) NOT NULL, model VARCHAR(100) NOT NULL, CONSTRAINT django_content_type_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-69
CREATE TABLE django_migrations (id INT NOT NULL, app VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, applied TIMESTAMP WITH TIME ZONE NOT NULL, CONSTRAINT django_migrations_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-70
CREATE TABLE django_session (session_key VARCHAR(40) NOT NULL, session_data CLOB NOT NULL, expire_date TIMESTAMP WITH TIME ZONE NOT NULL, CONSTRAINT django_session_pkey PRIMARY KEY (session_key));

--changeset aishu:1557304170118-71
CREATE TABLE employee (id INT NOT NULL, emp_name VARCHAR(50) NOT NULL, dept INT, CONSTRAINT employee_pkey PRIMARY KEY (id));

--changeset aishu:1557304170118-72
CREATE TABLE testtable (columnname1 VARCHAR(355));

--changeset aishu:1557304170118-73
ALTER TABLE Activities ADD CONSTRAINT Activities_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-74
ALTER TABLE ActivityAssets ADD CONSTRAINT ActivityAssets_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-75
ALTER TABLE ActivityCategories ADD CONSTRAINT ActivityCategories_sequence_key UNIQUE (sequence);

--changeset aishu:1557304170118-76
ALTER TABLE ActivityCategories ADD CONSTRAINT ActivityCategories_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-77
ALTER TABLE ActivityLists ADD CONSTRAINT ActivityLists_activity_id_list_id_f2d42ff6_uniq UNIQUE (activity_id, list_id);

--changeset aishu:1557304170118-78
ALTER TABLE ActivityLists ADD CONSTRAINT ActivityLists_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-79
ALTER TABLE ApplicationConfigs ADD CONSTRAINT ApplicationConfigs_device_id_id_user_id_49b396ae_uniq UNIQUE (device_id_id, user_id);

--changeset aishu:1557304170118-80
ALTER TABLE CollaborativeListActivities ADD CONSTRAINT CollaborativeListActivit_user_id_list_id_activity_3162fdce_uniq UNIQUE (user_id, list_id, activity_id);

--changeset aishu:1557304170118-81
ALTER TABLE CollaborativeListActivities ADD CONSTRAINT CollaborativeListActivities_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-82
ALTER TABLE CollaborativeListGeoFences ADD CONSTRAINT CollaborativeListGeoFences_place_id_key UNIQUE (place_id);

--changeset aishu:1557304170118-83
ALTER TABLE CollaborativeListGeoFences ADD CONSTRAINT CollaborativeListGeoFences_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-84
ALTER TABLE CollaborativeListReminders ADD CONSTRAINT CollaborativeListReminders_user_id_activity_id_e9895616_uniq UNIQUE (user_id, activity_id);

--changeset aishu:1557304170118-85
ALTER TABLE CollaborativeListReminders ADD CONSTRAINT CollaborativeListReminders_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-86
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_user_id_list_id_9a011230_uniq UNIQUE (user_id, list_id);

--changeset aishu:1557304170118-87
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-88
ALTER TABLE DeviceInfos ADD CONSTRAINT DeviceInfos_device_id_user_id_594b3c4f_uniq UNIQUE (device_id, user_id);

--changeset aishu:1557304170118-89
ALTER TABLE DeviceInfos ADD CONSTRAINT DeviceInfos_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-90
ALTER TABLE FeaturedLists ADD CONSTRAINT FeaturedLists_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-91
ALTER TABLE FeaturedUsersLists ADD CONSTRAINT FeaturedUsersLists_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-92
ALTER TABLE FeaturedUsers ADD CONSTRAINT FeaturedUsers_user_id_20ce47fd_uniq UNIQUE (user_id);

--changeset aishu:1557304170118-93
ALTER TABLE FeaturedUsers ADD CONSTRAINT FeaturedUsers_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-94
ALTER TABLE Followers ADD CONSTRAINT Followers_followee_id_followed_by_id_bc874a7d_uniq UNIQUE (followee_id, followed_by_id);

--changeset aishu:1557304170118-95
ALTER TABLE Followers ADD CONSTRAINT Followers_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-96
ALTER TABLE FriendLists ADD CONSTRAINT FriendLists_user_id_compelld_user_id_33641b56_uniq UNIQUE (user_id, compelld_user_id);

--changeset aishu:1557304170118-97
ALTER TABLE FriendLists ADD CONSTRAINT FriendLists_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-98
ALTER TABLE FriendSearchKeywords ADD CONSTRAINT FriendSearchKeywords_keyword_user_id_3d91771f_uniq UNIQUE (keyword, user_id);

--changeset aishu:1557304170118-99
ALTER TABLE GeoFences ADD CONSTRAINT GeoFences_place_id_key UNIQUE (place_id);

--changeset aishu:1557304170118-100
ALTER TABLE GeoFences ADD CONSTRAINT GeoFences_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-101
ALTER TABLE HomeModules ADD CONSTRAINT HomeModules_name_9078791d_uniq UNIQUE (name);

--changeset aishu:1557304170118-102
ALTER TABLE HomeModules ADD CONSTRAINT HomeModules_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-103
ALTER TABLE ListCategories ADD CONSTRAINT ListCategories_sequence_key UNIQUE (sequence);

--changeset aishu:1557304170118-104
ALTER TABLE ListCategories ADD CONSTRAINT ListCategories_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-105
ALTER TABLE ListFollowers ADD CONSTRAINT ListFollowers_list_id_followed_by_id_463a905c_uniq UNIQUE (list_id, followed_by_id);

--changeset aishu:1557304170118-106
ALTER TABLE ListFollowers ADD CONSTRAINT ListFollowers_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-107
ALTER TABLE ListMappings ADD CONSTRAINT ListMapping_parent_list_id_child_list_id_94e67c78_uniq UNIQUE (parent_list_id, child_list_id);

--changeset aishu:1557304170118-108
ALTER TABLE ListMappings ADD CONSTRAINT ListMapping_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-109
ALTER TABLE Lists ADD CONSTRAINT Lists_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-110
ALTER TABLE PlaceTypes ADD CONSTRAINT PlaceTypes_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-111
ALTER TABLE Places ADD CONSTRAINT Places_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-112
ALTER TABLE Ratings ADD CONSTRAINT Ratings_user_id_activity_id_01b05c79_uniq UNIQUE (user_id, activity_id);

--changeset aishu:1557304170118-113
ALTER TABLE Ratings ADD CONSTRAINT Ratings_user_id_place_id_4ca78726_uniq UNIQUE (user_id, place_id);

--changeset aishu:1557304170118-114
ALTER TABLE Ratings ADD CONSTRAINT Ratings_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-115
ALTER TABLE Reminders ADD CONSTRAINT Reminders_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-116
ALTER TABLE SearchKeywords ADD CONSTRAINT SearchKeywords_keyword_user_id_92e169e3_uniq UNIQUE (keyword, user_id);

--changeset aishu:1557304170118-117
ALTER TABLE Shares ADD CONSTRAINT Shares_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-118
ALTER TABLE TermsOfServices ADD CONSTRAINT TermsOfServices_major_version_minor_vers_425520ee_uniq UNIQUE (major_version, minor_version, patch_version);

--changeset aishu:1557304170118-119
ALTER TABLE TermsOfServices ADD CONSTRAINT TermsOfServices_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-120
ALTER TABLE UserHomeModules ADD CONSTRAINT UserHomeModules_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-121
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-122
ALTER TABLE UserVerifications ADD CONSTRAINT UserVerifications_user_id_key UNIQUE (user_id);

--changeset aishu:1557304170118-123
ALTER TABLE Users ADD CONSTRAINT Users_email_key UNIQUE (email);

--changeset aishu:1557304170118-124
ALTER TABLE Users_groups ADD CONSTRAINT Users_groups_user_id_group_id_590dc796_uniq UNIQUE (user_id, group_id);

--changeset aishu:1557304170118-125
ALTER TABLE Users ADD CONSTRAINT Users_screen_name_key UNIQUE (screen_name);

--changeset aishu:1557304170118-126
ALTER TABLE Users_user_permissions ADD CONSTRAINT Users_user_permissions_user_id_permission_id_f5781f04_uniq UNIQUE (user_id, permission_id);

--changeset aishu:1557304170118-127
ALTER TABLE Users ADD CONSTRAINT Users_uuid_key UNIQUE (uuid);

--changeset aishu:1557304170118-128
ALTER TABLE auth_group ADD CONSTRAINT auth_group_name_key UNIQUE (name);

--changeset aishu:1557304170118-129
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);

--changeset aishu:1557304170118-130
ALTER TABLE auth_permission ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);

--changeset aishu:1557304170118-131
ALTER TABLE compelld_app_activitycategory ADD CONSTRAINT compelld_app_activitycategory_sequence_key UNIQUE (sequence);

--changeset aishu:1557304170118-132
ALTER TABLE compelld_app_activitylist ADD CONSTRAINT compelld_app_activitylist_activity_id_list_id_7aff7320_uniq UNIQUE (activity_id, list_id);

--changeset aishu:1557304170118-133
ALTER TABLE compelld_app_deviceinfo ADD CONSTRAINT compelld_app_deviceinfo_device_id_da126f6b_uniq UNIQUE (device_id);

--changeset aishu:1557304170118-134
ALTER TABLE compelld_app_follower ADD CONSTRAINT compelld_app_follower_followee_id_followed_by_id_6c6f1f23_uniq UNIQUE (followee_id, followed_by_id);

--changeset aishu:1557304170118-135
ALTER TABLE compelld_app_friendlist ADD CONSTRAINT compelld_app_friendlist_user_id_compelld_user_id_b63221a5_uniq UNIQUE (user_id, compelld_user_id);

--changeset aishu:1557304170118-136
ALTER TABLE compelld_app_geofence ADD CONSTRAINT compelld_app_geofence_place_id_key UNIQUE (place_id);

--changeset aishu:1557304170118-137
ALTER TABLE compelld_app_ratings ADD CONSTRAINT compelld_app_ratings_user_id_activity_id_c1bd6d17_uniq UNIQUE (user_id, activity_id);

--changeset aishu:1557304170118-138
ALTER TABLE compelld_app_ratings ADD CONSTRAINT compelld_app_ratings_user_id_place_id_e393a371_uniq UNIQUE (user_id, place_id);

--changeset aishu:1557304170118-139
ALTER TABLE compelld_app_user ADD CONSTRAINT compelld_app_user_email_88dce67e_uniq UNIQUE (email);

--changeset aishu:1557304170118-140
ALTER TABLE compelld_app_user_groups ADD CONSTRAINT compelld_app_user_groups_user_id_group_id_d37eec52_uniq UNIQUE (user_id, group_id);

--changeset aishu:1557304170118-141
ALTER TABLE compelld_app_user ADD CONSTRAINT compelld_app_user_screen_name_0ffaa8b3_uniq UNIQUE (screen_name);

--changeset aishu:1557304170118-142
ALTER TABLE compelld_app_user_user_permissions ADD CONSTRAINT compelld_app_user_user_p_user_id_permission_id_fb86aeab_uniq UNIQUE (user_id, permission_id);

--changeset aishu:1557304170118-143
ALTER TABLE compelld_app_userverification ADD CONSTRAINT compelld_app_userverification_user_id_key UNIQUE (user_id);

--changeset aishu:1557304170118-144
ALTER TABLE django_content_type ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);

--changeset aishu:1557304170118-145
CREATE INDEX Activities_activity_category_id_9c551642 ON Activities(activity_category_id);

--changeset aishu:1557304170118-146
CREATE INDEX Activities_copied_from_id_dc7660b9 ON Activities(copied_from_id);

--changeset aishu:1557304170118-147
CREATE INDEX Activities_copied_from_user_id_741bba3e ON Activities(copied_from_user_id);

--changeset aishu:1557304170118-148
CREATE INDEX Activities_list_category_id_2689948f ON Activities(list_category_id);

--changeset aishu:1557304170118-149
CREATE INDEX Activities_originated_from_id_dfe0e750 ON Activities(originated_from_id);

--changeset aishu:1557304170118-150
CREATE INDEX Activities_parent_activity_id_0cf24a9e ON Activities(parent_activity_id);

--changeset aishu:1557304170118-151
CREATE INDEX Activities_place_id_605ba543 ON Activities(place_id);

--changeset aishu:1557304170118-152
CREATE INDEX Activities_user_id_85702ab4 ON Activities(user_id);

--changeset aishu:1557304170118-153
CREATE INDEX ActivityAssets_activity_id_fab92a2a ON ActivityAssets(activity_id);

--changeset aishu:1557304170118-154
CREATE INDEX ActivityAssets_user_id_3dc25968 ON ActivityAssets(user_id);

--changeset aishu:1557304170118-155
CREATE INDEX ActivityCategories_parent_activity_category_id_262b3149 ON ActivityCategories(parent_activity_category_id);

--changeset aishu:1557304170118-156
CREATE INDEX ActivityLists_activity_id_e62ec092 ON ActivityLists(activity_id);

--changeset aishu:1557304170118-157
CREATE INDEX ActivityLists_list_id_0f896df6 ON ActivityLists(list_id);

--changeset aishu:1557304170118-158
CREATE INDEX ActivityLists_user_id_8766573e ON ActivityLists(user_id);

--changeset aishu:1557304170118-159
CREATE INDEX ApplicationConfigs_device_id_id_6c01def5 ON ApplicationConfigs(device_id_id);

--changeset aishu:1557304170118-160
CREATE INDEX ApplicationConfigs_user_id_0a1be298 ON ApplicationConfigs(user_id);

--changeset aishu:1557304170118-161
CREATE INDEX CollaborativeListActivities_activity_id_b86d5d38 ON CollaborativeListActivities(activity_id);

--changeset aishu:1557304170118-162
CREATE INDEX CollaborativeListActivities_list_id_0452bce4 ON CollaborativeListActivities(list_id);

--changeset aishu:1557304170118-163
CREATE INDEX CollaborativeListActivities_user_id_ad26b45a ON CollaborativeListActivities(user_id);

--changeset aishu:1557304170118-164
CREATE INDEX CollaborativeListGeoFences_activity_id_5168ec88 ON CollaborativeListGeoFences(activity_id);

--changeset aishu:1557304170118-165
CREATE INDEX CollaborativeListGeoFences_user_id_04411db2 ON CollaborativeListGeoFences(user_id);

--changeset aishu:1557304170118-166
CREATE INDEX CollaborativeListReminders_activity_id_f6bd83d0 ON CollaborativeListReminders(activity_id);

--changeset aishu:1557304170118-167
CREATE INDEX CollaborativeListReminders_user_id_96539333 ON CollaborativeListReminders(user_id);

--changeset aishu:1557304170118-168
CREATE INDEX CollaborativeListRoles_deleted_by_id_739b0f5c ON CollaborativeListRoles(deleted_by_id);

--changeset aishu:1557304170118-169
CREATE INDEX CollaborativeListRoles_invited_by_id_843308f5 ON CollaborativeListRoles(invited_by_id);

--changeset aishu:1557304170118-170
CREATE INDEX CollaborativeListRoles_list_id_9e60a7a2 ON CollaborativeListRoles(list_id);

--changeset aishu:1557304170118-171
CREATE INDEX CollaborativeListRoles_user_id_397a4ae3 ON CollaborativeListRoles(user_id);

--changeset aishu:1557304170118-172
CREATE INDEX DeviceInfos_user_id_b2da0a49 ON DeviceInfos(user_id);

--changeset aishu:1557304170118-173
CREATE INDEX FeaturedLists_list_id_574e1864 ON FeaturedLists(list_id);

--changeset aishu:1557304170118-174
CREATE INDEX FeaturedLists_user_id_6a22160b ON FeaturedLists(user_id);

--changeset aishu:1557304170118-175
CREATE INDEX FeaturedUsersLists_list_id_c0e2c2ad ON FeaturedUsersLists(list_id);

--changeset aishu:1557304170118-176
CREATE INDEX FeaturedUsersLists_user_id_3addc797 ON FeaturedUsersLists(user_id);

--changeset aishu:1557304170118-177
CREATE INDEX Followers_followed_by_id_6ee9e054 ON Followers(followed_by_id);

--changeset aishu:1557304170118-178
CREATE INDEX Followers_followee_id_ec66e011 ON Followers(followee_id);

--changeset aishu:1557304170118-179
CREATE INDEX FriendLists_compelld_user_id_02f49dec ON FriendLists(compelld_user_id);

--changeset aishu:1557304170118-180
CREATE INDEX FriendLists_user_id_10d3a979 ON FriendLists(user_id);

--changeset aishu:1557304170118-181
CREATE INDEX FriendSearchKeywords_user_id_a0dcd00d ON FriendSearchKeywords(user_id);

--changeset aishu:1557304170118-182
CREATE INDEX GeoFences_activity_id_d65da973 ON GeoFences(activity_id);

--changeset aishu:1557304170118-183
CREATE INDEX GeoFences_user_id_8388ffb6 ON GeoFences(user_id);

--changeset aishu:1557304170118-184
CREATE INDEX ListCategories_parent_list_category_id_0737dd3f ON ListCategories(parent_list_category_id);

--changeset aishu:1557304170118-185
CREATE INDEX ListFollowers_followed_by_id_b58e880c ON ListFollowers(followed_by_id);

--changeset aishu:1557304170118-186
CREATE INDEX ListFollowers_list_id_052c8963 ON ListFollowers(list_id);

--changeset aishu:1557304170118-187
CREATE INDEX ListMapping_child_list_id_fc800676 ON ListMappings(child_list_id);

--changeset aishu:1557304170118-188
CREATE INDEX ListMapping_parent_list_id_d8448631 ON ListMappings(parent_list_id);

--changeset aishu:1557304170118-189
CREATE INDEX ListMapping_user_id_4676babc ON ListMappings(user_id);

--changeset aishu:1557304170118-190
CREATE INDEX Lists_list_category_id_a8756374 ON Lists(list_category_id);

--changeset aishu:1557304170118-191
CREATE INDEX Lists_originated_from_id_e48c3d6d ON Lists(originated_from_id);

--changeset aishu:1557304170118-192
CREATE INDEX Lists_parent_list_id_053a3775 ON Lists(parent_list_id);

--changeset aishu:1557304170118-193
CREATE INDEX Lists_user_id_6303ce03 ON Lists(user_id);

--changeset aishu:1557304170118-194
CREATE INDEX Places_place_type_id_d3b42df0 ON Places(place_type_id);

--changeset aishu:1557304170118-195
CREATE INDEX Ratings_activity_id_6d50b15a ON Ratings(activity_id);

--changeset aishu:1557304170118-196
CREATE INDEX Ratings_place_id_9090432b ON Ratings(place_id);

--changeset aishu:1557304170118-197
CREATE INDEX Ratings_user_id_31a8a7d1 ON Ratings(user_id);

--changeset aishu:1557304170118-198
CREATE INDEX Reminders_activity_id_4179429b ON Reminders(activity_id);

--changeset aishu:1557304170118-199
CREATE INDEX Reminders_user_id_c6839c25 ON Reminders(user_id);

--changeset aishu:1557304170118-200
CREATE INDEX SearchKeywords_user_id_66a6e7fd ON SearchKeywords(user_id);

--changeset aishu:1557304170118-201
CREATE INDEX Shares_activity_id_de7a2f19 ON Shares(activity_id);

--changeset aishu:1557304170118-202
CREATE INDEX Shares_list_id_f094b66f ON Shares(list_id);

--changeset aishu:1557304170118-203
CREATE INDEX Shares_shared_by_id_96f74b1f ON Shares(shared_by_id);

--changeset aishu:1557304170118-204
CREATE INDEX Shares_shared_with_id_029e12ce ON Shares(shared_with_id);

--changeset aishu:1557304170118-205
CREATE INDEX UserHomeModules_home_module_id_aa2eba9e ON UserHomeModules(home_module_id);

--changeset aishu:1557304170118-206
CREATE INDEX UserHomeModules_user_id_8bf0d5e7 ON UserHomeModules(user_id);

--changeset aishu:1557304170118-207
CREATE INDEX UserInboxes_activity_id_5d5d1d1a ON UserInboxes(activity_id);

--changeset aishu:1557304170118-208
CREATE INDEX UserInboxes_followed_user_id_2fa9c019 ON UserInboxes(followed_user_id);

--changeset aishu:1557304170118-209
CREATE INDEX UserInboxes_from_user_id_c65780d2 ON UserInboxes(from_user_id);

--changeset aishu:1557304170118-210
CREATE INDEX UserInboxes_list_id_1c17be20 ON UserInboxes(list_id);

--changeset aishu:1557304170118-211
CREATE INDEX UserInboxes_parent_list_id_7aa028c2 ON UserInboxes(parent_list_id);

--changeset aishu:1557304170118-212
CREATE INDEX UserInboxes_to_user_id_c2f4768a ON UserInboxes(to_user_id);

--changeset aishu:1557304170118-213
CREATE INDEX Users_groups_group_id_2ddde7ed ON Users_groups(group_id);

--changeset aishu:1557304170118-214
CREATE INDEX Users_groups_user_id_d0013979 ON Users_groups(user_id);

--changeset aishu:1557304170118-215
CREATE INDEX Users_terms_of_services_id_709cfa42 ON Users(terms_of_services_id);

--changeset aishu:1557304170118-216
CREATE INDEX Users_user_permissions_permission_id_7995fa19 ON Users_user_permissions(permission_id);

--changeset aishu:1557304170118-217
CREATE INDEX Users_user_permissions_user_id_c976b39e ON Users_user_permissions(user_id);

--changeset aishu:1557304170118-218
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions(group_id);

--changeset aishu:1557304170118-219
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions(permission_id);

--changeset aishu:1557304170118-220
CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission(content_type_id);

--changeset aishu:1557304170118-221
CREATE INDEX background_task_attempts_a9ade23d ON background_task(attempts);

--changeset aishu:1557304170118-222
CREATE INDEX background_task_completedtask_attempts_772a6783 ON background_task_completedtask(attempts);

--changeset aishu:1557304170118-223
CREATE INDEX background_task_completedtask_creator_content_type_id_21d6a741 ON background_task_completedtask(creator_content_type_id);

--changeset aishu:1557304170118-224
CREATE INDEX background_task_completedtask_failed_at_3de56618 ON background_task_completedtask(failed_at);

--changeset aishu:1557304170118-225
CREATE INDEX background_task_completedtask_locked_at_29c62708 ON background_task_completedtask(locked_at);

--changeset aishu:1557304170118-226
CREATE INDEX background_task_completedtask_locked_by_edc8a213 ON background_task_completedtask(locked_by);

--changeset aishu:1557304170118-227
CREATE INDEX background_task_completedtask_priority_9080692e ON background_task_completedtask(priority);

--changeset aishu:1557304170118-228
CREATE INDEX background_task_completedtask_queue_61fb0415 ON background_task_completedtask(queue);

--changeset aishu:1557304170118-229
CREATE INDEX background_task_completedtask_run_at_77c80f34 ON background_task_completedtask(run_at);

--changeset aishu:1557304170118-230
CREATE INDEX background_task_completedtask_task_hash_91187576_like ON background_task_completedtask(task_hash);

--changeset aishu:1557304170118-231
CREATE INDEX background_task_completedtask_task_name_388dabc2 ON background_task_completedtask(task_name);

--changeset aishu:1557304170118-232
CREATE INDEX background_task_creator_content_type_id_61cc9af3 ON background_task(creator_content_type_id);

--changeset aishu:1557304170118-233
CREATE INDEX background_task_failed_at_b81bba14 ON background_task(failed_at);

--changeset aishu:1557304170118-234
CREATE INDEX background_task_locked_at_0fb0f225 ON background_task(locked_at);

--changeset aishu:1557304170118-235
CREATE INDEX background_task_locked_by_db7779e3_like ON background_task(locked_by);

--changeset aishu:1557304170118-236
CREATE INDEX background_task_priority_88bdbce9 ON background_task(priority);

--changeset aishu:1557304170118-237
CREATE INDEX background_task_queue_1d5f3a40 ON background_task(queue);

--changeset aishu:1557304170118-238
CREATE INDEX background_task_run_at_7baca3aa ON background_task(run_at);

--changeset aishu:1557304170118-239
CREATE INDEX background_task_task_hash_d8f233bd ON background_task(task_hash);

--changeset aishu:1557304170118-240
CREATE INDEX background_task_task_name_4562d56a ON background_task(task_name);

--changeset aishu:1557304170118-241
CREATE INDEX compelld_app_activity_activity_category_id_fdeb7457 ON compelld_app_activity(activity_category_id);

--changeset aishu:1557304170118-242
CREATE INDEX compelld_app_activity_parent_activity_id_32408115 ON compelld_app_activity(parent_activity_id);

--changeset aishu:1557304170118-243
CREATE INDEX compelld_app_activity_place_id_1b3a3a20 ON compelld_app_activity(place_id);

--changeset aishu:1557304170118-244
CREATE INDEX compelld_app_activity_user_id_31b6ec64 ON compelld_app_activity(user_id);

--changeset aishu:1557304170118-245
CREATE INDEX compelld_app_activityasset_activity_id_2a0b4288 ON compelld_app_activityasset(activity_id);

--changeset aishu:1557304170118-246
CREATE INDEX compelld_app_activityasset_user_id_b1c4ecdd ON compelld_app_activityasset(user_id);

--changeset aishu:1557304170118-247
CREATE INDEX compelld_app_activitycateg_parent_activity_category_i_197794da ON compelld_app_activitycategory(parent_activity_category_id);

--changeset aishu:1557304170118-248
CREATE INDEX compelld_app_activitylist_activity_id_20b7007d ON compelld_app_activitylist(activity_id);

--changeset aishu:1557304170118-249
CREATE INDEX compelld_app_activitylist_list_id_f79762b4 ON compelld_app_activitylist(list_id);

--changeset aishu:1557304170118-250
CREATE INDEX compelld_app_activitylist_user_id_356a4e3e ON compelld_app_activitylist(user_id);

--changeset aishu:1557304170118-251
CREATE INDEX compelld_app_deviceinfo_user_id_13428615 ON compelld_app_deviceinfo(user_id);

--changeset aishu:1557304170118-252
CREATE INDEX compelld_app_follower_followed_by_id_575a619c ON compelld_app_follower(followed_by_id);

--changeset aishu:1557304170118-253
CREATE INDEX compelld_app_follower_followed_id_54e52737 ON compelld_app_follower(followee_id);

--changeset aishu:1557304170118-254
CREATE INDEX compelld_app_friendlist_friend_user_id_id_803f3f5a ON compelld_app_friendlist(compelld_user_id);

--changeset aishu:1557304170118-255
CREATE INDEX compelld_app_friendlist_user_id_a2a459f4 ON compelld_app_friendlist(user_id);

--changeset aishu:1557304170118-256
CREATE INDEX compelld_app_geofence_activity_id_f9329b6a ON compelld_app_geofence(activity_id);

--changeset aishu:1557304170118-257
CREATE INDEX compelld_app_geofence_user_id_fa109473 ON compelld_app_geofence(user_id);

--changeset aishu:1557304170118-258
CREATE INDEX compelld_app_list_parent_list_id_fd20861a ON compelld_app_list(parent_list_id);

--changeset aishu:1557304170118-259
CREATE INDEX compelld_app_list_user_id_642a4a7f ON compelld_app_list(user_id);

--changeset aishu:1557304170118-260
CREATE INDEX compelld_app_place_place_type_id_6b73d766 ON compelld_app_place(place_type_id);

--changeset aishu:1557304170118-261
CREATE INDEX compelld_app_ratings_activity_id_b4b3e897 ON compelld_app_ratings(activity_id);

--changeset aishu:1557304170118-262
CREATE INDEX compelld_app_ratings_place_id_54d72963 ON compelld_app_ratings(place_id);

--changeset aishu:1557304170118-263
CREATE INDEX compelld_app_ratings_user_id_e3f175d3 ON compelld_app_ratings(user_id);

--changeset aishu:1557304170118-264
CREATE INDEX compelld_app_reminder_activity_id_7fe5267a ON compelld_app_reminder(activity_id);

--changeset aishu:1557304170118-265
CREATE INDEX compelld_app_reminder_user_id_78f906fe ON compelld_app_reminder(user_id);

--changeset aishu:1557304170118-266
CREATE INDEX compelld_app_share_activity_id_80cdad70 ON compelld_app_share(activity_id);

--changeset aishu:1557304170118-267
CREATE INDEX compelld_app_share_list_id_5abe77e6 ON compelld_app_share(list_id);

--changeset aishu:1557304170118-268
CREATE INDEX compelld_app_share_shared_by_id_238838e6 ON compelld_app_share(shared_by_id);

--changeset aishu:1557304170118-269
CREATE INDEX compelld_app_share_shared_with_id_0e93bbd7 ON compelld_app_share(shared_with_id);

--changeset aishu:1557304170118-270
CREATE INDEX compelld_app_user_groups_group_id_d4c0de32 ON compelld_app_user_groups(group_id);

--changeset aishu:1557304170118-271
CREATE INDEX compelld_app_user_groups_user_id_f03b5bdb ON compelld_app_user_groups(user_id);

--changeset aishu:1557304170118-272
CREATE INDEX compelld_app_user_user_permissions_permission_id_78df7bf7 ON compelld_app_user_user_permissions(permission_id);

--changeset aishu:1557304170118-273
CREATE INDEX compelld_app_user_user_permissions_user_id_22b6a122 ON compelld_app_user_user_permissions(user_id);

--changeset aishu:1557304170118-274
CREATE INDEX compelld_app_userinbox_activity_id_c448c4f2 ON compelld_app_userinbox(activity_id);

--changeset aishu:1557304170118-275
CREATE INDEX compelld_app_userinbox_from_user_id_450ee63d ON compelld_app_userinbox(from_user_id);

--changeset aishu:1557304170118-276
CREATE INDEX compelld_app_userinbox_list_id_6eb78f59 ON compelld_app_userinbox(list_id);

--changeset aishu:1557304170118-277
CREATE INDEX compelld_app_userinbox_to_user_id_d92fcb29 ON compelld_app_userinbox(to_user_id);

--changeset aishu:1557304170118-278
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log(content_type_id);

--changeset aishu:1557304170118-279
CREATE INDEX django_session_expire_date_a5c62663 ON django_session(expire_date);

--changeset aishu:1557304170118-280
ALTER TABLE Activities ADD CONSTRAINT Activities_activity_category_id_9c551642_fk_ActivityC FOREIGN KEY (activity_category_id) REFERENCES ActivityCategories (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-281
ALTER TABLE Activities ADD CONSTRAINT Activities_copied_from_id_dc7660b9_fk_Activities_uuid FOREIGN KEY (copied_from_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-282
ALTER TABLE Activities ADD CONSTRAINT Activities_copied_from_user_id_741bba3e_fk_Users_uuid FOREIGN KEY (copied_from_user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-283
ALTER TABLE Activities ADD CONSTRAINT Activities_list_category_id_2689948f_fk_ListCategories_uuid FOREIGN KEY (list_category_id) REFERENCES ListCategories (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-284
ALTER TABLE Activities ADD CONSTRAINT Activities_originated_from_id_dfe0e750_fk_Activities_uuid FOREIGN KEY (originated_from_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-285
ALTER TABLE Activities ADD CONSTRAINT Activities_parent_activity_id_0cf24a9e_fk_Activities_uuid FOREIGN KEY (parent_activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-286
ALTER TABLE Activities ADD CONSTRAINT Activities_place_id_605ba543_fk_Places_uuid FOREIGN KEY (place_id) REFERENCES Places (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-287
ALTER TABLE Activities ADD CONSTRAINT Activities_user_id_85702ab4_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-288
ALTER TABLE ActivityAssets ADD CONSTRAINT ActivityAssets_activity_id_fab92a2a_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-289
ALTER TABLE ActivityAssets ADD CONSTRAINT ActivityAssets_user_id_3dc25968_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-290
ALTER TABLE ActivityCategories ADD CONSTRAINT ActivityCategories_parent_activity_cate_262b3149_fk_ActivityC FOREIGN KEY (parent_activity_category_id) REFERENCES ActivityCategories (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-291
ALTER TABLE ActivityLists ADD CONSTRAINT ActivityLists_activity_id_e62ec092_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-292
ALTER TABLE ActivityLists ADD CONSTRAINT ActivityLists_list_id_0f896df6_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-293
ALTER TABLE ActivityLists ADD CONSTRAINT ActivityLists_user_id_8766573e_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-294
ALTER TABLE ApplicationConfigs ADD CONSTRAINT ApplicationConfigs_device_id_id_6c01def5_fk_DeviceInfos_uuid FOREIGN KEY (device_id_id) REFERENCES DeviceInfos (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-295
ALTER TABLE ApplicationConfigs ADD CONSTRAINT ApplicationConfigs_user_id_0a1be298_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-296
ALTER TABLE CollaborativeListActivities ADD CONSTRAINT CollaborativeListAct_activity_id_b86d5d38_fk_Activitie FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-297
ALTER TABLE CollaborativeListActivities ADD CONSTRAINT CollaborativeListActivities_list_id_0452bce4_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-298
ALTER TABLE CollaborativeListActivities ADD CONSTRAINT CollaborativeListActivities_user_id_ad26b45a_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-299
ALTER TABLE CollaborativeListGeoFences ADD CONSTRAINT CollaborativeListGeoFences_place_id_8b624b12_fk_Places_uuid FOREIGN KEY (place_id) REFERENCES Places (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-300
ALTER TABLE CollaborativeListGeoFences ADD CONSTRAINT CollaborativeListGeoFences_user_id_04411db2_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-301
ALTER TABLE CollaborativeListGeoFences ADD CONSTRAINT CollaborativeListGeo_activity_id_5168ec88_fk_Collabora FOREIGN KEY (activity_id) REFERENCES CollaborativeListActivities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-302
ALTER TABLE CollaborativeListReminders ADD CONSTRAINT CollaborativeListRem_activity_id_f6bd83d0_fk_Collabora FOREIGN KEY (activity_id) REFERENCES CollaborativeListActivities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-303
ALTER TABLE CollaborativeListReminders ADD CONSTRAINT CollaborativeListReminders_user_id_96539333_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-304
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_deleted_by_id_739b0f5c_fk_Users_uuid FOREIGN KEY (deleted_by_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-305
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_invited_by_id_843308f5_fk_Users_uuid FOREIGN KEY (invited_by_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-306
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_list_id_9e60a7a2_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-307
ALTER TABLE CollaborativeListRoles ADD CONSTRAINT CollaborativeListRoles_user_id_397a4ae3_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-308
ALTER TABLE DeviceInfos ADD CONSTRAINT DeviceInfos_user_id_b2da0a49_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-309
ALTER TABLE FeaturedLists ADD CONSTRAINT FeaturedLists_list_id_574e1864_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-310
ALTER TABLE FeaturedLists ADD CONSTRAINT FeaturedLists_user_id_6a22160b_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-311
ALTER TABLE FeaturedUsersLists ADD CONSTRAINT FeaturedUsersLists_list_id_c0e2c2ad_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-312
ALTER TABLE FeaturedUsersLists ADD CONSTRAINT FeaturedUsersLists_user_id_3addc797_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-313
ALTER TABLE FeaturedUsers ADD CONSTRAINT FeaturedUsers_user_id_20ce47fd_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-314
ALTER TABLE Followers ADD CONSTRAINT Followers_followed_by_id_6ee9e054_fk_Users_uuid FOREIGN KEY (followed_by_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-315
ALTER TABLE Followers ADD CONSTRAINT Followers_followee_id_ec66e011_fk_Users_uuid FOREIGN KEY (followee_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-316
ALTER TABLE FriendLists ADD CONSTRAINT FriendLists_compelld_user_id_02f49dec_fk_Users_uuid FOREIGN KEY (compelld_user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-317
ALTER TABLE FriendLists ADD CONSTRAINT FriendLists_user_id_10d3a979_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-318
ALTER TABLE FriendSearchKeywords ADD CONSTRAINT FriendSearchKeywords_user_id_a0dcd00d_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-319
ALTER TABLE GeoFences ADD CONSTRAINT GeoFences_activity_id_d65da973_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-320
ALTER TABLE GeoFences ADD CONSTRAINT GeoFences_place_id_3df3e623_fk_Places_uuid FOREIGN KEY (place_id) REFERENCES Places (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-321
ALTER TABLE GeoFences ADD CONSTRAINT GeoFences_user_id_8388ffb6_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-322
ALTER TABLE ListCategories ADD CONSTRAINT ListCategories_parent_list_category_0737dd3f_fk_ListCateg FOREIGN KEY (parent_list_category_id) REFERENCES ListCategories (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-323
ALTER TABLE ListFollowers ADD CONSTRAINT ListFollowers_followed_by_id_b58e880c_fk_Users_uuid FOREIGN KEY (followed_by_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-324
ALTER TABLE ListFollowers ADD CONSTRAINT ListFollowers_list_id_052c8963_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-325
ALTER TABLE ListMappings ADD CONSTRAINT ListMapping_child_list_id_fc800676_fk_Lists_uuid FOREIGN KEY (child_list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-326
ALTER TABLE ListMappings ADD CONSTRAINT ListMapping_parent_list_id_d8448631_fk_Lists_uuid FOREIGN KEY (parent_list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-327
ALTER TABLE ListMappings ADD CONSTRAINT ListMapping_user_id_4676babc_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-328
ALTER TABLE Lists ADD CONSTRAINT Lists_list_category_id_a8756374_fk_ListCategories_uuid FOREIGN KEY (list_category_id) REFERENCES ListCategories (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-329
ALTER TABLE Lists ADD CONSTRAINT Lists_originated_from_id_e48c3d6d_fk_Lists_uuid FOREIGN KEY (originated_from_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-330
ALTER TABLE Lists ADD CONSTRAINT Lists_parent_list_id_053a3775_fk_Lists_uuid FOREIGN KEY (parent_list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-331
ALTER TABLE Lists ADD CONSTRAINT Lists_user_id_6303ce03_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-332
ALTER TABLE Places ADD CONSTRAINT Places_place_type_id_d3b42df0_fk_PlaceTypes_uuid FOREIGN KEY (place_type_id) REFERENCES PlaceTypes (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-333
ALTER TABLE Ratings ADD CONSTRAINT Ratings_activity_id_6d50b15a_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-334
ALTER TABLE Ratings ADD CONSTRAINT Ratings_place_id_9090432b_fk_Places_uuid FOREIGN KEY (place_id) REFERENCES Places (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-335
ALTER TABLE Ratings ADD CONSTRAINT Ratings_user_id_31a8a7d1_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-336
ALTER TABLE Reminders ADD CONSTRAINT Reminders_activity_id_4179429b_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-337
ALTER TABLE Reminders ADD CONSTRAINT Reminders_user_id_c6839c25_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-338
ALTER TABLE SearchKeywords ADD CONSTRAINT SearchKeywords_user_id_66a6e7fd_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-339
ALTER TABLE Shares ADD CONSTRAINT Shares_activity_id_de7a2f19_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-340
ALTER TABLE Shares ADD CONSTRAINT Shares_list_id_f094b66f_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-341
ALTER TABLE Shares ADD CONSTRAINT Shares_shared_by_id_96f74b1f_fk_Users_uuid FOREIGN KEY (shared_by_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-342
ALTER TABLE Shares ADD CONSTRAINT Shares_shared_with_id_029e12ce_fk_Users_uuid FOREIGN KEY (shared_with_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-343
ALTER TABLE UserHomeModules ADD CONSTRAINT UserHomeModules_home_module_id_aa2eba9e_fk_HomeModules_uuid FOREIGN KEY (home_module_id) REFERENCES HomeModules (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-344
ALTER TABLE UserHomeModules ADD CONSTRAINT UserHomeModules_user_id_8bf0d5e7_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-345
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_activity_id_5d5d1d1a_fk_Activities_uuid FOREIGN KEY (activity_id) REFERENCES Activities (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-346
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_followed_user_id_2fa9c019_fk_Users_uuid FOREIGN KEY (followed_user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-347
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_from_user_id_c65780d2_fk_Users_uuid FOREIGN KEY (from_user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-348
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_list_id_1c17be20_fk_Lists_uuid FOREIGN KEY (list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-349
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_parent_list_id_7aa028c2_fk_Lists_uuid FOREIGN KEY (parent_list_id) REFERENCES Lists (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-350
ALTER TABLE UserInboxes ADD CONSTRAINT UserInboxes_to_user_id_c2f4768a_fk_Users_uuid FOREIGN KEY (to_user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-351
ALTER TABLE UserVerifications ADD CONSTRAINT UserVerifications_user_id_75ae358b_fk_Users_uuid FOREIGN KEY (user_id) REFERENCES Users (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-352
ALTER TABLE Users_groups ADD CONSTRAINT Users_groups_group_id_2ddde7ed_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-353
ALTER TABLE Users_groups ADD CONSTRAINT Users_groups_user_id_d0013979_fk_Users_id FOREIGN KEY (user_id) REFERENCES Users (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-354
ALTER TABLE Users ADD CONSTRAINT Users_terms_of_services_id_709cfa42_fk_TermsOfServices_uuid FOREIGN KEY (terms_of_services_id) REFERENCES TermsOfServices (uuid) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-355
ALTER TABLE Users_user_permissions ADD CONSTRAINT Users_user_permissio_permission_id_7995fa19_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-356
ALTER TABLE Users_user_permissions ADD CONSTRAINT Users_user_permissions_user_id_c976b39e_fk_Users_id FOREIGN KEY (user_id) REFERENCES Users (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-357
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-358
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-359
ALTER TABLE auth_permission ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-360
ALTER TABLE background_task_completedtask ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-361
ALTER TABLE background_task ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-362
ALTER TABLE compelld_app_activity ADD CONSTRAINT compelld_app_activit_activity_category_id_fdeb7457_fk_compelld_ FOREIGN KEY (activity_category_id) REFERENCES compelld_app_activitycategory (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-363
ALTER TABLE compelld_app_activitylist ADD CONSTRAINT compelld_app_activit_activity_id_20b7007d_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-364
ALTER TABLE compelld_app_activityasset ADD CONSTRAINT compelld_app_activit_activity_id_2a0b4288_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-365
ALTER TABLE compelld_app_activitylist ADD CONSTRAINT compelld_app_activit_list_id_f79762b4_fk_compelld_ FOREIGN KEY (list_id) REFERENCES compelld_app_list (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-366
ALTER TABLE compelld_app_activitycategory ADD CONSTRAINT compelld_app_activit_parent_activity_cate_197794da_fk_compelld_ FOREIGN KEY (parent_activity_category_id) REFERENCES compelld_app_activitycategory (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-367
ALTER TABLE compelld_app_activity ADD CONSTRAINT compelld_app_activit_parent_activity_id_32408115_fk_compelld_ FOREIGN KEY (parent_activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-368
ALTER TABLE compelld_app_activity ADD CONSTRAINT compelld_app_activit_place_id_1b3a3a20_fk_compelld_ FOREIGN KEY (place_id) REFERENCES compelld_app_place (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-369
ALTER TABLE compelld_app_activitylist ADD CONSTRAINT compelld_app_activit_user_id_356a4e3e_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-370
ALTER TABLE compelld_app_activityasset ADD CONSTRAINT compelld_app_activit_user_id_b1c4ecdd_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-371
ALTER TABLE compelld_app_activity ADD CONSTRAINT compelld_app_activity_user_id_31b6ec64_fk_compelld_app_user_id FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-372
ALTER TABLE compelld_app_deviceinfo ADD CONSTRAINT compelld_app_devicei_user_id_13428615_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-373
ALTER TABLE compelld_app_follower ADD CONSTRAINT compelld_app_followe_followed_by_id_575a619c_fk_compelld_ FOREIGN KEY (followed_by_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-374
ALTER TABLE compelld_app_follower ADD CONSTRAINT compelld_app_followe_followee_id_561d9dbf_fk_compelld_ FOREIGN KEY (followee_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-375
ALTER TABLE compelld_app_friendlist ADD CONSTRAINT compelld_app_friendl_compelld_user_id_29e5520c_fk_compelld_ FOREIGN KEY (compelld_user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-376
ALTER TABLE compelld_app_friendlist ADD CONSTRAINT compelld_app_friendl_user_id_a2a459f4_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-377
ALTER TABLE compelld_app_geofence ADD CONSTRAINT compelld_app_geofenc_activity_id_f9329b6a_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-378
ALTER TABLE compelld_app_geofence ADD CONSTRAINT compelld_app_geofenc_place_id_9aa8076d_fk_compelld_ FOREIGN KEY (place_id) REFERENCES compelld_app_place (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-379
ALTER TABLE compelld_app_geofence ADD CONSTRAINT compelld_app_geofence_user_id_fa109473_fk_compelld_app_user_id FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-380
ALTER TABLE compelld_app_list ADD CONSTRAINT compelld_app_list_parent_list_id_fd20861a_fk_compelld_ FOREIGN KEY (parent_list_id) REFERENCES compelld_app_list (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-381
ALTER TABLE compelld_app_list ADD CONSTRAINT compelld_app_list_user_id_642a4a7f_fk_compelld_app_user_id FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-382
ALTER TABLE compelld_app_place ADD CONSTRAINT compelld_app_place_place_type_id_6b73d766_fk_compelld_ FOREIGN KEY (place_type_id) REFERENCES compelld_app_placetype (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-383
ALTER TABLE compelld_app_ratings ADD CONSTRAINT compelld_app_ratings_activity_id_b4b3e897_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-384
ALTER TABLE compelld_app_ratings ADD CONSTRAINT compelld_app_ratings_place_id_54d72963_fk_compelld_app_place_id FOREIGN KEY (place_id) REFERENCES compelld_app_place (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-385
ALTER TABLE compelld_app_ratings ADD CONSTRAINT compelld_app_ratings_user_id_e3f175d3_fk_compelld_app_user_id FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-386
ALTER TABLE compelld_app_reminder ADD CONSTRAINT compelld_app_reminde_activity_id_7fe5267a_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-387
ALTER TABLE compelld_app_reminder ADD CONSTRAINT compelld_app_reminder_user_id_78f906fe_fk_compelld_app_user_id FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-388
ALTER TABLE compelld_app_share ADD CONSTRAINT compelld_app_share_activity_id_80cdad70_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-389
ALTER TABLE compelld_app_share ADD CONSTRAINT compelld_app_share_list_id_5abe77e6_fk_compelld_app_list_id FOREIGN KEY (list_id) REFERENCES compelld_app_list (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-390
ALTER TABLE compelld_app_share ADD CONSTRAINT compelld_app_share_shared_by_id_238838e6_fk_compelld_ FOREIGN KEY (shared_by_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-391
ALTER TABLE compelld_app_share ADD CONSTRAINT compelld_app_share_shared_with_id_0e93bbd7_fk_compelld_ FOREIGN KEY (shared_with_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-392
ALTER TABLE compelld_app_user_groups ADD CONSTRAINT compelld_app_user_gr_user_id_f03b5bdb_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-393
ALTER TABLE compelld_app_user_groups ADD CONSTRAINT compelld_app_user_groups_group_id_d4c0de32_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-394
ALTER TABLE compelld_app_user_user_permissions ADD CONSTRAINT compelld_app_user_us_permission_id_78df7bf7_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-395
ALTER TABLE compelld_app_user_user_permissions ADD CONSTRAINT compelld_app_user_us_user_id_22b6a122_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-396
ALTER TABLE compelld_app_userinbox ADD CONSTRAINT compelld_app_userinb_activity_id_c448c4f2_fk_compelld_ FOREIGN KEY (activity_id) REFERENCES compelld_app_activity (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-397
ALTER TABLE compelld_app_userinbox ADD CONSTRAINT compelld_app_userinb_from_user_id_450ee63d_fk_compelld_ FOREIGN KEY (from_user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-398
ALTER TABLE compelld_app_userinbox ADD CONSTRAINT compelld_app_userinb_to_user_id_d92fcb29_fk_compelld_ FOREIGN KEY (to_user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-399
ALTER TABLE compelld_app_userinbox ADD CONSTRAINT compelld_app_userinbox_list_id_6eb78f59_fk_compelld_app_list_id FOREIGN KEY (list_id) REFERENCES compelld_app_list (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-400
ALTER TABLE compelld_app_userverification ADD CONSTRAINT compelld_app_userver_user_id_864534b0_fk_compelld_ FOREIGN KEY (user_id) REFERENCES compelld_app_user (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-401
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

--changeset aishu:1557304170118-402
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_Users_user_id FOREIGN KEY (user_id) REFERENCES Users (id) ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED;

