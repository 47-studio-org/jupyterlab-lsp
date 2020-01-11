*** Settings ***
Suite Setup       Setup Suite For Screenshots    diagnostics_panel
Resource          ../Keywords.robot

*** Variables ***
${EXPECTED_COUNT}    1
${DIAGNOSTIC}     W291 trailing whitespace (pycodestyle)

*** Test Cases ***
Diagnostics Panel Opens
    [Setup]    Gently Reset Workspace
    Open Notebook And Panel    Panel.ipynb
    Capture Page Screenshot    03-panel-opens.png
    Wait Until Keyword Succeeds    10 x    1s    Should Have Expected Rows Count
    [Teardown]    Clean Up After Working With File    Panel.ipynb

Diagnostics Panel Works After Rename
    [Documentation]    Test for #141 bug (diagnostics were not cleared after rename)
    [Setup]    Gently Reset Workspace
    Open Notebook And Panel    Panel.ipynb
    Rename Jupyter File    Panel.ipynb    PanelRenamed.ipynb
    Close Diagnostics Panel
    Wait Until Page Contains Element    css:.cm-lsp-diagnostic[title*="${DIAGNOSTIC}"]    timeout=20s
    Capture Page Screenshot    00-panel-rename.png
    Open Diagnostics Panel
    Capture Page Screenshot    01-panel-rename.png
    Wait Until Keyword Succeeds    10 x    1s    Should Have Expected Rows Count
    Clean Up After Working With File    PanelRenamed.ipynb
    [Teardown]    Clean Up After Working With File    Panel.ipynb

Diagnostics Panel Can Be Restored
    [Setup]    Gently Reset Workspace
    Open Notebook And Panel    Panel.ipynb
    Close Diagnostics Panel
    Open Diagnostics Panel
    Wait Until Keyword Succeeds    10 x    1s    Should Have Expected Rows Count
    [Teardown]    Clean Up After Working With File    Panel.ipynb

*** Keywords ***
Gently Reset Workspace
    Lab Command    Close All Tabs

Open Notebook And Panel
    [Arguments]    ${notebook}
    Setup Notebook    Python    ${notebook}
    Capture Page Screenshot    00-notebook-and-panel-openeing.png
    Wait Until Page Contains Element    css:.cm-lsp-diagnostic[title*="${DIAGNOSTIC}"]    timeout=20s
    Open Diagnostics Panel
    Capture Page Screenshot    00-notebook-and-panel-opened.png

Should Have Expected Rows Count
    ${count} =    Count Diagnostics In Panel
    Should Be True    ${count} == ${EXPECTED_COUNT}
