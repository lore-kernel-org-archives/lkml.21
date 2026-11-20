Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164270;
	b=28D2EiociYd4qyfccM3JM2NBjZjUoVmJil47fT9XjSO1n0NkIvJFLOh7zlLPZaVFlWM1
	 Elawb7/+cpDaBMWqpMCHcvh/60sjhr5gPSSk7kXXGHE9plMJ4PvRonLTFR2Z0f4n0GFO/
	 H+hnd3TM+1h1xxa7MrW7z1wxLbqIJcsiYUfUeKHdN4K4J1dtCJesWvXs1QL8QFJDcT7kL
	 va60N8G2p/SF1PeVLVyL50mEGh30+KVL0YRov1zc6x9vbfvbRCARe5RgPGkSTTX7KeNxe
	 qXKMF2vleJKRNr/NUgs3VjzTeBrRkiszwwxIRtZtXDBT5auqcoLQKO8X51JvAzpu5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AXkV0k6Xfrn5k73f3TaWD8N4csl7C8uRYph441/Su9o=;
	b=wEGCtIA4ZUylq4ZFvhiT3KkwgFMeiSbOPK0oZJTQ9DyV/FN7n24vuNJzHmzVwoQnm645
	 KPmSLbgasELPT8MNMmywu/YSsklPaQsASOZQpq+vPNF1Ae0/V3iHX1XEU6h/NYdi4VrLa
	 jmRdUnJ4Sn2Cq8Duht46W0usW5RTOxMbu13pvtId6NO7vo/O+GUQMwdDU/TOYQHVp0rHD
	 hR7n8o/ACfthxIez3TI7j6tEom4naLoF+9+CBsd12Gz9X6CRiqWSDX3cLxLgbTwGrsxSP
	 XHqcNDXXiJ55OQ3kHOpCC2U0qD6lFIIFfKdMobKigQtOvpwhzYD8iVdhKFcCItLpoIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="irH/rjJ9";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1406160A6F6B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1406160A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irH/rjJ9
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so933415c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164269; x=1795769069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXkV0k6Xfrn5k73f3TaWD8N4csl7C8uRYph441/Su9o=;
        b=irH/rjJ9NRx/EyIbX5urK3G5MDBjsgd5zUmo92edP4uBGDcnXNj8oKyeURkWMhbO+7
         yQ69dlGRvJZDmwM4sh77x2B3burrr+2EhDP8KL3XuRop425V1g4sQe+aqAjQ2LQK9N8t
         nwvCL4JDXxSAkh9xBGiGcRIHqVt/c3uxVS8OPr+bO6AN7Lfq/qU9lLCyP3p+2MKqkq1u
         mbNBhWxl0ihOpJ8NiJBBUa0GPPkl6a4lXT4WFPlOV/hmzqlwBMAS6TzvUA21wUzHZAxA
         frLbnyMCyRsX/aLxRTMvuZlufSDG4iRHEYSn7PNltQa0AXeNOm4oN1DrgslURi9cseBb
         0Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164269; x=1795769069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXkV0k6Xfrn5k73f3TaWD8N4csl7C8uRYph441/Su9o=;
        b=KDNTInZZJrivOzkl4gUBv7lRWoBvdnf7Tk9q6RG3YHtdlFOwPx4D+xmQqdd4BSDEMn
         CLEUlQ/msnrCJvfh8efzMtYn8mQ4WlIKznK0V6TSjJ51xGSj0nKKAfBKnUH/mOIXadlC
         s8djHcqLYjon0WhetL2iDwhFfxj7cUAfHwWwSX4eSUx02u9W2oQifccwZrd4QwN4J/7A
         3uPsDxSdRiEdEdAPoRF9Wfbq1Gbmx3KmcOFF87Mld9BAguj+ZYnsH+L8Q/4cxTVzzvuj
         ICiK9xalV5vGjJ0mYWPY0aGWxFU7QS1ZRbxfTv1uA+dcF7+FL43vCGInAjYzfyBXT4gA
         FZGQ==
X-Forwarded-Encrypted: i=1; AL+hErHxSbNlAjN7b8RL96Z/qZkHxP7kGxem371RuSLr0OqcdJ71KfzBI2vCcXE4ooDnS2avaENP+R9nil+wFSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BLgRdghBHpJ/SZPXdxb9C0TaXxjY/suiiHD8WHmOGf4bkNpi2
	5T2yG1ekM2Y5t32qTmzsHLT3CBb0Q4yo5FSgZjphkG52/3H3KOdi7+5V
