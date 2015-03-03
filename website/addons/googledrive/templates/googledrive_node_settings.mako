<!--<link rel="stylesheet" href="/static/addons/googleDrive/googleDrive.css">-->
<div id="googleDriveScope" class="scripted">
    <!-- <pre data-bind="text: ko.toJSON($data, null, 2)"></pre> -->
    <h4 class="addon-title">
        Google Drive
        <small class="authorized-by">
            <span data-bind="if: nodeHasAuth">
                authorized by <a data-bind="attr.href: urls().owner">
                    {{ownerName}}
                </a>
                % if not is_registration:
                    <a data-bind="click: deauthorize"
                        class="text-danger pull-right addon-auth">Deauthorize</a>
                % endif
            </span>

             <!-- Import Access Token Button -->
            <span data-bind="if: showImport">
                <a data-bind="click: importAuth" href="#" class="text-primary pull-right addon-auth">
                    Import Access Token
                </a>
            </span>

            <!-- Oauth Start Button -->
            <span data-bind="if: showTokenCreateButton">
                <a data-bind="attr.href: urls().auth" class="text-primary pull-right addon-auth">
                    Create Access Token
                </a>
            </span>
        </small>
    </h4>


    <!-- Settings Pane -->
    <div class="googleDrive-settings" data-bind='if: showSettings'>
        <div class="row">
            <div class="col-md-12">
                <p>
                    <strong>Current Folder:</strong>
                    <a data-bind="attr.href: urls().files">
                        {{folderName}}
                    </a>
                    <span data-bind="if: folder().path === null" class="text-muted">
                        None
                    </span>

                </p>

                <!-- Folder buttons -->
                <div class="btn-group" data-bind="visible: userIsOwner() && validCredentials()">
                    <button data-bind="visible: validCredentials,
                                        click: togglePicker,
                                        css: {active: currentDisplay() === PICKER}"
                            class="btn btn-sm btn-addon"><i class="icon-edit"></i> Change</button>
                </div>


                <!-- Folder picker -->
                <div class="googleDrive-widget">
                    <div data-bind="visible: currentDisplay() === PICKER">
                        <div id="googleDriveGrid"
                             class="filebrowser googleDrive-folder-picker">
                          <p class="text-muted text-center googleDrive-loading-text" data-bind="visible: loading">
                            Loading folders...
                          </p>                          
                        </div>                        
                    </div>

                    <!-- Queued selection -->
                    <div class="googleDrive-confirm-selection"
                        data-bind="visible: currentDisplay() == PICKER && selected()">
                        <form data-bind="submit: submitSettings">
                            <div class="pull-right">
                                <button class="btn btn-default"
                                        data-bind="click: cancelSelection">
                                    Cancel
                                </button>
                                <input type="submit"
                                       class="btn btn-primary"
                                       value="Submit" />
                            </div>
                            <h4 data-bind="if: selected" class="googleDrive-confirm-dlg">
                                Connect &ldquo;{{ selectedFolderName }}&rdquo;?
                            </h4>
                        </form>
                    </div><!-- end .googleDrive-confirm-selection -->

                </div>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end .googleDrive-settings -->

    <!-- Flashed Messages -->
    <div class="help-block">
        <p data-bind="html: message, attr.class: messageClass"></p>
    </div>
</div><!-- end #googleDriveScope -->
