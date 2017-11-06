<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Poli extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
	}

	public function index()
	{
		$this->load->view('poli/index');
	}

	public function dokter()
	{
		$this->load->view('poli/dokter');
	}
	public function form()
	{
		$this->load->view('poli/input-dokter');
	}

}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */