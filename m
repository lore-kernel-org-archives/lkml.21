Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285535;
	b=4a1w06WYWODwck8lFZd1XWc06o0r/4psYmaT29PFOq01Tj0tXfRw3ByKAoYD/TSWB64X
	 4DZxEZayQelWqZMIUAkUnakP70JsbgDP74VbcmN2t4b08vgxFDsdWl0R2rPqHA8L22pSx
	 +li1/l4ZOlQalfsJDJHB8gnwPG4iX3rkDSJ/Ll+5tHFhuUg7W+yJD9fmlmz4/rVDWTo0E
	 WZ+af5nXAx3/cto4FI/7BNmX7zITk2yxeDZzgl9YlbRqcHn3dhxK/QqDlBXCrPKJC3oOJ
	 L2bXLNQ2MHeFk4OBqlk7sR+t6OlrKALyy8hVmgKMAlFQtDicBnJNkSU/QBAKsFI9fjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XIR6Wx/jogMouYNfoTVVWotCZnwikfuag8XOShgmdeo=;
	b=1CWQRu/PlSstozflO7H3sk4unumbdsxxNA8n41TjedBvMu78OsrTbt9UO7fnLQQ4Fn5z
	 BXsaIBKCBHC1Fv8vhvzaoc4r1rNT/mddSEbCwD4L3H6zVxDF6g6UbAsT0Ptq/6i3amhbB
	 ljemgAJDYf+j9xGZqOePw8OV2JFEMvrUPBYjPjX9Oo42qsMTLMEmsqEGYsRFaCJNwkqYy
	 fSjXUiz4ofv0Sb28NsNv4i3L+RObJqh3EsFLW0sswS8JVwauIZan35ngfBC9Jz1URBc4W
	 N+TxiE60jd+HAFQAaiDTaBAmWRAFAuPD1G/46eivQAOZ3Bk8wuPTOIuTUne1MPPJnPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivJVa0li;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF913606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF913606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivJVa0li
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so16404351fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285533; x=1795890333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIR6Wx/jogMouYNfoTVVWotCZnwikfuag8XOShgmdeo=;
        b=ivJVa0liH8Wp0nV1SixjK4toqh6XCBigxUkZb9iYN+7ehEtuY/JMNjSVlQp0aVLKZr
         5B3FJtA3rBiV+l/dp/9i92pOQ0IOgapx+KT+QFeYsNtrTZKU9/6zvEw1fBg1RAy1pHP4
         3ytxvcj/yHihfsdB3pEO/wo3oTWCqmCVEKA5txENfPUI272ClFlQz5X5iWxLMssqa7hX
         55y0UC5H3XyDVix5peRGc979ylryOxNAKBtrXH/IDVq7dy4gWssaVeN7DpgKgEvLMa18
         iMDXWCF4BApFi2UDC0HRKvtt7l46OtnYGGT/Y2U9NU0/SBhnd7eXFPVQk8izq0BUGtPk
         Aq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285533; x=1795890333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIR6Wx/jogMouYNfoTVVWotCZnwikfuag8XOShgmdeo=;
        b=RkztTcMIrdsX3MvnBUyrG18aoiWQs9vs8m0AlmfEJ1/EGVkRbhs4E4ldLElGnSnnE7
         tSHBz6wiejhnCvhU7g8SeGtETLjihJLktVT/ml6IEg/s2G18BS4JsyICPZw4ax/zXO+z
         p+I/Gt6Pwy5/yycm1LIjlfPdWQtfBQac9+JLJh9nqXR51cI9/zL1fHN+tKHbtf+Rm4k3
         wekyR1WtDt+Pu86G1k409Ah2i/soCOswQ+uHEIBWupdS/eXyI9mVhUCSXMET4kdmp9Cp
         aT8yOaNkmdRqcfSf4lomn935mvhP+NsIy+besDcdeiYd8t87hgmQTHRVxwUwGcReCdlA
         JsFw==
X-Forwarded-Encrypted: i=1; AL+hErFQ2uUrWSjqCcJwDFNYUwJeJRu+zC1tuqb44JgB5soMMkoNm6mXAUUz22vFgiMZG+U3hu77RTe+x4XPCqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Nq6WDaP2VFc+DYD6cPtTkIrlRbQPsMSogljx77sTyfvG+Aqh
	/0wVujSb+XR240CedOu2OMWMeSVP1oH33cDgVCGkLiNbku6VtwVyVs7W
