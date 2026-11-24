Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510277;
	b=CnXLGeyUv33UdkqpNDgbzaSb1StkHrM08OF/iRGlZNy3S7+INEqXvgzRMhErXdMFCmFg
	 aVD5yzSELyP2F+i7lw/2L06rye+hYmnLXe0eIQOie0t9G2bRpsAbvh9hZYjijJM2UFC2Y
	 QiDjTq2geT3Aircje/nsseo4BxXUNTkhGTVX1qSicI4epBJCdpuqEC49Xa1Fk09tqHq2w
	 enepPEKo5iXTfX5saf3bRxQLO0bGskmt1yyqEb+UJWOQ58h6lh4BFhtcADz6wa7F6WmzP
	 zp6eGzI5z4aQFVaNiAidkVkdoCExev1CS/txfc1FV1xyNSO7YgpDoFaiFtGzJfQC5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
	b=iXFUy14Euum8hdDs0N6+Q+XiyxB/dgtf2i8Ivc6XStcvDQspjU0xjCHv/SN5JRiv90qr
	 FkUKC/t+qImgHflKDJBh1NH4iH8Qa5kuZQg7QuSfVj1fF3NLDJ0EQuG4ERfLwow7HK1Kd
	 PLoRJOfIgjmkSn80HiacS1zdR63QaFFLgU13yxnALmdWyv+UCFElMu3/5xJhQdn0AwKJT
	 93OyK9F4BEBpQM4QQGlUSxJFm5VPG04hKxXTb66/XjJ6og8HST+lMPQlJmG8Ts/h+zPIJ
	 NFzFp5Kvv2WGIIPIjWIQPvvVvDPSx1LhXmwFrQbfMZGkkrnUCM99x+6IoS0mzasnA3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+rAwjIG;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+rAwjIG
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2688977f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510275; x=1796115075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=w+rAwjIGq2RAS3Jn7nk07N6ZmRWPFI7EhxaWPnuYNPwb7hQsU3nMDpS0c/lepPS405
         kxNBzFj9AbUjUiaJHXpmG2PE1V3CZVYhrGr7zBaDRCdX/I27V9FK1aDs/voEG6UOLxza
         B/WSKvWm8MFkN6jPm1ssp3zs+yhLvIMeSJdnt6VjU0v0nNLAVJm8/LEXj5tmFF2UmgJj
         dexZxY4ooGZiByNd/PZWB1/vjdBjqll2Pi7h5fsC7hQ0/N8RhDsy6JjhufgcK818zbr6
         aMrhY0jOlcoanJ7qlgRoXqg+lXQLGlz119Cfr5WAWTGlJum+6wBrMOtANFoariGhIj3H
         CrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510275; x=1796115075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+tEAauVDFwo0LFqluBw/XabLtSrlP/ZHi6sb+R8lbE=;
        b=AkdVujVCTUn/FsBZksmIGpBjKi18lzup+DSdfHLs5WJGqsy9HIAEWXg9lhDGRzPL9z
         eS9yXXuNCbD4AJVAEk8V8i077H+F6FEB4Xqoe333Fw1Zeup4GBoYFa5VCOcDPzsotYYY
         HGylR3O7sz2M5s+3vaUAIZCJRUE02CfWUiisD8e99myenSKAGq568QaYHHGvwtBY5/UN
         XrO08G6Ysi/Q+5AUcQo6o1hw87kdcYs+re03ZRWyPsvE5HwGAAlbOtBetgUYf8IpTxiH
         EEhDnplyB57DwxfpuT/g7uIKHEAbuOVgsImbUjw3KPxaXOqXRsasmQpcepw+f3GdvJUO
         MSnA==
X-Forwarded-Encrypted: i=1; AL+hErHbOOmnXaLztEIjyETLw7Gy1ijd/D8yxd/k429/NiMK6HP3uLO98rFnnUUbd8sW+3DVo7rm2EtyeE5zBgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bI6TsjXhgHCwPs1T9kbx0tu12z/SLDbltBVdYzjEsdyI5RWd2
	9APSgykpcow/zhJ0k/Lwa5QTNXeD5CJn5z6y/jJhNm9nqYmFM6oCRLOs
