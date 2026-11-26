Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695228;
	b=dKzpy2vKdhFKr5UGvNDsC7eAPwSK9+oL9sLuVrMbIun54GrUQYpRY8QqlxZSM3UGWOh4
	 GHqNPBYIxrV9HQUBZU+iLNWwtexlGR9MA3UpajESF40/ymJzhPI3l0Ylbcg7FW6igV0Xt
	 RTL3DMf5W7F8uNs0tghhBy9GtgRrzWLavumFyC1IWdWKqFnAJCGzlo3CxneRlc1w6hLFK
	 28pgWBCKvh9LZsZ+RLs3ftam3/5BsIfOLxtnv9ZgL+eKRoWmn2HkHuigTuqRLsSaWg8TQ
	 t1ugWtfsVmFh5nmKu8QIed6sLkJy+MgOtyY5TecLLJ8vB7MZLbf8x8BtYOKVvasVGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q2xu2GjGe1J1BVkHf8m/d5zr35D1LtrCMJmYA+Hhslo=;
	b=0lISpIZIS5Y1NG7Qmhfh133rZoIOrs3Zjpi+k5rTfy7T2m5R59QF8N1QnG7cbMXjefOW
	 FEV/in0uJAJeffN3Lg2M7Gd4k4vyJGR6uhKvCNpv0PEP3l0+VcnPF0A3CjmOMad735CRv
	 HwGiVytSpaHTpZCFwg94qRuoV6svk8ou2+U2uGXmyCFqk30wsFrOemKdfhDIocrDhjzXH
	 xY06kcBvllfxzgGwlM78Gu0bF6XJwGo99n9qzkaVfl+J/ngO9cLnsRKbdh0DtnUTgcV0h
	 C/857wnw4OAUtWtNnFPZSz2lHbSss3+EmcvM4bQ7K/xx8DctalFZPTlVdV6Osf0rH2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exj7Y8kb;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7C606A685
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB7C606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exj7Y8kb
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adfed9a887so63090911fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695226; x=1796300026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2xu2GjGe1J1BVkHf8m/d5zr35D1LtrCMJmYA+Hhslo=;
        b=exj7Y8kb/3GEhGKzFXejN/pz3nNn3LERdMbiF9sMk8ow5cDrpKQTA9A8Xa7+FtJGqJ
         yLBB752LWI9j6lcOla9BY7VQnbXI2D0CcghQoDbZHZ0PR0uP62bMjJszvTXu+oIdL7pP
         fK/cueSVikZJrdalj0rnjZNJGjdH9shxTMZ4G8xvM/iYovbaEjsENUohCsk8AvLXWrIH
         5mhLVyr+actMeLvlB5vYsW2/RhEi44g+wDrgg4yELJh7M5IAE7QHRGiBElZX7BxgV7OO
         +/4+91rGGR1GoJ8hB/UdOa+H79f5nV9W5brMrlAN3MpfozaEzvlIX59v5SniTy/GFmjK
         QiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695226; x=1796300026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2xu2GjGe1J1BVkHf8m/d5zr35D1LtrCMJmYA+Hhslo=;
        b=E0tNOL4S6kYarFdtDOBFAC6BBkCHcGSlgBNRfp3TqtsPkNVEhfU6xvBIn/kRX6f+16
         sA1BXyVdc9BCExbFGhK4tAilKWxMrk89Efvi8T4XCTWRvjzXhS5cGtwmxmr0qMuujdOj
         BMAyQnc7yyzw4YUlgjd8TYeg9JfCek0CsQvv2pjB4KRllVodYwbdteAVlDMuaFYHylvG
         eajiV417Leq/8V5Yn7KNsgAWx6zbwGC5AhAykSK8lLhiM8luN7PbmwXWE/OvCpcA4ugY
         wTIORsyw8paJwsHmscKvuj+EZjO2rE/IMJZzqYmLC3mt132zlhspx7/uwGiNOGnxFUgw
         ypXA==
X-Forwarded-Encrypted: i=1; AL+hErFeahRi2fOXGbzGUa3V016ahOb165XH0IBsTtl7tvcbEr1qFz6hMpa7zjY8U/qx37UQmd/ru1Ug9wuF5yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zyfZS5bXBehDBVTPKnPtP0LJyhyt+R/fl+qWz4b+zHA7FPqJd
	RL4RxfGkEi3iPY/vfrV9pv4n82ELpxUNED8AsrasS9CdTqz4a4Ug5qnW
