Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458847;
	b=Nv/nCiJ4fESHGlta1gCzG+oGRPjRPs4QcY+Mb2mCkA3+zKxG3enl4I2uc6wSF/7hGowb
	 yCT9VM8Bnh0Bn0y6xH4VKddJGdCei0eqyj1o0x/OHBU11EGx9hjOpCDWDvrsw/H5FV89v
	 f9pPAL2uK7aE2PEEAko2FIZkMuUNCnFSHFqK5+nkI4EbzhJA4eCPrzllCcTF44yPOTBy/
	 vZDJq2ya41062GBcie6Oka4qYT4SicswwJq5FXsKYMRpaTTBXpY12EEnSbK40hbDbdhUR
	 x4UNkzNQl9OEqVuvmJDSQ1+4q3jWm+2kuJfb9zlRtGxfCvrV09k14FVCWMoCS3HnWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Otb5sptt/O2moH4ZmOuRJ8i8LXpeoJWjWRCpePvANNg=;
	b=RhBmJO9pFQDk7tHLp9Npbn99MkwRaDRZ8C5uvdwdLfXF06xL2tldyvf7TU/cbeaM3J3m
	 krL2a1N53+4suhJWrZngxDm+z2hdB46S7onfRkwKOXo8wZtPInF1dZin9txkHYGszmC4b
	 0flJ/YOhZQJY+QmDQe6HES/mcn7x98WuzbcnpyOZgWPdLor6vvnX5Z5B96PhaXpXByhpS
	 CskdVDU8nL+WdKTnbtn0t2+OCyEZ8MSTTlhpSrjqqv8ASsXQQdWIskFlGbIm/iOS6NENm
	 01Y4QT8WQB3IJbbzB0zM9XjJJxqBsVyKTY5wWM5vkqg6b48lSYQwHBtu5qgUwNtwmkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10AmrpX;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10AmrpX
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2290509f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795458845; x=1796063645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Otb5sptt/O2moH4ZmOuRJ8i8LXpeoJWjWRCpePvANNg=;
        b=Q10AmrpXNfizMTlCVJVVqWmyE1wnvQzO3SpxGCsnyfF5d+0dap3FQv446ZHvOlArGl
         h1ANPDM/fqk7FaE7jUkfX7ByRqq9GIbMagcV1kVccUTQElcfpS9lHjDQnE7RXD66gR2m
         IREEiSwh8+Xch3vZTS2fMA7AJXssEM/UUQW9POTMw4ijXqfldZ5BDlDPVEwTgWjGtR4M
         Zs5o7AYON2LgrD09pgWkVcSfwPJEdeL2J5UpplHJuJZAf3ZoIxlbQfBK8kyj3bHTCsEN
         n9z6HHDnCUwzZU5TyERqBMhgWI/cCQIYTRpA5o5LlESVuRndcHhZqFN0ZdSBUFDdClEP
         dRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458845; x=1796063645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Otb5sptt/O2moH4ZmOuRJ8i8LXpeoJWjWRCpePvANNg=;
        b=FWOYIE7d4MeRwldwRYm9h8WFH6X1rsyqiNmFr2imY0jb9Kiunf3Siwtcbux6oWUCu2
         nMQMq9GV4QNhE3X19FtSHkxBrcBDppUC8yy9/h3v0XJJe5MUQ+yz1m2j6VLLYI7ckxzg
         vw0EQcf9c3LnI6AnOQl0TjXtoES8RvdKpd+VnGweTkE7ANcQCYP365lDr7Y8NbEk+6ky
         vHLXvGK7Ck0NkeSzf2qjhoto8NVYxlcQcPNL6KvAVF/kS3lAUMEkxpHuAqIdlthStXue
         OU3x7T1L1YOlwFb77eWboK+CtNED4k4/dDH+ToLWcRRwbL8q9PttUBfmpV07GCIfh+xb
         ceRA==
