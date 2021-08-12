create view company_page as 
select c.companycode,pc.companycode as parent_company_code,c.companyname,c.companytype,
c.address1,c.address2,c.city,c.street,c.zipcode,c.state,c.country,c.contact,c.email,c.timezone,
c.isparentcompany,c.is_enabled,c.default_lang_code,c.created_dttm,c.last_updated_dttm,u1.username as created_by , u2.username as updated_by
 from twms.company c inner join twms.company pc on (c.company_id = pc.parent_company_id) left join twms.user u1 on (c.created_user = u1.user_id)
 left join twms.user u2 on (c.last_updated_user = u2.user_id);
 
create view facility_page as 
 select f.facility_code,f.facility_name,f.facility_type,f.address1,f.address2,f.city,f.street,f.zipcode,f.state,f.country,
 f.contact, f.email,f.timezone,c.companyname,f.is_enabled,f.default_lang_code,f.created_dttm,f.last_updated_dttm,u1.username as created_by , u2.username as updated_by
 from twms.facility f left join company c on (f.parent_company_id = c.company_id)
 left join twms.user u1 on (f.created_user = u1.user_id)
 left join twms.user u2 on (f.last_updated_user = u2.user_id);

select * from twms.page_action;