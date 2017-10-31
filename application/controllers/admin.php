<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
	}

	public function index()
	{
		$this->load->view('admin/index');
	}

	public function dokter()
	{
		$this->load->view('admin/dokter');
	}
	public function form()
	{
		$this->load->view('admin/input-dokter');
	}

}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */