Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118137;
	b=kO9/ncr/xdI7cUhIJdc3QlKAgEVMYSj+46YRUK1q/NWlptkuICYIeAFZjIyk14+uAyt1
	 W5AphUgQ1ykslJZArNaRrvYRVcIpWxP7YfVILohJXYdIZxtkKUCjyUf+cwV7dFn9vNett
	 5MOAOnqImQyhIWcbs7KNwi0wikVRXsvoIVGw86NhYp16wrVsfFY+BvDkNsqbcOFtATI+C
	 /ug0FVszk6kxtfaFG9794tkSJE25FsxERjlh1OosVb/yP+rjo9wwLebSF+2+l2+CBXJ9V
	 Qm/Eh33ZPbbp/h9izYp87H+v95CiUzFGn/4LsJtQDKhmJLH0KbfrZe/hcLsDfDXP6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=rC5HxOOT/ie6JY+YzBXWuN+NlKBHLxUUHfJVJx/FJbCaH5shBewrSMg4u2wfNREGncbO
	 bYb8p6wqur5gSdtE8fRrvMDYs0lQWP/QxKQt9VzJ5vl+DM0N2MbLb44mMqSVdPf3J4bhb
	 Md8iCqHys6IuAcv1lSr+zOoIiW4dOIFp+6H/Q8Ce2nuhUbr9BEDA70ycZbxwK+uEnc7Z7
	 DsQ71lcDepgiHOHpkg+8ZRzfjiy+iOaET2XNy424DVvsOx22D1KZzNttSWzJc/lJYzKQD
	 1xNnuP3Epl0hJEJZhwYh5yIKQ69CoII4eaO2rTJsziRDdeMucyg4Y0DPjShi6CtrPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFD606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AFD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so40171f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=awL9SL51GAF94ZkXOA2QXOfkl6D8oBwv43SYFqN1vMM9CcQo1zA27EcNnQ8ErXm+9b
         +KvbYSFDOwcqKPJFgpTZNqqXGuEEGXh0tuQhtRw2YR8xJBgYFN2m2Vn/k23U0NP6F5ou
         GZXMdZ+X/OrhPq5aCgrMoQlZ/NPbOsoYN/ap1Pq+c7OZgT8bVOG26Tm3cum2LM9s/833
         HyxRevCtklZWrHfuOYhpJIa0Qaw1TIj2yQMkFHBD0vo0t8EGtnGyqxMDRO8JbUemq/Cc
         j2OT3Wqu2twsZrgYKy9Ae6dGak8BtQ+gbGvplCriw5mpLSYrFweu7LW6hnFsPemfytzM
         ICSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=vAxlVkB0u1FJpqTJsxwjgv9E8jZ6W1qH/Ey0cyBFHfDV7+Xqz+DbAVFdsRPp4+/E8w
         kiI0+78rUe4TPU3w5GcjfkcDbfM9zbjPhwLLmYuOlhj5blMHfNBEaQtG9D0qp6Ja5RtW
         W7B4AHbTrUodQ+DUdXmBfL4rTBfCKRJS+jQaINkIaSirY7X9E5UME3lhBolLBYdyEqgV
         gISNFSfuApWZ+Z+3Q5VLMbczOiWHVNoBiQp+VGMAx6cMs85RoIHF1Vb8bQU/0//rc6Ba
         PkMQqkpw4Cbs9nr/ZFRHK3empu4Bk21ylPjpC+FppyfC2uBy9KRjrH93OlJv+D8db6Hi
         0r3Q==
X-Gm-Message-State: APuU4Z/zwfgk09pmIjEvWFCgFs6be/1A0cKO6vtgMeaF0RkIKltRrqqy
	y1O07m5SYmJuh4xIr/+UtS/YBFegENultfVjF+/bK4XX+na/vBUuU5X4
X-Gm-Gg: AZFdTZeZnLa1YzfYPLSXuRVSrGUqwbRwKMTBXXrf8A5zylXwP05/GI+CxlzAAfrdYul
	dTq4uV9Iy2wBeRPHRu9MYDuHCu3NHS47hDBtCbc48KCtEZzbAtGC9gjDlHWkwtQlsEVEWRqjAIJ
	Jf/ghJH/p6M89HG5Yzo7Kaug6MyOQw5lSUPDbSIlWCnDEmnai6FGDcEvyuJjE4QFBhbZcflc2Bb
	A9ba4RH7N+xlLwYwNOhs9ub4UYwqT0RGjH60Q2wbnX7TB23QLJTrAv/I7u1a14RImh4siAbpXPN
	3QuKNPfk4E3RtI5rsFa+KKIS/MTx4mQTXndhOKIi3sNaB01aF5pt1fRUNcqPxBVdnsVXO/q/m8l
	EBDPHTa1HbFlPUzqMm5U8YG3cJ97F59qQzJbKwx5D74hYctsaHMDRZH8RP+PaM8HShVxppfb9HE
	eRJ80KJXp2OmVmRnUC3DuM6qTsDZLh0rShAl7nH6ylrleRd6w1lKBVXDlvC9dNIKPyPjfPcVOxR
	TnodlQ0IB7jz1VpadaHzzqva8yis//YEWTAssaZfWvhvoBzxHAHzemdwTKaoYxbumo9DR5xOGrU
	Flj+1UvxFUjdvx8LDKHInY7c5AZcL4iS/wbwBOTYHyp0XUSA/A18Sk8dKP8GXovWGpMiT8dPwQr
	p7zR0G54mf5/MxdM=
X-Received: by 2002:a05:6000:186e:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4abb225ebacmr959607f8f.25.1795118135348;
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:31 +0100
Subject: [PATCH v4 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
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
Message-Id: <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1hSNXDBZPA8BDKMuebBK+XYMMCVqHzsEva
 /o+P2IReHGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z9geD/0X0ve2bjnBdQk+E5KD5v8e5ClnFtyUX0zNo1Vy1ASx7d+hZGYSZl3S6mrafmpH8PZ9i9c
 ZOnN+f12gku/0Rhd71Acwatt582FJh3m05WnP1WheUOYRvoK0i9dnq/DwqxQluxQ+DxmVaVA7ok
 /xwTa7RTWR5CsphiAWErORUkwGoBqCI17ehfS93G93VV4sk29ikcTh6Ln7S5kBvmY0jyA7k38DR
 160GuhLuZeRwstADN0uNRc94EUUp5mJ6083fCJtYYKiFg+LCdq+6c05J4+u64i9Tbi51cWCVU+9
 3eaGym/X9MjkJGwamT/D51h2vhZsu1Jg2yxUwtZqr2s7J2qbAoE5qij/LahYeeg5EgoQZatQEL4
 j4vneI9qwgBLbmJfT6j4+z7B/Dt4elLYNFYkpUxCkxucmP4J9lnRNNYVJ7jodpnVTB0t5vg/hzk
 QVCz5pBZE2n2K90VyJqqrdue55VXYvEiCTkefeeJmTl1khz118oH9hDUo7fkMuNuFA5oQG6/guf
 qnbmdeumiaS0qyGylJeHOCylE8qgbLy3CZTn3KBHFeUEpRxQ1oYLLxlsx3uQp+2nfVjcFUQzOVI
 9TGMT1Rdf2yRzmW0lFm4ilpppSv4AOwcMUmpLyydPLQkLjKyQdzoKMEIQQwol2ZbH2nYpHiGVWz
 rBTXExGi0YTV0VQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1

