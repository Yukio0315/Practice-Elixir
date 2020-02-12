sayFizzBuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  a, b, c -> c
end

# IO.puts(sayFizzBuzz.(0, 0, 1))
# IO.puts(sayFizzBuzz.(0, 1, 1))
# IO.puts(sayFizzBuzz.(1, 0, 1))

fizzBuzz = fn n -> sayFizzBuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts(fizzBuzz.(10))
IO.puts(fizzBuzz.(11))
IO.puts(fizzBuzz.(12))
IO.puts(fizzBuzz.(13))
IO.puts(fizzBuzz.(14))
IO.puts(fizzBuzz.(15))
IO.puts(fizzBuzz.(16))
