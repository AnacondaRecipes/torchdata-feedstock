@echo off

@REM # E   ImportError: dlopen(/opt/miniconda3/conda-bld/...lib/python3.11/site-packages/torch/_C.cpython-311-darwin.so, 0x0002): 
@REM # Symbol not found: __ZN2at3mps14getMPSProfilerEv
set FAILED_TESTS=--ignore=nodes/test_adapters.py ^
 --ignore=nodes/test_base_node.py ^
 --ignore=nodes/test_batch.py ^
 --ignore=nodes/test_loader.py ^
 --ignore=nodes/test_map.py ^
 --ignore=nodes/test_multi_node_weighted_sampler.py ^
 --ignore=nodes/test_pin_memory.py ^
 --ignore=nodes/test_prefetch.py ^
 --ignore=nodes/test_snapshot_store.py ^
 --ignore=stateful_dataloader/test_hugging_face.py ^
 --ignore=stateful_dataloader/test_incremental_state.py ^
 --ignore=stateful_dataloader/test_sampler.py

%PYTHON% -m pip check
cd test

:: test_audio_examples uses an uninstalled local folder ("examples");
:: avoid test_text_examples due to cycle since torchtext depends on torchdata
:: avoiding tests due to performance or timeouts
pytest -v ^
  --ignore=dataloader2 ^
  --ignore=stateful_dataloader/test_dataloader.py ^
  --ignore=test_audio_examples.py ^
  --ignore=test_text_examples.py ^
  --ignore=stateful_dataloader/test_state_dict.py ^
  %FAILED_TESTS% ^
  -k "not (_not_a_real_test or test_fsspec_memory_list or test_elastic_training_dl1_backend_gloo or test_elastic_training_dl2_backend_gloo or test_fsspec_io_iterdatapipe or test_online_iterdatapipe or test_gdrive_iterdatapipe or test_list_files or test_list_files_with_filter_mask or test_lazy_imports or TestMultiProcessingReadingService or test_large_sampler_indices or test_ind_worker_queue or TestStatefulSampler_shard1 or test_disk_cache_locks)"
