Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164078;
	b=au1Mx5IKm0p8cXJBnw0lwOkCdR0JkGNXFf3T1j/Cp+RS7gBhibqTYHAJx7WFVJf6kwB8
	 eImk8PGSrhFM/Ks4ymRrzAphjGBsXz2lBhpuYfsWL1g6Qh2QmS+aKwtmLosoJgC8guzck
	 w6hbmc5UbDLHL/Qf5SzT2gSZg4wwMjJjIOykCYMRA3ms3DFeHHOHXHD1MT/fRDzBvTXbm
	 u1jbdX7yYmGIdXiU37ZDetwN4Xg0XmLBOOHYNAQszJFc+zmkMxLwIg/0CqIYIR7jtvZH1
	 S8ZIBQvcNYEwkp7pRiAsutQVyDzwUM5YNPEDf7rMfDckwmrpZQYryJhRC8ewHep2pXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vX+acAcyFO4SrtgWaI02zFsEoaqyPYu5s5s/HN5VPPM=;
	b=WAGn+QUfEv/8kgVdOGITdJ8156v1sGP+5FxSlTuE1zZC05+PmyBueU/0D1ebEF/FUARY
	 RHUPPllkXN8VuUFOX/SQGYmCsXgui0RwRr8oA96eDvZA3DgDMaLEkyiH11ZNwzBHyd/NV
	 px0HZgPWx3/fe5UfZza0tMjzq+xcv2ALOPNwNDUyzgpOvTa9Krh6bwuy4Z3IKMPIwiPpz
	 D9vfBaJFlmOxQgqspv4b5UY+25/5Nqamf3zT4a7y2cM7T67FzMSaz7kqkT6mWTOR+fgw5
	 BLIMWT5JNFeN4F9HbJO1cOmz7hOhPdD/1AZcM9OJVO/SfbOmr3vICc15xPAVGiJRC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rd2v0wPd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4449A606A8A5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4449A606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rd2v0wPd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40319bdso804725eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164077; x=1795768877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vX+acAcyFO4SrtgWaI02zFsEoaqyPYu5s5s/HN5VPPM=;
        b=Rd2v0wPdfwvMv2u0VK501gIGjVDdVP5U/7/e49sNppiED2l1CFH6HT+LgnKGvn3z5N
         tHup6H8TiXYsM30gt/1fJY91iD+QbHOnsBwNAg3UzKGXAaqWIN6GHqXgr/Ft99BsMcD3
         moUcv3/hSUlPTEob4twN4a9qAoyq6orC81eKYFRcGj1D6mOzE/ogsV5MH5IZC0QB11of
         drQOOrU5IXXNhqyehht9bP1z0zJxLkEvhiHHH9lisIj6Sf+4HCN9MPndaMsNILJrgewd
         QsdgDG8fhb/s9Z1IXgFXSjM1P3iCga8KbkXC/hCzygSupEFHWg/+BAibC2rm1Edt5Opc
         QYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164077; x=1795768877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vX+acAcyFO4SrtgWaI02zFsEoaqyPYu5s5s/HN5VPPM=;
        b=Zex5/OJWp0KWwa3SJisXQd6TFjxULLbx6aplNutNmiKFpgUj1zGEVSvtO/nTeeIBWs
         BGvmNG8vJR0jj6rJKY8BfmNVrV0QipSdh/FWJRAyvVPZjPPHD/ox172e3qvxtBZFy3ap
         u3wH5lf9FT0fmJWZIGaenS9e+H8GfhmiKe8uN/814LoyG1+Pq4xqc7Md4kxmDGA4oMJ5
         Imgj/fUFuWUv36SjiGcJD07fiSu5hBG3721AR4PJZ6ktHOOVXJUSd3zDz0KHz24wqLxC
         yRnRXR+U326BCfp0yYev3DlHu3aUtWn4JAXCpRla96fEJ8r8CKzbSYBvQoyGf8v7BHSJ
         EDOg==
