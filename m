Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463390;
	b=B0AzX2UMX0oEcgOPJ7G+bfBDUfQmpSlV5TS07f8DheUGgctx3DABlfIt5BkeO+8miMpv
	 lix11aosFFdREfNaSghAVz6RIck3xc8K6roH8hRCYkAFNYUKdG/zfDq1r6hMyf/1fSjd+
	 xHUywgbvt7IfwbavVn9JAhpbTYDfICUGWnuv7+6X3mJI+5ZAp5JaskLCHzvzsP5b9EZZ4
	 4d5BPC3GFxiaD6ygOIPSIGb7OtJ0v2c64kqaeVY7vjucVJwrgI/Vjr71zMawuYeIco6M/
	 yl5vfW9T4VMwYvL1/FpndpAu2lQu72hZuAqsBOHHJIeA2LUgszsGMTNCWYbFLOiWX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u/af0oFedONOG78b7v4aO2KzMNrUwvebFerX1xuYNME=;
	b=0BNkuB7k0h30KMYMgDqv7SLrRRlcGxqu9Wzgx5ij9c7zteplVnVJnLV4rXB/rhSj1qFs
	 DrY6+osS1unNXu75A4LBS8lfg0QBip1o+fx+wprhuxy55FPMeCMog/FHc/nm2K9Lw0kMK
	 /ztYKjvArbu44IyG01d/ouprJl3+X6JMg1PJJLBebrxIGwZnqcihU1ZedLeLR7x2gOGRF
	 7QFeqzui9MuQdWDd9mX5VVhb0oeDfUb53IsnhT/HsmOzuIfAih9P/L+RogtAX1XFamWzA
	 PLlOXr1IJQ/RXARL37+jzeaNJ+LWg9aH7WnJURD3hXbxqbAqddrWLL/umqAoSAuyjtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OtIFV7gX;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A6606A6A5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8A6606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OtIFV7gX
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so25376195e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463388; x=1796068188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/af0oFedONOG78b7v4aO2KzMNrUwvebFerX1xuYNME=;
        b=OtIFV7gXGyoWOxdYBtL8dlue9CMS63zjNUtm4UI7vahvboE0MZf6hfP5k0NLDI5a+d
         667pFkQ+4Xu+I7vPpzOJz7VjPErLTrpqUovSbnudpgyWe0ZMiTy7JbyNziszkIWUrs2f
         SBwyST9yiHOzGlYOZ16kzwdcG9Ayb0jAsQbuFJL4FGleCP/+H36fe6HSVF+/LFwLnc85
         3qyCZBxMP9nmWPpBuxtkSYs0zPF86WVBYf2Na/mJeTL87lhlLXAuYnXBDL64rc4qoFrW
         mKoh87MhlW4L/sBBSbLMjDf9eshvAk7ocp5MKBEoISfbAFX1zIYBpmF7hIGgl+WVXZh1
         JPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463388; x=1796068188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/af0oFedONOG78b7v4aO2KzMNrUwvebFerX1xuYNME=;
        b=lD1/sXaUyc4o89klYyeyRQk50Qm3MkRLAPFg9jiBPRHdlkYugKQZYyeHrT7947m8+6
         3uV6TfX36+FIv+4XY1nC9QVEmEqOZYo/Q9OFufXMzGF0zl4DgYP5vvz578EVHqIooKro
         ExPXNqaaFKKfJBTkWpx4jiRf+Autt0ZvzIlGbGGe7NKsmDxOMaJxLvFyT0Lvcc56pLWt
         c5cOhDKnU66ru73HHpHRQwlmzDSOhDdmWtq0EkftctS70HjvB7kYU21etB73k4JUkF8m
         +eLJuJD8eWiEj9ZqaJYWJ9sKBsNiRCMvo8kQn6PFzT0psvqec58/sgjMsDYelkN0Kebw
         Bbfw==
X-Forwarded-Encrypted: i=1; AL+hErFWZZSVRmGWyaQ7vuT2NMgzAd0O+sSdzSUwq4w+27NthxAz1r2f5FMp96FtgJEZCf4Fs5qJX8RFyqvTkyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xKU6XfGINuiBM+wBoQ4C1UJskAeh6etRmWb9tz6jjCU7XdK+l
	RyMhPg9gSbH5zbF8e7LcojYdwYB6ZQ2rsk2zm54IOaS6ZbQmLqxs2JCCBmNVrTvfowA=
X-Gm-Gg: AZFdTZeFmk5LuZqNFYhxZDoDZJqRcIb8bEK4cGtOODvAHAFs7Ilgw7vNXTnALvBEif+
	+fhnfrosQRPhyuDMk2HK5gOPopnITQa/2puobmutoQBtpBLZexE4ThbftE/kyX897cDd10zKcqT
	ThuO9Cj1OZCDCydfrH3wN4vKstLV6k5X2Ns6vx+J76y1QVZtSb5HI496pFVEErc0cnOqnsOpLR0
	/cXeJEq31xuYBSWeC1P4go5uMMfi7+BI6ulVi4f1g7NjcvvNfnDExOdoXrQ7IBESMpIehd3pQEv
	JzyCTeA+zl5YSdDWCc6dqXSbUWKiPfp3Abx9Z4/w9IS2PCZA0qD6B/yI+PtTx1uI3pUURqOQ6N4
	qxkZLaBR2PXFSe2Kg6JgYSEflawIpXHRi3aSGyQJXet52W957+O8O9tIh7qhq9jWIw9+KqJbHVV
	AF3tCL7+DBbELK6GmPexnQVuwlk8P4sdokO6mIVwzjf5MjaadQGalFUJF1sdi6ksACWE/PBnLn8
	OQ20VxMOH7M8o9ajSF5pB1wrMe/DiFWlAKsBfZYDh14TFys30TtnjhIeKDitB9j2ESvFgNZPt+C
	o+2JszM/uwf3QZSuXUMip3xfrqM5vbu7VIDVtxcxxcDiZ3jyXTFsn3r1Kc03aC+LFSOm6GWr/Kb
	CbspSSgdrNnY=
X-Received: by 2002:a05:600c:4e4c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb88938d2dmr237088285e9.32.1795463388317;
        Mon, 23 Nov 2026 11:49:48 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:48 -0800 (PST)
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
Subject: [PATCH v3 3/4] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Mon, 23 Nov 2026 20:49:42 +0100
Message-ID: <20261123194943.57601-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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
 drivers/iio/magnetometer/mmc5633.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 5871007eeba6..584ed957e0ac 100644
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
@@ -65,6 +66,8 @@
 
 /* tSR: minimum time between SET or RESET and other operations */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+/* tOp: time to operate device after VDD valid */
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -473,6 +476,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
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

