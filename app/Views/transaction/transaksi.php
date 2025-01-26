<?php echo view('_partials/header'); ?>
<?php echo view('_partials/sidebar'); ?>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Create Transaction</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Transaction</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <?php 
            $inputs = session()->getFlashdata('inputs');
            $errors = session()->getFlashdata('errors');
            if(!empty($errors)){ ?>
            <div class="alert alert-danger" role="alert">
              Whoops! Ada kesalahan saat input data, yaitu:
              <ul>
              <?php foreach ($errors as $error) : ?>
                  <li><?= esc($error) ?></li>
              <?php endforeach ?>
              </ul>
            </div>
          <?php } ?>
          <?php echo form_open_multipart('transaction/store'); ?>
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group"> 
                    <?php 
                      echo form_label('Produk', 'Produk');
                      echo form_dropdown('product_id', $produks, $inputs == null ? '' : $inputs['product_id'], ['class' => 'form-control']); 
                    ?>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <?php 
                      echo form_label('Harga');
                      $trx_price = [
                        'type'  => 'text',
                        'name'  => 'trx_price',
                        'id'    => 'trx_price',
                        'value' => $inputs == null ? '' : $inputs['trx_price'],
                        'class' => 'form-control',
                        'placeholder' => 'Harga'
                      ];
                      echo form_input($trx_price); 
                    ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
                <a href="<?php echo base_url('transaction'); ?>" class="btn btn-outline-info">Back</a>
                <button type="submit" class="btn btn-primary float-right">Save</button>
            </div>
          </div>
          <?php echo form_close(); ?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo view('_partials/footer'); ?>