X-Forwarded-Encrypted: i=1; AL+hErEEcgXuTveYlfv0Yl2fpCV+frMFuluxUzkprCBSkzHIU4aHAgS3cYIWcbH3CMfuwYl/WB1dCMXKA2tXcQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QspWx7McWvwkg+CbNb2hYdQ6DoRynTCZZzevZ5kr79C4fJWic
	UocLijzKsPyK3qMw36Xt5VJm+6h0ym6PWlcfzI0nXZD5iXnAF4Ig/eFK
X-Gm-Gg: AZFdTZcGYFelN9na+ByqZWMuuce2NTHxpMYXqlrIuQn5SFVcrIcXQd9Rd/nrdMzB6O1
	/W5aMEjX1qYNEepyISO18IT4MgAEis2sOZI9T7Z5CkvNZY/y/R7wJqbsW8UPe1vrmFGjFa8s103
	csDivjGSweYmnnaCfSlILAMVUZQZTQGqBsYJYzw6vWIek+v1uBxJpsOdvMPWTUYM/cYZlbQ68t9
	I+TenDBsuVptreNz5BtdxgePBFkzSVehfTuxfEQnCi1XpSqMwGW8LYsXLqnNTzPA4uC+mqvNJoh
	yRg6p22qKi6ruBlwWZRmIywOIZqfTktbUKDNl2pKZvjg1kPZQw321gjKCQrPosALQmnfxWDWHsr
	9Q6trBrRoLhlhBQjamtVertPDa1ZdjoTRSwLSc0XdZVmQJMaoYDFt1H9Kbfy/nr1eTCnZSthrO5
	C+AWrcd9t59Ow0NGApdtZs7X9iL3gxB+xvVBOgLqTEswofof4L7MGHoXkgGDL1vEoIdRhjiDKTH
	1woGD2JHqbznX6DQzS8p6dAQBexd46oG4hxHkFjtTZAulleo8/xM4bfjnn+TErNj+g1rsmoSZ1L
	D+IKDYYhw3suZf3U1E31g+kjlRycku53DXO3cLQXcGy8CD4tLy34NW+orDXeFlYE6AuPSTnxYLZ
	PCKzcYkCMazF4o7ymd56pFJY1utI=
X-Received: by 2002:a05:6000:26ca:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4abb0e469damr24892047f8f.19.1795458844808;
        Mon, 23 Nov 2026 10:34:04 -0800 (PST)
