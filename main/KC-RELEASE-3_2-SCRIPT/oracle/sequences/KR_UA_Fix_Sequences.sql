create or replace function is_numeric (p_string in varchar2)
return NUMBER as l_number number;
begin
    l_number := p_string;
    return 1;
exception
    when others then
    return 0;
end;
/

declare
    l_new_seq INTEGER;
begin

  execute immediate 'DROP SEQUENCE KRIM_ROLE_PERM_ID_BS_S';
  select nvl(max(to_number(ROLE_PERM_ID)),'1') + 1 into l_new_seq from KRIM_ROLE_PERM_T where decode(is_numeric(ROLE_PERM_ID),1,to_number(ROLE_PERM_ID)) < 10000;
  execute immediate 'CREATE SEQUENCE KRIM_ROLE_PERM_ID_BS_S START WITH ' || l_new_seq ||
      ' MAXVALUE 99999999 MINVALUE 1 NOCYCLE NOCACHE NOORDER';

end;
/
