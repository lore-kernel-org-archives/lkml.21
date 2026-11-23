Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474871;
	b=0Tvosz24z5PbsCJxiOks5UZR+mcrLOhmRNUwTDwrDFRGLuE6fHMowrVWNL+M4XxGe5pL
	 eXDMHxaaZW5IH7jTxc9kSWoPKbHZOlKoliSet769XUHKAE1eNl/tOSWsOktYHkrDyTaSV
	 j/swdbRkKpggjKeoFFWtLuAPE0t94IHp0BflPsnE7FYlf1buh6zPM2TUMgrfu6BIcCPcN
	 J5kypcx1j2mFlJU9gcJeHrwa2razQUBP9g0gi93vYIzEuWf/rQHROxGS9J+XQWTRWgnc3
	 CLI4Rpqwiw760VOvuVS8BLhJT2Hf1j1SI/JEZRCG7oYCA1rkGbNvWeRufYsosIc7vaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
	b=JbgxaMJkR+LZW7z3iyJGh3PZ4oqBOZ5Mi9x0BWwnWzrXqhvYwwj7pUYLfJFQ+ZazWkiu
	 PAZMs5mwDZ0I177S9D+YLdXSzdquQfDsLPtrv/isX9RB6G6y8Rbow+4WoYU/CYOx+Pk1I
	 CLIQzN9aVUyPWt2mC59o1hoH6tO42+hypzm5+MF+fG7aq7sSrQt0/OvrVhOzmPjzyS+4j
	 0Yj2Zrr3FE34kRMSp8MP0mPVf//QF15D8894luJml6k3689SzjCUMS+0Chlf8MYtHlRbS
	 yKnpCZrtD1/vw7iO/BVK0WWiz/ssiXP3U3d0w+ODdoIJZ4lQwUhuI5+tzOOJ2Pd9tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuu9fJi3;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29901606A688
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29901606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuu9fJi3
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4902355c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474870; x=1796079670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
        b=zuu9fJi3ojsWgSJ7IQ5NfUB1RcpcooJkDn6vtm610PNIoInxtvl9w3dpUG5yPD5L4R
         60AENY5G39R1Xk4qRqXGXSyAivxSKB3xacH88suw7yZRwv+wp/I/L02k43RCwrSJF6Rm
         vMrMLTEUima0NyFOiQtEtREoUbFAwZWMi9mjLtXWPaATHpMYa9rqa4b/BIP77Kg10Jdf
         IEqX8RIkV76fMkHWwIjuNWf25ZcvOVlGCfhmDwrpzNPaEp5c0Md85z4YB56lQhgQJH0V
         fnHA5+h9qpKQpogo6uo+v7wm1Q7/W49T4nHVH0AyhlxwAAoVww74qv0VwJS74y83o9MA
         /fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474870; x=1796079670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
        b=PN7qhCQsEDjdkkzWgn0zK0dbFau95UbEunwo28XLucJ6wsEpb23iBObUFqcbVe++y7
         RWZ7xv2dAYIq+j3NQtD80Be+NjxH6RdsRyrzu5sLdCSvfYqL1XMoMnGlMFyDVCVsV75l
         yvMJOtwcT6ncukc24hsvHcEteSsTx3chGYNI75rPIrG2nEFx3nPYRbWIRNGfz4kpFzco
         kZw5SoK1EpFC81oMBWvXguzK9IWVPjF9+NDCRT4m6yjnCLAtp1XZkBb0XP4mhdltWRJm
         hpptp0TuyJh/h5dEBRZXCyFQt2myPb6PPW1StMXHpLXZZjXUgMDoCnTqKTf2lNHYTlPQ
         I+3A==
X-Forwarded-Encrypted: i=1; AL+hErF6c5QhO/mVcP9G0F7rqRsWRW+mR/Zu1vImUAuHnH49qzs9/xFgO6AYFlLuzeImyEzn8D0p6h7Y7k4vBYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z8DfrBu7w9MC5OjArYuS0KEZiVWiBWF/HB/+F38+Se7ar0Ylr
	6cVZ/xV9rTFtCZjIMerXGF0FLFtC1XgT0YZdaHYygCXM3ovMQSj1yLl9
