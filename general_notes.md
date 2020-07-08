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

### Pass by reference vs pass by value

You can either treat these arguments as "references" to the original object or as "values", which are copies of the original.

When you "pass by value", the method only has a copy of the original object. Operations performed on the object within the method have no effect on the original object outside of the method.

Ruby exhibits a combination of behaviors from both "pass by reference" as well as "pass by value". Some people call this pass by reference of the value or call by sharing. Whatever you call it, the most important concept you should remember is:

> When an operation within the method mutates the caller, it will affect the original object. For example, `upcase!`, `capitalize!`, `Array#pop` or `Array#<<`. Assignment `=` or concatenating 2 arrays with `+` will not mutate the caller.

Another example where assignment does not mutate the caller. First, the `=` is pointing the new variable to  a different address in memory.

Variables are pointers to physical space in memory and when the caller is mutated, instead of reassigned, the value in the memory address changes for both variables.

```ruby
a = "hi there"
b = a
a = "not here"
b #=> "hi there"

a = "hi there"
b = a
a << ", Bob"
b #=> "hi there, Bob"
```