Received: from dmig-l13.lan ([2a02:2455:ffd8:3900::c9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm20408949f8f.27.2026.11.23.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:34:04 -0800 (PST)
From: Dmitriy Geels <dmitriy.geels@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	hadess@hadess.net,
	lains@riseup.net,
	rydberg@bitmath.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitriy Geels <dmitriy.geels@gmail.com>
Subject: [PATCH v4] HID: logitech-hidpp: add native touchpad support for K400 Plus
Date: Mon, 23 Nov 2026 19:33:47 +0100
Message-ID: <20261123183347.54413-1-dmitriy.geels@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Logitech K400 Plus (WPID 0x404d) exposes its touchpad through the
HID++ TouchpadRawXY feature, but currently operates as an emulated mouse.

Add support for the native raw touchpad reports by creating a separate
multitouch input device while leaving the keyboard and physical button
reports on the existing HID input device.

The K400 Plus reports an area range of zero. Do not expose
ABS_MT_PRESSURE when the TouchpadRawXY feature reports no contact area,
as a permanently zero pressure value causes userspace to treat contacts
as hovering rather than touching.

This enables native touchpad handling, including multitouch gestures and
two-finger scrolling.

This is an AI-assisted patch.

Signed-off-by: Dmitriy Geels <dmitriy.geels@gmail.com>
---
Changes in v4:
- Rebase onto the current HID for-next branch.
- Do not advertise clickpad buttons on the separate K400 Plus touchpad
  device; physical button events remain on the existing HID input.
- Use a stable K400 Plus touchpad name, independent of receiver naming
  and the longer HID++ firmware product name.
- Publish the touchpad input pointer only after successful registration and
  use READ_ONCE() in the raw event path.
- Keep the existing WTP input pointer path unchanged and clean up allocation
  failures. The touchpad name no longer needs a separate allocation.

 drivers/hid/hid-logitech-hidpp.c | 211 ++++++++++++++++++++++---------
 1 file changed, 153 insertions(+), 58 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 27d83b8bbaaf..7b52c88506a1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -64,6 +64,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_CLASS_K400			BIT(2)
 #define HIDPP_QUIRK_CLASS_G920			BIT(3)
 #define HIDPP_QUIRK_CLASS_K750			BIT(4)
+#define HIDPP_QUIRK_CLASS_KBD_WTP		BIT(5)
 
 /* bits 2..20 are reserved for classes */
 /* #define HIDPP_QUIRK_CONNECT_EVENTS		BIT(21) disabled */
@@ -2931,11 +2932,13 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 #define WTP_MANUAL_RESOLUTION				39
 
 struct wtp_data {
+	struct input_dev *input;
 	u16 x_size, y_size;
 	u8 finger_count;
 	u8 mt_feature_index;
 	u8 button_feature_index;
 	u8 maxcontacts;
+	u8 area_range;
 	bool flip_y;
 	unsigned int resolution;
 };
@@ -2947,8 +2950,8 @@ static int wtp_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return -1;
 }
 
-static void wtp_populate_input(struct hidpp_device *hidpp,
-			       struct input_dev *input_dev)
+static int wtp_populate_input(struct hidpp_device *hidpp,
+			      struct input_dev *input_dev)
 {
 	struct wtp_data *wd = hidpp->private_data;
 
@@ -2962,22 +2965,31 @@ static void wtp_populate_input(struct hidpp_device *hidpp,
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, wd->y_size, 0, 0);
 	input_abs_set_res(input_dev, ABS_MT_POSITION_Y, wd->resolution);
 
-	/* Max pressure is not given by the devices, pick one */
-	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 50, 0, 0);
+	/*
+	 * The driver exposes contact area as pressure.  Do not advertise a
+	 * pressure axis when the device does not report contact area; userspace
+	 * may otherwise interpret a permanently-zero pressure value as hover.
+	 */
+	if (wd->area_range)
+		input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 50, 0, 0);
 
-	input_set_capability(input_dev, EV_KEY, BTN_LEFT);
+	/* The K400 Plus reports its physical button on the HID input. */
+	if (!(hidpp->quirks & HIDPP_QUIRK_CLASS_KBD_WTP)) {
+		input_set_capability(input_dev, EV_KEY, BTN_LEFT);
 
-	if (hidpp->quirks & HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS)
-		input_set_capability(input_dev, EV_KEY, BTN_RIGHT);
-	else
-		__set_bit(INPUT_PROP_BUTTONPAD, input_dev->propbit);
+		if (hidpp->quirks & HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS)
+			input_set_capability(input_dev, EV_KEY, BTN_RIGHT);
+		else
+			__set_bit(INPUT_PROP_BUTTONPAD, input_dev->propbit);
+	}
 
