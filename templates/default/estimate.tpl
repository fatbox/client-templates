{if $estimate}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$hb}{$business_name} - {$lang.customerquote}</title>
{if !empty($HBaddons.header_js)}
<script type="text/javascript" src="{$template_dir}js/jquery.js"></script>
{foreach from=$HBaddons.header_js item=module}
	{$module}
{/foreach}
{/if}
{literal}
<style type="text/css" media="all">

	* {
		margin:0px;
		padding:0px;
	}
	body {
		background: #f6f6f6;
		font-family:Arial,Tahoma,sans-serif;
		font-size:12px;
		color:#484740;

	}
        #backlink {
            text-align: center;
            margin: 10px;
            padding: 0;
        }
        #backlink a, a:active, a:visited {
            color: #a4a4a4;
            text-decoration: none;
        }
        #backlink  a:hover {
            color: #a4a4a4;
            text-decoration: underline;
        }
	#invoice-container {
		width:759px;
		margin:20px auto;
	}
	#invoice-content {
		width:749px;
		padding:5px;
		background:url({/literal}{$template_dir}{literal}images/invoice_rep.gif) repeat-y top left;
		position:relative;

	}
	#invoice-top {
		width:759px;
		position:absolute;
		top:0px;
		left:0px;
		height:10px;
		background:url({/literal}{$template_dir}{literal}images/invoice_top.gif) no-repeat top left;
	}
	#invoice-bottom {
		width:759px;
		position:absolute;
		bottom:0px;
		left:0px;
		height:10px;
		background:url({/literal}{$template_dir}{literal}images/invoice_bottom.gif) no-repeat top left;
	}
	#invoice-status {
		bacground-position:top left;
		background-repeat:no-repeat;
		width:400px;
		height:80px;
		position:absolute;
		top:5px;
		padding:50px 0px 0px 80px;
		left:5px;
		font-size:30px;
		font-family:'Calibri','Trebuchet MS',Arial,Tahoma;
		letter-spacing:-1px;
	}
	#invoice-details {
		position:absolute;
		top:50px;
		right:30px;
		width:260px;



	}
	#invoice-details .left {
		width:125px;
		text-align:right;
		font-weight:bold;
	}
	#invoice-details .right{
		width:125px;
		text-align:left;
	}

	.left {
		float:left;
	}
	.right {
		float:right;
	}
	#invoice-status strong {
		color:#a4a4a4;
	}
	#invoice-body {
		font-size:11px;

		width:709px;
		padding:130px 20px 40px;
	}
	strong.larger {
		font-size:12px;
	}
	strong.status {

		text-transform:uppercase;
	}
	strong.Paid {
	color:#a6ca04;
	}
	strong.Unpaid {
		color:#891539;
	}
	strong.Cancelled {
		color:#b7b7b7;
	}
	#invoce-transactions {
		margin-top:30px;
		margin-bottom:20px;
	}
	.invoice-table{
		margin-top:20px;
		margin-bottom:20px;
		font-size:11px;
	}
	.invoice-table th, .invoice-table-transaction th {
		background:#f0f0f0;
		font-weight:bold;
		padding:0px;
		margin:0px;
		border-top:1px solid #eeeeee;
		border:none;
	}

	.invoice-table .aright, .invoice-table-transaction .aright {
	text-align:right;
	}
	.invoice-table .acenter, .invoice-table-transaction .acenter {
	text-align:center;
	}
	.invoice-table td {
		border-bottom:solid 1px #f0f0f0;
	}
	.invoice-table td.noborder {
		border:none !important;
	}
	.invoice-table th, .invoice-table td{
		text-align:left;
		padding:8px 12px;
	}
	.invoice-table-transaction td, .invoice-table-transaction th{
		text-align:left;
		padding:3px 12px;
	}
	.invoice-table-transaction .summary {
		font-size:12px;
		 border:none !important;
	}
	.invoice-table-transaction td {
		border-bottom:solid 1px #f0f0f0;
	}
	.invoice-table .summary {
		font-size:12px;
		 padding:5px 12px;
		 border:none !important;
	}
	.invoice-table .summary .bigger {
		font-size:14px;
	}
	#invoice-icons {
		position:absolute;
		top:-11px;
		right:0px;
		width:75px;
	}
	#invoice-icons img {
	border:none;
		float:left;
		margin-right:6px;
	}
	.tbs {
	font-size:11px;
	}
        #gateway {
            margin: 10px;
        }
        #invoice-footer {
            border-top: 1px solid rgb(85, 85, 85);
            width:80%;
            text-align: center;
            margin: 20px auto 0 auto;
            padding: 10px 20px;
        }

</style>
<style type="text/css" media="print">
        #backlink {
            display: none;
        }
	#invoice-top {
		display:none;
	}
	#invoice-bottom {
		display:none;
	}
	#invoice-container {
		width:650px !important;
	}
	#invoice-content {
		background:none;
	width:650px !important;
	}
	body {
		background:#ffffff;
		margin:0px;
	}
	#invoice-body {

		padding-left:0px;
		padding-right:0px;
		width:650px !important;
	}
	#invoice-status {
	background-image:url({/literal}{$template_dir}images/invoice_{$estimate.status}_{$language}{literal}.gif);
	}
	#gateway {
		display:none;
	}
	#invoice-icons {
		display:none;
	}
</style>

<!--[if IE]>

<style type="text/css">
#invoice-bottom {
		bottom:-5px;
	}
	#invoice-status {
	height:150px;
	}
	#invoice-content {
	width:759px;
	}
