prefix = fn prefix -> fn name -> IO.puts(Enum.join([prefix, name], " ")) end end

prefix.("a").("b")
