const data = [
    {
        l: "A",
        p: 8,
    }, 
    {
        l: "B",
        p: 1.5,
    }, 
    {
        l: "C",
        p: 3,
    },
    {
        l: "D",
        p: 4.2,
    },
    {
        l: "E",
        p: 13,
    },
    {
        l: "F",
        p: 2.4,
    }, 
    {
        l: "G",
        p: 2,
    }
];
const margin = {top: 20, right: 30, bottom: 30, left: 40};
const width = 960 - margin.left - margin.right;
const barHeight = 500 - margin.top - margin.bottom;

const x = d3.scaleBand()
    .rangeRound([0, width], .1);

const y = d3.scaleLinear()
    .range([barHeight, 0]);

const xAxis = d3.axisBottom().scale(x);
const yAxis = d3.axisLeft().scale(y).ticks(10, "%");

const chart = d3.select(".chart")
    .attr("width", width + margin.left + margin.right)
    .attr("height", barHeight + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

chart.append("g")
    .attr("class", "x axis")
    .attr("transform", `translate(0,${barHeight})`)
    .call(xAxis);

chart.append("g")
    .attr("class", "y axis")
    .call(yAxis)
    .append("text")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", "1em")
    .style("text-anchor", "end")
    .text("Frequency");

y.domain([0, 12]);
x.domain(data.map((d) => d.l));

const barWidth = width / data.length;

const bars = chart.append("g")
.attr("class", "bars");

const bars2 = bars.selectAll("g")
    .data(data)
    .enter().append("g")
    .attr("transform", (d) => `translate(${x(d.l) + 1},0)`)
    .attr("class", "bar")


bars2.append("rect")
.attr("y", (d) => y(d.p))
.attr("width", x.bandwidth() - 1)
.attr("height", (d) => barHeight - y(d.p))

bars2.append("text")
.attr("x", x.bandwidth() / 2)
.attr("y", (d) => y(d.p) + (barHeight - y(d.p)) / 2)
.text((d) => d.l);

