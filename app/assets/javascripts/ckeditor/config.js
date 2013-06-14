CKEDITOR.editorConfig = function( config ) {
	config.language = 'us';
	config.uiColor = '#AADC6E';
	config.toolbar = 'Basic';
	config.toolbarGroups = [
	{ name: 'editing', groups: [ 'find', 'spellchecker' ] },
	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
	{ name: 'links' },
	{ name: 'insert' },
	{ name: 'styles' },
	{ name: 'colors' },
	{ name: 'tools' },
	{ name: 'others' },
	];
};