X-Gm-Gg: AZFdTZfhH63RrlRJNvUp2SFxPBhotnTIYgdKi+N+ZnB4O7kcCDUiJ3zsnCbtH1xmCLT
	9qkWvnVpGBXrSDAyLprdZC0JcIqYRpU92N17PIC1mIzRvoYkXDUpl+FSs5fUX4UkRmy8XtuhO3E
	tvgNqGvl8rL+AZ1cVQWssGEAZ6ZPqiIPgYNVplpFvI2TycSoIU2BtKiQBpzHopAcr3LIIncYVU6
	/YkmNV8FaRmysWY5YYtTGAJTvRvRiJ4uZX2CGluY+lHvJMWu52v+IdpLcNvRF2W3Jml7Gpe9sMT
	A4cjs90JJIEtUkkxLunf4GkLYtZTiwtH6mqeppRL2zQe1hhmGMJDJPKA9nWLp5W+xwYgUGLYPpa
	FGeZlVNztnL+4340+GB+C57myKhp20T6XN+DY6ucoEMFHxm5cbtsn4aF2WUu12OkyT7wvLxPCkH
	HgBe/+ArE5HUIwhOWnvOt/TIBP2WaMkgkRRICQdVe2sdogJXosgDbcV+6x5YAJ8R7zCzXmaE1q1
	3Ns2X8yzktGYG0NA4m23nIa5u+SCTcUUJlbJYV/IqXe1/NFFz3wtC93cxoE/uG8kCtdmzyUuF+R
	iGN2hoaxmvW3Z+Il5ENkxzR+cJHWzbIKcjh1Qw/2IJLWo2EL9c1v1PuEQZSvL6Vc9icevE7T8wZ
	HbK4bTX212rJLkhzBPw==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr19311351eec.38.1795474869816;
        Mon, 23 Nov 2026 15:01:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:55 -0800
Subject: [PATCH v2 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
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
Message-Id: <20261123-arizona-asoc-v2-2-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

Always parse device properties in the Arizona jack detection driver and
codec drivers even when platform data is provided, allowing DT, ACPI,
or software node properties to augment platform data configurations.

In the jack detection driver, only validate and apply the
wlf,hpdet-channel property when it is present, leaving any existing
platform data value untouched when the property is absent or invalid,
and preserve existing boolean flags using bitwise OR assignments.

Default an unset headphone detection channel (0, corresponding to
ARIZONA_ACCDET_MODE_MIC and invalid for headphone impedance polling) to
ARIZONA_ACCDET_MODE_HPL during jack probe.
Commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
accessory detect mode when headphone detection") originally placed this
default only in the OF property parser, inadvertently leaving
platform-data boards that omit the channel setting at 0.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 50 +++++++++++++++++++++++------------------
 sound/soc/codecs/cs47l24.c      |  3 +--
 sound/soc/codecs/wm5102.c       |  3 +--
 sound/soc/codecs/wm5110.c       |  3 +--
 sound/soc/codecs/wm8997.c       |  3 +--
 sound/soc/codecs/wm8998.c       |  3 +--
 6 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index db60ea1aaec8..f36d314a6a54 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1183,18 +1183,20 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
-	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int val;
 	int ret;
 
-	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
-	switch (val) {
-	case ARIZONA_ACCDET_MODE_HPL:
-	case ARIZONA_ACCDET_MODE_HPR:
-		pdata->hpdet_channel = val;
-		break;
-	default:
-		dev_err(arizona->dev, "Wrong wlf,hpdet-channel DT value %d\n", val);
-		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
+	if (!device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val)) {
+		switch (val) {
+		case ARIZONA_ACCDET_MODE_HPL:
+		case ARIZONA_ACCDET_MODE_HPR:
+			pdata->hpdet_channel = val;
+			break;
+		default:
+			dev_err(arizona->dev,
+				"Wrong wlf,hpdet-channel DT value %d\n", val);
+			break;
+		}
 	}
 
 	device_property_read_u32(arizona->dev, "wlf,micd-detect-debounce",
@@ -1212,21 +1214,23 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
 				 &pdata->micd_timeout);
 
-	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
-						"wlf,micd-force-micbias");
+	pdata->micd_force_micbias |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-force-micbias");
 
-	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
-						"wlf,micd-software-compare");
+	pdata->micd_software_compare |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-software-compare");
 
-	pdata->jd_invert = device_property_read_bool(arizona->dev,
-						     "wlf,jd-invert");
+	pdata->jd_invert |= device_property_read_bool(arizona->dev,
+						      "wlf,jd-invert");
 
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
-	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
-						    "wlf,use-jd2");
-	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
-						"wlf,use-jd2-nopull");
+	pdata->jd_gpio5 |= device_property_read_bool(arizona->dev,
+						     "wlf,use-jd2");
+	pdata->jd_gpio5_nopull |=
+		device_property_read_bool(arizona->dev, "wlf,use-jd2-nopull");
 
 	ret = arizona_extcon_get_micd_configs(dev, arizona);
 	if (ret < 0)
@@ -1241,8 +1245,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, mode;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(dev, arizona);
+	arizona_extcon_device_get_pdata(dev, arizona);
 
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd))
@@ -1286,6 +1289,9 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		break;
 	}
 
+	if (!pdata->hpdet_channel)
+		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
+
 	if (!pdata->micd_timeout)
 		pdata->micd_timeout = DEFAULT_MICD_TIMEOUT;
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 4c09b476b77a..744a610cd1af 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1221,8 +1221,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 35b7c034b517..b52f1d30c3c0 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2040,8 +2040,7 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 312c55ab7cd5..34a6ef555530 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2402,8 +2402,7 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 4d0c3a54bd16..f4608c1f16bb 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1118,8 +1118,7 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 3ae19f03f29a..9eb82d46346c 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1345,8 +1345,7 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.1.809.ga0b61035b5-goog