-	input_mt_init_slots(input_dev, wd->maxcontacts, INPUT_MT_POINTER |
-		INPUT_MT_DROP_UNUSED);
+	return input_mt_init_slots(input_dev, wd->maxcontacts, INPUT_MT_POINTER |
+				   INPUT_MT_DROP_UNUSED);
 }
 
 static void wtp_touch_event(struct hidpp_device *hidpp,
-	struct hidpp_touchpad_raw_xy_finger *touch_report)
+			    struct input_dev *input,
+			    struct hidpp_touchpad_raw_xy_finger *touch_report)
 {
 	struct wtp_data *wd = hidpp->private_data;
 	int slot;
@@ -2986,41 +2998,47 @@ static void wtp_touch_event(struct hidpp_device *hidpp,
 		/* no actual data */
 		return;
 
-	slot = input_mt_get_slot_by_key(hidpp->input, touch_report->finger_id);
+	slot = input_mt_get_slot_by_key(input, touch_report->finger_id);
 
-	input_mt_slot(hidpp->input, slot);
-	input_mt_report_slot_state(hidpp->input, MT_TOOL_FINGER,
-					touch_report->contact_status);
+	input_mt_slot(input, slot);
+	input_mt_report_slot_state(input, MT_TOOL_FINGER,
+				   touch_report->contact_status);
 	if (touch_report->contact_status) {
-		input_event(hidpp->input, EV_ABS, ABS_MT_POSITION_X,
-				touch_report->x);
-		input_event(hidpp->input, EV_ABS, ABS_MT_POSITION_Y,
-				wd->flip_y ? wd->y_size - touch_report->y :
-					     touch_report->y);
-		input_event(hidpp->input, EV_ABS, ABS_MT_PRESSURE,
-				touch_report->area);
+		input_event(input, EV_ABS, ABS_MT_POSITION_X,
+			    touch_report->x);
+		input_event(input, EV_ABS, ABS_MT_POSITION_Y,
+			    wd->flip_y ? wd->y_size - touch_report->y :
+			    touch_report->y);
+
+		if (wd->area_range)
+			input_event(input, EV_ABS, ABS_MT_PRESSURE,
+				    touch_report->area);
 	}
 }
 
 static void wtp_send_raw_xy_event(struct hidpp_device *hidpp,
+		struct input_dev *input,
 		struct hidpp_touchpad_raw_xy *raw)
 {
 	int i;
 
 	for (i = 0; i < 2; i++)
-		wtp_touch_event(hidpp, &(raw->fingers[i]));
+		wtp_touch_event(hidpp, input, &raw->fingers[i]);
 
 	if (raw->end_of_frame &&
-	    !(hidpp->quirks & HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS))
-		input_event(hidpp->input, EV_KEY, BTN_LEFT, raw->button);
+	    !(hidpp->quirks &
+	      (HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS |
+	       HIDPP_QUIRK_CLASS_KBD_WTP)))
+		input_event(input, EV_KEY, BTN_LEFT, raw->button);
 
 	if (raw->end_of_frame || raw->finger_count <= 2) {
-		input_mt_sync_frame(hidpp->input);
-		input_sync(hidpp->input);
+		input_mt_sync_frame(input);
+		input_sync(input);
 	}
 }
 
-static int wtp_mouse_raw_xy_event(struct hidpp_device *hidpp, u8 *data)
+static int wtp_mouse_raw_xy_event(struct hidpp_device *hidpp,
+				  struct input_dev *input, u8 *data)
 {
 	struct wtp_data *wd = hidpp->private_data;
 	u8 c1_area = ((data[7] & 0xf) * (data[7] & 0xf) +
@@ -3054,7 +3072,7 @@ static int wtp_mouse_raw_xy_event(struct hidpp_device *hidpp, u8 *data)
 		.button = data[0] & 0x01,
 	};
 
-	wtp_send_raw_xy_event(hidpp, &raw);
+	wtp_send_raw_xy_event(hidpp, input, &raw);
 
 	return 1;
 }
@@ -3065,8 +3083,16 @@ static int wtp_raw_event(struct hid_device *hdev, u8 *data, int size)
 	struct wtp_data *wd = hidpp->private_data;
 	struct hidpp_report *report = (struct hidpp_report *)data;
 	struct hidpp_touchpad_raw_xy raw;
+	struct input_dev *input;
 
-	if (!wd || !hidpp->input)
+	if (!wd)
+		return 1;
+
+	if (hidpp->quirks & HIDPP_QUIRK_CLASS_KBD_WTP)
+		input = READ_ONCE(wd->input);
+	else
+		input = hidpp->input;
+	if (!input)
 		return 1;
 
 	switch (data[0]) {
@@ -3077,16 +3103,16 @@ static int wtp_raw_event(struct hid_device *hdev, u8 *data, int size)
 			return 1;
 		}
 		if (hidpp->quirks & HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS) {
-			input_event(hidpp->input, EV_KEY, BTN_LEFT,
-					!!(data[1] & 0x01));
-			input_event(hidpp->input, EV_KEY, BTN_RIGHT,
-					!!(data[1] & 0x02));
-			input_sync(hidpp->input);
+			input_event(input, EV_KEY, BTN_LEFT,
+				    !!(data[1] & 0x01));
+			input_event(input, EV_KEY, BTN_RIGHT,
+				    !!(data[1] & 0x02));
+			input_sync(input);
 			return 0;
 		} else {
 			if (size < 21)
 				return 1;
-			return wtp_mouse_raw_xy_event(hidpp, &data[7]);
+			return wtp_mouse_raw_xy_event(hidpp, input, &data[7]);
 		}
 	case REPORT_ID_HIDPP_LONG:
 		/* size is already checked in hidpp_raw_event. */
