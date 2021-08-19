feature 'Unfavouriting cat images' do
  scenario 'A user can unfavourite previously favouritted cat images' do

    # mock the API call 
    favourites_api_response = [
  {
    id: 833,
    user_id: "4",
    image_id: "1ud",
    sub_id: "",
    created_at: "2018-10-24T08:35:48.000Z",
    image: {
      id: "1ud",
      url: "https://cdn2.thecatapi.com/images/1ud.jpg"
    }
  },
  {
    id: 838,
    user_id: "4",
    image_id: "o0",
    sub_id: "",
    created_at: "2018-10-25T00:12:36.000Z",
    image: {
      id: "o0",
      url: "https://cdn2.thecatapi.com/images/o0.gif"
    }
  }
]
    
   favourite_api_response_json = JSON.generate(favourites_api_response)

    stub_request(:get, "https://api.thecatapi.com/v1/favourites").
      with( headers: { 'Accept'=>'application/json', 'Connection'=>'close', 'Host'=>'api.thecatapi.com', 'User-Agent'=>'http.rb/5.0.1' }).
      to_return(status: 200, body: favourite_api_response_json, headers: {})
  
    visit('/favourites')

    expect(page).to have_css("img[src*='https://cdn2.thecatapi.com/images/1ud.jpg']")

    first('.my_unfavourite_button').click

    expect(page).to_not have_css("img[src*='https://cdn2.thecatapi.com/images/1ud.jpg']")
  end
end