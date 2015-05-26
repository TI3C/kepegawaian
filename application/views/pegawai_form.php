<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to Data Pegawai</title>

	<style type="text/css">

	::selection{ background-color: #E13300; color: white; }
	::moz-selection{ background-color: #E13300; color: white; }
	::webkit-selection{ background-color: #E13300; color: white; }

	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body{
		margin: 0 15px 0 15px;
	}
	
	p.footer{
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	
	#container{
		margin: 10px;
		border: 1px solid #D0D0D0;
		-webkit-box-shadow: 0 0 8px #D0D0D0;
	}
	</style>
</head>
<body>

<div id="container">
	<h1>Data Pegawai</h1>

	<div id="body">
		<h1><?php echo $title;?></h1>
		<?php echo $message;?>
		<?php echo validation_errors();?>
		<?php echo form_open($action);?>
		<div class="data">
		<table>
		<tr>
			<td width="30%">Kd Pegawai</td>
			<td><input type="text" name="tKd_Pegawai" class="text" value="<?php echo (isset($pegawai['Kd_Pegawai']))?$pegawai['Kd_Pegawai']:'';?>"/></td>
		</tr>
		<tr>
			<td valign="top">nama</td>
			<td><input type="text"name="tNama"class="text"value="<?php echo (isset($pegawai['Nama']))?$pegawai['Nama']:'';?>"/>
			<?php echo form_error('Nama');?></td>
		</tr>
		<tr>
			<td valign="top">Telpon</td>
			<td><input type="text"name="tTelpon"class="text"value="<?php echo (isset($pegawai['Telpon']))?$pegawai['Telpon']:'';?>"/>
			<?php echo form_error('Telpon');?></td>
		</tr>
		<tr>
			<td valign="top">Alamat</td>
			<td><input type="text"name="tAlamat"class="text"value="<?php echo (isset($pegawai['Alamat']))?$pegawai['Alamat']:'';?>"/>
			<?php echo form_error('Alamat');?></td>
		</tr>
		<tr>
			<td valign="top">Status</td>
			<td><input type="text"name="tStatus"class="text"value="<?php echo (isset($pegawai['Status']))?$pegawai['Status']:'';?>"/>
			<?php echo form_error('Status');?></td>
		</tr>
		<tr>
			<td valign="top">Foto</td>
			<td><input type="text"name="tFoto"class="text"value="<?php echo (isset($pegawai['Foto']))?$pegawai['Foto']:'';?>"/>
			<?php echo form_error('Foto');?></td>
		</tr>
		<tr>
			<td valign="top">Bagian</td>
			<td><input type="text"name="tBagian"class="text"value="<?php echo (isset($pegawai['Bagian']))?$pegawai['Bagian']:'';?>"/>
			<?php echo form_error('Bagian');?></td>
		</tr>
		<tr>
			<td valign="top">jenis_kelamin</td>
			<td><input type="radio"name="tJenis_Kelamin"value="M" <?php echo ($pegawai['Jenis_Kelamin']=="M")?"checked='checked'":'';?> /> Laki - Laki
			<input type="radio"name="tJenis_Kelamin"value="F" <?php echo ($pegawai['Jenis_Kelamin']=="F")?"checked='checked'":'';?> /> 	<?php echo form_error('Jenis_Kelamin');?> Perempuan</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit"value="Save"/></td>
		</tr>
		</table>
	</div>
	</form>
	<br/>
	<?php echo $link_back;?>				
	</div>

	<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds</p>
</div>

</body>
</html>