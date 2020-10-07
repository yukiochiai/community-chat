FactoryBot.define do
  factory :tweet do
    title       { "aaaaaa" }
    category    { "bbbbbb" }
    image       { "ccccccc" }
    content     { "abcdefghijklmnopqrlstuvwxyz"}
    user_id     {1}
  end
end