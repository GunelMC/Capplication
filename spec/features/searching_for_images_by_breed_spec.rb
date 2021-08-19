feature 'Search by breed' do
  scenario 'A user can search for cat descriptions by breed' do

    # mock the API call 

      stubbed_response_body = [ 
  {
    breeds: [],id: "343", url: "https://cdn2.thecatapi.com/images/343.gif",width: 100,height: 100
  },
  {
    breeds: [], 
    categories: [
      {
        id: 14,
        name: "sinks"
      }
    ],
    id: "MTc5NjcyNQ",
    url: "https://cdn2.thecatapi.com/images/MTc5NjcyNQ.jpg",
    width: 640,
    height: 640
  },
  {
    breeds: [
      
    ],
    id: "uSdQBzCfg",
    url: "https://cdn2.thecatapi.com/images/uSdQBzCfg.jpg",
    width: 509,
    height: 340
  }
]
    
    stubbed_response_body_json = JSON.generate(stubbed_response_body)

    search_by_breed_api_response = {
    breeds: [
      {
        weight: {
          imperial: "6 - 12",
          metric: "3 - 7"
        },
        id: "beng",
        name: "Bengal",
        cfa_url: "http://cfa.org/Breeds/BreedsAB/Bengal.aspx",
        vetstreet_url: "http://www.vetstreet.com/cats/bengal",
        vcahospitals_url: "https://vcahospitals.com/know-your-pet/cat-breeds/bengal",
        temperament: "Alert, Agile, Energetic, Demanding, Intelligent",
        origin: "United States",
        country_codes: "US",
        country_code: "US",
        description: "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.",
        life_span: "12 - 15",
        indoor: 0,
        lap: 0,
        adaptability: 5,
        affection_level: 5,
        child_friendly: 4,
        cat_friendly: 4,
        dog_friendly: 5,
        energy_level: 5,
        grooming: 1,
        health_issues: 3,
        intelligence: 5,
        shedding_level: 3,
        social_needs: 5,
        stranger_friendly: 3,
        vocalisation: 5,
        bidability: 3,
        experimental: 0,
        hairless: 0,
        natural: 0,
        rare: 0,
        rex: 0,
        suppressed_tail: 0,
        short_legs: 0,
        wikipedia_url: "https://en.wikipedia.org/wiki/Bengal_(cat)",
        hypoallergenic: 1,
        reference_image_id: "O3btzLlsO"
      }
    ],
    id: "NwMUoJYmT",
    url: "https://cdn2.thecatapi.com/images/NwMUoJYmT.jpg",
    width: 2160,
    height: 1440
  }
    
   search_by_breed_api_response_json = JSON.generate(search_by_breed_api_response)

    stub_request(:get, "https://api.thecatapi.com/v1/images/search?limit=3").
    with( headers: { 'Accept'=>'application/json', 'Connection'=>'close', 'Host'=>'api.thecatapi.com', 'User-Agent'=>'http.rb/5.0.1' }).
    to_return(status: 200, body: stubbed_response_body_json, headers: {})

    stub_request(:get, "https://api.thecatapi.com/v1/breeds/beng"). with( headers: { 'Accept'=>'application/json', 'Connection'=>'close', 'Host'=>'api.thecatapi.com', 'User-Agent'=>'http.rb/5.0.1' }). to_return(status: 200, body: search_by_breed_api_response_json, headers: {})
  
    visit('/')

    fill_in('breed_id', with: "beng")
    click_button('Search')

    save_and_open_page
    expect(page).to have_css("img[src*='https://cdn2.thecatapi.com/images/NwMUoJYmT.jpg']")

  end
end