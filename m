Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465584;
	b=0cOirXkRA9wDDiKFfbx00sdMYJShtFPU0DBKvKRDFXaI0V2tcuQ7PqXo6rit3QbznzRq
	 HL0Ge4DdzNsYWSLP2mI42s2D+DRVqau/CsdMbWZGKRxdX3DOVjpF7/f70x3hV4CADrMN3
	 Xuth3/kP8QOXLTTCCtKnld09yatZl190YgSQGtfCfg/BNg1R2MBmLQnR/mhzsK1C8f7zw
	 VXcJaDHIap5Jt3fYL4VyeM84buOFU7w6PQvIcB1vtKSRUICfZoUT/i8ZmeBPpPEEFNCj3
	 kxxDYfHUiXPvPb9NNj3WzYNxLdDmZBCNC63c7g0pf1AnGU20UMckueR4pe47MeDhuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
	b=PHvwcMg9drrs8BcdLgVCD9QjHzVtJu4F9euFA88zQ5ochNUn4XnKx4BJee1tZHAw/4Ys
	 0P7mHfljMwKpu8+E2Z8IFwj3BgxrIvaIGLik/DO+2lUlFEzIemZYZIaUAgMpMHWvnMplR
	 EW7naeQidpsiBIIiwGzEpqofkAMDDMC8IkxsNvp/SlwHXMHtqYlE3EeVAsFXNQvBAEotP
	 BXiWyS5onJp2pmHjzLWv61+soMl6qPx74GNnVy2SsFmr1UfmMcxz546KpidBBy1QLj9vo
	 zSBOGmtg7vFPJuaLLCttTIQh5iTi6U3WhbEyk/izeq+Kj2wgYDojyOdDjE/CiyB19Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ei1iu2Fa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB178606A68F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB178606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ei1iu2Fa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so38099475e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465582; x=1796070382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
        b=Ei1iu2FawtRxzzGB6bQgwPKaMQeP5zfk3orsA67e6Icah8ewSS5bB/J8bbQi5WGlrg
         5Biy/6uYR8C3yQYgd4RozUTBeJAWLj7QeCDF/eirO5+6r1/hKZUjzCD/mIjtLgUxcFEK
         CglMk+9Yth8FGsUhcFSHQdZT418ak3Hr8sGYDqZSBguH5877udN3J3H/i2k5ouAnC0bI
         b+SgP4DIyWkZGYTjVLs1OGh36abk+kGUxDBAgrGKawr+s+fu6fd5r0zmgMd/miGGewe/
         tEIDXh9WzPQeVw1EcJP9OrkL6seOAAt/rqMtpTuxodgHV3Qm/j5ToAGTzzBgLThSwN/I
         F0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465582; x=1796070382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
        b=H48PhO9k8LQKEkoKMH8nIpUpeu5TGTLMxqzu8SLK8hSv2qFsFDi7ZB8N19aIJEDS9X
         /wyBbHK02/hzKrN8wYJS0Tyoh5R6KOhGYri4HamqiFjfAgsfqxyd5y4X6HnwtAlxKmkn
         2fCF+FFG5IzMcugSkZo9z3bGAwIvkQC09r/10/iZtHquEMRSZBPI3DZCpbZL7r/w0tAb
         csEcTTPffx3sb0LDxuiPir7eEA84lx/XZZv19vWaasgeKdf4y9oKnL7fQHq0GI1JM0Pr
         N/1dZMIPXIrgXNT0MLiRjgutPgjQz60AjRENGPlzM1csztL4+FJdki3mGuMaWUE+fMDs
         Mg9g==
X-Forwarded-Encrypted: i=1; AL+hErEg1W7godAXPNBSuUeKib1RZW3QPzjr5MAv+N99+kg6byYRe1ddZC1ulcCMC/TBwiOAXnVhY4nDr19e/sY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+xyfaaGbqjuO16zVgUkS9bO89TaBLkZgtbQnpEm6VaNazQE/Z
	KCxT+CSkPldPfjTp4r+mQyCX1cAaqywJpoavaxv54qNQ91e3zpansgo4zU2TTOkgmlw=
X-Gm-Gg: AZFdTZeNIjIin0jf6wbkwuGRXwAx0GIC0r7qMe3FChQ0ZZ5XgytrraB71jOqddjbk4Y
	NETamvWu6sPLPrvsZd56qbjXdHiiM6zBL0hEkSXPx5yz8SsroB7R0Bvdof/xOZFO0DZLFsBSau5
	9qQ/MfG7N7SZHjBmd2rFYeBgm3B2IJAC6IFN+q9M5ThE9b2lDBMR7PFpY5tJLjjKMMaA3ZHESPQ
	4p8IZXDXIW14gquMEnQEI7jXzMd0746nFBUaiKJqZxNsCv8Ve3MrPaDdLbpLAzr+rkYjsXDUszO
	gndgCF281kRBirP++AZt1CWQlwJfvpfL/7BYbsRQkihfsEaK0qTQn2NVbxv5+Ll+lAqAn4YpRc2
	ih+JPPRgNnWAtceUU/Qu0kWY82RTomfPudce+HHvs293ZAgPk+v/F7jeYY9t6ceFbydwLOZOyl9
	fm8CP8HpTAUTq9fFmEYUy2dK4SArnBjJdPf9TruBYYNcKsYEkdHp0AJ3ynt8WTHTI5yF6lDtUhj
	9BNwjivwf7sN9JHZwpmqzu/Oir/fVtAOXM7zyKIzYlLKCQCftPQUe4t8QhfbyL503tBzfi+GP8p
	ks1uHPb2kDBKeazYOTeW5H5VDv+8qkINn3ETfEHRb3ZRtHZUQE+ZHawiAn4p++po+9UBnzrOxLD
	mrQJYkTsp3/c=
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr290934055e9.8.1795465582225;
        Mon, 23 Nov 2026 12:26:22 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:21 -0800 (PST)
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
Subject: [PATCH v4 3/4] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Mon, 23 Nov 2026 21:26:14 +0100
Message-ID: <20261123202616.17334-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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
 drivers/iio/magnetometer/mmc5633.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 92a09316ccdc..316b431477dd 100644
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
@@ -69,6 +70,11 @@
  * Operating Timing Diagram section.
  */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+/*
+ * tOp, time to operate the device after VDD is valid, per the same datasheet
+ * pages as tSR above.
+ */
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -473,6 +479,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
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

