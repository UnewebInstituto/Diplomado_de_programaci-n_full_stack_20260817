function fibonacci(n) {
  const result = [0, 1];
  for (var i = 2; i < n; i++) {
    result.push(result[i - 2] + result[i - 1]);
  }
  return result.slice(0, n);
}

console.log(fibonacci(10));