Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601334;
	b=X6JHcXdJf/IAMRu7kdLk0Yo3vdLD9tBetbNNzj8cZhunJaIXAMiXCPqD7lMvkUC/uXrC
	 aamt+eYBdg4jju8WRMhSMurP2xJ1qsu4TBjHVUci8ri8qa49FbAinu3ge7bzGNJ6wIiPZ
	 w7HvzELzyhXbrHd/Iuks/eAoDXtk4d1eWNwu8AyMAYSljs7V18sOWs0bHPyYcJEDE6wgy
	 /NMMKRmn9XYKvcFvptueBxaE02q+dN1P//chvKeg9COkKVe5GMuzaIBQ14WY76LvBIlAR
	 YqvQm6XRwHzGTrqtU7ny7fZqCADJAoE/BFRQWBLP2/umr6GVKuLpvxLc0r2KQ4fxK6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=pd4p9Qxa5In9+g0/BQUXMOqoumqz2LbPkIrCjX+8XUM=;
	b=q5stXApX8SKLPdxWpp/t0CNj/odeoO14WXm3FrIcVr2SE0OdG0t749f/4c7ARdYVA/mB
	 Q9UpnztaW0vrjiDw0nFsvod8++lcZv7EGiCB+Mni7z6KIhN3P+fatdmRkNzAxzZJ16ACL
	 VDZUCEQU777WDwAcqa95C6MVAe/NusFMB3i9dHL1XHAaEs8ZJajTH9CzhuaInDUPiqYsK
	 HXSJhKVFhJCiB4gNoBZVmKZ3wBJHrnNudp3sCjxGo7t5v01zELD78STK6d0DxE0mnwsUJ
	 Ej3VWxzVxYAhHoXWD7L2xi2kKm1qbTMZFo4MugjCq+xRUolRwiJGWwy32QQikGAaBlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnXcrLC4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36703606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36703606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gnXcrLC4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a42b34e930so4821897f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795601332; x=1796206132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pd4p9Qxa5In9+g0/BQUXMOqoumqz2LbPkIrCjX+8XUM=;
        b=gnXcrLC4UV8y66NqdecdJRF/U3V8p6Wl0VxduYa1e2L2SFGYK2MQge7sf8kS3GwtMJ
         NWsB7iqA6pZ6BusMcetcOHELyLMVf7gEVu0lg7e2SJ7NpiicSG0QmpIa0Gw+N9iheFuC
         ieKwC+IlTydp9yU8+oaCW8+6Wc5anueeo3W9iprvK1uswp5+ZwAuYVrKpZCaaAO+NXet
         z6KMWlLbllQNTNHFUFKUsUrgkMKY+DlKPMGHGkWdm8w3/YfLhB0dWdEAsaoCowmAeoq2
         o7IhogI9+TTnlL8mA7zaj18w3VFD7xDqBUA97jwOvu9ljoECWSgdLillCwgOSWSLznxA
         Kptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601332; x=1796206132;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd4p9Qxa5In9+g0/BQUXMOqoumqz2LbPkIrCjX+8XUM=;
        b=RBy+P84+I2K8sVq1uamQlPwW95dOg+k8HQGMH2fgzukxZZw1Wa7uiVunJr+AqhDTiE
         NwHO4rO2cYmmRIuB55SqA72lsLQZ288CRQxRq17d2vQUOyZiTXI8DGqmtCnlYv0YdmrU
         so5FmQ+TI/9M5sbB3oJ/XFgqm5HOfQErNc4e0oZBCByiyYmwjTQ9ODzsqINCn/xfbZFQ
         TBnDsXPFi/g2f5lpG2hh/GM8fVXKF8YLMjcu3ApmBAgdjC6f7M07LqqmyIjrVvLsfSVw
         +qKwgyZPZ+rUgJ6TWf1bI32NxzCAb9GOKV0c/F0UACfJWrmSo25Ir7dRyceltaSshEvQ
         v3Dw==
X-Forwarded-Encrypted: i=1; AL+hErELQT6ERzHxgKNnkT+gbsdhIG9LiaVrKk9jxfAxKxAkAhe2eIILVl8CJUBo2cZTVQALJ/6NtVx+a5XVG5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+areJgagyvNbl1SDW0gMjI26V3y+PRa+ze9IHKgfkwEoFCZZjl
	O9jhI2ev60NZUxLR0xiOjbomoRo+9BuJauql9zBd5fjk1XU5AyJBLxJV4k5V5QXUjv4=
