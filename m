Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179461;
	b=uwo89TFezHGE/FHFdcZUZSiqmppvpjTzy48hXKAxeIAgs4U/Fe9Mtmt4kfJQKW8idVuK
	 MJg55QFlKtty5ToI4G65MZ/WaY8h6PfKBAz9cRQ+CfeR8ibv+SgBGip+y0g3BJuQZFTKP
	 Te8OOU5/CWqEek6B36y/KPHQaZtwcuYQqmWZTCqAAn7Eb1SEN9UJnAsic/KBGY2WclkV8
	 D5cCM5zAe4NuXPgFlUdFVCCZMWBKC50F727jfRXbzJbGjM9GeqYLZg9/50WnT8b53g41g
	 Qw+kRj3CtDKMhMbSkHX4hIwmlY/YYzwGMX5t4D/3pHUNZ1XzwttO4Rhc5TIpVByt9Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
	b=k0dc+Ase4vXqU+J0BHP9aKM0V/UG2jC5iBpLH6t0FI84H9Mf1rCfWrtP1hev6g5WZ6md
	 oy4hbXConTxHdPxjukQjoXpD1WKYXe6F/s4TA6epUaAwxzDzLn56iZ+JGS89h3JySPFBw
	 /P6SYHcWljfc9Cdu6iaTy01fb9gk22A4JLEjcdY7yfz7fBrGYBSSmN/zMJkSCVR6lHt0j
	 4vr6pNjUJAYDczS0iy7tr0UwwOmcAf3PRdiwU1CDhq/dxWwNLU/9bqvMKPWNP+q/B7k5+
	 pu7pLO3O3HPbr/5pg2YSpD2u6PIrj1y2hbtFfX18aleVximETvvTQzhEeDS8VeSeOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xc+/RY6m";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80133606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80133606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc+/RY6m
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so2173451eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179461; x=1795784261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
        b=xc+/RY6mE5bOW4O6W5gmg4gOu1k2/kFtnQHpgVLHJtgbPGIRhrKRwoGhJrhblCxn+h
         CzjDJ2yuxJGPeB1SYPdsf3M8s2oRmbU9IFlDdFxssBz3l+8R1vq0JIajfQ+6AIHWny+s
         qijpk6JuGsHJEAjwF0k4VzfTIflN5H3cWa2UvDgOdYW/OteghkBjgq3dkzjjgPIRmyrR
         b7TEvcxwf7cXtTOe5Je90WOZqLekoGgMN5EV7tbjpSVmJn8BcMfdPQd97aIwEQef2A6N
         qPsWgVZNPxkdkZ+bk6HMHggZzp3xEyzgXyHsGhjMBo7MSDddugjn9q4LW3umHiUENL+o
         o7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179461; x=1795784261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeRD44dQOO6ZDNI7a8JiTN75jiv8xR1iGSuq9LBDHK0=;
        b=Lk82ctqx8DLpXneBv1H4lgSw2b4ZmHJTtQWMb4XYq9+TSA7mRVjQBKorY1Sp6g49/1
         dX6lHf+oabkubCQmPLVk/uyLW5bD+AEQdorVE39yYSL0c9SNn/3sG/T40eP1eX5iy42i
         3CiItDDPnoTm2GjnwRt5l/t5R5znwSmhtPAMlczNyy6gMDiyVEF1KWbgwEgT3qPR6Fcq
         oaxzVqQ6kSBHiIVhNDzklHC+6VwSc24yR9cNx1kZWlwVv84zs6WX/9mT7DufsJ5kK3cB
         XOg15eVQg/eek83HBF8wR5oZpyDOWl+v1+lYoYGst5dtBHuJowex+F5wvfuhV5gUP/h5
         UCmQ==
X-Forwarded-Encrypted: i=1; AL+hErFTuqSnDRA/TVYeUKmDhLG6gyp6EJZ2NncCx6N+px2cVgp7iTd8XqEf8b8C9SWOVT+T0tV8WuldepinMHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOvyKu+fugzPIMxg+ZjZk3Avrrn1bG3zXBcWow/TZk9MNCssu
	FX719ELwayUEO8FVMo3Nz0LIpaA8HLDl1At4VxUYUEZBPOQ5zrsjT2uW
