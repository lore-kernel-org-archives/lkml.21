Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164255;
	b=UIBKxjaH812zxo72L9XQugwPvehRL8Jb9gBWmmJQyiVS51FN1DbOFT1jSbSYFk/yhDmX
	 msSwc57mWRsxix9WnWMoIW8Mizcm6mu4HDuvjFhcy8+smm0xGHM4P+KNdR3ky6WJT4+Gx
	 72Ki2K4J+3MudK51+w/0IMuhL74h+G+DtW/4MAFMtjErEMHT6qFGt8anbSDRVyp0xPMZL
	 FeqK8lmJieUTTxtj7HF3qdqUF0ueEIgRHstCsIKSZquamZkPldi2MI+Rk99wBprjYEJyv
	 7Fz0ORXIqo9ilMQqskeBpJVS4AY/v1Hg1MpTJUHXLZn7ryKrupqx2OsxoeGs4a40gSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V8ZwfTPG8jGpcsaM/I32hjrBsqSSwwwpQT8qhPi47RI=;
	b=X9YN0frUw1wMr+q2jQSOjwFiRpBT8Hc5g+8ZjBR2MNChgv49Za4vZbixJ0Is0nruBXOO
	 PkaMtqP1nY1pWs4pJA0xbtzxn4+MRSqQ3NlpKQH0t5Zm4mcrmB2+s9BTBCfmlBAkzOLwq
	 uPnQcp0ZJLXUvtQWunqR80zY4RR0Gxyul48NtRutg1PfK7dU3eP2QwOB7EkKZkUg4glX2
	 LJZTf96bRFHPeBkow/5/GuNr7C4xb2VAtPXES1RirVgpMABdYSPufVeIg2RRVs9jOMiYH
	 E8Mdc64d9r2B6QFwnQvRR6+1m9Ea7LJR6Dmaka7Z1FnvwY2SmRK7SPpb8c44S8C0bJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s+IOzwVZ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7ED606B4B6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7ED606B4B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s+IOzwVZ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so1139281c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164255; x=1795769055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8ZwfTPG8jGpcsaM/I32hjrBsqSSwwwpQT8qhPi47RI=;
        b=s+IOzwVZ/6+3+Vr6SI/DdKZ2cuiUy2PRsqIMvTld6qzNTaUqucXfW2ZbQc0eUBRwhr
         0GjjPSPrfgKZBxq2OGAWWrPdWFudDlzaZBxst8cAA8Rd/P34Gh80OG7+MyO0zX2OOwKB
         5I+iAL1bEEYaZ52yhG2jpC7PWn4fYlXQrB7yier1Ff03pP21KKNW71jBu0V4iaarlZk7
         bJ4ZgubpeckJ2DVPdy8DdeQ5b9AcYI4WKeg3B6FdAkDL6x7eq5hIrWpzML2WypVn0UbF
         xQh+X3r74ludX1iKQZcSQavsPnWA/nfXsOokhdf5vBOIXaqlEyW2+Z2SWRtSij4G1vk/
         sipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164255; x=1795769055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8ZwfTPG8jGpcsaM/I32hjrBsqSSwwwpQT8qhPi47RI=;
        b=tiVh4qY0giIx0g2AZrUGE5CVVh0LLt8lh2K4AbcdGOJLb9f5k++0tPmpXhTrJU1R6i
         g4YAHtP0WRgpD+OeJ142iOdZnr2FY+pAZJi5wcG5aqJ150mnpjmYumxXcjTEV2OmL+QO
         XBRZidOBXR/UUKRQMbHDVlhWa1YQcGnW4DOXkSN3RbqIRnFqmcNHjo4cOhFTsfNZzWE5
         OipSaNRFMwG377sK3nL9PBgza+ADO5eti9e0hhls97FxnhBzMmNcVL3DhUaI0Kj3mC5/
         v9xbbCwm8wcSP2anOi813MB3A/tLCwq61UvxngayjxHTJtSf0hZZLg5oM6bz9oEdsNvz
         zeYA==
X-Forwarded-Encrypted: i=1; AL+hErHTYSgHL9F7ZEOdFVEgWECC3jAIXcj2QIVi746ZeY1d72QZzCKfi++fxQB36M3IlfiOkbklcPlmNuYgHsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NMBj+xhbU9kHb3irES7xcAH4HBVLzldx1Edeklxx7jGoP/dKs
	95DA0QhGT8CahinrJfCNk7qVM0l9cSKZC0+pbqybmLcCm//CnwNNymRZ
