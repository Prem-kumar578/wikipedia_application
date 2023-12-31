let inputEl = document.getElementById("searchInput");
let containerEl = document.getElementById("searchResults");

function createAndAppend(result) {
    let {
        title,
        link,
        description
    } = result
    let containerEl1 = document.createElement("div");
    containerEl1.classList.add("result_item");
    containerEl.appendChild(containerEl1)

    let anchorEl = document.createElement("a");
    anchorEl.classList.add("result_item");
    anchorEl.textContent = title;
    anchorEl.href = link;
    anchorEl.target = "_blank";
    containerEl1.appendChild(anchorEl)

    let breakEl = document.createElement("br");
    containerEl1.appendChild(breakEl);

    let anchorEl1 = document.createElement("a");
    anchorEl1.classList.add("result_item");
    anchorEl1.textContent = link;
    anchorEl1.href = link
    anchorEl.target = "_blank";
    containerEl1.appendChild(anchorEl1);

    let breakEl1 = document.createElement("br");
    containerEl1.appendChild(breakEl1);

    let paragraphEl = document.createElement("p");
    paragraphEl.textContent = description;
    paragraphEl.classList.add("line_description");
    containerEl1.appendChild(paragraphEl);
}

function displayResults(searchResults) {
    for (let result of searchResults) {
        createAndAppend(result)
    }
}

inputEl.addEventListener("keydown", function() {
    if (event.key === "Enter") {
        containerEl.textContent = "";
        let inputvalue = inputEl.value;

        let options = {
            method: "GET"
        }
        let url = "https://apis.ccbp.in/wiki-search?search=" + inputvalue
        fetch(url, options)
            .then(function(response) {
                return response.json()
            })
            .then(function(jsonData) {
                let {
                    search_results
                } = jsonData;
                displayResults(search_results)
            })
    }
})