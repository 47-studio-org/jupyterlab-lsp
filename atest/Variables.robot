*** Variables ***
${SPLASH}         id:jupyterlab-splash
# to help catch hard-coded paths
${BASE}           /@est/
# override with `python scripts/atest.py --variable HEADLESS:0`
${HEADLESS}       1
${CMD PALETTE INPUT}    css:#command-palette .p-CommandPalette-input
${CMD PALETTE ITEM ACTIVE}    css:#command-palette .p-CommandPalette-item.p-mod-active
${JLAB XP TOP}    //div[@id='jp-top-panel']
${JLAB XP MENU ITEM LABEL}    //div[@class='p-Menu-itemLabel']
${JLAB XP MENU LABEL}    //div[@class='p-MenuBar-itemLabel']
${JLAB CSS VERSION}    css:.jp-About-version
${CSS DIALOG OK}    css:.jp-Dialog .jp-mod-accept
${MENU OPEN WITH}    xpath://div[contains(@class, 'p-Menu-itemLabel')][contains(text(), "Open With")]
# R is missing on purpose (may need to use .)
${MENU RENAME}    xpath://div[contains(@class, 'p-Menu-itemLabel')][contains(., "ename")]
# N is missing on purpose
${MENU NOTEBOOK}    xpath://div[contains(@class, 'p-Menu-itemLabel')][contains(., "otebook")]
${DIAGNOSTICS PANEL}    id:lsp-diagnostics-panel
${DIAGNOSTIC PANEL CLOSE}    css:.p-DockPanel-tabBar .p-TabBar-tab[data-id="lsp-diagnostics-panel"] .p-TabBar-tabCloseIcon
${DIALOG WINDOW}    css:.jp-Dialog
${DIALOG INPUT}    css:.jp-Input-Dialog input
${DIALOG ACCEPT}    css:button.jp-Dialog-button.jp-mod-accept
