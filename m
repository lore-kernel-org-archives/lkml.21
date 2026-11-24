Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513599;
	b=5R7/QWAbqUfyA2+Kq3npx5rfHJg/Evo/VYY/jwQT+ws224IYU4Rt//VcUsxIdQcMnJ97
	 FmtF+YG+MzCZ0DC39sVApkTVe/1JNoArjLsLX342ppzyEFZ6JllFuUAIzGroEqrAdTM7y
	 P3RZS8arGd2+tK7FjjScqtUmA4FjWi30wuVh3DW3NwdNOPSMettkkHD4yruio97fxRwju
	 MugebrM6EFbh5KXyR3hHjjKNLUlX8l8U8Y5JkikVm6bq4jUbjZxShJ+j+Zd6bybyo1nlP
	 xC9EqUSwWp8lC143qsa0rSLthsFa+8dltxPvNIOmTJRe2ZCgu2jsOh3+hoG8VHWgjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
	b=Jy18HHjBWkfKrzw7HR6XqjZ5N0Wc0bN+6PU0KzJsdJCQY2AZKl+cVgyqgrWSc+uJ21OS
	 V6qPrem3SMZ4ZPYKx/jl3ssvG6jyaGzBCAP6krFmHMxsWiWkp+gGPvsT1uI565EjA9sQE
	 IcoZrADR92DzO4K94FOoTRLJgdLYMNDsu228FZgIpwyneKoJRIzP/GC7qc94BaKFjdE6p
	 WKjXnjaCfrVv30U/MZl+0ovNVfz7X+H8foVgbf+ZESHb4+/qiVrpXFJp986ye5vAwxySj
	 lHE0cBvkQGYkdSrNkQfZa3FljYkmlmgzAeI8IJMC4TUC2Jwt2nRUHzvoMfeXoiWfKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SWOat0uM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D760777CD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9D760777CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SWOat0uM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so41811225e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513597; x=1796118397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
        b=SWOat0uMtykoLrOOWFDDMs7TMV4cfqWsKi6cZpyxQ6x1B8U3bBeY+BrBehM1SdbsfS
         D9YA2Rztbp/ssELZIBseqhnvrukpJKgPTsd0HcV4HRH4d09PQrqo2sWs+4Ye7MOp7AW6
         aqhlVvcU4Ez3Y1U/3LpV2RfSLxOaliJc2F3j8hbjsRh4Aduo8iQN+gaTnzuIUFUj5LRQ
         q8EahHyO3QnDP9m/B8MINzZEmHfjVt0suVbJk2aDaZTgnJGvfafiy81Nb6XW1ImpTEZH
         mkzr500eodJoDpvBVMbm29YB9ImpG3eYdQxda8zcb3ZOtjCbojoIt5TZ0x7vCf8cC7lp
         Gv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513597; x=1796118397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnZSqwlaadL4PUZcokgyQtKhCiqmTb5kZKgMwBNaw/w=;
        b=v/3a4cAlYus8I1usuGBfzQzKlglG/umUGNr7df/gwMu8ZOQcsVzsIcN5Cw3+fiIM/E
         DjW1GuUsnzKU8fcCjaaxynW8nvrrk9GxNOIsGr5w2oGatZuLNAHpzpkZOxWqmGXeq8yC
         vAqkmmTOvCJ/IAoV36J11xVgM+lLsTI/8c8be+qk9GtwfxX0N72AgvsZe51ArTo+aBKw
         Y/MsdKvRTOIPdU0tRJdQTQQrxMJ+mh86Lp65csFjWEFdvF8OyDST2hMbkopRGxfZSXqk
         ktzwgH/Sq97WWuklV5oN756SSy83RJJGaiNq+6Wnf5LP1fz2SADShrly+sJ2se0BMl9G
         tjPA==
X-Forwarded-Encrypted: i=1; AL+hErHDlEPU0m+WXtRBrFomxyfFZfxQgekmwxwj53OlmBzImHQcsHyj+TCPbNhTKEFF6WMTskNaTEDuhtfWs2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Pnp4c1McD9+T+fcj4gLLuvUT+8bU9gx1vnOnA2WQIgFEqEbG
	zNb8U0+S4hGrr5++RDb2QY8VIkW9gpje0rl/KnrEspI/xcNsLcfUAZFAq4Cv+yHpMEd2OaQX5S9
	bUzXMIUSg4g==
X-Gm-Gg: AZFdTZcR2oK+BE5DZWOvFN4mhXWD5fiXVf2nlFk8T5PZUByYcJe0Pw5Vrj5fPoZ30Uc
	H3LzHdcsE6Zcgw7dyfazJn+dXDJ1WNB0heIJLuONr51ev9KPy2hrEzH3o5ZwfiFl4n9jeg/Uj+V
	A/QMRINVPgq041JNO3bZEAIudYnm5y41j5xqUUDUm1LP7MfrgqS/qJWo+ajZzgrAhnqoytU2NbA
	zsLI/xaj+L+cssL0W/9/AUnwRRKbtfiXAXK3feib4PAXXrNk5TPr3GI7BRmJK5JQ2NClGLKUr2t
	sTyE3lIGjvD50XXF9Ps3Is0GR6TO5bafpMsAnVwpfI+1Wp4T4j56HX/fIEvunb+ehE7jBGGc58i
	lsScCU03DyfBD7sUYRnz1YxGjOJwq5cdCesnqK0G66u44VU502Lr41aFX+lJBV9xuIt+c2MYYli
	Q1JMKWNY/9kamNCvVuO/s24sRse4MNrHq+q7E2llqv/4Aoz/CBKaa1nHcSO/Va3h58nF3NqD0LQ
	Us6XRdRwlJKDf+zm0IEonAs0mDZj5MAgBp/GVta92GqiQ/lC24WN+RNL0vdkMROdWWnxW3C2Zrs
	tOhC3FlxHFk+OKggQJ8BtFyIb9lSYL2VHQiype/3nLVbcxZYlnIuide5jByeG3iQMK/IKNCg9SA
	In8RzLT5ICZc=
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr276037095e9.1.1795513597154;
        Tue, 24 Nov 2026 01:46:37 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:36 -0800 (PST)
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
Subject: [PATCH v5 3/4] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Tue, 24 Nov 2026 10:46:31 +0100
Message-ID: <20261124094632.8879-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261124094632.8879-1-gerard@teslabs.com>
References: <20261124094632.8879-1-gerard@teslabs.com>
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
 drivers/iio/magnetometer/mmc5633.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 8142ba741ddc..08bebc8eb5f6 100644
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
@@ -70,6 +71,13 @@
  * - MMC5633NJL datasheet (Rev. A, page 23)
  */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+/*
+ * tOp, time to operate the device after VDD is valid, per
+ * Operating Timing Diagram section in
+ * - MMC5603NJ datasheet (Rev. B, page 15)
+ * - MMC5633NJL datasheet (Rev. A, page 23)
+ */
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -474,6 +482,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
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