X-Gm-Gg: AZFdTZcyN8B5+4a5aQyXDwmpZLXYCa+Wa6ymJIwlE6pEwEscgoknoxNWQby9jK3ogOF
	AjygPxgmjnXCMVHquitn6SOrLJmOJlDoccAnjymMxeETSOPxtOnqzIlaPlJWmQcdmywj9r4L8kz
	kEfg+O5i7hT8ELkqAled2mwRLFD6i4P/ziphuxxDFahYoHHYJ1JOc50rXzs6dFzvI3iAm/FK7Ig
	mvyxw8Zn2yQoxWKBvm1NzXoKFcIiuXWPT6fLiIJKrsbv2nrxqZu0x+xNrycaioyrHLkhVEVOygF
	vcoGZ92lWIrVwSp67qLsHxB0oQoJc+t2qbKPWsjXkEBuZvnthWf26ZzTbiPtsNqjcMnwQQ2wUto
	/aZz5YCShJmyzb2HzlLJaAbtv9COXxZA+QbhX8m3jefCcrW29/Nbn/i4u6kNORwWAPNsXZkEXwl
	ASroLzFNJ2mzVH4WVUt2LBNnbW8Nro9nZhMj3wxB6KttP7pGC4uo6iFeds4mq6hi1iIKWJ1pN6h
	JEx3PxB/0tAMiNXTmosG+hgpalY8nyTbzmkA5+BHSkMy3pI4g0lmVvXlahJz3XhXp6YMsvUAhYD
	n797epBzs1+4Csb5AqW7DfMLATGJ+IkvQRm30jWQwonAIC3uyKhd9gNHwnCo7yFWbLyWKkXW
X-Received: by 2002:a05:7301:182f:b0:385:cf42:9b9b with SMTP id 5a478bee46e88-385cf429e7amr1916243eec.8.1795179460450;
        Fri, 20 Nov 2026 04:57:40 -0800 (PST)
Received: from akhil ([61.0.85.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm10672548eec.4.2026.11.20.04.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:57:39 -0800 (PST)
From: Akhil Arul <akhilarul324@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: shenghao-ding@ti.com,
	baojun.xu@ti.com,
	Carmel@aperio.ai,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akhil Arul <akhilarul324@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781-spi: Set tas_hda->dev in probe
Date: Fri, 20 Nov 2026 18:27:29 +0530
Message-ID: <20261120125729.135171-1-akhilarul324@gmail.com>
X-Mailer: git-send-email 2.56.1
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

tas2781_hda_remove() is shared by the I2C and SPI drivers and uses
tas_hda->dev for component_del() and for the runtime PM calls.  The I2C
probe sets that field, the SPI probe does not, so for SPI it stays NULL
from the devm_kzalloc().  Unbinding the device through sysfs then warns
in component_del() and crashes on the NULL device in pm_runtime_get_sync():

  WARNING: drivers/base/component.c:839 at component_del+0x149/0x170
  Call Trace:
   tas2781_hda_remove+0x16/0x60 [snd_hda_scodec_tas2781]
   device_release_driver_internal+0x19e/0x200
   unbind_store+0xa4/0xb0
  Oops: general protection fault, kernel NULL pointer dereference 0x1d1
  RIP: 0010:__pm_runtime_resume+0x1a/0x90
   tas2781_hda_remove+0x23/0x60 [snd_hda_scodec_tas2781]

The same path runs from the driver remove callback and from the
component_add() failure path in tas2781_hda_spi_probe().

Before the common library was introduced, the SPI driver had its own
remove function that used tas_priv->dev.  Set tas_hda->dev in
tas2781_hda_spi_probe(), as the I2C driver does.

Tested the probe/unbind path with KASAN and lockdep enabled: without this
change, unbinding the device gives the warning and oops above; with it,
unbind, bind and unbind again complete without any splat.

Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
Reported-by: Carmel Okun <Carmel@aperio.ai>
Closes: https://lore.kernel.org/linux-sound/AS2PR02MB10038DB2CE8CAE659D35B9F1AC8792@AS2PR02MB10038.eurprd02.prod.outlook.com/
Cc: stable@vger.kernel.org
Signed-off-by: Akhil Arul <akhilarul324@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index da71b57a26e..4bcee8362b6 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -781,6 +781,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
 	if (!hda_priv)
 		return -ENOMEM;
 
+	tas_hda->dev = &spi->dev;
 	tas_hda->hda_priv = hda_priv;
 	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
 
-- 
2.56.1

