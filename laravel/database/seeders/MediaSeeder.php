<?php

namespace Database\Seeders;

use App\Models\Code;
use App\Models\Page;
use App\Models\Project;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MediaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $image_code = storage_path('images\code.jpg');
        $image_page = storage_path('images\page.jpg');
        $image_project = storage_path('images\project.jpg');
        for ($i = 1; $i <= 20; $i++) {
            $code = Code::find($i);
            $code
                ->addMedia($image_code)
                ->preservingOriginal()
                ->toMediaCollection('codes');
        }
        for ($i = 1; $i <= 20; $i++) {
            $page = Page::find($i);
            $page
                ->addMedia($image_page)
                ->preservingOriginal()
                ->toMediaCollection('pages');
        }
        for ($i = 1; $i <= 20; $i++) {
            $project = Project::find($i);
            $project
                ->addMedia($image_project)
                ->preservingOriginal()
                ->toMediaCollection('projects');
        }
    }
}
