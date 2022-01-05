//Load the DOM, then do stuff.
document.addEventListener('DOMContentLoaded', function() {

    // Make sure Welcome page is displayed
    document.querySelector('#welcome-desc').style.display = 'block';

    // Use Nav bar to toggle between Board views
    document.querySelector('#product').addEventListener('click', () => loadDashboard('product'));
    document.querySelector('#client').addEventListener('click', () => loadDashboard('client'));
    document.querySelector('#usecase').addEventListener('click', () => loadDashboard('usecase'));

    // Listener for Search Bar
    document.querySelector('#search-input').addEventListener('click', () => searchQuery())
    
    // Listeners for Create Buttons
    document.querySelector('#product-btn').addEventListener('click', () => openForm('product'));
    document.querySelector('#client-btn').addEventListener('click', () => openForm('client'));
    document.querySelector('#usecase-btn').addEventListener('click', () => openForm('usecase'));
    
    // Listeners for Each Form
    document.querySelector('#product-submit').addEventListener('click', () => createProduct());
    document.querySelector('#client-submit').addEventListener('click', () => createClient());
    document.querySelector('#usecase-submit').addEventListener('click', () => createUsecase());

}); 

function loadDashboard(board, search='False', searchValue='') {
    // Clear out the container so we don't duplicate entries on screen
    document.querySelector('#welcome-desc').style.display = 'none';
    document.querySelector(`#${board}-card-container`).innerHTML = ' ';
    document.querySelector(`#${board}-view`).innerHTML = '';

    // Unhide the Search Bar
    document.querySelector(`#search-input`).style.display = 'Flex';
    document.querySelector(`#search-value`).style.display = 'Flex';
    

    // Clear out the forms so we don't keep them filled in should they have been used to Edit.
    document.querySelector('.create-forms').style.display = 'none';
    document.querySelector(`#${board}-input-id`).value = 'none';
    document.querySelector(`#${board}-name`).value = '';
    document.querySelector(`#${board}-desc`).value = '';
    try {
        document.querySelector(`#${board}-status`).value = '';
    } catch {};

    var createBtn = document.querySelector(`#${board}-btn`);
    createBtn.className = 'create-btn btn btn-primary';
    createBtn.innerHTML = `Create ${board}`;

    
    getStatus(board);

    fetch(`/tracker_dashboard/${board}/${search}/${searchValue}`)
    .then(response => response.json())
    .then(data => (item_obj = data.items, obj = data))
    .then(() => {
        //for item in list is the pythonic way of explaining what this does
        item_obj.forEach(item => {
            console.log(`Items are: ${item}`);
            buildCards(board, item)
        });   
    })

}


function searchQuery() {

    var search = 'True';
    var searchValue = document.querySelector('#search-value').value
    
    var searchItem = document.querySelector('#search-value').placeholder;
    var board = 'all';
    console.log(`${searchItem}`);
    if (searchItem === 'Search Products') {
        board = 'product';
    } else if (searchItem === 'Search Clients') {
        board = 'client';
    } else if (searchItem === 'Search Use Cases') {
        board = 'usecase';
    } else {
        board = 'all';
    }
    
    loadDashboard(board, search, searchValue);
}

function getStatus(board) {
    //Fetches the Status List Choices from various Models
    if (board === 'client') {
        return undefined;
    }
    var statusSelector = document.querySelector(`#${board}-status`);
    fetch(`get_status/${board}`)
    .then(response => response.json())
    .then(function(data) {
        console.log(data.statuses);
        console.log(`statusSelector is: ${statusSelector}`)
        for (const status of data.statuses) {
            let statusOption = document.createElement('option');
            statusOption.id = `${status}-status`
            statusOption.value = status;
            statusOption.innerHTML = status;
            statusSelector.appendChild(statusOption);
        }
    })
}

function openForm(board) {
    // Create Floating window
    document.querySelector('.create-forms').style.display = 'block';
    document.querySelector('#product-form').style.display = 'none';
    document.querySelector('#client-form').style.display = 'none';
    document.querySelector('#usecase-form').style.display = 'none';
    
    if (board === 'product') {
        document.querySelector('#product-form').style.display = 'block';
        console.log('Create Product Clicked');
    } 
    else if (board === 'client') {
        document.querySelector('#client-form').style.display = 'block';
        console.log('Create Client Clicked');
    }
    else if (board === 'usecase') {
        document.querySelector('#usecase-form').style.display = 'block';
        console.log('Create usecase Clicked');      
    }

}

