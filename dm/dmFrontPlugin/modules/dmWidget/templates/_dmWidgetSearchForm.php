<?php

echo
$form->open('action=main/search method=get'),

$form['query']->label()->field('.query'),

$form->submit(__('trae')),

$form->close();