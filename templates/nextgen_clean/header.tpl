<!DOCTYPE html>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html lang="en"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <base href="{$system_url}" />
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/bootstrap.min.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/main.css" />
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/fatbox.css" />
        <!--[if lt IE 9]>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}css/ie8.css" />
        <script type="text/javascript" src="{$template_dir}js/ie8.js"></script>
        <![endif]-->
        <script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
        <script type="text/javascript" src="{$template_dir}js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/common.min.js"></script>
        <script type="text/javascript" src="{$template_dir}js/jquery-ui-1.8.2.custom.min.js"></script>
        <script type="text/javascript" src="{$system_url}?cmd=hbchat&amp;action=embed"></script>
        {userheader}
    </head>

    <body class="{$language|capitalize} tpl_nextgen" >
        <div id="wrapper">
            <div class="container">

                {if $adminlogged && $maintenance}
                <div style="color:red;text-align:center;background:#fffed1; padding:1em"><strong>{$lang.notes} {$lang.maintenance}</strong></div>
                {/if}

                <div id="headpart">
                    <div id="mainpart">

                        <div class="right headersection">



                            {if $languages}
                            <div class="btn-group">
                                <button class="btn  dropdown-toggle" data-toggle="dropdown">
                                    {foreach from=$languages item=ling}{if  $language==$ling}<img src="{$template_dir}img/famfamfam/lang_{$ling|capitalize}.gif"  alt="{$ling|capitalize}"/>{/if}{/foreach}
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
	{foreach from=$languages item=ling}
                                    <li id="lang_{$ling|capitalize}" ><a href="{$ca_url}{$cmd}&action={$action}&languagechange={$ling|capitalize}"><img src="{$template_dir}img/famfamfam/lang_{$ling|capitalize}.gif" alt="{$ling|capitalize}"/> {$lang[$ling]|capitalize}</a></li>
                            	{/foreach}
                                </ul>
                            </div>
                            {/if}
                            <div class="btn-group">
                                <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">

                                    {if $logged=='1'}
                                    <i class="icon-user icon-white"></i> {$login.firstname} {$login.lastname}
                                    {else}
                                    <i class="icon-lock icon-white"></i> {$lang.login}
                                    {/if}
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu  pull-right">

                                    {if $logged!='1'}
                                    <li><a href="{$ca_url}signup/">{$lang.createaccount}</a></li>
                                    <li><a href="{$ca_url}clientarea/">{$lang.login}</a></li>
                                    {else}
                                    <li><a href="{$ca_url}clientarea/details/">{$lang.manageaccount}</a></li>
                                    <li><a href="?action=logout">{$lang.logout}</a></li>
                                    {/if}
                                    {if $adminlogged}
                                    <li class="divider"></li>
                                    <li><a  href="{$admin_url}/index.php{if $login.id}?cmd=clients&amp;action=show&amp;id={$login.id}{/if}">{$lang.adminreturn}</a></li>
                                    {/if}

                                </ul>
                            </div>

                        </div>

                        <h1>{$business_name}</h1>
                        <div class="clear"></div>


                    </div>
                </div>

                {include file="mainmenu.tpl"}


	{include file="submenu.tpl"}


                {include file="notifications.tpl"}



                <section id="{$cmd}">
	{if $cmd=='cart'}{include file="../orderpages/cart.sidemenu.tpl"}{/if}
                    <div id="cont" {if $cmd=='cart' && $step>0 && $step<4}class="left"{/if}>
