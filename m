Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164273;
	b=Ydmsviix+8aXSFK4ysUDUJCPItJtbrVu+8nigXNcnjHEom4ywtVGe+mM2MKCTMMe1A5c
	 NRBFCatiIQummP6ElUqCo7wz371KQ+SFzOvMx6AfdK0GQrSEATm/lGmqu36TCySc86l/7
	 XcAQOf4ge81MeCopDTshWEMGS2gfgss4ABPAkbfxJeFgLKsj5nClZl5Fv4ArIzbpUD+Rr
	 Dh9xt3Ugfa7PH3e/2R9YV8ETItTO9sFjWotoXtJ4JZxgB6NCBapZCBRR0SlFQqjq6t4/t
	 m1+On6zCX618n+P0+DfCL/St7Jkxq+FN+RoblF4JXqRhc0n+7CAMlri5cUvmwO9h22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k3Udl9m4ZJ5E93EjC7KYeeRpBxK5leMJ3xgfW9JwgOg=;
	b=k00ZbWHnIpURgIBbZHYIekI8uosqXn1PMMNirU12YaJf2e7NReOPXXAFHB8bnyQZLbJm
	 XJU+Ov9X1hnzjQRfBzU4X00RHQVS4t1coKju/9bFvMiM7uIOuhbYFn+1RCeG6gG0+d9R7
	 /RLASra9dh4l1MWHSFf31AvUoAZ44NqzfZEuxlYPJ1pP/qyTNQjcfOvY6slg6jKSnpnfx
	 JRcFsCPiL80vzPyVXoGUU2gplc7U1hkGMVyp5S9zFWPULg3Uq0zH+AqhTZT/4bazxpCH9
	 nqRBt2p6jF7cwzWHwruiO3oQiwfAU2iuJYhrgi5ycdu3yGXnq0DttCGTlNM9UAYODeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl64QOXJ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B10606A7D3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B10606A7D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gl64QOXJ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so970203c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164272; x=1795769072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3Udl9m4ZJ5E93EjC7KYeeRpBxK5leMJ3xgfW9JwgOg=;
        b=gl64QOXJ8E26/3CA4yHWXNO/ww1DNMwY+tVB5FL6PbQ6EJ1cBxf6zpknC9G15mnVBm
         eyGBfcIlxkEkH337TsLFYpUZTO3BXXF/ZxtQD7nYVqkKqRi+lhmgDZbq8BZg1NKZWW8U
         7uLxzytqsJB0chQcEb6WTka6nnVjX8OAczmOvUV4KYCQpJuv5K3/Rc+S0lgRT+1v4hlq
         RlqxmUP2WP3pve7Z3Xug1Uk2sFxPAu7RLEDbQ/+QaYjtPAdAur2ZICmsLiWCDu365YX0
         09/z82rU8YQmg2U252GbsCxTWY7AvPAKiZFsXkyQ4sdEuW60Zh0Cu3dmVLIYb1QHnS6L
         /Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164272; x=1795769072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3Udl9m4ZJ5E93EjC7KYeeRpBxK5leMJ3xgfW9JwgOg=;
        b=EsT4Rpso5rAD702s3hiKPb6mmtSQhJtqxCdyKs4X+fYwjB0LTzdK+v/0uhf5LLteOh
         T3ZPM5YxCjp7HnxXeDCETJzP2olqHO5bTP8C3WaKDPZZQ2rYPL98ebzwP3umvjUUn32S
         9AEGxzglxdTkDQtFh/Yb6G8yJsWCS5Shyki3U3/FpmiIewXXwL+Y9lSjhJiTYdub55+u
         ksGloi4iQxH7H6l9YgzRiWMiNyYkKKEFDx9GaslqkhbKGfXf6kwpphVl1bfZqi/VU9+U
         x+RzTVC8JfDrg6cK2TibF8bOND2E5p3+kF0iwDPekWQvBROD/CEBR3ZFjyxzYntCDOzL
         Cbsw==
