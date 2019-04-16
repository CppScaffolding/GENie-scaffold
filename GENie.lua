-- scaffold geniefile for GENie

GENie_script = path.getabsolute(path.getdirectory(_SCRIPT))
GENie_root = path.join(GENie_script, "GENie")

GENie_includedirs = {
	path.join(GENie_script, "config"),
	GENie_root,
}

GENie_libdirs = {}
GENie_links = {}
GENie_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { GENie_includedirs }
	end,

	_add_defines = function()
		defines { GENie_defines }
	end,

	_add_libdirs = function()
		libdirs { GENie_libdirs }
	end,

	_add_external_links = function()
		links { GENie_links }
	end,

	_add_self_links = function()
		links { "GENie" }
	end,

	_create_projects = function()

project "GENie"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		GENie_includedirs,
	}

	defines {}

	files {
		path.join(GENie_script, "config", "**.h"),
		path.join(GENie_root, "**.h"),
		path.join(GENie_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