X-Gm-Gg: AZFdTZdM94KbcQfJny83YqETUTG/Uciopycrho3QBrblgXATPhqZ12FbxZ0wnvoRdqW
	OVbE77NhV44J8BL8UPNYx2fjIMw2CoNh1WD1joglDpPdJY9AhjS7IPmfVwhPaGYoK4yRd4NwVQn
	v0yoRQhJnjYgJrRh4MXgRjRSy+CBYWbRsoa844cPRDfwAjXqIxH67bKtn9vc6l0eieLhS007VKa
	6+EGNPEOiQopQIUdrXnOKP8d4ZUl1TlVTIqUnk3Q42KRGtDRLuJODRbI/E8Gaa5AsFQkMcNitED
	EG6d0pb/BPV2BjfWksXpX3O80Evl1VC0Bkz1rYPX6vCw8p9ikAKKZRuFwvnodfssn2Td4njXKal
	A3VL3jvD/GsESeWQD4RRdOUl9hsnM5RcIGCa1Ahs+PFrLTjO6N32Qusgo8+18UclSqr6/0g4f/d
	IiUIy1a7BZgRTg8ZNrVG9MoRVv/pw5B4p2X/ybcw2vJccaWyytWYk4YBjoWVJg1YAPMF7Iires6
	zF/RyEgwovXrdxnNIZ2AJPWAl9OYjM+h517USkhox+8do5Bxmq1jQH8sHzvLyaCiU5qhVCm44uo
	AcChvgDIzu5HyjS5wmS2YhtAfk0t+vMflZJQmu2Y24afySsGb+5DxDV5nn5+7ghuBGUz36+LRIX
	WdlTnBC+nLN5vPIbcIjC/B9T+wCAcTDzU36mX
X-Received: by 2002:a05:6512:b88:b0:5be:3444:57f1 with SMTP id 2adb3069b0e04-5c1bc85f23amr6082541e87.63.1795695225993;
        Thu, 26 Nov 2026 04:13:45 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:45 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v2 5/7] iio: pressure: dps310: use time unit macros for sleeps and timeouts
Date: Thu, 26 Nov 2026 14:13:28 +0200
Message-ID: <20261126121331.10438-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121331.10438-1-zoone.rupert@gmail.com>
References: <20261126121331.10438-1-zoone.rupert@gmail.com>
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

Write the microsecond values as multiples of USEC_PER_MSEC, like the
poll timeout next to them already uses USEC_PER_SEC.

After a reset wait 20 ms with msleep() instead of 15 to 55 ms. The
specification says 15 ms, so this keeps some margin.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2:
- wrap the poll call on logical boundaries (Andy)
- msleep(20) after a reset (Andy)

 drivers/iio/pressure/dps310.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index f802c2c59072..1d46817ad04a 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -20,6 +20,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -103,7 +104,7 @@
 #define DPS310_DRAIN_MAX_MS	(2 * MSEC_PER_SEC)
 
 /* Make sure sleep time is <= 30ms for usleep_range */
-#define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
+#define DPS310_POLL_SLEEP_US(t)		min(30 * USEC_PER_MSEC, (t) / 8)
 /* A period plus a measurement time; silently handle error in rate value */
 #define DPS310_POLL_TIMEOUT_US(rc)	(2 * USEC_PER_SEC / max(rc, 1))
 
@@ -369,8 +370,9 @@ static int dps310_startup(struct dps310_data *data)
 	 * Calibration coefficients required for reporting temperature.
 	 * They are available 40ms after the device has started
 	 */
-	rc = regmap_read_poll_timeout(data->regmap, DPS310_MEAS_CFG, ready,
-				      ready & DPS310_COEF_RDY, 10000, 40000);
+	rc = regmap_read_poll_timeout(data->regmap, DPS310_MEAS_CFG,
+				      ready, ready & DPS310_COEF_RDY,
+				      10 * USEC_PER_MSEC, 40 * USEC_PER_MSEC);
 	if (rc)
 		return rc;
 
@@ -558,7 +560,7 @@ static int dps310_reset_wait(struct dps310_data *data)
 		return rc;
 
 	/* Wait for device chip access: 15ms in specification */
-	usleep_range(15000, 55000);
+	msleep(20);
 	return 0;
 }
 
-- 
2.43.0