X-Forwarded-Encrypted: i=1; AL+hErGDyYGeRsfAWkrQHwgbnRBNMENU9qLAQDK5xBqtW0gM1el7rtWMTiE1T64H+l5sZna0XM41jbA+ju9DCUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K8MYn1JRqx8QTZOtXijuuZz4Xn7L1O5RWLy3fZtnxjvc4X4uw
	at1qqYvxatGtWLDPbkRYJ4OLsAbCvxMyXP9TmFLtoL0DSZ3EQ8oEEyp5BnZYaA==
X-Gm-Gg: AYBFou1ZpKPWOx4eNlHJoinnC+HxQbqxJfAMrmFc6Y2TBLudvq7/PdudiUgN1kRKOyz
	omi7Xf02fnTv+mgP2Z76mJ+IvNJaZp8BBpqSTLjUlar61LbnXbGJCJCgQ3FfZJzwnSms63gcdnJ
	35tnLqKq3F+7xEh/gwUKWI0+F8Es+WWPdMtn0qbSsWmcZ/v9zCGiNBMl4dmNwD/H6UeStim6Jsq
	vi61mx3//C2BK4+jV/tdYPylzRtgvr3T9VC0Jd8ksZCcz14aYWpXIi7Vklocnios+8hDyDXxgfo
	X3IMMfceYEC2zw4ueq/g65HzYDgxCPrZYuHzxa4qyo+w97rYwr7lU6TZbMuHjSrUTy0FE8q1tcy
	OTWcjXmMckBdyJxM7JWBGaXXhjKmIYXgRo5UaQKeq+v6A1RBiQdP9Ons2woax+6eVzqsw/8XT6T
	f+/gHiPPXne7MmmX6B/tSqy3gujcpSOTM/W9TFcZoQLe+B9OpZRbvUo7kd2HQm/WD5dxTF5WaZP
	PnmlJ92QpbMB5x9VejTz4/ar0t5YH/bZHGEFdqnuRz2pB0A39aj6KYgE9428FzISEXZnHTcA4z1
	uRLTMAtUSWXnFl1rQtSbw8y1LFWzMs9GsrpuvKfZg9CO1EQ33PdMu2hKK1O1kNWdWrBSZ9gGhn9
	2jqsUF1/z3VqPULGOjw==
X-Received: by 2002:a05:7022:294:10b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b5568c876dmr2160403c88.20.1795164272459;
        Fri, 20 Nov 2026 00:44:32 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:31 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:05 -0800
Subject: [PATCH v3 14/18] HID: logitech-hidpp: use __free(kfree) for
 temporary allocations
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-14-ba39242d4336@gmail.com>
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

Managing short-lived heap allocations manually with explicit kfree()
calls adds boilerplate cleanup paths and forces callers to hold
temporary return variables across calls.

Convert temporary message and device-name allocations in command helpers
and device initialization paths to use __free(kfree) with no_free_ptr()
ownership transfer where the buffer is returned to callers.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 44 +++++++++++++---------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 49f21d7adebb..12b499fe08e7 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -401,18 +401,15 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	u8 feat_index, u8 funcindex_clientid, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
-	struct hidpp_report *message;
-	int ret;
-
-	if (param_count > sizeof(message->fap.params)) {
+	if (param_count > sizeof_field(struct hidpp_report, fap.params)) {
 		hid_dbg(hidpp->hid_dev,
 			"Invalid number of parameters passed to command (%d != %llu)\n",
 			param_count,
-			(unsigned long long) sizeof(message->fap.params));
+			(unsigned long long)sizeof_field(struct hidpp_report, fap.params));
 		return -EINVAL;
 	}
 
-	message = kzalloc_obj(struct hidpp_report);
+	struct hidpp_report *message __free(kfree) = kzalloc_obj(*message);
 	if (!message)
 		return -ENOMEM;
 
@@ -424,9 +421,7 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	message->fap.funcindex_clientid = funcindex_clientid | LINUX_KERNEL_SW_ID;
 	memcpy(&message->fap.params, params, param_count);
 
