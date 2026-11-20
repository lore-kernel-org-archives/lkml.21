Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164267;
	b=mnBeQSL+8SC2X6ZRZHyTJMVvwL8YYWS+aOlcLHGQJpSN2idaLVP6zRKtjdPHd/+vHYC/
	 sLSKIc/SfvHwvOLxAFAU3v8LfXkmQotbIUeYvoHmyZP8V3RRbc+fgXYAoIgX7n82iP/sw
	 ygBx3PtwmTGf3i2OnTUEGJebnqLTcHYYvNRmlQr5bZukbyM80CahOYultu2giAC0dIvdA
	 GCxJNaBhLgA+GcJCa0WO8M1swyyDPsoYW6GWRoK6et9UZr+YWhHyTHTVn7dcfGAc8BCCo
	 LvTVV9JIZ+BlTty6yYftHMEooD7SolahiD4u4KgtHRZB3cBVfItkymzHUNgr81hgKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+PTqDdgKMzvDBdtiCoq01adncoTw96dv8jl0o4bYl6I=;
	b=2Gi5c0xU9sptdkC/7TwmK1mOSmNkMSqg56CjJPR1/1e3B5FNo+EkdVoSwycTjej0OEYS
	 6I6H+0F3qWeEvK931YwexUoS6/CYmmUxyZ0iy51DTCFnS1u7/HtzkY6uODx5XeGeYGXy7
	 eKw03HrRrkuTBY2FD3yFTwHuB/zndaC+xkJtR1EtU+2agX5pRBZurFZnujpO2XNX9qV9Q
	 qqIBSK+9IPqw3yGlRv2UVDm3T1Fctv8qaefMVSmbGghHFhlKqu5mHJOQ0klGNGl5jkIDq
	 SCet0VlMfYhi16F/e60zZEmCdM+TlN2v/18SrBGNC5r7cxQBTiG78R/dex/PhxUY9Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dy2utYiC;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B560A5BE5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163B560A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dy2utYiC
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so1391302c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164266; x=1795769066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PTqDdgKMzvDBdtiCoq01adncoTw96dv8jl0o4bYl6I=;
        b=dy2utYiCN9ro2WFuyd2TkAUpbLpxGhD7LjJolZZhlzADbE7De2WFMWZ4TKyuToM0c+
         Q7ehnYZmRr065L6fBjv/T8Hfl7nTkiWjnQej7P4yyaPLMnH4YAiLGB605+eDRh2+F0kd
         GHVYqUVhuj4y2WUA5dqFYCNTTyJCI5F4tUZEIr3wpoH69SJ4YJzsV9TLYKgCtj9FQ8rF
         7R8sb9hqNhiZDluTbPPjpMSdildAYrmUxzg5QC04gPig0e6LUYIJO6uW/qcSh/CVup8l
         qJSUu8zEq2EbFTutEbCs1mw0VtFJ6u2yRmnSMgKela81Qk/oNMsXg/u9slIkS/VnjSKp
         3Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164266; x=1795769066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PTqDdgKMzvDBdtiCoq01adncoTw96dv8jl0o4bYl6I=;
        b=aPklgKMXXN5Pqxb3h5TmMJ2bTgvrxscZ2g+TIX16wTf4ypeoHR40oZbayYv4LIUBzU
         rbXNUJ/59JHi7Fa22MMZtN2xm6twh+Y/+FB3kYDxlo7m3aN55KO+P4TW++ftni+fi/yW
         2JDMyU47ViAIyBhekx/GOgJrkBla+B+EuHRs3OpE30usQb2fMlZSiLNYJfWpA3upZ6g+
         gv2nhQ/8mdGsFGVk+lrNLHeaXptCHPbjCar0VtE1OpXuUdcIG83Wk7S2fVjKXG+Z2X7k
         NH0Il5E+v+lruV2tnupeP7EMGWOz6Izbxl2m46bl1UeRQR8gByFbEo/xZUrbYgGNU/0K
         NQ5w==
