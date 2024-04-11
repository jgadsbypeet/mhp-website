<?php
return array(
  '*' => array(
    'pipeline' => 'manifest',
    'manifestPath' => 'web/dist/rev-manifest.json', // same as gulp manifest path
    'assetsBasePath' => '@webroot/dist', // directory where manifest is saved
  ),
);
