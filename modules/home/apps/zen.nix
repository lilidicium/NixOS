{ config, inputs, ... }:{

imports = [ inputs.zen-browser.homeModules.default ];

programs.zen-browser = {
	enable = true;
	profiles = {
		default = {
			id = 0;
			name = "default";
			isDefault = true;
			settings = {
				"layout.css.devPixelsPerPx" = "1.3";
				"browser.startup.homepage" = "https://startpage.com";
				"browser.search.defaultenginename" = "Startpage";
				"browser.search.order.1" = "Startpage";
			};
			search = {
				force = true;
				default = "Startpage";
				order = [ "Startpage" "Google "];
				engines = {
								"Startpage" = {
									urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
								};
				};
			};
		};
	};
};

}