</style>
<![endif]-->
{/literal}


</head>

<body>
<div id="backlink"><a href="{$ca_url}clientarea">- {$lang.backtoclientarea} -</a></div>
<div id="invoice-container">
	<div id="invoice-content">

		<div id="invoice-top"></div>

		<div id="invoice-bottom"></div>
		<div id="invoice-icons">
			<a href="#" onclick="window.print();"><img src="{$template_dir}images/invoice_print.gif" /></a>
			<a href="{$ca_url}root&amp;action=download&amp;estimate={$estimate.hash}" onclick=""><img src="{$template_dir}images/invoice_pdf.gif" /></a>

		</div>
		<div id="invoice-status" style="background-image:url({$template_dir}images/estimate_{$estimate.status}_{$language}.gif);width:auto;">{if $company_image}<img src="{$system_url}{$company_image}" alt="{$business_name}" style="width: 200px; height: 50px;" />{else}{$business_name}{/if} <div style="float: right;  padding-left: 5px;"><strong>{$lang.customerquote}</strong></div></div>
		
		<div id="invoice-body" >
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="66%" valign="top">
						<table border="0" cellpadding="2" cellspacing="0"  class="invoice-table" style="margin:0px;">
							<tr>
								<td width="130"  class="summary"><strong>{$lang.expirydate}</strong></td>
								<td class="summary">{$estimate.date_expires|dateformat:$date_format}</td>
							</tr>
							<tr>
								<td width="130" class="summary">{$lang.estimate_date}</td>
								<td class="summary">{$estimate.date_created|dateformat:$date_format}</td>
							</tr>
							
						{if $estimate.client.companyname!=''}	
						<tr>
								<td width="130" class="summary">{$lang.company}</td>
								<td class="summary">{$estimate.client.companyname}</td>
							</tr>
						{/if}
						<tr>
								<td width="130" class="summary">{$lang.customer}</td>
								<td class="summary">{$estimate.client.firstname} {$estimate.client.lastname} </td>
							</tr>
						
						</table>
					
						

					</td>
					
					<td width="33%"  valign="top">
					<table border="0" cellpadding="2" cellspacing="0"  class="invoice-table" style="margin:0px;">
							<tr>
								<td  class="summary"><strong class="larger">{$lang.estimate_id}</strong>:</td>
								<td class="summary"><span class="larger">#{$estimate.id}</span></td>
							</tr>
							<tr>
								<td class="summary"><strong class="larger">{$lang.invoice_status}</strong></td>
								<td class="summary"> <strong class="larger status {$estimate.status}">{$lang[$estimate.status]}</strong></td>
							</tr>
							
					
						
						</table>
					 
						

					</td>
				</tr>
			</table>

			<table class="invoice-table" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<th>{$lang.invoice_desc}</th>
					{if $estimate.taxrate>0 || $estimate.taxrate2>0}
					<th width="7%" class="acenter">{$lang.invoice_tax}</th>
					{/if}
					<th width="15%" class="aright">{$lang.unitcost}</th>
					<th width="7%" class="acenter">{$lang.qty}</th>
					<th width="15%" class="aright">{$lang.price}</th>
					
				</tr>
				{foreach from=$estimate.items item=item}
				<tr>
					<td>{$item.description|nl2br}</td>
					{if $estimate.taxrate>0 || $estimate.taxrate2>0}
					<td class="acenter">{if $item.taxed==1}{$lang.yes}{else}{$lang.no}{/if}</td>
					{/if}
					<td class="aright">{$item.amount|price:$currency}</td>
					<td class="acenter">{$item.qty}</td>
					
					<td class="aright">{$item.linetotal|price:$currency}</td>
				</tr>
				{/foreach}
				<tr>
					<td class="summary"></td>
					<td class="summary aright" colspan="2"><strong>{$lang.subtotal}</strong></td>
					<td class="summary aright" colspan="2"><strong>{$estimate.subtotal|price:$currency}</strong></td>
				</tr>
				{if $estimate.credit>0}
				<tr>
					<td class="summary"></td>
					<td class="summary aright" colspan="2"><strong>{$lang.discount}</strong></td>
					<td class="summary aright" colspan="2"><strong>{$estimate.credit|price:$currency}</strong></td>
				</tr>
				{/if}
				{if $estimate.taxrate!=0}
				<tr>
					<td class="summary"></td>
					<td class="summary aright" colspan="2"><strong>{$lang.tax} ({$estimate.taxrate}%)</strong></td>
					<td class="summary aright" colspan="2"><strong>{$estimate.tax|price:$currency}</strong></td>
				</tr>
				{/if}
				{if $estimate.taxrate2!=0}
				<tr>
					<td class="summary"></td>
					<td class="summary aright" colspan="2"><strong>{$lang.tax} ({$estimate.taxrate2}%)</strong></td>
					<td class="summary aright" colspan="2"><strong>{$estimate.tax2|price:$currency}</strong></td>
				</tr>
				{/if}
				<tr>
					<td class="summary"></td>
					<td class="summary aright" colspan="2"><strong class="bigger">{$lang.total}</strong></td>
					<td class="summary aright" colspan="2"><strong class="bigger">{$estimate.total|price:$currency}</strong></td>
				</tr>
			</table>

			{if $estimate.notes!=''}
			<strong class="larger">{$lang.notes}</strong><br />
			{$estimate.notes}
			{/if}

			
		</div>
	</div>
</div>
</body>
</html>
{/if}