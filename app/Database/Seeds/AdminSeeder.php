<?php namespace App\Database\Seeds;

class AdminSeeder extends \CodeIgniter\Database\Seeder
{
    public function run()
    {
        $data = [
            'username'  => 'admin',
            'name'      => 'Admin',
            'email'     => 'admin@example.com',
            'password'  => '$2y$10$sOKww3LkoNzBtuW5SKxcJOVcY5eN3L1UsTMZpzgWLDd5MfiZ2mmNe',
            'status'    => 'Active',
            'level'     => 'Admin',

            'username'  => 'petugas',
            'name'      => 'Petugas',
            'email'     => 'petugas@example.com',
            'password'  => '$2y$10$sOKww3LkoNzBtuW5SKxcJOVcY5eN3L1UsTMZpzgWLDd5MfiZ2mmNe',
            'status'    => 'Active',
            'level'     => 'Petugas',

            'username'  => 'kepala',
            'name'      => 'Kepala',
            'email'     => 'kepala@example.com',
            'password'  => '$2y$10$sOKww3LkoNzBtuW5SKxcJOVcY5eN3L1UsTMZpzgWLDd5MfiZ2mmNe',
            'status'    => 'Active',
            'level'     => 'Kepala',
        ];
        $this->db->table('users')->insert($data);
    }
} 