function buildCards(board, item) {
    var id = item.id
    var desc = item.desc
    console.log(`ID variable is: ${id}`)

    document.querySelector('#client-page').style.display = 'none';
    document.querySelector('#usecase-page').style.display = 'none';
    document.querySelector('#product-page').style.display = 'none';
    
    if(board === 'product') {
        document.querySelector('#product-page').style.display = 'block';    
        document.querySelector('#product-btn').style.display = 'block';
        document.querySelector('#product-delete-btn').style.display = 'none';
        document.querySelector('#search-value').placeholder = 'Search Products';
        item = item.product;
    } else if(board === 'client') {
        document.querySelector('#client-page').style.display = 'block';
        document.querySelector('#client-btn').style.display = 'block';
        document.querySelector('#client-delete-btn').style.display = 'none';
        document.querySelector('#search-value').placeholder = 'Search Clients';
        item = item.client;
    } else if(board === 'usecase') {
        document.querySelector('#usecase-page').style.display = 'block';
        document.querySelector('#usecase-btn').style.display = 'block';
        document.querySelector('#usecase-delete-btn').style.display = 'none';
        document.querySelector('#search-value').placeholder = 'Search Use Cases'; 
        item = item.use_case;
    } else {
        // case for 'home'
    }
    
    // build your card div
    let card_div = document.createElement('div');
    card_div.className = 'card board-div';
    card_div.style = "width: 18rem";
    card_div.id = `${board}-div${id}`;
    card_div.innerHTML = `${item}`;
    
    // build your card body
    let card_body = document.createElement('div');
    card_body.className = 'card-body';
    card_body.id = `${board}-body${id}`;
    card_body.style = 'padding: 0rem;';
    card_div.innerHTML = ` `;
    
    
    // build your card title
    let card_title = document.createElement('h5');
    card_title.className = 'card-title';
    card_title.id = `${board}-title${id}`;
    card_title.style = 'height: 4.00rem; padding: 5px; text-align: center; font-weight: bold;';
    card_title.innerHTML = `${item}`;

    if (board === 'product') {
        card_title.style.backgroundColor = '#659ACF';
    } else if (board === 'client') {
        card_title.style.backgroundColor = '#F39A6D';
    } else if (board === 'usecase') {
        card_title.style.backgroundColor = '#6FC78D';
    } else {}
    
    
    // build your card text
    let card_text = document.createElement('p');
    card_text.className = 'card-text';
    card_text.id = `${board}-text${id}`;
    card_text.innerHTML = `${desc}`;
    
    // build your card btn
    let card_btn = document.createElement('a');
    card_btn.className = 'card-btn btn btn-primary';
    card_btn.id = `${board}-btn-${id}`;
    //card_btn.href = `${board}_view/${id}`;
    card_btn.innerHTML = `View`;
    card_btn.addEventListener('click', () => cardDetails(board, id, item))
    
    console.log(`Board Body is ${board}-body${id}`);
    document.querySelector(`#${board}-card-container`).append(card_div);
    document.querySelector(`#${board}-div${id}`).append(card_body);
    document.querySelector(`#${board}-body${id}`).append(card_title, card_text, card_btn);
    
}