X-Gm-Gg: AYBFou1m4oodwMZCQHJFDC+j44qbUycjtW5dqzUE64uSpBqfgE1RJ3R64SHw/49uMMt
	HBK50edtVDDGCd0WldphNajALB9cNgvlh0fXnrFPN4a+U9FYy5TaLE1RuY//OjOFhNQCN528n12
	CupQCn0fWWaXUuWrl7j0dA794DI/O7OVWw0nUb4T1gKi649KXBFw5HLJRd6K29BvZW57s7Lg389
	GU/GplpbFOZipe1JeXTCaGTJh/RDE2b+xSuLahshYW8Tu5LpegbL1fctAGf5rZhL1gQFSRo98tH
	MMgbcU/Eit1r2pYcH0KeWGuavo2rcgfGQ2Hc3bRPbrKhTsFScdXTc3AoRDLsc77fGP5h7tDbFu/
	a253o8fy1g6cSqglRzRS5dooOnLeHP1D6Vf86G/tr09GvHeDa2eYx9NwxZtaDYFY2rnp6HlqKwg
	2r23GpovvyX/QPOx8O3RldCheTc5HiQwinerA9NEg3xZa6JPON4AUooF+7HoScKbScH/DbBDXxV
	fZ1KgV3ZtrGcfivcGQoW+XQ0P3mz9kYUd1Jn28zWEGEmkguyK8Q0p54L7fxuc+WZZXu8EtMBIj1
	dTLT5my6R38j8tjiml/oxzMWIfv8IzDyduujl9ZhFWyNCmiidmWZ/5ixYnxXOKaZETH0wH9HmNM
	M/SxJb5EgDqaUWSFQkA==
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id a92af1059eb24-1b5567b5788mr1842460c88.5.1795164254561;
        Fri, 20 Nov 2026 00:44:14 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:13 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:54 -0800
Subject: [PATCH v3 03/18] HID: logitech-hidpp: return negative error codes
 from hidpp_send_message_sync()
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-3-ba39242d4336@gmail.com>
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

Low-level synchronous send helpers previously returned 0 on success,
negative error numbers on transport/timeout errors, and positive values
on device protocol errors. Callers across the driver were burdened with
checking if (ret > 0) to convert protocol errors into -EPROTO or -EIO,
leading to scattered, inconsistent error translation.

Translate HID++ 1.0 and HID++ 2.0 error reports directly into standard
negative error codes (-EBUSY, -EIO, -EPROTO) in the core synchronous
send helper, simplify retry handling in hidpp_send_message_sync() to
check ret == -EBUSY, and remove redundant protocol error conversion
boilerplate across all callers.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 158 +++++++++------------------------------
 1 file changed, 37 insertions(+), 121 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f7e654d82805..44a7b4dfc9d9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -287,10 +287,9 @@ static int __hidpp_send_report(struct hid_device *hdev,
  *
  * Must be called with hidpp->send_mutex locked
  *
- * Same return protocol than hidpp_send_message_sync():
- * - success on 0
- * - negative error means transport error
- * - positive value means protocol error
+ * Same return protocol as hidpp_send_message_sync():
+ * - 0 on success
+ * - negative error code on failure
  */
 static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	struct hidpp_report *message,
@@ -331,6 +330,18 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	    response->rap.sub_id == HIDPP_ERROR) {
 		ret = response->rap.params[1];
 		dbg_hid("%s:got hidpp error %02X\n", __func__, ret);
+		switch (ret) {
+		case HIDPP_ERROR_BUSY:
+			ret = -EBUSY;
+			break;
+		case HIDPP_ERROR_RESOURCE_ERROR:
+		case HIDPP_ERROR_UNKNOWN_DEVICE:
+			ret = -EIO;
+			break;
+		default:
+			ret = -EPROTO;
+			break;
+		}
 		goto out;
 	}
 
@@ -339,6 +350,14 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	    response->fap.feature_index == HIDPP20_ERROR) {
 		ret = response->fap.params[1];
 		dbg_hid("%s:got hidpp 2.0 error %02X\n", __func__, ret);
+		switch (ret) {
+		case HIDPP20_ERROR_BUSY:
+			ret = -EBUSY;
+			break;
+		default:
+			ret = -EPROTO;
+			break;
+		}
 		goto out;
 	}
 
@@ -350,11 +369,8 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_message_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_message_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 	struct hidpp_report *message,
@@ -367,18 +383,10 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
-		if (ret <= 0)
+		if (ret != -EBUSY)
 			break;
 
