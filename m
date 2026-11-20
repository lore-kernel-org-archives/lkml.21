Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164065;
	b=FBx3cjD+2At4zjQXmA31Emj6ZfelO31HYsY9DYBDRUcqt/bcFvzX+I2lfZnnCI+YJo8D
	 +XDVNcDIUv0oRFM5mSjWHFh77JB39qZ/ZJ5+4QhyPP7UwqVClqrzYp8U2RiJ8fJ/GTpk9
	 TBqRJq7nbXi5NW5W27M1IV2391+qfm/Rf28WGiGSkR0kL3iMko0RepJl/EefJ8zt13W3d
	 UUrmWExvr8+A1IXRX3RytsJ7KFYyQ0ZU0glquiiarNuOOEnfIAQqBGGg856BCmR0FPMv9
	 FfCHZuUC7/L8qxpsC+DFVnQA4IB2oX8NMZEYvEtpezg2RJfQp4blujM8TE+URp1rxvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8Bt2PgIzmfYYqWvlsp18IRDzNq07DsE0CJgcW25urB8=;
	b=0jR7yCQIkKdhyMbHK6YI9rdiehmN6DUDuEA73WfHX5dzJlZZeuCnxsTTWwsFQIOYtj3T
	 VX8+efpvylZhWZLBKijDoWS6UiCStXDM2qHD/9zRNjImC5je9uUAyCfD4MuGRjs0+y0Vw
	 s3g405ZwNvD+A6k5T+m6RBtfUUPvxdf/D2dgWo4WBzjQQZqx/RbwNtAO3wxdF5497e+PK
	 HpxSkBwy3zx3EmV5GTDHyr3IOF09H66pWhrcVU07lHitrdtjuhcz0oMuiWNsuEP/LKMiZ
	 KJ/HtzUnzX+r3wzb4+QGXc8UI/NE5VJ/C2CSvHBuYv4xoH7ISQckpr358oaOYIDq2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVPBQkQu;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90D60A380B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C90D60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UVPBQkQu
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so774280eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164064; x=1795768864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bt2PgIzmfYYqWvlsp18IRDzNq07DsE0CJgcW25urB8=;
        b=UVPBQkQul5d5hGJi9LEsCi4HC1Y8wHc7Q7prFHIIYy/TdiZpZ68ChYJK5k6dR2x3XC
         RlhjqVYuIgxpltaVjXqGnNUbzSFPsDU0H/mF46DFV8hktQPBY91untQx6YI12kry8E8H
         yxUveY4GUAHbQxErgx3q+WCcgwe9U07Hdogzxwy6PHgqfeZo07z4CF3wP24xrB8nOEq0
         ENgNy5B4yyn8UoSRtFfuvy7y+5Z/Jlef4PzcHEYT/Ik2GrH/fZrfdB0cMW/DhS31cDnv
         bY3M5f1fSFKT/ayIeCfxmjpWdMNZhIfz2X3E2YhpqWBkQ2jV68ZQGd/WL8UljTyfDu4H
         eJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164064; x=1795768864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Bt2PgIzmfYYqWvlsp18IRDzNq07DsE0CJgcW25urB8=;
        b=o8Z/miBfzk5YQJwA6O6PA2oh6gAxnDSmfTsNxqWXuF8+0NvFHDVZPmpAmQ6EjWQIIE
         2koJrBbzf1hbrBoSp5gaeC4Qq8SrXYwqgY5ZU/Z1RVJ5SnoBTBVx4dTDHKg4EDB2dwFX
         dhED3JcMpej/YEaOetrYwplRpX0TGxRiYl0/2DRVV5o8C2JvHjHl78X0CREWGI3FeFNP
         TyQOTxND42jb9jxVLZE55a6IwVLyStJ0zrKWeHqCRAoyLtmfhxahD6IelwwtEppVykb3
         jp/CZCLgYEXhxxNZYhhgwzoVZZErOSg1ed8HRM3cE+H+joGrKiumu3ZG6vf1g7BAJJJa
         GEUg==
X-Forwarded-Encrypted: i=1; AL+hErG/tOSU5T5g75pFP1cmBkNR6KKsbRibtRXHNBTcmedgHt8kAT1L438vuul3dSu01yVauwStbueJ0OWFlXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3419CMrF4kSSYjWvEseLTK6ureUyj/SFPJQGSjvkarLMtZGg0
	79lmKEYjeLm5rpp4uGPKO6fJIyzI73LV3Yw5/eHfSZfc9zR4OdpQgWNN