X-Forwarded-Encrypted: i=1; AL+hErFP0FE/lZsC7J8FMaW5MZq8jdfd5rY56Xkq560FQm9j/YjTom2UsCpLt867V1XgilYdU1U0xU3LUd3zeRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Upi1g5RRS8KbwvpXofs21ZFtSp1RslqZ3fj4srejn3NiXLz6u
	EgK7Z4PWL7Qd88xrh1cT9Frki9U/vK6b8nAYgHqDPJNYzkjtp11eiFZt
X-Gm-Gg: AYBFou2+i+IZQxV/1PTaFwFBv9RXm/BDRga9oHFxEv9TkOElhfl2AcdZPnqmJTVOWA6
	tdUNRUyTyqKbRbUpHanpjvXyOR5pnWppdzUEZMWJEKvF5rinm9K5NsyFnrQghQcJ47SNY0dh+5c
	v249KEbSqOf5W20eFfU6OxHrOqDlxEX/E3jkXJN35+D5Qi7DQeDf77eEniMUV3kVggUQltmZwWE
	2LOS3vVEJjT5cWADF1sVrvTuO8VR5Fv+8kPJ+RdKeSFmH2u6u1Uy4xtq2POz39lqs20lmEeiDhA
	8HqL2xTCaMkpOpan6dyKes3o4twEB3JMKUulFRED8k/yyaUp//TkuJX+hNTsWywOY4+5xt2UKJp
	BwDz5BVkv6pMOKnA8s3UHGs1i0HLVmbOJqRg+W6qxQ4otU/gUmyZR1gt0gMxaTSR8wAzD6Y3rgC
	tIqufdoGlhKtKZpzkKqowkMZ1Ossqu93GcRpy/2KJ8vnYjZ2Puel3NquxgXiO+cSCGdqW5Ak+9v
	9E7XOrYnA4ln75mBf7AUlE02aI18mL3rI7ilchquye95hZ1CSCbYIjEEsIqTCcxf1C1FxzbiycI
	WrzdCuh8p1AceaCGclvKnw56346P8Peadf1GJsP2USXpffmy4nlVtAPznfzVe5kwlwMSLnSdcob
	f9LY9I7eyxoxQjEtEvg==
X-Received: by 2002:a05:7022:3f0d:b0:1b5:3aca:8116 with SMTP id a92af1059eb24-1b55690bcfemr2149038c88.33.1795164266229;
        Fri, 20 Nov 2026 00:44:26 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:01 -0800
Subject: [PATCH v3 10/18] HID: logitech-hidpp: clean up G920 force-feedback
 helpers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-hid-logitech-hidpp-next-v3-10-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Perform several minor cleanups across the G920 force-feedback support:

- In hidpp_ff_init(), obtain the firmware version directly in a single
  expression from the USB device descriptor, drop the redundant
  hid_is_usb() check on the already-matched G920 device, and remove
  unused local variables.
- In hidpp_ff_upload_effect(), remove the dead force calculation in the
  periodic effect upload case where magnitude is written directly.
- Zero-initialize stack parameter buffers in effect upload, playback,
  autocenter, and gain helpers so unused parameter bytes sent over USB
  are always clean zeroes.
- Drop the write-only gain field from struct g920_data, remove the
  unused HIDPP_FF_GET_GLOBAL_GAINS query at probe time, and remove the
  gain cache update from the work handler.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 43 +++++-----------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index cfd13ca93b2a..54e7ee824063 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2315,7 +2315,6 @@ static void hidpp_touchpad_raw_xy_event(struct hidpp_device *hidpp_dev,
 #define HIDPP_FF_DESTROY_EFFECT		0x41
 #define HIDPP_FF_GET_APERTURE		0x51
 #define HIDPP_FF_SET_APERTURE		0x61
-#define HIDPP_FF_GET_GLOBAL_GAINS	0x71
 #define HIDPP_FF_SET_GLOBAL_GAINS	0x81
 
 #define HIDPP_FF_EFFECT_STATE_GET	0x00
@@ -2354,7 +2353,6 @@ struct g920_data {
 	u8 feature_index;
 	u8 slot_autocenter;
 	u8 num_effects;
-	u16 gain;
 	u16 range;
 };
 
@@ -2417,8 +2415,6 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 					  &response);
 	if (ret)
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
-	else if (wd->command == HIDPP_FF_SET_GLOBAL_GAINS)
-		g920->gain = (wd->params[0] << 8) + wd->params[1];
 
 	atomic_dec(&data->workqueue_size);
 	kfree(wd);