-		if (response->report_id == REPORT_ID_HIDPP_SHORT &&
-		    ret != HIDPP_ERROR_BUSY)
-			break;
-		if ((response->report_id == REPORT_ID_HIDPP_LONG ||
-		     response->report_id == REPORT_ID_HIDPP_VERY_LONG) &&
-		    ret != HIDPP20_ERROR_BUSY)
-			break;
-
-		dbg_hid("%s:got busy hidpp error %02X, retrying\n", __func__, ret);
+		dbg_hid("%s:got busy hidpp error, retrying\n", __func__);
 	} while (--max_retries);
 
 	mutex_unlock(&hidpp->send_mutex);
@@ -387,11 +395,8 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_fap_command_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_fap_command_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	u8 feat_index, u8 funcindex_clientid, u8 *params, int param_count,
@@ -426,11 +431,8 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_rap_command_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_rap_command_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int param_count,
@@ -988,22 +990,14 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 			CMD_ROOT_GET_PROTOCOL_VERSION | LINUX_KERNEL_SW_ID,
 			ping_data, sizeof(ping_data), &response);
 
-	if (ret == HIDPP_ERROR_INVALID_SUBID) {
+	if (ret == -EPROTO &&
+	    response.rap.sub_id == HIDPP_ERROR &&
+	    response.rap.params[1] == HIDPP_ERROR_INVALID_SUBID) {
 		hidpp->protocol_major = 1;
 		hidpp->protocol_minor = 0;
 		goto print_version;
 	}
 
-	/* the device might not be connected */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR ||
-	    ret == HIDPP_ERROR_UNKNOWN_DEVICE)
-		return -EIO;
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1091,12 +1085,6 @@ static int hidpp_devicenametype_get_count(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_GET_DEVICE_NAME_TYPE_GET_COUNT, NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1115,12 +1103,6 @@ static int hidpp_devicenametype_get_device_name(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME, &char_index, 1,
 		&response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1273,14 +1255,6 @@ static int hidpp20_batterylevel_get_battery_capacity(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_LEVEL_STATUS,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1302,11 +1276,6 @@ static int hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_CAPABILITY,
 					  NULL, 0, &response);
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1461,12 +1430,6 @@ static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE,
 					  NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1609,14 +1572,6 @@ static int hidpp20_unifiedbattery_get_capabilities(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_UNIFIED_BATTERY_GET_CAPABILITIES,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1699,14 +1654,6 @@ static int hidpp20_unifiedbattery_get_status(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_UNIFIED_BATTERY_GET_STATUS,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1963,13 +1910,8 @@ static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT,
 					  NULL, 0, &response);
-
-	if (ret) {
-		if (ret > 0)
-			hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-				__func__, ret);
+	if (ret)
 		return false;
-	}
 
 	*status = hidpp20_map_adc_measurement_1f20(params, voltage);
 	return true;
@@ -2143,11 +2085,6 @@ static int hidpp_solar_request_battery_event(struct hidpp_device *hidpp)
 					  hidpp->battery.solar_feature_index,
 					  CMD_SOLAR_SET_LIGHT_MEASURE,
 					  params, 2, &response);
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -2235,12 +2172,6 @@ static int hidpp_touchpad_fw_items_set(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_TOUCHPAD_FW_ITEMS_SET, &items->state, 1, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -2305,12 +2236,6 @@ static int hidpp_touchpad_get_raw_info(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_TOUCHPAD_GET_RAW_INFO, NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -3498,13 +3423,8 @@ static int g920_get_config(struct hidpp_device *hidpp,
 					  HIDPP_FF_GET_INFO,
 					  NULL, 0,
 					  &response);
-	if (ret) {
-		if (ret < 0)
-			return ret;
-		hid_err(hidpp->hid_dev,
-			"%s: received protocol error 0x%02x\n", __func__, ret);
-		return -EPROTO;
-	}
+	if (ret)
+		return ret;
 
 	data->num_effects = response.fap.params[0];
 
@@ -3707,8 +3627,6 @@ static int hidpp20_reprog_controls_get_count(struct hidpp_device *hidpp)
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index, cmd, NULL, 0,
 					  &response);
-	if (ret > 0)
-		return -EPROTO;
 	if (ret)
 		return ret;
 
@@ -3726,8 +3644,6 @@ static int hidpp20_reprog_controls_get_cid_info(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index, cmd, &index,
 					  sizeof(index), &response);
-	if (ret > 0)
-		return -EPROTO;
 	if (ret)
 		return ret;
 

-- 
2.56.1.750.gf70dc682cf-goog

