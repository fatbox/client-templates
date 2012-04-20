<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="{$system_url}" />
<title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
<script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
<script type="text/javascript" src="{$template_dir}js/common.js"></script>
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}style.css" />
<script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
<!-- part below is not css valid. remove it if you want this document to be css valid -->
<link media="all" type="text/css" rel="stylesheet" href="{$template_dir}corners.css" />
{foreach from=$HBaddons.header_js item=module}
	{$module}
{/foreach}
</head>

<body class="{$language|capitalize}">

{if $adminlogged && $maintenance}
<div style="color:red;text-align:center;background:#fffed1; padding:1em"><strong>{$lang.notes} {$lang.maintenance}</strong></div>
{/if}

<div id="headpart">
	<div id="mainpart">

		<div class="right">
		{if $adminlogged}
		{$lang.adminlogged} | <a  href="{$admin_url}/index.php{if $login.id}?cmd=clients&amp;action=show&amp;id={$login.id}{/if}">{$lang.adminreturn}</a> |
		{/if}
			{if $logged=='1'}{$lang.loggedinas} <a href="{$ca_url}clientarea/">{$login.firstname} {$login.lastname}</a>  | <a href="{$ca_url}clientarea/details/">{$lang.manageaccount}</a> | <a href="?action=logout">{$lang.logout}</a>{else}
				<a href="{$ca_url}signup/">{$lang.createaccount}</a> |  <a href="{$ca_url}clientarea/">{$lang.login}</a>
			{/if}
		</div>
		
		<h1>{$business_name}</h1><h1 class="shadow">{$business_name}</h1>
		
		<div class="clear"></div>
		
		
	</div>	
</div>


<div id="content">
{include file="mainmenu.tpl"}
<div id="contener">
	
	
	<div id="inner" {if $nosidemenu}class="nosidemenu"{/if}>
	{include file="submenu.tpl"}
	<div class="p_cont">
	{if $cmd=='cart'}{include file="../orderpages/cart.sidemenu.tpl"}{/if}
	
	<div id="cont" {if $cmd=='cart' && $step>0 && $step<4}class="left"{/if}>
	
<div id="errors" {if $error}style="display:block"{/if}>{foreach from=$error item=blad}<span>{$blad}</span>{/foreach}
<a class="close" href="#"><img src="{$template_dir}icons/ico_close.gif" alt="" /></a>
</div>
<div id="infos"  {if $info}style="display:block"{/if}>{foreach from=$info item=infos}<span>{$infos}</span>{/foreach}
<a class="close" href="#"><img src="{$template_dir}icons/ico_close.gif" alt="" /></a></div>