@@ -3095,7 +3121,7 @@ static int wtp_raw_event(struct hid_device *hdev, u8 *data, int size)
 			return 1;
 		hidpp_touchpad_raw_xy_event(hidpp, data + 4, &raw);
 
-		wtp_send_raw_xy_event(hidpp, &raw);
+		wtp_send_raw_xy_event(hidpp, input, &raw);
 		return 0;
 	}
 
@@ -3108,6 +3134,9 @@ static int wtp_get_config(struct hidpp_device *hidpp)
 	struct hidpp_touchpad_raw_info raw_info = {0};
 	int ret;
 
+	if (wd->x_size)
+		return 0;
+
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_TOUCHPAD_RAW_XY,
 		&wd->mt_feature_index);
 	if (ret)
@@ -3122,6 +3151,7 @@ static int wtp_get_config(struct hidpp_device *hidpp)
 	wd->x_size = raw_info.x_size;
 	wd->y_size = raw_info.y_size;
 	wd->maxcontacts = raw_info.maxcontacts;
+	wd->area_range = raw_info.area_range;
 	wd->flip_y = raw_info.origin == TOUCHPAD_RAW_XY_ORIGIN_LOWER_LEFT;
 	wd->resolution = raw_info.res;
 	if (!wd->resolution)
@@ -3145,22 +3175,27 @@ static int wtp_allocate(struct hid_device *hdev, const struct hid_device_id *id)
 	return 0;
 };
 
+static int wtp_enable_raw_mode(struct hidpp_device *hidpp)
+{
+	struct wtp_data *wd = hidpp->private_data;
+
+	return hidpp_touchpad_set_raw_report_state(hidpp,
+						  wd->mt_feature_index,
+						  true, true);
+}
+
 static int wtp_connect(struct hid_device *hdev)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
-	struct wtp_data *wd = hidpp->private_data;
 	int ret;
 
-	if (!wd->x_size) {
-		ret = wtp_get_config(hidpp);
-		if (ret) {
-			hid_err(hdev, "Can not get wtp config: %d\n", ret);
-			return ret;
-		}
+	ret = wtp_get_config(hidpp);
+	if (ret) {
+		hid_err(hdev, "cannot get WTP config: %d\n", ret);
+		return ret;
 	}
 
-	return hidpp_touchpad_set_raw_report_state(hidpp, wd->mt_feature_index,
-			true, true);
+	return wtp_enable_raw_mode(hidpp);
 }
 
 /* ------------------------------------------------------------------------- */
@@ -4063,15 +4098,20 @@ static int hidpp_input_mapped(struct hid_device *hdev, struct hid_input *hi,
 }
 
 
-static void hidpp_populate_input(struct hidpp_device *hidpp,
-				 struct input_dev *input)
+static int hidpp_populate_input(struct hidpp_device *hidpp,
+				struct input_dev *input)
 {
+	int ret;
+
 	hidpp->input = input;
 
-	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)
-		wtp_populate_input(hidpp, input);
-	else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560)
+	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
+		ret = wtp_populate_input(hidpp, input);
+		if (ret)
+			return ret;
+	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560) {
 		m560_populate_input(hidpp, input);
+	}
 
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS)
 		hidpp10_wheel_populate_input(hidpp, input);
