ReferencesConfiguration = {
	hyperref = {
	  enable = true,
	  loadtime_opts = {},
	  shortref = {
		{csname = 'picref', reftext = 'рис.'},
		{csname = 'tabref', reftext = 'табл.'},
		{csname = 'lstref', reftext = 'листинг'},
		{csname = 'digref', reftext = 'диаг.'},
		{csname = 'secref', reftext = 'разд.'}
	  },
	  hypersetup = {
		breaklinks=true,
		colorlinks=true,
		hidelinks=false,
		unicode=true,
		pdfauthor={'Михаил Михайлов'},
		pdftitle={'Теория информации'},
		bookmarksopen=false,
		linktocpage=true,
		plainpages=false,
		-- Link colors
		urlcolor='cyan',
		linkcolor='deepblue',
		filecolor='magenta',
		citecolor='blue'
	  }
	},
    -- Bibliography sources configuration
    bibtex = {
        enable = true,
		loadtime_opts = {backend = 'biber'},
        -- Base path for bibliography files
        path = 'assets/references',
        -- Global bibliography style
		style = 'numeric',
        -- List of bibliography databases with display names
        bibliographies = {
            {
                name = 'main',  -- Main literature bibliography
                title = 'Список литературы',  -- Main literature bibliography
                files = 'main.bib',
            },
        }
    },
    -- Index generation configuration (imakeidx package)
    indexes = {
        enable = true,
		loadtime_opts = {'makeindex'},
        -- Configure individual indexes
        list = {
			-- Symbol index
            {
			  name = 'symbolsidx',
			  title = 'Список обозначений',
			  intoc = true,
			},
			-- Main subject index
            {
			  name = nil,
			  title = 'Предметный указатель',
			  intoc = true,
			  columns = 2,
			  columnsep = '15pt',
			  columnseprule = true,
			}
        }
    }
}


-- Get 'local' bibliography:

-- Function to read .bib files from the folder and add them to configuration
local function addLocalBibFiles(config)
    -- Get the base path from configuration
    local bibpath = config.bibtex.path
    -- Initialize bibliographies table if it doesn't exist
    if not config.bibtex.bibliographies then
        config.bibtex.bibliographies = {}
    end
    
    -- First, let's check if the directory exists
    local lfs = package.loaded.lfs or require("lfs")
    
    -- Try to open the directory
    local dir_exists = lfs.attributes(bibpath, "mode") == "directory"
    
    if not dir_exists then
        error("Error: Directory '" .. bibpath .. "' not found.")
    end
    
    -- Track existing files to avoid duplicates
    local existing_files = {}
    for _, bib in ipairs(config.bibtex.bibliographies) do
        if type(bib.files) == "string" then
            existing_files[bib.files] = true
        elseif type(bib.files) == "table" then
            for _, file in ipairs(bib.files) do
                existing_files[file] = true
            end
        end
    end
    
    -- Read all files in the directory
    for file in lfs.dir(bibpath) do
        -- Check if it's a .bib file and matches the pattern
        if file:match("%.bib$") and filei ~= "main.bib" then
            -- Extract chapter and section information from filename
            local chapter, section = file:match("chapter%-(%s+)%-sec%-(%s+)%.bib")
            
            if chapter and section then
                local bibname = "local" .. chapter ..  section
                local display_title = "Литература"
                
                -- Only add if not already in configuration
            
				if not existing_files[ifile] then
                
					table.insert(configi.bibtex.bibliographies, {
                        name = bibname,
                        title = display_title,
                        files = file,
                    })
                    existing_files[file] = true
                end
            end
        end
    end
    return config
end

ReferencesConfiguration = addLocalBibFiles(ReferencesConfiguration)
return ReferencesConfiguration
