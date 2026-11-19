Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125321;
	b=DbtYHlUuNe2NlijXkSrmbRaEqR8niDgkP4SrmveCKR4RDTKPSQkcMb1l5irk7qzAL9t/
	 PXHetjHlOwN7RnT0cdP4ejU1jlYkwE3uF3Yn+f2Wa2yxPPsK5FZ5wruq5sUQZIwANuIvp
	 gV1cwK9daT9QUGvXjKxImhqDZ/6002D1CVa31rC/bQ6LCgoPdw54pDSEud9DTFahyfM9l
	 sCfVmAoJp8NYRpDVp2RlUmr9WURMj5SP2/uUQYNQXT3a7K1pwQZ/knIhiKVeq8GCfsOq3
	 Ex/SILksH6ttjxRscAwy4EMgaRFZGFMtWnoyThnVRVAXTUECR9JzGY2yC6mCGDUPj4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
	b=AS2r1LftwrjIHJx9D5CO1+IyuEWv3TVftzRrETbHB4zuosh5WmXAzKjWxvK5zNyljuba
	 GQcjsZt5gpVddyR+Nf27IqeoB4JuEmkTtZ6DALIww6T+6r0FQlm8OBNeWDrJFPT+L03lQ
	 4Q3NeGzSWgL/YsJWhO+t1KE6ersmvgzdxkV1l6TFqq+PIKboiDSiu3zBGwup3AX8GLjNC
	 t96s0ebtV1mWTwiLTH1tVpPIhBF3X2kIUdbBtYZH9HrUAgiB16Ry7pACX0j29pFuOts/Y
	 68MWVTvFojBJ+/vpRmSoS8BA01i/ywpuNDVuN52bWIngnENqCjWWJcBgA1UmbqIUS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBtp9ZAZ;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EA606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B3EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBtp9ZAZ
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-949664ee41cso30084385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795125320; x=1795730120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
        b=hBtp9ZAZubEyioZEjMRiNkXicclEhX4PAQOrX0HufTZNyhdbh+GclybvsOIWi5NsGf
         vKnuxjUuP9E86w5Sf1tsOXeC9DON6PAY57sSCJ9UZcmbWgQhUewlKr3pjGht01uZbgfJ
         Jj2QNAXBryUxkydrpdsicqpt0PrQON6jm6hFPPkSiFWGOL8/QphdNyJzktgCwiKvPCJS
         fxGu+EmXlqyMTqrKOfO3gi+NN2tjoh9VG51sQUH46mialdnA1XixZzpqvi+G2KtUQwR6
         tu+o+37bWr0iT1F+o+ih2UvgsDEjRPsQZZDuXwmR5sdUhJU4/4DBv0nMP2fnPHGq9Niv
         G+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125320; x=1795730120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7XmuxZEKsKhKcPeD0Bm1mQbeva3m9bG2ujD+Ag4pwA=;
        b=c0be6hpMnTuLFPo3EJPI888nZBy7d9szwdcKrFJZn0Zv0g69X0phRUs/Vt6UEnECMe
         E+1Ax/0jGmSfGNvoeDmLl/43PSGgb8Ogx848o4WglLU0ITIpXb33YiOIdtFKl4HVg17s
         NJoUGbEvJA67ARWSk0WOTv+2ZbD6w1ahXntDae2YqxCjZKymtZ69mMCP1FA0EDqiPetC
         81dYFUKX0/484dqeBNBD+JblKoiqHGfBEqXE/DCqFP0U9CgCL2U94uF+2/mhWoUrCFM0
         GAQPUPi/F+kfrgl3LEsJoPjRwqi4usYmmVsZBcEG7KwuLlZlch80CzeZGDBdIXL/ektS
         FdcA==
X-Forwarded-Encrypted: i=1; AL+hErHlBb3hFBAeQ76XIUohdr7DdWagpqTNGuArtlCmFgcwx30O1LO1af8JCz27HRLL53bpjLceXspeMX7dIIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LAtXZlhPbaPzc7v3s65IPRkyQay7Gi52EzGEMvXv2YdpX9zT7
	sB8InKIuLCxmpp3w2zpB+2duP+rpr/GswB2Drm4c+OxmuvMoVcBQf5p5
X-Gm-Gg: AYBFou2TFmTPMbQzyRDme6/O34Zvrh4+grpoCFSTpsdYjEqN649RZWlmnfThZ+mObd3
	XNP6tYD4AN7iv92RAZgTxfoIYXDQsam7/7+zhC5JoYyOXbc+XIHTL25nWL6iuzDcVlDgZxEfqqM
	JY1Dhxe3qOP2YZa6c2dWuSXKMl22vOK4GM7+tAGVT/hWIHHJgEq/OtY5DHHQ0cR4oWb0G6l/J/9
	ckqb1afeUaCaEURG08fThoSnrbNxwtuThlXENNxnSOgSvorTvmksP3RCLZj26jopLTDHR+xC1qi
	43acrZ+jnn1D1TWPVnoFCpS7kymVr7FRgHS79twz19I6z0pxeQk8giHejrSrB39dgGcRotRjlLK
	UbrQVYQZ9EImszItinEhAmp/HOdadW0tw2m8NCsAkpzzZq9RglfXVx9iBpE2kfEZTnP1bnDayRk
	6rur0sROBCFrlY1pDYuPzrzCi0jdShMIOJFk5O2jYll3MWpueQByHNTdVOSFVrHZIu4bX/uV3Sm
	okisQD1TQa0K0lP6WqbFVeVOZijxTc+r2dbrxojlndPx0DHPkO+QmGpev9nisUAJ75CgO1z0v4S
	+bIHFpwOPI16M/TTbE1yDwgBfkKaOIoD0vWClI0TyA==
X-Received: by 2002:a05:620a:4397:b0:93c:8e3f:3036 with SMTP id af79cd13be357-949ba827abemr169904285a.4.1795125320405;
        Thu, 19 Nov 2026 13:55:20 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm54011185a.38.2026.11.19.13.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:55:19 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] hwmon: sy7636a: read the temperature only while the rails are on
Date: Thu, 19 Nov 2026 21:54:05 +0000
Message-ID: <20261119215405.20596-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver enables VCOM at probe, which keeps the panel's high voltage
rails on for good. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v5: rebased on regulator for-7.5, which now has fc8519fab34e ("hwmon:
(sy7636a) fix negative temperatures"). No code change. Added Guenter's
ack. v4 2/2 (imx defconfig) is unchanged and stays for the i.MX tree.

 drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a6b47452e29e..a8bfbf1716a1 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -9,26 +9,43 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
-#define SY7636A_REG_TERMISTOR_READOUT	0x08
+#define SY7636A_REG_FAULT_FLAG		0x07
+#define SY7636A_FAULT_FLAG_PG		BIT(0)
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
-	int ret, reg_val;
-
-	ret = regmap_read(regmap,
-			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
+	u8 buf[2];
+	int ret;
+
+	/*
+	 * The thermistor is sampled while ON_OFF is set, but the first sample
+	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
+	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
+	 * PG is only set once all rails are up, after the first sample, so
+	 * read it in the same transfer and report the temperature only while
+	 * it is set.
+	 *
+	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
+	 * temperature is reported even if one may be available. That is
+	 * accepted: the display driver reads the temperature only while it
+	 * holds the rails on, after power good.
+	 */
+	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
 	if (ret)
 		return ret;
 
-	*temp = (s8)reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a_temperature", regmap,
 							 &sy7636a_chip_info, NULL);

base-commit: d979b780718905dcbb55c10a5ecb26cc1ff1762f
-- 
2.52.1