@@ -4081,6 +4121,8 @@ static void hidpp_populate_input(struct hidpp_device *hidpp,
 
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_REPROG_CONTROLS_BTNS)
 		hidpp20_reprog_controls_populate_input(hidpp, input);
+
+	return 0;
 }
 
 static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hidinput)
@@ -4109,9 +4151,7 @@ static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hid
 		}
 	}
 
-	hidpp_populate_input(hidpp, input);
-
-	return 0;
+	return hidpp_populate_input(hidpp, input);
 }
 
 static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
@@ -4273,6 +4313,9 @@ static int hidpp_raw_event(struct hid_device *hdev, struct hid_report *report,
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)
 		return wtp_raw_event(hdev, data, size);
+	else if ((hidpp->quirks & HIDPP_QUIRK_CLASS_KBD_WTP) &&
+		 data[0] == REPORT_ID_HIDPP_LONG)
+		return wtp_raw_event(hdev, data, size);
 	else if (hidpp->quirks & HIDPP_QUIRK_CLASS_M560)
 		return m560_raw_event(hdev, data, size);
 
@@ -4481,7 +4524,50 @@ static void hidpp_connect_event(struct work_struct *work)
 		return;
 	}
 
-	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
+	if (hidpp->quirks & HIDPP_QUIRK_CLASS_KBD_WTP) {
+		struct wtp_data *wd = hidpp->private_data;
+
+		if (!wd->input) {
+			ret = wtp_get_config(hidpp);
+			if (ret) {
+				hid_err(hdev, "cannot get WTP config: %d\n", ret);
+				return;
+			}
+
+			input = hidpp_allocate_input(hdev);
+			if (!input) {
+				hid_err(hdev, "cannot allocate touchpad input device\n");
+				return;
+			}
+
+			/* This quirk is specific to the K400 Plus (WPID 0x404d). */
+			input->name = "Logitech K400 Plus Touchpad";
+
+			ret = wtp_populate_input(hidpp, input);
+			if (ret) {
+				hid_err(hdev,
+					"cannot initialize touchpad input device: %d\n",
+					ret);
+				input_free_device(input);
+				return;
+			}
+
+			ret = input_register_device(input);
+			if (ret) {
+				hid_err(hdev,
+					"cannot register touchpad input device: %d\n",
+					ret);
+				input_free_device(input);
+				return;
+			}
+
+			WRITE_ONCE(wd->input, input);
+		}
+
+		ret = wtp_enable_raw_mode(hidpp);
+		if (ret)
+			return;
+	} else if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
 		ret = wtp_connect(hdev);
 		if (ret)
 			return;
@@ -4572,7 +4658,12 @@ static void hidpp_connect_event(struct work_struct *work)
 		return;
 	}
 
-	hidpp_populate_input(hidpp, input);
+	ret = hidpp_populate_input(hidpp, input);
+	if (ret) {
+		hidpp->input = NULL;
+		input_free_device(input);
+		return;
+	}
 
 	ret = input_register_device(input);
 	if (ret) {
@@ -4712,7 +4803,8 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	    hidpp_application_equals(hdev, HID_GD_KEYBOARD))
 		hidpp->quirks |= HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS;
 
-	if (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP) {
+	if (hidpp->quirks &
+	    (HIDPP_QUIRK_CLASS_WTP | HIDPP_QUIRK_CLASS_KBD_WTP)) {
 		ret = wtp_allocate(hdev, id);
 		if (ret)
 			return ret;
@@ -4843,6 +4935,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Keyboard logitech K400 */
 	  LDJ_DEVICE(0x4024),
 	  .driver_data = HIDPP_QUIRK_CLASS_K400 },
+	{ /* Wireless Touch Keyboard Logitech K400 Plus */
+	  LDJ_DEVICE(0x404d),
+	  .driver_data = HIDPP_QUIRK_CLASS_KBD_WTP },
 	{ /* Solar Keyboard Logitech K750 */
 	  LDJ_DEVICE(0x4002),
 	  .driver_data = HIDPP_QUIRK_CLASS_K750 },
-- 
2.56.1