X-Gm-Gg: AZFdTZdyFcmcUnPexnjwhM3eJTUNK7PkolWj0VJwSQNIbX3gSHIlTbGQ81HpRjzWsIi
	zsps4ECiYDvpml5at0J9MVJ55ohg2BmkM71lpYzmEgPO72LSyZ7s3NymxYrTHbVMTMnqVu7mOig
	qdhcGZSWrkfvKCIvakEktgy+YL53VBCc1QXgsNu1IPTqaZk3D0hxar1zZH+UOcLFmUsSQxEZB/G
	gNMCfVqiNp1Ujd9sRSqZW3I7eDqeeYnmO7V3u8/MOXGptGSaeomruP81d9FzbPNDkMM4TfaH9lg
	p7OdPaEREcVCm+9bHI9KYih3MR2EytqAyjVvKwxdg1opMSqqUvCLA4VkT1heee5GrREza8AgcA3
	4b9O/GawnEZeNIQZrZJgDWSaDKL6oj3UslmMoyx0PTd4qXVHisMZUa2uV5nJvvBybZZIOBwFL3c
	zwgk5jn2UZz+2/nO35+xlmf5W5oPGiruZaejTiOLfmawDP46g4oK78zsxsQHReks/uHBQvNt8gv
	OGSntN4d5YYqHgh7CM7lWrBx4k7xRaDx3oWXnrXpBv5Sz8nVkTcbEUSoEMLkbllSSvKtpXluqjo
	FS6e6XAw1NNKQeCLr/K1uKtZIygS5VwCjS/Ex81dT0KPFPti2hdEUeVcHNpHdzgglaChGQIPBdY
	azZREJQhLLZQL6ZYH
X-Received: by 2002:a05:6000:298d:10b0:492:9630:6a7f with SMTP id ffacd0b85a97d-4abb5db7829mr23954805f8f.55.1795601332561;
        Wed, 25 Nov 2026 02:08:52 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4b8e564e39asm4042375f8f.57.2026.11.25.02.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:08:52 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Paul Mbewe <paultyson.mbewe@ziehl-abegg.de>,
	Joachim Knorr <joachim.knorr@ziehl-abegg.de>,
	Martin Fuzzey <martin.fuzzey@flowbird.group>,
	Luca Fresi <luca.fresi@bithiatec.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 1/2] serial: sc16is7xx: Drop usage of <linux/mod_devicetable.h>
Date: Wed, 25 Nov 2026 11:08:38 +0100
Message-ID:  <000a0bfa98500f315a49fd4780e9b4e193f12840.1795601260.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795601260.git.u.kleine-koenig@baylibre.com>
References: <cover.1795601260.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rRCGx+2Zzp5KY20/ogaPkQ2ONt60PW1toE9sxiV9SRg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBrOo0C/aWXDpbR3nOqyoR/XeK6RdbNl+m5ieC hRpom1ZEe2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawazqAAKCRCPgPtYfRL+ ThWgCACX2nncM3OEtJ3WHAKSpeO6gklZpEAZONEEv3Y63bqfZPc8JAy3UJYQY/qIKWWhZX8zs// 8bL8Ts0v/wCdbA6zb+6cRtO298PlrqAhoV8dZqt3Y+K+MgOpdvatYQQLRzuAXmsJsEsBMuZrEql X+kH8qejifGsnIVkm0hEN+q3K9IOyV1U4VPVYdZwz1Y1XSKk573KElD7zhaoqerTFAHjYhTRW9B WbV2VYcjcc8EuV3jkb63rgY65teKFnxyMaEePJRa9S1vVbR2u9B/9ajp9RDVDqUPQsJi8JKlbLj Ufn5Sewx2YCOLmeC6MG0OLVNe+J9YM+Aa13X0oWQCCt/6NvY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

drivers/tty/serial/sc16is7xx.h only used of_device_id from the various
structures provided transitively by <linux/mod_devicetable.h>.

The consumers of drivers/tty/serial/sc16is7xx.h (i.e.
drivers/tty/serial/sc16is7xx{,_i2c,_spi}.c) only use of_device_id,
i2c_device_id and spi_device_id. The latter two are already provided by
<linux/i2c.h> and <linux/spi/spi.h> respectively. So it's enough to
replace the broad #include by <linux/device-id/of.h> in the header.

This reduces the amount of transitively included headers (and thus
useless build dependencies) a lot. (Supporting statistics on top of
next-20261124 for an x86_64 allmodconfig build:

	before:
	$ wc -l drivers/tty/serial/sc16is7xx.i drivers/tty/serial/.sc16is7xx.o.cmd
	  71313 drivers/tty/serial/sc16is7xx.i
	   1387 drivers/tty/serial/.sc16is7xx.o.cmd

	after:
	$ wc -l drivers/tty/serial/sc16is7xx.i drivers/tty/serial/.sc16is7xx.o.cmd
	  70392 drivers/tty/serial/sc16is7xx.i
	   1330 drivers/tty/serial/.sc16is7xx.o.cmd
)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/tty/serial/sc16is7xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sc16is7xx.h b/drivers/tty/serial/sc16is7xx.h
index 9c584d6d3593..fb3b23ae2aff 100644
--- a/drivers/tty/serial/sc16is7xx.h
+++ b/drivers/tty/serial/sc16is7xx.h
@@ -4,7 +4,7 @@
 #ifndef _SC16IS7XX_H_
 #define _SC16IS7XX_H_
 
-#include <linux/mod_devicetable.h>
+#include <linux/device-id/of.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
-- 
2.47.3

