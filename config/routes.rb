Rails.application.routes.draw do
    get 'sums' => 'sums#index'
    post 'sums' => 'sums#create'
    get 'filters' => 'filters#index'
    post 'filters' => 'filters#create'
    get 'intervals' => 'intervals#index'
    post 'intervals' => 'intervals#create'
    get 'lin_regression' => 'lin_regression#index'
    post ';in_regression' => 'lin_regression#create'
end
