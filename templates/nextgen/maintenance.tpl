<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>{$hb}{if $pagetitle}{$pagetitle} -{/if} {$business_name}</title>
        <link media="all" type="text/css" rel="stylesheet" href="{$template_dir}style.css" />

    </head>

    <body  class="{$language|capitalize}">



        <div id="headpart" style="height:66px;margin-top:100px;">
            <div id="mainpart" style="width:500px;height:66px;">


                <h1>{$business_name}</h1><h1 class="shadow">{$business_name}</h1>

                <div class="clear"></div>


            </div>
        </div>


        <div id="content" style="width:500px">

            <div id="contener"  >


                <div id="inner" style="border-top:solid 1px #cccccc;padding:10px;">
                    <h1 style="margin:0px;padding:0px;color:#aaaaaa;">{$lang.under_maintenance}</h1>
                    <strong>{$lang.maintenance_desc}</strong>
                </div>
            </div>
        </div>
    </body>
</html>