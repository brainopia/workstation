__dir__ = File.absolute_path File.dirname __FILE__

file_cache_path __dir__ + '/../tmp'
 
data_bag_path __dir__ + '/data'

cookbook_path [
  __dir__ + '/../cookbooks',
  __dir__ + '/../vendor/cookbooks'
]
