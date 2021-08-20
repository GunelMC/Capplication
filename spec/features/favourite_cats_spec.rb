# frozen_string_literal: true

feature 'Favouriting cat images' do
  scenario 'A user can favourite a cat image' do
    # mock the API call
    stubbed_response_body = [
      {
        breeds: [], id: '343', url: 'https://cdn2.thecatapi.com/images/343.gif', width: 100, height: 100
      },
      {
        breeds: [],
        categories: [
          {
            id: 14,
            name: 'sinks'
          }
        ],
        id: 'MTc5NjcyNQ',
        url: 'https://cdn2.thecatapi.com/images/MTc5NjcyNQ.jpg',
        width: 640,
        height: 640
      },
      {
        breeds: [],
        id: 'uSdQBzCfg',
        url: 'https://cdn2.thecatapi.com/images/uSdQBzCfg.jpg',
        width: 509,
        height: 340
      }
    ]

    stubbed_response_body_json = JSON.generate(stubbed_response_body)

    stub_request(:get, 'https://api.thecatapi.com/v1/images/search?limit=3')
      .with(headers: { 'Accept' => 'application/json', 'Connection' => 'close', 'Host' => 'api.thecatapi.com',
                       'User-Agent' => 'http.rb/5.0.1' })
      .to_return(status: 200, body: stubbed_response_body_json, headers: {})

    visit('/')
    find('.my_button', match: :first).click
    visit('/favourites')

    expect(page).to have_content("img[src*='https://cdn2.thecatapi.com/images/343.gif']")
    expect(page).not_to have_css("img[src*='https://cdn2.thecatapi.com/images/MTc5NjcyNQ.jpg']")
    expect(page).not_to have_css("img[src*='https://cdn2.thecatapi.com/images/uSdQBzCfg.jpg']")
  end
end
