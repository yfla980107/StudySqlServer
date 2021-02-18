select lower(email) as email, mobile, names, addr
  from membertbl
order by names desc;