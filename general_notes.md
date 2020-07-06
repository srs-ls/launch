### Tap

One other use case for this method is to debug intermediate objects in method chains. Take the example below. As you can see, the transformation done and the resulting object at every step is now visible to us by just using tap.

```ruby
(1..10)                 .tap { |x| p x }   # 1..10
 .to_a                  .tap { |x| p x }   # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 .select {|x| x.even? } .tap { |x| p x }   # [2, 4, 6, 8, 10]
 .map {|x| x*x }        .tap { |x| p x }   # [4, 16, 36, 64, 100]
```

### Notes on method scope and blocks

Given this additional context, we can think of method definition as setting a certain scope for any local variables in terms of the parameters that the method definition has, what it does with those parameters, and also how it interacts (if at all) with a block. We can then think of method invocation as using the scope set by the method definition. If the method is defined to use a block, then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings.

For example:

```ruby
a = "hello"

[1, 2, 3].map { |num| a } # => ["hello", "hello", "hello"]
# The method `map` does not have access to the outer scope's variables but can act on them through the block's return value.
```

- Method definition sets a scope for local variables in terms of parameters and interaction with blocks
- Method invocation uses the scope set by the method definition