X-Gm-Gg: AYBFou0D0QkJ0a77xDp1tbEhtzWY4EdkmimR+4bzmHDU/oLtBNWs/PGC71WDE4HY21c
	QDbaIW0bYrcKyY5zuo6tzhrslfiklVwmNeZptnJEeXkQ/9nnwnSYWxWvth1ltb2k0Y5M0guXERo
	xS0mJlrLV7NwwqVRM5ATS+hRtU7uhGKW2g1prtb+KHT2A4/F3PxirI7qzWADzyp4KnQESxJouY5
	FjPrpI9MVpPOJefuVBuOxSuiIwEDr/DUX2AKswYZR3UawvSSv6PEVODwENXAe1yJO2h7gi/5nEk
	OztHWTgd8dlbBnXwNRNdvey62astaA64tzWGFXsp1G+Ds3oWFvKL+3E39A60F/Rt83tgEyBRnmQ
	C12aAMkymiPM+PSXNQC69zFISFSucD4Dkz39WCNn9WbUhrtWJcji8JDYUOdMK20XvMRVpJFKiJl
	PSIuXqVg2+RRUfBBzr1TTxvz7bd3PcF6p2+pYX7s6eJCI77wKoNrlDTJM1N37q+ZGWxnTiI6YUZ
	I8Y5aHrEOPDAvjARijE/lt29WHqD+IjD+tIRfdS8Yw5f7vqembj3kgvhQ7dYvNqMH07tJD46Q7c
	pE4i6YOG+YeAr66OxrDsqAyil1sBW4yVBCIk7PWMzHft0qeSFntLWKFM7ZQggKbbnGSGBAz8+5M
	jeISfGYompSTspKlvVQ==
X-Received: by 2002:a05:701a:815a:20b0:1b2:4e29:92f4 with SMTP id a92af1059eb24-1b5568eaf10mr1948385c88.39.1795164269206;
        Fri, 20 Nov 2026 00:44:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:03 -0800
Subject: [PATCH v3 12/18] HID: logitech-hidpp: store device serial as a
 byte array
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-12-ba39242d4336@gmail.com>
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

Device serial numbers are read from 4-byte protocol payloads only to be
formatted as raw byte sequences with %4phD. Storing them as u32 requires
unaligned pointer casts and dereferences that depend on endian-neutral
memory layout, and the FAP-based serial helper reads from the RAP union
member instead of the matching FAP payload.

Represent device serial numbers as 4-byte arrays, copy the payload bytes
with a fixed serial length constant, and read the FAP device information
response from the FAP payload directly.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 16fb52634437..053cbfe8cb6f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -48,6 +48,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_REPORT_SHORT_LENGTH		7
 #define HIDPP_REPORT_LONG_LENGTH		20
 #define HIDPP_REPORT_VERY_LONG_MAX_LENGTH	64
+#define HIDPP_SERIAL_LENGTH			4
 
 #define HIDPP_REPORT_SHORT_SUPPORTED		BIT(0)
 #define HIDPP_REPORT_LONG_SUPPORTED		BIT(1)
@@ -898,7 +899,8 @@ static char *hidpp_unifying_get_name(struct hidpp_device *hidpp_dev)
 	return name;
 }
 
-static int hidpp_unifying_get_serial(struct hidpp_device *hidpp, u32 *serial)
+static int hidpp_unifying_get_serial(struct hidpp_device *hidpp,
+				     u8 serial[HIDPP_SERIAL_LENGTH])
 {
 	struct hidpp_report response;
 	int ret;
@@ -912,11 +914,7 @@ static int hidpp_unifying_get_serial(struct hidpp_device *hidpp, u32 *serial)
 	if (ret)
 		return ret;
 
-	/*
-	 * We don't care about LE or BE, we will output it as a string
-	 * with %4phD, so we need to keep the order.
-	 */
-	*serial = *((u32 *)&response.rap.params[1]);
+	memcpy(serial, &response.rap.params[1], HIDPP_SERIAL_LENGTH);
 	return 0;
 }
 
@@ -924,14 +922,14 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
 	const char *name;
-	u32 serial;
+	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
-	ret = hidpp_unifying_get_serial(hidpp, &serial);
+	ret = hidpp_unifying_get_serial(hidpp, serial);
 	if (ret)
 		return ret;
 
-	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", &serial);
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ Unifying: Got serial: %s\n", hdev->uniq);
 
 	name = hidpp_unifying_get_name(hidpp);
@@ -1031,7 +1029,8 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 
 #define CMD_GET_DEVICE_INFO				0x00
 
-static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
+static int hidpp_get_serial(struct hidpp_device *hidpp,
+			    u8 serial[HIDPP_SERIAL_LENGTH])
 {
 	struct hidpp_report response;
 	u8 feature_index;
@@ -1048,22 +1047,21 @@ static int hidpp_get_serial(struct hidpp_device *hidpp, u32 *serial)
 	if (ret)
 		return ret;
 
-	/* See hidpp_unifying_get_serial() */
-	*serial = *((u32 *)&response.rap.params[1]);
+	memcpy(serial, &response.fap.params[1], HIDPP_SERIAL_LENGTH);
 	return 0;
 }
 
 static int hidpp_serial_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	u32 serial;
+	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
-	ret = hidpp_get_serial(hidpp, &serial);
+	ret = hidpp_get_serial(hidpp, serial);
 	if (ret)
 		return ret;
 
-	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", &serial);
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ DeviceInformation: Got serial: %s\n", hdev->uniq);
 
 	return 0;

-- 
2.56.1.750.gf70dc682cf-goog

