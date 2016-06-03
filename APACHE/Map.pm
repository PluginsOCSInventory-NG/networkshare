
 
package Apache::Ocsinventory::Plugins::Networkshare::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;

$DATA_MAP{networkshare} = {
		mask => 0,
		multi => 1,
		auto => 1,
		delOnReplace => 1,
		sortBy => 'DRIVE',
		writeDiff => 0,
		cache => 0,
		fields => {
                DRIVE => {},
                PATH => {}
	}
};
1;