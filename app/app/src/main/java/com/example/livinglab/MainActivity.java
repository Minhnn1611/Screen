package com.example.livinglab;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.DatePickerDialog;
import android.app.PendingIntent;
import android.app.TimePickerDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TimePicker;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.protobuf.InvalidProtocolBufferException;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {
    private static final String BROKER = "tcp://broker.emqx.io:1883";
//    private static final String BROKER = "tcp://192.168.66.118:1883";
    private static final String CLIENT_ID = "livinglab-app";
//    private static final String TOPIC_PUB = "hub/control/app/8xff";

    private static final String TOPIC_PUB = "host/master";
    private static final String TOPIC_SUB = "hub/app";
    static GridView gv;
    private Button addBtn, removeBtn, scanBtn;
    private ImageView timeBtn;
    static ArrayList<Device> deviceList;
    int requestCode;
    private SharedPrefsManager prefsManager;
    private static MyArrayAdapter myAdapter;
    static MqttHandler mqttHandler;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        initViews();
        initMqttHandler();
        setupDeviceList();
        setupListeners();

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }

    private void initViews() {
        gv = findViewById(R.id.device_list);
        addBtn = findViewById(R.id.add_btn);
        removeBtn = findViewById(R.id.remove_btn);
        scanBtn = findViewById(R.id.scan_btn);
        timeBtn = findViewById(R.id.alarm_img);
    }

    private void initMqttHandler() {
        mqttHandler = new MqttHandler();
        mqttHandler.connect(BROKER, CLIENT_ID);
        mqttHandler.subscribe(TOPIC_SUB);
        mqttHandler.setCallback(new MyMqttCallback());
    }

    private void setupDeviceList() {
        prefsManager = new SharedPrefsManager(this);
        requestCode = prefsManager.loadRequestCode();
        deviceList = prefsManager.loadDeviceList();
        myAdapter = new MyArrayAdapter(MainActivity.this, R.layout.layout_item_device, deviceList);
        gv.setAdapter(myAdapter);
    }

    private void setupListeners() {
        gv.setOnItemClickListener(this::onDeviceItemClick);
        removeBtn.setOnClickListener(this::onRemoveDeviceClick);
        scanBtn.setOnClickListener(this::onScanClick);
        timeBtn.setOnClickListener(this::onTimeClick);
    }

    private void onDeviceItemClick(AdapterView<?> parent, View view, int position, long id) {
        Device device = deviceList.get(position);
        device.setStatus(!device.isStatus());
        updateDeviceImageInView(view, device);
        sendDeviceStatus(device);
    }

    private void updateDeviceImageInView(View view, Device device) {
        ImageView deviceImg = view.findViewById(R.id.device_img);
        if (device.getDevice_type().equals("Led")) {
            device.setImg(device.isStatus() ? R.drawable.led_on : R.drawable.led_off);
        }
        else if (device.getDevice_type().equals("Switch")) {
            device.setImg(device.isStatus() ? R.drawable.switch_on : R.drawable.switch_off);
        }
        deviceImg.setImageResource(device.getImg());
    }

    private void sendDeviceStatus(Device device) {
        System.out.println("device on click");

        if (device.getDevice_type().equals("Led")) {
            try {
                JSONObject jsonObject = new JSONObject();
                JSONArray leds = new JSONArray();
                JSONObject led = new JSONObject();

                led.put("name", device.getName());
                led.put("status", device.isStatus());
                led.put("controller", device.getController());
                leds.put(0, led);
                jsonObject.put("mode", "device_control");
                jsonObject.put("sender", "app");
                jsonObject.put("leds", leds);

                System.out.println(jsonObject);
                mqttHandler.publish(TOPIC_PUB, jsonObject.toString().getBytes());
            } catch (JSONException e) {
                e.printStackTrace();  // Handle the exception
            }
        }
        else if (device.getDevice_type().equals("Switch")) {
            try {
                JSONArray sws = new JSONArray();
                JSONObject jsonObject = new JSONObject();
                JSONObject sw = new JSONObject();

                sw.put("name", device.getName());
                sw.put("ep", device.getEp());
                sw.put("status", device.isStatus());
                sw.put("controller", device.getController());
                sws.put(0, sw);
                jsonObject.put("mode", "device_control");
                jsonObject.put("sender", "app");
                jsonObject.put("sws", sws);

                System.out.println(jsonObject);
                mqttHandler.publish(TOPIC_PUB, jsonObject.toString().getBytes());
            } catch (JSONException e) {
                e.printStackTrace();  // Handle the exception
            }
        }

    }

    private void onRemoveDeviceClick(View v) {
        View removeDeviceView = LayoutInflater.from(this).inflate(R.layout.layout_remove_device, null);
        AlertDialog alertDialog = createDialog(removeDeviceView);
        alertDialog.show();
        removeDeviceView.findViewById(R.id.remove_led_btn).setOnClickListener(view -> removeDevice(removeDeviceView, alertDialog));
    }

    private void removeDevice(View removeDeviceView, AlertDialog alertDialog) {
        String name = ((EditText) removeDeviceView.findViewById(R.id.led_name_remove)).getText().toString();
        if (!name.isEmpty()) {
            if (removeDeviceFromList(name)) {
                alertDialog.dismiss();
            } else {
                showToast("Device not found");
            }
        } else {
            showToast("Please enter Device name");
        }
    }

    private boolean removeDeviceFromList(String name) {
        for (int i = 0; i < deviceList.size(); i++) {
            if (deviceList.get(i).getName().equals(name)) {
                deviceList.remove(i);
                myAdapter.notifyDataSetChanged();
                return true;
            }
        }
        return false;
    }

    private void onScanClick(View v) {
        try {
            JSONObject jsonObject = new JSONObject();

            jsonObject.put("mode", "get_device");
            jsonObject.put("sender", "app");

            System.out.println(jsonObject);
            mqttHandler.publish(TOPIC_PUB, jsonObject.toString().getBytes());
        } catch (JSONException e) {
            e.printStackTrace();  // Handle the exception
        }
    }

    private void showToast(String message) {
        Toast.makeText(MainActivity.this, message, Toast.LENGTH_SHORT).show();
    }
    private void onTimeClick(View v) {
        View timeSettingView = LayoutInflater.from(this).inflate(R.layout.layout_set_time, null);
        AlertDialog alertDialog = createDialog(timeSettingView);

        Button confirmButton = timeSettingView.findViewById(R.id.confirm_button);
        confirmButton.setOnClickListener(view -> {
            confirmTime(timeSettingView, alertDialog);
        });

        alertDialog.show();
    }

    private void confirmTime(View timeSettingView, AlertDialog alertDialog) {
        EditText editTextHour = timeSettingView.findViewById(R.id.editTextHour);
        EditText editTextMinute = timeSettingView.findViewById(R.id.editTextMinute);
        EditText editTextDay = timeSettingView.findViewById(R.id.editTextDay);
        EditText editTextMonth = timeSettingView.findViewById(R.id.editTextMonth);
        EditText editTextDeviceName = timeSettingView.findViewById(R.id.editTextDeviceName);
        Spinner spinnerDeviceStatus = timeSettingView.findViewById(R.id.device_status);

        String hourText = editTextHour.getText().toString();
        String minuteText = editTextMinute.getText().toString();
        String dayText = editTextDay.getText().toString();
        String monthText = editTextMonth.getText().toString();
        String deviceNames = editTextDeviceName.getText().toString();
        String deviceStatusStr = spinnerDeviceStatus.getSelectedItem().toString();
        boolean deviceStatus = deviceStatusStr.equals("On");

        if (!isValidTime(hourText, minuteText) || !isValidDate(dayText, monthText)) {
            Toast.makeText(this, "Invalid time or date", Toast.LENGTH_SHORT).show();
            return;
        }
        String[] deviceNameArray = deviceNames.split(",");
        for (String deviceName : deviceNameArray) {
            deviceName = deviceName.trim();
            if (!isValidDeviceName(deviceName)) {
                Toast.makeText(this, "Invalid device name: " + "\"" + deviceName + "\"", Toast.LENGTH_SHORT).show();
                return;
            }
        }
        int hour = Integer.parseInt(hourText);
        int minute = Integer.parseInt(minuteText);
        int day = Integer.parseInt(dayText);
        int month = Integer.parseInt(monthText);

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minute);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.DAY_OF_MONTH, day);
        calendar.set(Calendar.MONTH, month - 1);

        Calendar currentTime = Calendar.getInstance();
        if (calendar.before(currentTime)) {
            Toast.makeText(this, "Selected time is in the past", Toast.LENGTH_SHORT).show();
            return;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm dd/MM", Locale.getDefault());
        System.out.println(dateFormat.format(calendar.getTime()));

        alertDialog.dismiss();
    }
    private boolean isValidDeviceName(String deviceName){
        for(Device device : deviceList){
            if(deviceName.equals(device.getName())){
                return true;
            }
        }
        return false;
    }
    private boolean isValidTime(String hourText, String minuteText) {
        try {
            int hour = Integer.parseInt(hourText);
            int minute = Integer.parseInt(minuteText);
            return (hour >= 0 && hour < 24) && (minute >= 0 && minute < 60);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean isValidDate(String dayText, String monthText) {
        try {
            int day = Integer.parseInt(dayText);
            int month = Integer.parseInt(monthText);
            return (day > 0 && day <= 31) && (month > 0 && month <= 12);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private AlertDialog createDialog(View view) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setView(view);
        return builder.create();
    }

    @Override
    protected void onPause() {
        super.onPause();
        prefsManager.saveDeviceList(deviceList);
        prefsManager.saveRequestCode(requestCode);
    }

    class MyMqttCallback implements MqttCallback {
        @Override
        public void connectionLost(Throwable cause) {}

        @SuppressLint("SetTextI18n")
        @Override
        public void messageArrived(String topic, MqttMessage message) {
            if (topic.equals("hub/app")) {
                String jsonStr = new String(message.getPayload());
                System.out.println(jsonStr);

                updateLeds(jsonStr);
                updateSws(jsonStr);
                addLeds(jsonStr);
                addSws(jsonStr);
            }
        }

        @Override
        public void deliveryComplete(IMqttDeliveryToken token) {}
    }

    private void addLeds(String jsonStr) {

        try {
            JSONObject jsonObject = new JSONObject(jsonStr);

            // Check if "leds" exists and is an array
            if (jsonObject.has("leds") && jsonObject.get("leds") instanceof JSONArray) {
                JSONArray leds = jsonObject.getJSONArray("leds");

                for (int i = 0; i < leds.length(); i++) {
                    JSONObject led = leds.getJSONObject(i);
                    String led_name = led.getString("name");
                    String controller = led.getString("controller");
                    Boolean led_status = led.getBoolean("status");

                    boolean isNewLed = true;
                    for (Device device : deviceList) {
                        if (device.getName().equals(led_name)) {
                            isNewLed = false;
                            break;
                        }
                    }

                    if (isNewLed) {
                        System.out.println("new led: " + led_name);
                        int led_img = led_status ? R.drawable.led_on : R.drawable.led_off;
                        runOnUiThread(() -> {
                            Device newLed = new Device(led_img, led_name, 0, led_status, controller, "Led", 0);
                            deviceList.add(newLed);
                            myAdapter.notifyDataSetChanged();
                        });
                    }
                }
            } else {
                System.out.println("No 'leds' found in the JSON.");
            }

        } catch (JSONException e) {
            e.printStackTrace();  // Handle the exception
        }

    }

    private void addSws(String jsonStr) {

        try {
            JSONObject jsonObject = new JSONObject(jsonStr);

            if (jsonObject.has("sws") && jsonObject.get("sws") instanceof JSONArray) {
                JSONArray sws = jsonObject.getJSONArray("sws");

                for (int i = 0; i < sws.length(); i++) {
                    JSONObject sw = sws.getJSONObject(i);
                    String sw_name = sw.getString("name");
                    String controller = sw.getString("controller");
                    boolean sw_status = sw.getBoolean("status");
                    int ep = sw.getInt("ep");

                    boolean isNewSw = true;
                    for (Device device : deviceList) {
                        if (device.getName().equals(sw_name)) {
                            isNewSw = false;
                            break;
                        }
                    }

                    if (isNewSw) {
                        System.out.println("new sw: " + sw_name);
                        int sw_img = sw_status ? R.drawable.switch_on : R.drawable.switch_off;
                        runOnUiThread(() -> {
                            Device newSw = new Device(sw_img, sw_name, 0, sw_status, controller, "Switch", ep);
                            deviceList.add(newSw);
                            myAdapter.notifyDataSetChanged();
                        });
                    }
                }
            } else {
                System.out.println("No 'sws' found in the JSON.");
            }

        } catch (JSONException e) {
            e.printStackTrace();  // Handle the exception
        }

    }

    private void updateLeds(String jsonStr) {
        try {
            JSONObject jsonObject = new JSONObject(jsonStr);

            // Check if "leds" exists and is an array
            if (jsonObject.has("leds") && jsonObject.get("leds") instanceof JSONArray) {
                JSONArray leds = jsonObject.getJSONArray("leds");

                for (int i = 0; i < leds.length(); i++) {
                    JSONObject led = leds.getJSONObject(i);
                    String led_name = led.getString("name");
                    String controller = led.getString("controller");
                    Boolean led_status = led.getBoolean("status");

                    System.out.println(led_name);
                    for (int j = 0; j < deviceList.size(); j++) {
                        Device device = deviceList.get(j);
                        if (device.getName().equals(led_name)) {
                            System.out.println("change status led: " + led_name);
                            device.setStatus(led_status);
                            device.setImg(device.isStatus() ? R.drawable.led_on : R.drawable.led_off);
                            updateDeviceImageInGridView(j, device.getImg());
                        }
                    }
                }
            } else {
                System.out.println("No 'leds' found in the JSON.");
            }

        } catch (JSONException e) {
            e.printStackTrace();  // Handle the exception
        }

    }

    private void updateSws(String jsonStr) {
        try {
            JSONObject jsonObject = new JSONObject(jsonStr);

            if (jsonObject.has("sws") && jsonObject.get("sws") instanceof JSONArray) {
                JSONArray sws = jsonObject.getJSONArray("sws");

                for (int i = 0; i < sws.length(); i++) {
                    JSONObject sw = sws.getJSONObject(i);
                    String sw_name = sw.getString("name");
                    String controller = sw.getString("controller");
                    Boolean sw_status = sw.getBoolean("status");

                    System.out.println(sw_name);
                    for (int j = 0; j < deviceList.size(); j++) {
                        Device device = deviceList.get(j);
                        if (device.getName().equals(sw_name)) {
                            System.out.println("change status led: " + sw_name);
                            device.setStatus(sw_status);
                            device.setImg(device.isStatus() ? R.drawable.switch_on : R.drawable.switch_off);
                            updateDeviceImageInGridView(j, device.getImg());
                        }
                    }
                }
            } else {
                System.out.println("No 'sws' found in the JSON.");
            }

        } catch (JSONException e) {
            e.printStackTrace();  // Handle the exception
        }

    }

    private void updateDeviceImageInGridView(int index, int imgRes) {
        runOnUiThread(() -> {
            View itemView = gv.getChildAt(index);
            if (itemView != null) {
                ImageView deviceImg = itemView.findViewById(R.id.device_img);
                deviceImg.setImageResource(imgRes);
            }
        });
    }
}