@@ -2458,7 +2454,7 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
 	struct hidpp_report response;
-	u8 params[20];
+	u8 params[20] = {};
 	u8 size;
 	int force, error;
 
@@ -2515,7 +2511,6 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 				effect->u.periodic.waveform);
 			return -EINVAL;
 		}
-		force = (effect->u.periodic.magnitude * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
 		params[6] = effect->u.periodic.magnitude >> 8;
 		params[7] = effect->u.periodic.magnitude & 255;
 		params[8] = effect->u.periodic.offset >> 8;
@@ -2622,7 +2617,7 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 params[2];
+	u8 params[2] = {};
 
 	params[0] = data->slots[effect_id];
 	if (!dev->ready || !params[0])
@@ -2667,22 +2662,18 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
 	struct g920_data *g920 = data->hidpp->private_data;
-	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH];
+	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH] = {};
 
 	dbg_hid("Setting autocenter to %d.\n", magnitude);
 
 	/* start a standard spring effect */
 	params[0] = g920->slot_autocenter;
 	params[1] = HIDPP_FF_EFFECT_SPRING | HIDPP_FF_EFFECT_AUTOSTART;
-	/* zero delay and duration */
-	params[2] = params[3] = params[4] = params[5] = 0;
 	/* set coeff to 25% of saturation */
 	params[8] = params[14] = magnitude >> 11;
 	params[9] = params[15] = (magnitude >> 3) & 255;
 	params[6] = params[16] = magnitude >> 9;
 	params[7] = params[17] = (magnitude >> 1) & 255;
-	/* zero deadband and center */
-	params[10] = params[11] = params[12] = params[13] = 0;
 
 	hidpp_ff_queue_work(data, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
 }
@@ -2690,14 +2681,12 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 params[4];
+	u8 params[4] = {};
 
 	dbg_hid("Setting gain to %d.\n", gain);
 
 	params[0] = gain >> 8;
 	params[1] = gain & 255;
-	params[2] = 0; /* no boost */
-	params[3] = 0;
 
 	hidpp_ff_queue_work(data, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
 }
@@ -2813,17 +2802,10 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 {
 	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
-	struct usb_device_descriptor *udesc;
-	u16 bcdDevice;
 	struct ff_device *ff;
 	int error, j, num_slots = g920->num_effects;
 	u8 version;
 
-	if (!hid_is_usb(hid)) {
-		hid_err(hid, "device is not USB\n");
-		return -ENODEV;
-	}
-
 	struct hidpp_ff_private_data *data __free(kfree) =
 		kzalloc_flex(*data, slots, num_slots);
 	if (!data)
@@ -2840,9 +2822,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 		return -ENOMEM;
 
 	/* Get firmware release */
-	udesc = &(hid_to_usb_dev(hid)->descriptor);
-	bcdDevice = le16_to_cpu(udesc->bcdDevice);
-	version = bcdDevice & 255;
+	version = le16_to_cpu(hid_to_usb_dev(hid)->descriptor.bcdDevice) & 0xff;
 
 	/* Set supported force feedback capabilities */
 	for (j = 0; hidpp_ff_effects[j] >= 0; j++)
@@ -3448,19 +3428,6 @@ static int g920_get_config(struct hidpp_device *hidpp)
 	data.range = ret ?
 		900 : get_unaligned_be16(&response.fap.params[0]);
 
-	/* Read the current gain values */
-	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
-					  HIDPP_FF_GET_GLOBAL_GAINS,
-					  NULL, 0,
-					  &response);
-	if (ret)
-		hid_warn(hidpp->hid_dev,
-			 "Failed to read gain values from device!\n");
-	data.gain = ret ?
-		0xffff : get_unaligned_be16(&response.fap.params[0]);
-
-	/* ignore boost value at response.fap.params[2] */
-
 	ret = g920_ff_set_autocenter(hidpp, &data);
 	if (ret)
 		return ret;

-- 
2.56.1.750.gf70dc682cf-goog

