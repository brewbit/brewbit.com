# This migration comes from spree_brewbit_dashboard (originally 20130122042122)
class AddProbeCalibrationOffsetToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :probe_calibration_offset, :decimal
  end
end
