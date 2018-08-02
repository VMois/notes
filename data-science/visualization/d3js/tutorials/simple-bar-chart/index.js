const data = [2, 14, 7, 32, 25, 42];

console.log(d3);

const x = d3.scaleLinear()
    .domain([0, d3.max(data)])
    .range([0, 420]);

d3.select(".chart")
.selectAll("div")
.data(data)
.enter()
.append("div")
.style("height", (d) => x(d) + "px")
.text((d) => d)