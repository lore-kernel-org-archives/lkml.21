Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471629;
	b=zPYCKsj1mYEMB2kM4Lyuk5OhxLncavI4OKy+ljRtAsFXmLQIiAo8vORYuXEk/eL6kQAE
	 iFp0io6WArQeGwbZP+VnGO30OAFnjcyEuHEfuJlPcGVvxeShIIg3pDdaIz6tXDgZ0uztc
	 5QLkYIdN6CXUemBB1kVx7o3td5KK7/kiGeJUukwJ4/rYDTKPhLU0rNgXc3lzPYf8GgtDB
	 EcmfTtVQqdwi1ZoHHDCng3rJtmYINPiTElVgXZzMiKum6QW1r4FCLisxgKuqKdR1Kc2Do
	 V0r+9YVrhNribnMdd9U4odOrogDWrF4MrRZ2fldJYtRCINeLo2CS9r/DBK7Fn9veDbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qIMhjFwxcL0DmsspKzOZjTfn8gizO436jmGNqizsDvM=;
	b=3pM/C4wjxPcnJoQJN6KfYWIn7WvH60utBs12OPTineczUXikThm0EOmjbimh4POa0rdL
	 n1pxilFyS5ki4R70xLFblDsqL1iJkZj4EK6pxWEW6CywtaqFtaZYp5bZurx1PdeGc8fGo
	 104O03H7oQvtviKCXPvXC63XVwe97I2uYe2aWN8f1BrM/uIEWSz1sQ71USyvMlYIUMNL4
	 2YcEp9nLjFpl0x56wYsBc3K4slifevP/cLwHemkNI8VoI//D4iM6cNPslXAFO7OWi0K1L
	 fr+NSXbR6DbGeGHO1tmMR8AqOX2uFml+7GQn5d0BVIRV+ZRXkv1U5DsnTDOHWpV+HmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4HKUHhM;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF389606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF389606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4HKUHhM
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acef9307c7so30445101fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471627; x=1796076427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIMhjFwxcL0DmsspKzOZjTfn8gizO436jmGNqizsDvM=;
        b=x4HKUHhMUI2SEPUgN88XOyPhLfyhpeJOY2J0LP2QrhQ9MngCUEd+JeV1bQOm5umVZI
         L1+thJjBwKAQfdnpoKToHkQtZcEf/shNLopEXnFfvJXmC75O5368Ry9ZMi5tkYALfOco
         Ij0e00CYtH+etSyOG0hF00SQ0hNKVg7/W5+nUHV648q59yKQfV26AZNZXPTnE/7+EF3u
         NkI+jBuuqXSqfUWNr2J43uA5xaEDjSP1PbgI9l2db+lDz4mrX6rkw3+tcPsfgUrO+JYL
         02z8NtVi3VS8znx1GaFR6woD+AEHrLrIX2Aa9zvKidgqOFS3mD3xA8C6JB2mkeLIL4ES
         1eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471627; x=1796076427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIMhjFwxcL0DmsspKzOZjTfn8gizO436jmGNqizsDvM=;
        b=Z1KZs2LUwdiy80iT+SnUuESmLx8bIVMmlCnq5j0u6l7GsEZELA80LzV0LgsV1dQRhx
         FlwcPAytCSHLhQKBAjuzTV42sDYDrfZMRHJTxujE6Q5GaVOB2yag80X85WffF7tFhGle
         q7YoufHOW0QUykdBvTeDaVONhDcO4Bz/aCxJsSfhPERGFXCjcRT09CwbiIZNKvCpzomv
         xvEHn9mns5fawM1o+8EKWn2905DAjv8OkX3dRueCR+w6rIOv2qBEMDNjHEFTtGHtuV5D
         U/kDM0jgbf+fZSqnqTfQ1S+2hyBFx5mQf7Y2HHv7Rx08cLN+1tEu0CfHgJ81oFoX26U0
         vjBA==
X-Forwarded-Encrypted: i=1; AL+hErGTbOuFGVqY3f0MyLGIka33NLtELOcyQe28+zBmps6lBhn6SK5mUCQv9rqMq1ZHbKVhwlLSw5JeSNw04b0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FMFuVccBDcoDSN3iviatKto+zX3k4keLgRow6xbKkTBzjOz57
	o0N+g/NTv8jf70YBs487UBXqi8NXj4LmgBc/ra7ohVkAHRvoHdDmHBDL
X-Gm-Gg: AZFdTZfyjbMjOyyD75js17g3SM0TnqSccgOY9bhQbfY9BdTj6ZpU60ScJ/ugfuiVgV8
	ge1IKVfhPE58b6OJKgE2bjdd0caX+QGT6wPgUmtnySaxgRB1dgZSTd23K2O6xFGotr/wTNS+kGy
	oL5vDzC2l8Ch7bsBvPkLmL+mWgjAAHHPjGAudmoTZrzEbQ2YtJ51egboHZ9g86E7DNugxCzOEaB
	aiBwomhkBayHJnPDypOn+n1GWVji0UTjipSjyK7Tm9CAhNl+5LuvDdoIjhXBkl3lZptMDxbbJtR
	HMeAeZU2r3bsMjygsiRvK6QK69LkcckHJQammGmKEvdSa6rBML9FFtPGROxd7xOaSdEgJgykG9h
	cOZ2s9kUdoAs16ze9zFfaa941337CnPnOf/5ghQIITSRsmbna91YDdDao5xyrKX+ljG0LIlmSNj
	Ji9V9xMMXfagfyhTj2bGQgqrfyrHOXi9uP0S1nUPLB5aJG2l3m/qTIi4FVFCcu7gf4aK2cxK5oU
	KT3/yxvdFb+/AoyeUmQTfUaLmj42P/SowOQbXwuJFwqRJvKcBbpHgFLlb76P1p2toYJpTzprBke
	csZaqvYtyvJEtKJ0Sp1ky/JKjYb8vG/0PPOqk+3p1I9MyJHY05mTTgeuBAo3jbGyF0giZN7eDXk
	jt21D5lukbw+mYIRToKzZJWHgvA0dPgMwNX7pgQ==
X-Received: by 2002:a2e:a98d:0:b0:3ae:7eee:15d2 with SMTP id 38308e7fff4ca-3ae7fa63ad1mr37899791fa.18.1795471626898;
        Mon, 23 Nov 2026 14:07:06 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm34272021fa.21.2026.11.23.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:07:05 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 7/7] iio: pressure: dps310: include what the driver uses
Date: Tue, 24 Nov 2026 00:06:49 +0200
Message-ID: <20261123220649.36887-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123220649.36887-1-zoone.rupert@gmail.com>
References: <20261123220649.36887-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include the headers for what the driver uses directly and drop
linux/iio/sysfs.h, which it does not use.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 7581ea4c99ba..fd17fa38e9fc 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -18,28 +18,40 @@
  *   c0 * 0.5 + c1 * T_raw / kT °C
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
 #include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/jiffies.h>
 #include <linux/limits.h>
+#include <linux/log2.h>
 #include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/time.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
 #include <linux/units.h>
 #include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
 #include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
-- 
2.43.0

