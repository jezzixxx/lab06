file(REMOVE_RECURSE
  "sources"
  "sources.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/sources.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
