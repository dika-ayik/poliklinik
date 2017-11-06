<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod extends CI_Model {

			public function tampil($table)
			{
				 return $this->db->get($table);
			}

}

/* End of file mod.php */
/* Location: ./application/models/mod.php */