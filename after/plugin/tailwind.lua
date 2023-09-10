require('tailwind-sorter').setup({
  on_save_enabled = true,                                                                                                -- If `true`, automatically enables on save sorting.
  on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro', '*.svelte' }, -- The file patterns to watch and sort.
  node_path = 'node',
})
