function drni()
{
  docker images | grep "none" | awk "{print $3}" | xargs docker rmi -f dangling=true
}
