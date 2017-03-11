A simple program try to solve bin packing issue 

```
bundle install
bundle exec rspec spec
```

It can pass the tests of the giving dataset. 
However, I understand the algorithm used in the program is a naive approach.

This program use the following method: 
- try to fit the order quantiy with the largest bundle
- then try to fit the remaining quantiy with second largest bundle
- if there is no exact fit can be found drop the largest bundle size and try it again until the smallest bunlde can't fit

This program can't deal with case like:
- 28 T58 which can be fit with 9***x2 5x2
But it an certainly deal with Rose and Lilie. 
Beacuse their the small bundle size are the doulbe of the large one.
