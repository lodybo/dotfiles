function history()
{
  # use the argument as line number, or default to 1
  line=${1:-1}

  fc -E -l "$line"
}
