# $PYTHON -m pip check
# ulimit -n 4096
# cd test
# # test_audio_examples uses an uninstalled local folder ("examples");
# # avoid test_text_examples due to cycle since torchtext depends on torchdata
# # test_ind_worker_queue timed out.
# pytest -v --ignore=stateful_dataloader/test_dataloader.py \
# --ignore=stateful_dataloader/test_state_dict.py \
# --ignore=test_audio_examples.py \
# --ignore=test_text_examples.py \
# -k "not (_not_a_real_test \
# or test_fsspec_memory_list \
# or test_elastic_training_dl1_backend_gloo \
# or test_elastic_training_dl2_backend_gloo \
# or test_fsspec_io_iterdatapipe \
# or test_online_iterdatapipe \
# or test_gdrive_iterdatapipe \
# or test_list_files \
# or test_lazy_imports \
# or TestMultiProcessingReadingService \
# or test_large_sampler_indices \
# or test_ind_worker_queue \
# or test_list_files_with_filter_mask)"
