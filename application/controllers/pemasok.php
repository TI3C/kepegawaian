<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pemasok extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	private $limit=10;
	function __construct()
	{
		parent::__construct();
		#load library dan helper yang dibutuhkan
		$this->load->library(array('table','form_validation'));
		$this->load->helper(array('form','url'));
		$this->load->model('pemasok_model','',TRUE);
	}
	public function index($offset=0,$order_column='kd_pemasok',$order_type='asc')
	{
		if (empty($offset)) $offset=0;
		if (empty($order_column)) $order_column='kd_pemasok';
		if (empty($order_type)) $order_type='asc';
		//TODO: check for valid column
		// load data siswa
		$pemasoks=$this->pemasok_model->get_paged_list($this->limit,$offset,$order_column,$order_type)->result();
		// generate pagination
		$this->load->library('pagination');
		$config['base_url']= site_url('pemasok/index/');
		$config['total_rows']=$this->pemasok_model->count_all();
		$config['per_page']=$this->limit;
		$config['uri_segment']=3;
		$this->pagination->initialize($config);
		$data['pagination']=$this->pagination->create_links();
		// generate table data
		$this->load->library('table');
		$this->table->set_empty("&nbsp;");
		$new_order=($order_type=='asc'?'desc':'asc');
		$this->table->set_heading('No',anchor('pemasok/index/'.$offset.'/kd_pemasok/'.$new_order,'kd_pemasok'),anchor('pemasok/index/'.$offset.'/Nama/'.$new_order,'Nama'),anchor('pemasok/index/'.$offset.'/Jenis_Kelamin/'.$new_order,'Jenis Kelamin'),anchor('pegawai/index/'.$offset.'/Telpon/'.$new_order,'Telpon'),anchor('pegawai/index/'.$offset.'/Alamat/'.$new_order,'ALamat'),'Actions');
		$i=0+$offset;
		foreach ($pemasoks as $pemasok)
		{
			$this->table->add_row(
			++$i,
			$pemasok->kd_pemasok,
			$pemasok->nama_pemasok,
			//strtoupper($pemasok->Jenis_Kelamin)=='M'?'Laki-Laki':'Perempuan',
			$pemasok->telpon,
			$pemasok->alamat,
			anchor('pemasok/view/'.$pemasok->kd_pemasok,'view',array('class'=>'view')).' '.
			anchor('pemasok/update/'.$pemasok->kd_pemasok,'update',array('class'=>'update')).' '.
			anchor('pemasok/delete/'.$pemasok->kd_pemasok,'delete',array('class'=>'delete','onclick'=>"return confirm('Apakah Anda yakin ingin menghapus data Pegawai?')")));
		}
		$data['table']=$this->table->generate();

		if ($this->uri->segment(3)=='delete_success')
			$data['message']='Data berhasil dihapus';
		else if ($this->uri->segment(3)=='add_success')
			$data['message']='Data berhasil ditambah';
		else
			$data['message']='';
		// load view
		$this->load->view('pegawai_view',$data);
	}
	public function cari($offset=0,$order_column='kd_pemasok',$order_type='asc')
	{
		if (empty($offset)) $offset=0;
		if (empty($order_column)) $order_column='kd_pemasok';
		if (empty($order_type)) $order_type='asc';
		//TODO: check for valid column
		// load data siswa
		$pegawais=$this->pegawai_model->get_paged_list_search($this->limit,$offset,$order_column,$order_type)->result();
		// generate pagination
		$this->load->library('pagination');
		$config['base_url']= site_url('pemasok/index/');
		$config['total_rows']=$this->pegawai_model->count_all();
		$config['per_page']=$this->limit;
		$config['uri_segment']=3;
		$this->pagination->initialize($config);
		$data['pagination']=$this->pagination->create_links();
		// generate table data
		$this->load->library('table');
		$this->table->set_empty("&nbsp;");
		$new_order=($order_type=='asc'?'desc':'asc');
		$this->table->set_heading('No',anchor('pemasok/index/'.$offset.'/kd_pemasok/'.$new_order,'kd pemasok'),anchor('Pemasok/index/'.$offset.'/Nama/'.$new_order,'Nama'),anchor('pegawai/index/'.$offset.'/Jenis_Kelamin/'.$new_order,'Jenis Kelamin'),anchor('pegawai/index/'.$offset.'/Telpon/'.$new_order,'Telpon'),anchor('pegawai/index/'.$offset.'/Alamat/'.$new_order,'ALamat'),'Actions');
		$i=0+$offset;
		foreach ($pemasoks as $pemasok)
		{
			$this->table->add_row(
			++$i,
			$pemasok->kd_pemasok,
			$pemasok->Nama,
			//strtoupper($pemasok->Jenis_Kelamin)=='M'?'Laki-Laki':'Perempuan',
			$pemasok->Telpon,
			$pemasok->Alamat,
			anchor('pemasok/view/'.$pemasok->kd_pemasok,'view',array('class'=>'view')).' '.
			anchor('pemasok/update/'.$pemasok->kd_pemasok,'update',array('class'=>'update')).' '.
			anchor('pemasok/delete/'.$pemasok->kd_pemasok,'delete',array('class'=>'delete','onclick'=>"return confirm('Apakah Anda yakin ingin menghapus data Pegawai?')")));
			}
		$data['table']=$this->table->generate();

		if ($this->uri->segment(3)=='delete_success')
			$data['message']='Data berhasil dihapus';
		else if ($this->uri->segment(3)=='add_success')
			$data['message']='Data berhasil ditambah';
		else
			$data['message']='';
		// load view
		$this->load->view('pegawai_view',$data);
	}
	function add()
	{
		// set common properties
		$data['title']='Tambah Pegawai baru';
		$data['action']= site_url('pegawai/add');
		$data['link_back']= anchor('pegawai/index/','Back to list of pegawais',array('class'=>'back'));
		$this->_set_rules();
		// run validation
		if ($this->form_validation->run()=== FALSE)
		{
			$data['message']='';
			// set common properties
			$data['title']='Add new Pegawai';
			$data['message']='';
			$data['pegawai']['Kd_Pegawai']='';
			$data['pegawai']['Nama']='';
			$data['pegawai']['Jenis_Kelamin']='';
			$data['pegawai']['Telpon']='';
			$data['pegawai']['Alamat']='';
			$data['pegawai']['Status']='';
			$data['pegawai']['Foto']='';
			$data['pegawai']['Bagian']='';
			$data['link_back']= anchor('pegawai/index/','Lihat Daftar Pegawai',array('class'=>'back'));
			$this->load->view('pegawai_form',$data);
		} 
		else 
		{
			// save data
			$pegawai= array('Kd_Pegawai'=>$this->input->post('tKd_Pegawai'),
			'Nama'=>$this->input->post('tNama'),
			'Jenis_Kelamin'=>$this->input->post('tJenis_Kelamin'),
			'Telpon'=>$this->input->post('tTelpon'),
			'Alamat'=>$this->input->post('tAlamat'),
			'Status'=>$this->input->post('tStatus'),
			'Foto'=>$this->input->post('tFoto'),
			'Bagian'=>$this->input->post('tBagian')
			);
			$Kd_Pegawai=$this->pegawai_model->save($pegawai);
			// set form input nama="id"
			$this->validation->Kd_Pegawai =$Kd_Pegawai;
			redirect('pegawai/index/add_success');
		}
	}
	function update($Kd_Pegawai)
	{
		// set common properties
		$data['title']='Update siswa';
		$this->load->library('form_validation');
		// set validation properties
		$this->_set_rules();
		$data['action']=('pegawai/update/'.$Kd_Pegawai);
		// run validation
		if ($this->form_validation->run()=== FALSE)
		{
			$data['message']='';
			$data['pegawai']=$this->pegawai_model->get_by_id($Kd_Pegawai)->row_array();
			$_POST['Jenis_Kelamin']=strtoupper($data['pegawai']['Jenis_Kelamin']);

			$data['title']='Update siswa';
			$data['message']='';
		} 
		else 
		{
			// save data
			$Kd_Pegawai=$this->input->post('tKd_Pegawai');
			$pegawai= array('Kd_Pegawai'=>$this->input->post('tKd_Pegawai'),
			'Nama'=>$this->input->post('tNama'),
			'Jenis_Kelamin'=>$this->input->post('tJenis_Kelamin'),
			'Telpon'=>$this->input->post('tTelpon'),
			'Alamat'=>$this->input->post('tAlamat'),
			'Status'=>$this->input->post('tStatus'),
			'Foto'=>$this->input->post('tFoto'),
			'Bagian'=>$this->input->post('tBagian')
			);

			$this->pegawai_model->update($Kd_Pegawai,$pegawai);
			$data['pegawai']=$this->pegawai_model->get_by_id($Kd_Pegawai)->row_array();
			// set user message
			$data['message']='update pegawai success';
		}
		$data['link_back']= anchor('pegawai/index/','Lihat daftar pegawai',array('class'=>'back'));
		// load view
		$this->load->view('pegawai_form',$data);
}


	function view($Kd_Pegawai)
	{
		// set common properties
		$data['title']='pegawai Details';
		$data['link_back']= anchor('pegawai/index/','Lihat daftar pegawais',array('class'=>'back'));
		// get siswa details
		$data['pegawai']=$this->pegawai_model->get_by_id($Kd_Pegawai)->row();
		// load view
		$this->load->view('pegawai_detail',$data);
	}
	function delete($Kd_Pegawai)
	{
		// delete siswa
		$this->pegawai_model->delete($Kd_Pegawai);
		// redirect to siswa list page
		redirect('pegawai/index/delete_success','refresh');
	}
	// validation rules
	function _set_rules()
	{
		$this->form_validation->set_rules('tKd_Pegawai','Kode Pegawai','required|trim');
		$this->form_validation->set_rules('tNama','Nama','required|trim');
		$this->form_validation->set_rules('tTelpon','Telpon','required|trim');
		$this->form_validation->set_rules('tAlamat','Alamat','required|trim');
		$this->form_validation->set_rules('tStatus','Status','required|trim');
		$this->form_validation->set_rules('tFoto','Foto','required|trim');
		$this->form_validation->set_rules('tBagian','Bagian','required|trim');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */