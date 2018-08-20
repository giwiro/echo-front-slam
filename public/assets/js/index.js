
// const URL = 'http://www.giwiro.com/api/whois';
const URL = 'http://127.0.0.1:6969/whois';
const hostname = document.querySelector("#hostname");

fetch(URL)
	.then(resp => 
		resp.text()
			.then(text => hostname.innerHTML = text))
	.catch(e => console.log("error", error))
