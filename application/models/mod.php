<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod extends CI_Model {

	public function tampil($table)
	{
		return $this->db->get($table);
	}
	function delete($table,$where){
		$this->db->where($where);
		$this->db->delete($table); 
	}

}

/* End of file mod.php */
/* Location: ./application/models/mod.php */