X-Gm-Gg: AZFdTZdViCYnEnM/Qe+d1wN0aQqPrc7HrJkhUTQO5dj8Q3EAgT0ebo6YG7OSBD9OmqH
	s3xTDwBgCeoU8hqhgqGa5Uz2mVBjLtVOxdH1DMz9Jca+pT6fF9lCJ2v9Voh/KAgWTco7Cm64xF/
	f6qzwg7t2eWIOsdMFgZ1Dn9d9s5YScvUhGGXXNgROJmXfKJSGR705DTfpW10ZC6zyCPANMJsA7w
	MeW/8pdTdaNsvl9x5n008Da8oYj8LxPif2Aq+qjxlpnNKwMkC8/4oX3hQraUnG0aKy04z9tYuFc
	Q71eAXj5WXchMUKfxYI7H55pD7SMGSflUstU3TlUDjIJuxEWbPlEo01Cv1eQGmjH3eoJWKtNwVX
	F1zQ2e7IqdpM7Y4qeeLLp//hHCxaRx+uR/GFutUpCvy+U+TRVxSFEUTD6EqFox3H0GJNsG2tjdo
	//Gi7aX0AQbWCfOnxtyrljsQnAFpIASwYG9OwhWFCKxI9d62Th3MZVRMiwaDEGzzp1aP2D2hQlA
	iELon1VCff5FNM11qjpzeKzCqKbwHZEP9I6lvXIuShDEv++wrzlxBRMBhJYIt0kwzkyEnguWL8D
	ZIMRU3Fa3wea0Y1QJLQ9j8Hf
X-Received: by 2002:a05:6000:29d2:b0:4aa:1100:72a4 with SMTP id ffacd0b85a97d-4abb400af07mr18504917f8f.34.1795510274996;
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23692999f8f.17.2026.11.24.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:51:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] Input: goodix - sync the irq controller while starting firmware
Date: Tue, 24 Nov 2026 09:46:22 +0100
Message-ID: <20261124085058.128173-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
the touch screen fails to come online after loading firmware, printing
the error "Error reading 1 bytes from 0x8041: -6".

Comparing the upstream code with the Android stock sources, the existing
call to goodix_int_sync should be moved between the upload of the firmware
and the watchdog restart. With this change the touchscreen is correctly
detected and working.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Relevant bit of the stock source driver at [1].

Credits for noticing the issue and finding its cause go to matemiller992
on the postmarketOS forums, I cannot provide tags as he wants to stay
anonymous.

Patch tested on the Lenovo Tab E7 (TB-7104F).

Changes in v2:
- Instead of adding a second call to goodix_int_sync, move the existing
  one;
- Simplify the access to the necessary arguments/parameters.

v1: [2]

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
[2] https://lore.kernel.org/linux-mediatek/20261020122712.526797-1-l.scorcia@gmail.com/

 drivers/input/touchscreen/goodix_fwupload.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
index 888da7538c06..642a632d363c 100644
--- a/drivers/input/touchscreen/goodix_fwupload.c
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -153,8 +153,9 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
 	return 0;
 }
 
-static int goodix_start_firmware(struct i2c_client *client)
+static int goodix_start_firmware(struct goodix_ts_data *ts)
 {
+	struct i2c_client *client = ts->client;
 	int error;
 	u8 val;
 
@@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
 	if (error)
 		return error;
 
+	error = goodix_int_sync(ts);
+	if (error)
+		return error;
+
 	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
 	if (error)
 		return error;
@@ -249,11 +254,7 @@ static int goodix_firmware_upload(struct goodix_ts_data *ts)
 	if (error)
 		return error;
 
-	error = goodix_start_firmware(ts->client);
-	if (error)
-		return error;
-
-	error = goodix_int_sync(ts);
+	error = goodix_start_firmware(ts);
 	if (error)
 		return error;
 
-- 
2.43.0

