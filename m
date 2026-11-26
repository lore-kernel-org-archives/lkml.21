Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671068;
	b=cTcoJ0CqAOI2J0pzMLedQWtDXdExmy2lm+jykhPpnISz/IaM2soHW5hZ5e8FavZ5cuSH
	 FPwt6SUxmWJz+KcdPeuxrEFZgoHF+OhK3eDUUWRA+ovoTyy0bWz2Wu2oi/uklbxWCdyFJ
	 Mixn0iCqRy+5afm2bGmpCgRnmutSMyu0b33oI9AvU+GZ4qt3uY8B5P0zS8JwmKt0pLv9i
	 UAYEk4XTcn9KL3xPbHxwrck/IJR8Uc7YbE8rdrT+ENB0MgJNennXwCSoA9jwZKhH8ThbF
	 dtZXynBwnpOPKZKpO40zmiYmQo+XBxQN7Y14qVG5s6zhPmgk7K4dYjTIfWI/My9aDbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DopjhGvgf0EPox8pL3puwsu/vrZw1+vCbZ4ma8Rqqjk=;
	b=xsWm9Yhk49hKCTEnVw/tavfOCOek7AWi/A7UXDjIRTHaiqlMxxUTge+n15yTsAItfDhK
	 B3J+iAfQUT2dqwh6zcZOO49R204IUb5HanPaI3qXPWQ4xUsJJnCYsFHW+k86wj2S37N5N
	 B9poz+/MxJFxDXCbnOlwItHEmo5w3PyECsD2uWY2+BXev0AAaCYRjbK4UMzZDmAJrHodB
	 WXjGVqZbx7eHXpQMwnUgenYCVeFnlEbsai+v7EG1VdQ6Sy4WSnFHg1wSvib0evmypN2j0
	 QA1HIH55TWxVE/5y/pr7xgN689FOgFQnXFOtHW+5Kbf0WYT3pLMylKNy9zrhPPsE2jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSxGmgBS;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00D9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSxGmgBS
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc147d86bebso4069674a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671067; x=1796275867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DopjhGvgf0EPox8pL3puwsu/vrZw1+vCbZ4ma8Rqqjk=;
        b=TSxGmgBS7tAK5KwBvjtC92RpCduXLlx7yAvlVl2tJ7dimTa4UkxhFx/4eSABqj00iF
         jhxH8rt+9SVuLkSs7K5e4q7Y37V2gpEWPdaNQuI2uOPh/fHLp8hI1mt+p9AI61kFRbRJ
         YgsG01W2ado9xv2OvTYBXSQM0MA/la6p6bkZcrjZSVVQ2FIb5nFlWEL6FQjCitR+1KES
         HatFjAKdjt61dur1gLVB382veL+vYNQ5xzkdJwwImFa/kcMHbOjOa5XsLDUeGj/xOfAm
         Ck41kDme38xU/qhBo+6gjqSSbPLPTEKdsTJ7yP0q8OjhbIDcg4ViLUPD+D2YNCUkikE0
         8FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671067; x=1796275867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DopjhGvgf0EPox8pL3puwsu/vrZw1+vCbZ4ma8Rqqjk=;
        b=rks+1INj81QDGmmSAVXuCtxt1htODMb+xVaWiaPOaPspbk9LLSGykpV/7L+nUhItbh
         wyJzGZUQhlXfD6Ydh4lhnOyzIdqrQRDc7gaj4+b7yv4rKIHPLf+9JaqBEy5czW4+SK5O
         8k29mxrwsPqJOCRxI25UM4C60n9HYgv2Aci4JE+ZL9RKqjuir5p3IvEQSCCGMwczpupL
         7rXUX232NhzB49CxzdeYLITVDpXoXBsQ+q6O5P+UE0dwga3BlneiaQq01mP++06T0ojM
         gNYXN9b2zJj5Ud9IJsNZTYSsZJBDbBWqxTbHR/KgxMDqCmyLQiIpu6tgNEIyCxxYknr7
         OuJg==