X-Gm-Gg: AZFdTZcDX5HQpIHHIwe80sAdAdjNXf7MuHLoe/9r7oAV37NdU6VjkgWAhoFJ4u9slAc
	yTyKeHgRXgbDKiigaGlkUHVHQtdhcQX2pv0I7MKM9uDAseCxKyrHA8CbsfJIE3Ot9+WLHFVtBkF
	fRTualGQLZuswYT8V+iLbmGnQxpPplReXbQGs1q0XLh7MFRwxm6yaQy7FagLJxWrlEOyApDH6tS
	b/ikEfvtSMPyw0PONsXWTNdvzs5pBpT1x0TbPAOdJuwuO0+XZONObcs+uJvCc4hF9ssYdcCBg8r
	E+u0xegRqrgLBx2pekFHqKbJxONd75tjUZ8d+bF+o5r1Mw726E7L8dx3x2XIcgUzZANO10QkbiG
	CQtEWa9DiSUJcVUYy5akzq2qMgYy0mTxh+ZyutHR/opS0fpkgNAaa/oZK1DQLyNqD/mlqGOMhik
	yJ9auOz/3CJxEjDZOM1CU1ztlaRtoh+hvYz5j6pQmm3wpcJIavzasEJmo8/CUmLaPLPNRqAPM9r
	cj5KbGLOd503TT0NofXHV2fOsg1jcaCtBSf0clTukbY4nobolVstTGJe08YwsDWP9X2jPOTIQft
	0Ff+i4fZhqrQPkHJGk1W5lOaIdmJZ4m3386IAnRgQg3hhOSUIPwT9TIWV77w/J00jTIIHnsUK/5
	5iRPw0m/032ClP7iWCYuWIlxhiuxETJz9kfITJg==
X-Received: by 2002:a05:651c:19a9:b0:3ae:6273:a010 with SMTP id 38308e7fff4ca-3ae7f9a6933mr23888191fa.9.1795285532768;
        Sat, 21 Nov 2026 10:25:32 -0800 (PST)
Received: from yantra.. (nekmmqulvmgxaw4nwuk-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:a86f:851c:d740:ea0c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80538a4esm17472771fa.29.2026.11.21.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:25:32 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: pressure: dps310: read the first temperature in probe
Date: Sat, 21 Nov 2026 20:25:27 +0200
Message-ID: <20261121182527.34489-1-zoone.rupert@gmail.com>
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

The first temperature read is in dps310_fifo_interval() instead of
probe. That function is called with data->lock held and takes it
again, so enabling the buffer without a trigger deadlocks.

Move the read to probe.

Fixes: 903941a9b06a ("iio: pressure: dps310: don't wait for new temperature in trigger handler")
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: return inside the guard scope (Andy)
v1: https://lore.kernel.org/linux-iio/20261119190827.36947-1-zoone.rupert@gmail.com/

Based on iio togreg, fine to squash into 903941a9b06a instead.

Tested on a DPS310 on a BeagleBone Black: enabling the buffer without
a trigger works.

Cc: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

 drivers/iio/pressure/dps310.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9b52cbc2372a..fc727e5fcd59 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1058,16 +1058,9 @@ static unsigned int dps310_fifo_interval(struct dps310_data *data,
 {
 	unsigned int drain_interval_ms, fill_ms, want_ms;
 	int scan_rate;
-	int rc;
 
 	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
 
-	/* Pressure compensation needs a temperature from the start */
-	scoped_guard(mutex, &data->lock)
-		rc = dps310_read_temp_raw_locked(data);
-	if (rc)
-		return rc;
-
 	/*
 	 * There is no hardware watermark, so take it as the number of scans
 	 * the user will wait for and drain at that rate. Scans come from
@@ -1478,6 +1471,13 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/* Pressure compensation needs a temperature from the start */
+	scoped_guard(mutex, &data->lock) {
+		rc = dps310_read_temp_raw_locked(data);
+		if (rc)
+			return rc;
+	}
+
 	/*
 	 * The device measures continuously in background mode, so a triggered
 	 * capture is just a read of the latest results. The setup ops run the

base-commit: 903941a9b06ae445c70646ab061b604c2dea17d3
-- 
2.43.0