-	ret = hidpp_send_message_sync(hidpp, message, response);
-	kfree(message);
-	return ret;
+	return hidpp_send_message_sync(hidpp, message, response);
 }
 
 /*
@@ -437,8 +432,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
-	struct hidpp_report *message;
-	int ret, max_count;
+	int max_count;
 
 	/* Send as long report if short reports are not supported. */
 	if (report_id == REPORT_ID_HIDPP_SHORT &&
@@ -462,7 +456,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	if (param_count > max_count)
 		return -EINVAL;
 
-	message = kzalloc_obj(struct hidpp_report);
+	struct hidpp_report *message __free(kfree) = kzalloc_obj(*message);
 	if (!message)
 		return -ENOMEM;
 	message->report_id = report_id;
@@ -470,9 +464,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	message->rap.reg_address = reg_address;
 	memcpy(&message->rap.params, params, param_count);
 
-	ret = hidpp_send_message_sync(hidpp_dev, message, response);
-	kfree(message);
-	return ret;
+	return hidpp_send_message_sync(hidpp_dev, message, response);
 }
 
 static inline bool hidpp_match_answer(struct hidpp_report *question,
@@ -919,7 +911,6 @@ static int hidpp_unifying_get_serial(struct hidpp_device *hidpp,
 static int hidpp_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	const char *name;
 	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
@@ -930,14 +921,13 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ Unifying: Got serial: %s\n", hdev->uniq);
 
-	name = hidpp_unifying_get_name(hidpp);
+	char *name __free(kfree) = hidpp_unifying_get_name(hidpp);
 	if (!name)
 		return -EIO;
 
 	snprintf(hdev->name, sizeof(hdev->name), "%s", name);
 	dbg_hid("HID++ Unifying: Got name: %s\n", name);
 
-	kfree(name);
 	return 0;
 }
 
@@ -1131,7 +1121,6 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 {
 	u8 feature_index;
 	u8 __name_length;
-	char *name;
 	unsigned index = 0;
 	int ret;
 
@@ -1145,7 +1134,7 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 	if (ret)
 		return NULL;
 
-	name = kzalloc(__name_length + 1, GFP_KERNEL);
+	char *name __free(kfree) = kzalloc(__name_length + 1, GFP_KERNEL);
 	if (!name)
 		return NULL;
 
@@ -1153,17 +1142,15 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 		ret = hidpp_devicenametype_get_device_name(hidpp,
 			feature_index, index, name + index,
 			__name_length - index);
-		if (ret <= 0) {
-			kfree(name);
+		if (ret <= 0)
 			return NULL;
-		}
 		index += ret;
 	}
 
 	/* include the terminating '\0' */
 	hidpp_prefix_name(&name, __name_length + 1);
 
-	return name;
+	return no_free_ptr(name);
 }
 
 /* -------------------------------------------------------------------------- */
@@ -4314,17 +4301,15 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 static void hidpp_non_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	char *name;
 
 	/* Bluetooth devices already have their serialnr set */
 	if (hid_is_usb(hdev))
 		hidpp_serial_init(hidpp);
 
-	name = hidpp_get_device_name(hidpp);
+	char *name __free(kfree) = hidpp_get_device_name(hidpp);
 	if (name) {
 		dbg_hid("HID++: Got name: %s\n", name);
 		snprintf(hdev->name, sizeof(hdev->name), "%s", name);
-		kfree(name);
 	}
 }
 
@@ -4371,7 +4356,7 @@ static void hidpp_connect_event(struct work_struct *work)
 	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, work);
 	struct hid_device *hdev = hidpp->hid_dev;
 	struct input_dev *input;
-	char *name, *devm_name;
+	char *devm_name;
 	int ret;
 
 	/* Get device version to check if it is connected */
@@ -4430,11 +4415,10 @@ static void hidpp_connect_event(struct work_struct *work)
 	}
 
 	if (hidpp->name == hdev->name && hidpp->protocol_major >= 2) {
-		name = hidpp_get_device_name(hidpp);
+		char *name __free(kfree) = hidpp_get_device_name(hidpp);
 		if (name) {
 			devm_name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						   "%s", name);
-			kfree(name);
 			if (!devm_name)
 				return;
 

-- 
2.56.1.750.gf70dc682cf-goog