X-Gm-Gg: AYBFou2fxQuRF3A04T0Z0dQtJK+GF8O0CBaogAMWRkvABYxRiQc37rnlbZtPJB3BFnP
	cZukdkjSmYgWe8Na4y4tJiWADTcxCwH8wLR2DnBijrN9k+eI6d4Q5LLx92/womNdk6emlwvXaup
	iUpXbioyqo/eI0vkoVLKTmpq8QL3ml/ENEUOSBJIwpku2gpyR637MsHgxhCRB0bKrfJ5sKs/NcP
	MpyT4G7cCo3HtG3ToTEznHGvVJ3kFVRbAN0CIlBXdi8DT0oHvKDpdQO2pcAy868AHXSVMkBg8MC
	f4VZkrk8srcuVmDQqzxpmIws1bKIASWGD9pAa5A4GjhVIoS+RrpmE/3fo8ZMCC2KEGB+ZGSkaxr
	cpxJroyTRWzi5u1p06Vx/AYhu5yVYC4bFiO477xh9hIbGApnd0oV1U2vz6kqI2pnku0XYnmXLCj
	mHddsE3WnSB0n3ao5sfgEVZc70N25UQuNwJVC+81qx9CmKNObimK5OvsUlGsIbO1cfThz62kqYj
	UcskeYuFcOrn0YhFaYLfADxoXglP1EkdF+jxZhLvS5bu2+WHUc14KsrymDvrN/LvtJkNxjN1zMu
	AiAyM/NsyaFdPowTsZ3o8jZhi/OMS4V9oK98kIlpUOKMiX+SaYRaAy9pECP2QlqVMZklyNouSEn
	QCKPZtIo6FuZv3zDnNfh6w5maU6ez9tm00OCEyDs=
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr2567968c88.10.1795164063592;
        Fri, 20 Nov 2026 00:41:03 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:52 -0800
Subject: [PATCH v3 04/14] HID: logitech-hidpp: disable works before
 stopping transport
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
Message-Id: <20261120-hid-logitech-hidpp-v3-4-cfe2caa1d0eb@gmail.com>
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

Device removal and the probe error unwind path cancel the connect-event
and hi-res-reset work items only after closing and stopping the HID
transport, leaving in-flight work handlers able to issue HID++ transfers
or register power-supply and input devices while transport teardown is
underway. Moving cancel_work_sync() ahead of transport shutdown is not
sufficient because incoming reports remain active until the transport
stops and can re-schedule the work items before hid_hw_stop() completes.

Disable both work items synchronously before closing or stopping the
HID transport on device removal and on the post-I/O probe failure path,
and drop the unreachable cancellations from early transport start and
open failure paths where incoming packets have not been enabled yet.

On device removal where HID core enters with device I/O stopped and
driver_input_lock held, temporarily re-enable device I/O to flush
pending work handlers and disconnect input devices before stopping the
transport. Clear HID_CLAIMED_INPUT and hidpp->input upfront so incoming
reports can still wake synchronous commands without dispatching events
to the disconnecting input device.

Fixes: 7bfd2927adca ("HID: hid-logitech-hidpp: Add basic support for Logitech G920")
Fixes: ed80cc4667ac ("HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d5f53b35ac6f..0e1a9fd98faf 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4805,13 +4805,13 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	return ret;
 
 hid_hw_init_fail:
+	disable_work_sync(&hidpp->work);
+	disable_work_sync(&hidpp->reset_hi_res_work);
 	hid_hw_close(hdev);
 hid_hw_open_fail:
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	cancel_work_sync(&hidpp->work);
-	cancel_work_sync(&hidpp->reset_hi_res_work);
 	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
@@ -4819,15 +4819,26 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static void hidpp_remove(struct hid_device *hdev)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	bool claimed_input;
 
 	if (!hidpp)
 		return hid_hw_stop(hdev);
 
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
 
+	claimed_input = hdev->claimed & HID_CLAIMED_INPUT;
+	hdev->claimed &= ~HID_CLAIMED_INPUT;
+	if (claimed_input)
+		hidpp->input = NULL;
+
+	hid_device_io_start(hdev);
+	disable_work_sync(&hidpp->work);
+	disable_work_sync(&hidpp->reset_hi_res_work);
+	if (claimed_input)
+		hidinput_disconnect(hdev);
+	hid_device_io_stop(hdev);
+
 	hid_hw_stop(hdev);
-	cancel_work_sync(&hidpp->work);
-	cancel_work_sync(&hidpp->reset_hi_res_work);
 	mutex_destroy(&hidpp->send_mutex);
 }
 

-- 
2.56.1.750.gf70dc682cf-goog

