// JavaScript
const API_URL = "https://your-api-id.execute-api.region.amazonaws.com/prod/visitor-count";

async function getVisitorCount() {
  try {
    const response = await fetch(API_URL);
    if (!response.ok) throw new Error("Network response was not ok");

    const data = await response.json(); // Expecting { count: <number> }
    document.getElementById("visitor-count").innerText = data.count;
  } catch (error) {
    console.error("Error fetching visitor count:", error);
    document.getElementById("visitor-count").innerText = "Error";
  }
}

window.onload = getVisitorCount;
