<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Poli extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->model('mod');
	}

	public function index()
	{
		$this->load->view('poli/index');
	}

	public function dokter()
	{
		$data['user']=$this->mod->tampil('dokter')->result();
		$this->load->view('poli/dokter',$data);
	}
	public function form()
	{
		$this->load->view('poli/input-dokter');
	}
	public function hapusdokter($id)
	{
		$where = array('id_dokter' =>$id );
		$this->mod->delete('dokter',$where);
		redirect('poli/dokter');
	}

}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */