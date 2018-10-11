employees = []

alice = {
    full_name: 'Alice Doe',
    id: '1234567890'
}

employees << alice

some_hash ={
    1 => "Foo #{rand()}",
    bar: 'bar',
    :baz => :BAZ,
    [1,2,3] => 4,
    { a: 7 } => 8
}

puts some_hash[1]
puts some_hash[:bar]
puts some_hash[:baz]
puts some_hash[[1,2,3]]
puts some_hash[{a: 7}]