X-Forwarded-Encrypted: i=1; AL+hErHaoKPH7dettE32sIABovlozHe2N/F3JrNtURvQJkvOehdnYwWPOypYX6mbseEQtRRLTc1clJcry3lE4yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ub2PhbZdHV1AUEbyAkkUQ6ARdawxTSbEDIOWFgBAXYZefTKpj
	DNnpIATptOiiX+9pWSRDnOGpZcTGHf6/7lSjppvG/0YUIZ/BP0EN5ZdN
X-Gm-Gg: AZFdTZffZj5Mzi2d1d4AmmGk09RpGzqQEA56zMTNuxML12DXOzPx6/77vhRDnzy6L/s
	fec934/d1MzNywKrq+XgoWUBW+lejaz21/5jm18NCDIXVhePVRseaZEfjOZp+5lD4nxBsWQZ97g
	vfb9rAQ1Z0ty4e7ZCHMhDxGFGPWZTZHg/FCiGr221VO1Lxpe0rX9s2HZvu6xpcsIDuLl1BlFL1W
	S3fbRVqQcXqdtl80Q7k8TQTYyrZcLiGRo78XREF0AP/l+TMju0DID/s0W3Mpm772pbGMA4VnjTY
	bTtspWF6MEbUmRAFcwnMD3zWK1nyf7YBoQCuehQh+TOY13qNUFSc0xPr9cSwBxh6Quc6tBx7IKZ
	hxO/wLjrQlp+zyK1104ipjIyAtFt/VLm1tAJJNHIZ+3zrmUR8BsbGUCS2F+1jks89mQNZLo+NL4
	fkIHzlkzYK77GWyk7w2EaF202BG5acoYsF+qsM8OSbfovpEQPrJdYhJVy8rVDsIMp6ZQuUJM2Wf
	1w8JKrszlHEjLxKjO2EmHzZwmIZuEXgIO7QR4U1LqK1LAarnYJ6KWCKhDQaAKc2NMj5Oh5IArQa
	0CTcjo+k5pPGUocz2RgLTbSeVuPfTNF1cRNUhEv0gJIkQXw0iwz2NrLhu0dIB3ppkV8j1SlOvgu
	RsiV0imeYyJEdY/LRGg==
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr1889234eec.1.1795164077449;
        Fri, 20 Nov 2026 00:41:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:16 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:41:01 -0800
Subject: [PATCH v3 13/14] HID: logitech-hidpp: fix K750 solar battery
 feature lookup and reconnect
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
Message-Id: <20261120-hid-logitech-hidpp-v3-13-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

In hidpp_solar_request_battery_event(), the driver checked whether
hidpp->battery.feature_index == 0xff instead of checking
solar_feature_index, causing it to re-query the root feature table
unnecessarily or misidentify whether the solar feature was resolved.

Furthermore, in hidpp_connect_event(), the HIDPP20_BATTERY block lacked
a branch for HIDPP_QUIRK_CLASS_K750, causing wireless reconnects of a
K750 keyboard to fall through to hidpp20_query_battery_info_1000() which
fails because the K750 does not implement feature 0x1000.

Check solar_feature_index in hidpp_solar_request_battery_event() and
re-enable solar battery reporting via the solar request helper on K750
reconnects.

Fixes: 696ecef9b587 ("HID: logitech-hidpp: add support for battery status for the K750")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c960d26a41dd..dbf8f15f5a5b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2122,7 +2122,7 @@ static int hidpp_solar_request_battery_event(struct hidpp_device *hidpp)
 	u8 params[2] = { 1, 1 };
 	int ret;
 
-	if (hidpp->battery.feature_index == 0xff) {
+	if (hidpp->battery.solar_feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp,
 					     HIDPP_PAGE_SOLAR_KEYBOARD,
 					     &hidpp->battery.solar_feature_index);
@@ -4582,7 +4582,9 @@ static void hidpp_connect_event(struct work_struct *work)
 		else
 			hidpp10_query_battery_status(hidpp);
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
-		if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
+			hidpp_solar_request_battery_event(hidpp);
+		else if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
 			hidpp20_query_battery_voltage_info(hidpp);
 		else if (hidpp->capabilities & HIDPP_CAPABILITY_UNIFIED_BATTERY)
 			hidpp20_query_battery_info_1004(hidpp);

-- 
2.56.1.750.gf70dc682cf-goog