X-Forwarded-Encrypted: i=1; AL+hErHRNSidN+LHAyzUBVVf32VxCbJhhWhfxeg60QhlTGYvkdfTEoXHvVoWOFUDaMK3fJtFOCIgxmTlHxK2tDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OjFYzG/OakcN3VCoMiK5cLZVz8bKNPVQH/8I2Kgec1YEJyXy7
	AvzaG8se0VRvyHvV2lDwBi5wbDbUS1zISmXIxtu9XpTzmM2vLIbdLApG
X-Gm-Gg: AZFdTZcs35sVQL05NolkwmkKPyhkOwQBu44w/6NTRXpAPmvP2sfVZF3bp9SrI7Uyx1W
	cYNFl0yh803gZGUHioeGTOlwGFzNm2Hqm0kwZiWiulPk3q+bmdQGFWb+PGF3KgpTAfXAUwpkzDV
	hdk/I8N9RKJtp/b5jR3cM0yZBPggeQc2vx8IiCQjc9jrEyL86Id3s69sG0K2+DRumiehm5BKEEt
	i88NUjPa9+hdxNnZiuhKAIyWb0en5Xrl+pPTasmgAffq2Cl8kKZGhPlVZBwzMAKARTYaW/U+GDu
	xELrkkL+8uunI+J0cKoudqpn0aFKwsVLOtPwB9LVvI8dy75fbmwrwkll/Sdjr+pKmXIIHXDLr9T
	sMx/mL9nLV9kuUBlsYksoFvsBebWf96f8xnDy6XeZ+BiVONKBdUZuNIdXhmOvxoWoRjFpidoXQD
	BQ6N27QlhvmEh40kRdgvAo12XLSSpUSns84XmlUzpmU2hYDBMz/kpVHmDX6nJyFPMjgBsytsrTw
	wZ1RyKqQ2oA+j8GPRKoBjLUvgos8sySevSozAjb6zNf7mvdEjXTDRZ1c8Pl0/j1dB8lWqK0uiTk
	u9Ey8GzBcKwtWyh65AQSEogzq3iRSPJSoUDa1Ofus9jy6kefbjpGTjFc77eb60dlLRfSS+I3t6b
	Av2BSRF2p0qaIS/CF/KKsnLpTm6xdXYOFJqUNO1OCjIsqbB6mfrYKWiTFzL8XtCTHe1qqi02s5P
	JkxshB6HeWTJHIqtmqO2m3ILJKvg/zg/UaYnDlrzcLhtVk
X-Received: by 2002:a17:90b:3d4d:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b41c9082famr13103265a91.16.1795671067074;
        Wed, 25 Nov 2026 21:31:07 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm33700520a91.7.2026.11.25.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:31:06 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wang Shuaijie <wangshuaijie@awinic.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 2/4] iio: proximity: aw96103: use the default configuration without firmware
Date: Thu, 26 Nov 2026 11:00:26 +0530
Message-ID: <20261126053033.603086-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126053033.603086-1-kapoorarnav43@gmail.com>
References: <20261126053033.603086-1-kapoorarnav43@gmail.com>
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

aw96103_cfg_update() falls back to the built-in register defaults when
the aw96103_0.bin configuration file cannot be used, but not when it is
missing: then it only logs "No firmware." and returns. In that case the
chip is never configured, the channel scan and the interrupts are never
enabled (aw96103_channel_scan_start()), and no channel is marked as
used, so the device registers but never reports an event.

Load the defaults when the file is missing as well, as the comment in
aw96103_cfg_update() describes.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index 1fd0ceaf2a05..504e92ab9b07 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -589,12 +589,13 @@ static void aw96103_cfg_update(const struct firmware *fw, void *data)
 	struct aw96103 *aw96103 = data;
 	int ret, i;
 
-	if (!fw || !fw->data) {
-		dev_err(aw96103->dev, "No firmware.\n");
-		return;
+	if (fw && fw->data) {
+		ret = aw96103_cfg_all_loaded(fw, aw96103);
+	} else {
+		release_firmware(fw);
+		dev_warn(aw96103->dev, "No firmware, using the default configuration\n");
+		ret = -ENOENT;
 	}
-
-	ret = aw96103_cfg_all_loaded(fw, aw96103);
 	/*
 	 * If loading the register configuration file fails,
 	 * load the default register configuration in the driver to
-- 
2.53.0

