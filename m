Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374522;
	b=gwy/1WHCzga4y4Euy9JoEHjux3a+am0sqikiSKH33vPOQ0nSuSSI3PNw7O99xk1heKiF
	 cr566Q+50K/P2qf99/ycNqZya1hhvVG7wB1r1dXhZwIovgpeiMPRrrHoe2EmPESg/XQx0
	 TBiHa9ZPNuprnB3fzxeTr0CRC6TLCwYU/mTjLaRi8C6XCoubPlr8i90233fCTFpS3Ayxi
	 shoCDoR7Xu0zoKyP8f+7IN32QCE2/J0gSJDDIEhdwuRUQ81DektAnOjkt5sa5sqr6sV2A
	 3JONu+wVjWNK4UswjovuqI15lKVOuq/6hWQ8EEQrN4N1ouQa6dAkFV+cHkCPPwIh8+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
	b=mEjLlrsfT5HhXtghAX773BvQvYNdx31ppACqIYEdrvhL6MEonI1YcyLOAS8NuqpHQisR
	 MXa1D+H33MC0nl32BURhrm0NO0vhQCgPCKXnuc4jEYxDnA8aQyg1mapo4Nc1dOoKOvg/W
	 h/0Dqvr3LPe0fpDYTnBJeYE9X65wKf7mKGxkHlmpmQTvaHUmWuPRZiwu1Hgt+0O9S9qfI
	 uXBUuQrxasFNzb5GWDYJFCuLSa1aXsPL6RYStGLNSPp/in6l69GSy2ZV8JboygVMiUjKW
	 Tp0QQ8IRKobcRD046Bg8X0Vb4kch+aMgRPqIKtTI3gJaNXzn3OipFQHqrwjrW1RUMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OynidK4K;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED59606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED59606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OynidK4K
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so20777225e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374520; x=1795979320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
        b=OynidK4KUNaR4sXs4C9eY/rwSsK23cjX7gdlwtjh2qkjgkuJQLw8IAvcTG/MScWA4q
         iy1SZHhF9p5/nSYjuK0AvFJ70F1NuW/UcUOgbqALttsVRJ9n0ociNb7IDjbvLzxI81gQ
         z/PS/TKoWAkW4Fl5Zsw8MFcbK77l2R4AQ8olSNgoVTAWW9O/TwymYrJbyumfI7bRrBw2
         2TDSkXhea+56NLK0ZP8R01iiGyg9aEITaITErGUX7RnfSZIjQ3k6+/4nnbyTA/rlcBr9
         mExjMh7sUZAr++3hoB2yej5B7sjYKzm0eIyCY+F588P8fipxyE/LYPffRDmTJaIZtYdX
         DfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374520; x=1795979320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1qn3ZgXAJPwE9Z4LOxEEqcGESbeNlEBsddeXFHeNk=;
        b=wIqCqKmmPalQMkRszGlLJosSA6SA4OQ2Ii6mbkkV7ZdTITh/aC4WsXgaP5AQOY1QnH
         jHWtage4Xyw3CWu2z1/ff1TZ6FUs76a2iJLwP6LAadPH+ceNser8J3MDdk8wISTHD64k
         7HlL2WsV9ZMU18per6rjHyRMBa0gOy6iI78k1zm9iPjs+nXygCNa8wHlSXw4mq/VaDlL
         qc/Gr887NhorI9hri67+OYT8pIbjduyD9mCNs6mv4Tdn3uThobcAT4Mfq70D4XGM4iSt
         kXhB8v5A3WuFIl3lSyO5uVyD8sT9cqLzKCR1HKFN2DVWXwrgRVl9xiv7TTJ/5L/kMyB1
         Km5g==
X-Forwarded-Encrypted: i=1; AL+hErH0ot1lokQBcgsatjkkd8RCMVpr+gmjt8RjqJ0XQ/QnQhoOGv1vMK8ZN7bscyXMQEYfkofhdtwS5Xr9BZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8geBRd0RB1L5SuVKWuqRtcNEMGMjkg8V+/CHM+Bip3FE6dH0mL
	gvHnol5IWE5fngGxTeQVtVhtG62HsLnAPWiNSRfVwVCgOGh/E3nMqKmH9rTQOPUoPVs=
X-Gm-Gg: AZFdTZclPoGRXe2ngyEPxV49rYFX5wyYZ66T5ScRNebD6MIE3I03FeJjr4qsrY9BmAg
	YBa2hMf66/JISQP+qYA6derCzQya3TbCERSzn9Rnx0gbE9kN4GC08MJVEoR6v/ExmEF/HaIpg9F
	9aK9OKJ2oQq1ID550F8+y2OeaRK/GW+MK1jIhQK/hSgm0DcFyeXn0YF8+iuEyCdPientbk30hBX
	dIbVAu5nL5v6QeBf41uFCSWWXT4HlfAOyJHwgF1iKzBFIGutQs2UF0dK4ByLESnli97geWpEPq2
	UsxzIvsZcPomxIje2a0baPV7YkgHoV22cMZ3yz1fXHoql8Fy73Or41IQI+JWheZRb4VgXFknUn6
	KS6lN4mZjQxXfFKtXebrfBB4ndoYQxkIn1vgs0xykw+ydT6yFX0CHuamILQdG21STZvs3+6dO5f
	Pfkw55dHhNq+3y1mig9laH7fXEE28MqTE9JL271FnPfWzX584jNyccKDXze8jdCUM2j5YN9VWii
	CauPmnaTLMQCq+XrXLXwBSoDgr6KOPdi7G0TMkCJoHd+qiBl4f6EGwjCCfNRjW9KVuTH0blAo70
	WXFLmNavz1YHTZOBnu6Uaj5Y71iVa/4Kr7FpqhkMReDHkC5by3Q2UEFd0/W4fQDDGz5P920shbP
	sfyBaqIZtoPU=
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr216534635e9.3.1795374520111;
        Sun, 22 Nov 2026 11:08:40 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:39 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Sun, 22 Nov 2026 20:08:35 +0100
Message-ID: <20261122190836.66111-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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

Boards may switch the supply of the sensor, so get and enable it before
initialising the chip, and wait the 5 ms both parts need after VDD is
valid before they can be operated.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..79015c7984de 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -64,6 +65,7 @@
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -472,6 +474,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 	if (ret)
 		return ret;
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable VDD regulator\n");
+
+	fsleep(MMC5633_POWER_ON_US);
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2