function cardDetails(board, id) {
    // Open Page View, clear all others to start fresh
    document.querySelector('.pages-div').style.display = 'block';
    document.querySelector('#product-page').style.display = 'none';
    document.querySelector('#client-page').style.display = 'none';
    document.querySelector('#usecase-page').style.display = 'none';
    document.querySelector(`#${board}-card-container`).innerHTML = '';
    
    var view = document.getElementById(`${board}-view`);
    var page = document.getElementById(`${board}-page`);
    page.style.display = 'block';
    
    // Switch Button to Edit.
    var createBtn = document.querySelector(`#${board}-btn`);
    createBtn.className = 'create-btn btn btn-outline-primary';
    createBtn.innerHTML = `Edit ${board}`;

    // Display Delete Button, provide id as value, add Listener on Click
    var deleteBtn = document.querySelector(`#${board}-delete-btn`);
    deleteBtn.removeEventListener('click', () => deleteSwitch(board));
    deleteBtn.style.display = 'block';
    deleteBtn.value = id;
    deleteBtn.addEventListener('click', () => deleteSwitch(board));
    
    // Fetch data for specific ID
    fetch(`${board}_view/${id}`)
    .then(response => response.json())
    .then(data => (item_obj = data.item, obj = data))
    .then(() => {
        
        var title;
        var link = document.createElement('a');
        let statusIcon = document.createElement('i');
        
        if (board === 'client') {
            title = item_obj.client;
            document.querySelector(`#${board}-name`).value = title;
            document.querySelector(`#${board}-desc`).value = item_obj.desc;
            document.querySelector(`#${board}-input-id`).value = item_obj.id;
            link.setAttribute('href', item_obj.link)
            link.title = `Client Page Link: ${item_obj.link}`;
        } else if (board === 'product') {
            title = item_obj.product;
            document.querySelector(`#${board}-name`).value = title;
            document.querySelector(`#${board}-desc`).value = item_obj.desc;
            document.querySelector(`#${board}-status`).value = item_obj.status;
            document.querySelector(`#${board}-input-id`).value = item_obj.id;

            // Set Status Values
            if (item_obj.status === 'Live') {
                statusIcon.className = 'fas fa-check-circle fa-3x';
                statusIcon.title = 'Live';
                statusIcon.style.color = '#2AE839';
            } else if (item_obj.status === 'Concept') {
                statusIcon.className = 'far fa-question-circle fa-3x';
                statusIcon.title = 'Concept only';
                statusIcon.style.color = '#E6E82A';
            } else if (item_obj.status === 'Pre Alpha') {
                statusIcon.className = 'fas fa-cog fa-3x';
                statusIcon.title = 'Pre-Alpha';
                statusIcon.style.color = '#E84A2A';
            } else if (item_obj.status === 'Alpha') {
                statusIcon.className = 'fas fa-cogs fa-3x';
                statusIcon.title = 'In Alpha';
                statusIcon.style.color = '#CC2AE8';
            } else if (item_obj.status === 'Beta') {
                statusIcon.className = 'fas fa-users-cog fa-3x';
                statusIcon.title = `In Beta`;
                statusIcon.style.color = '#6DE7F3';
            } else if (item_obj.status === 'Release Candidate') {
                statusIcon.className = 'fas fa-hourglass-end fa-3x';
                statusIcon.title = 'Release Candidate';
                statusIcon.style.color = '#2AE8A3';
            }
            
        } else if (board === 'usecase') {
            title = item_obj.use_case;
            document.querySelector(`#${board}-name`).value = title;
            document.querySelector(`#${board}-desc`).value = item_obj.desc;
            document.querySelector(`#${board}-status`).value = item_obj.status;
            document.querySelector(`#${board}-input-id`).value = item_obj.id;

            // Set Status Values
            if (item_obj.status === 'Live') {
                statusIcon.className = 'fas fa-check-circle fa-3x';
                statusIcon.title = 'Live';
                statusIcon.style.color = '#2AE839';
            } else if (item_obj.status === 'Not Supported') {
                statusIcon.className = 'far fa-times-circle fa-3x';
                statusIcon.title = 'Not Supported';
                statusIcon.style.color = '#E84A2A';
            } else if (item_obj.status === 'Queued') {
                statusIcon.className = 'fas fa-clock fa-3x';
                statusIcon.title = 'Use Case is Queued for Development'
                statusIcon.style.color = '#E6E82A';
            } else if (item_obj.status === 'Review') {
                statusIcon.className = 'fas fa-hourglass-end fa-3x';
                statusIcon.title = 'In Review';
                statusIcon.style.color = '#6DE7F3';
            }
        }

        
        let descHeader = document.createElement('h4');
        let header = document.createElement('h1');
        
        link.innerHTML = title;
        link.style.color = 'whitesmoke';
        descHeader.innerHTML = item_obj.desc;
        descHeader.style.color = 'whitesmoke';
        
        // Append the constructed Elements and their content to 'View'
        header.appendChild(link);
        view.append(header);
        view.append(descHeader);
        view.append(statusIcon);
    })  
}

// ***CRUD FUNCTIONS************************************************************************************************************
// *****************************************************************************************************************************
// Creates & Edits Product
function createProduct() {
    console.log('You Clicked Submit on Product');

    // Get values from product form
    let itemId ='';
    try {
        itemId = document.querySelector('#product-input-id').value;
    } catch {}

    let product = document.querySelector('#product-name').value;
    let desc = document.querySelector('#product-desc').value;
    let status = document.querySelector('#product-status').value;

    fetch('/create_product', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            item_id: `${itemId}`,
            product: `${product}`,
            desc: `${desc}`,
            status: `${status}`,
        }),          
    })
    .then(response => {
        loadDashboard('product');  
    })

}

// Creates & Edits Client
function createClient() {
    // Get values from form
    let itemId ='';
    try {
        itemId = document.querySelector('#client-input-id').value;
    } catch {}

    let client = document.querySelector('#client-name').value;
    let desc = document.querySelector('#client-desc').value;
    let link = document.querySelector('#client-crm-link').value;

    fetch('/create_client', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            item_id: `${itemId}`,
            client: `${client}`,
            desc: `${desc}`,
            link: `${link}`,
        }),
    })
    .then(response => loadDashboard('client'))
}

// Creates & Edits Use Case
function createUsecase() {
    // Get values from product form
    let itemId ='';
    try {
        itemId = document.querySelector('#usecase-input-id').value;
    } catch {}

    let usecase = document.querySelector('#usecase-name').value;
    let desc = document.querySelector('#usecase-desc').value;
    let status = document.querySelector('#usecase-status').value;

    fetch('/create_usecase', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            item_id: `${itemId}`,
            usecase: `${usecase}`,
            desc: `${desc}`,
            status: `${status}`,
        }),
    })
    .then(response => loadDashboard('usecase'))
}

// Delete Switch
function deleteSwitch(board) {
    var id = document.querySelector(`#${board}-delete-btn`).value;
    if (board === 'product') {
        fetch(`/delete_product`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                id: `${id}`
            })
        })
        .then(response => loadDashboard('product'))
        
    } else if (board === 'client') {
        fetch(`/delete_client`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                id: `${id}`
            })
        })
        .then(response => loadDashboard('client'))

    } else if (board === 'usecase') {
        fetch(`/delete_usecase`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                id: `${id}`
            })
        })
        .then(response => loadDashboard('usecase'))
    }
}
// ***END CRUD FUNCTIONS**************************************************************************************************************
// ***********************************************************************************************************************************




