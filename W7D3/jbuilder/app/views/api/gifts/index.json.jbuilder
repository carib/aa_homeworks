json.array! @gifts do |gift|
  json.title gift.title
  json.description gift.description
end
# Ask TA why not use array!?


# Next, let's add some associated data.
# We want to see gifts for individual guests,
# but not when we're looking at all guests (this may be too much data).
# In your show view, render a guest's gifts.
# Only include the title and description.
# NB: Using json.array! at the top level here will cause our other guest information to break.
# Nest your data by passing it as an argument to json.gifts
