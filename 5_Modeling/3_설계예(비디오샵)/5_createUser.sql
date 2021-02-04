drop user VIDEO CASCADE;
create user VIDEO identified by JAVA;
grant CONNECT, RESOURCE to VIDEO;
conn VIDEO/JAVA;