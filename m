Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695229;
	b=0v9KgAmyI1EtqYD699xTN6xZVojCPrXJSBqxcnasmsyEivxniynyE/TrVvixciOVar5W
	 /2LYyqdvrckWxoWlATGk/n+Wo3c3brMUtaqXXigu0kxk5n6eCjcXglI1MvxITT1WOvYAh
	 2jOLKWIvA/nHDBVZ9TXpc8d6RO0kKpWHmHy0lBI92Zbh/GPTCrUnZJHwjt8EQbiOaPqPH
	 S9E1XKqmSHAoVGIkp1UZoM+qzsGVMpgl7sC8bh9lDxX2ZDNMNEH36P/ZVf3zfmQZvyFEO
	 IgcdNHLLFnyF7KziEjR9bftRDAzyZRQvf1RLBLjDUb/uuu9LCtU6faX5GZnW76AwGgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ywyJ1rCUV3crT1Diyh0F+HIgqAG1RWgKj5oF/WBEKNk=;
	b=L2TRWxWs4CPyztnZ0IwMOrUYwAmzCPuI6eTpWrz9ocXQgZtrXdq97Qr3P4EqX3YXhQCy
	 pFhu9uJOEkBum6LyU5SdfxZ9i4C5asviNkPNE5j3o39hZumYYvL4rJY1PSuyAeKRC8DKD
	 0PGXFN4vdgBaDxVEWibgpbmm4GIJp1JZKjsr7smTy/yYWM3A2P9shmylAjRpssBys5UXD
	 FmWrOSkRR6C3WydlswFLa9Dy0noYoLHYdZ2epytnsxZsCTpRSEsdv9MKOp2HZGfn7BzIE
	 J2IvzU3bz51OtAdQHTw2evK5i5A1ZNTkJJ3CZT5gXVWx7zry/8BeALOmxn1WRG40yIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwQ7j7vn;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C394606A6A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C394606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwQ7j7vn
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae85add512so57231201fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695227; x=1796300027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywyJ1rCUV3crT1Diyh0F+HIgqAG1RWgKj5oF/WBEKNk=;
        b=WwQ7j7vnqPOMcAptrGAHYxqiKbA98io5A58SKFgxmCpJjzL5LXYR6Zkcjiozch61dN
         MnIp1P7FX+reQCUB3wWfP1BpIS4BtSlsCa2+Oje80u2PSbPvz1qvki98VzLK9wiTsANG
         iq60rpC8flZT5UjzoqPGSrrHtXtBzNbSZS0UTE5+KiThs312vq2AnMQxB/zJNvzMxATQ
         as9MzdQWA5JmusTLLN6drCBn0AuX01ZpC7WJFjMIDwci45owY53lbr6t521f6rr8u95l
         sUMK3yLmFs6xcfAjz36Re6eQWCdbnAPUUSzboy/xD89w3uqKHhYjDwIZm8j2051FG7gX
         w1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695227; x=1796300027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywyJ1rCUV3crT1Diyh0F+HIgqAG1RWgKj5oF/WBEKNk=;
        b=Lbt/lweGcH3OKDdXEKOfItCwQRLKS3XslyrI21/mWldyzikikrTYmjCVtx7jCqPl4x
         pcJmxZfkd7oPiqovx9ZKgDOPWSFnDEPIxQ6BZQmrc73Su/QqU7p2gNp5YBbEmqE0zac9
         kc0xNTToVxYidm1TThun3pc++XD0aE+qirq81Z9huKSYtj/Nw2l3P4iJ1ql0UywUQ2U5
         z6dmV2161WZHjrLU1dZ4z7phkDQ9mj4R8GCtm3bClIqJUwNCSf7IJ72w3ldbsEnOV7ff
         gBhMRd8AWXG0gFqFJ82a2fIfab0Sb/o3rbu/DJapRMMecQe5+xujwJ2UI1cOm11LTKrq
         fjSQ==
X-Forwarded-Encrypted: i=1; AL+hErHAtIaJ8/H9uBzQiS9XFCllTEDOoCy+hK5NpFx57Xu3UjBCCS1aP73MH2vC1r80+zLlicxklIbtAvg05HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/80dzTV7dApMO37vj0uTP88lwyetGQhdbKmByNRC3kQFRjvoL4
	5PDcJihkYoMDw80/OY/F+hMNeDqbPRJc8iZaJEhnZO0scJISKzi9p9J4
X-Gm-Gg: AZFdTZcxT0A1VB9N08vHi33wYGq86lJQVHLpSAeyoj/xKEl6VZL9Y1ltX0YRf975Pl9
	5XO9bZNEL4ZD46TuZ75pRFPCNR7Yr0lKXGu4Htzrhphvc+pm3oXEvozZa1IcX7690xuMNJuErpA
	27dbOt5c7GA/yQUE92gHYLkEn2DwxsI7ySj97gwXba8yde8qGTrFmyc2h36f1NVmGOuYqnZObnp
	OtU9fRZpuFam74CiW9V+aJKo9tW1aB9Pcv5aXipexmYPwGYtx/BUHc1lB027sxiWnJC4iKLAt5F
	UvLRTnbFlaJRoBZHeg3/VX4fNFaTNvIm4lQ0Z7Eqcg6tO6fSun0UPUB5rMoLRwlRBruUTDetIxf
	BSLjmPFL5U9oLjkVTPZG9ZGXlFqcu37tr8MkOEHTi8z8/tAtVakgXTY+cP7V41e1iDgY/UaQDDh
	OGqMMsg9haEygdCTcszvHZAo0QTBznTcMpqCc2lvkEbCXo9YLAjJJMV16xlJDFp14OEApxgG3M2
	eFI3NfFjn3pACaAT92FpZsLpMavrwbH8bE90YvgLnE1Q7zgUFK3RBEQPn8BhS/dGs2b3GtQsBcb
	1AeZ6Sm31mrL0+3WtC0X1EhZtJ+76n4LWQ39w1k3LJpxO0im7kAHwF1/CuEcMr+TGjvihSv/gDK
	juIaKhvvLi9+/4XOo9vOwPTBuaVqThK5h3uDlX6QKdOBQ2KBeayQihLCejQ==
X-Received: by 2002:a2e:be87:0:b0:3ac:fd58:5e7b with SMTP id 38308e7fff4ca-3ae7fa6a080mr58150261fa.22.1795695227258;
        Thu, 26 Nov 2026 04:13:47 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:46 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	u.kleine-koenig@baylibre.com,
	crofts@kernel.org
Subject: [PATCH v2 7/7] iio: pressure: dps310: include what the driver uses
Date: Thu, 26 Nov 2026 14:13:30 +0200
Message-ID: <20261126121331.10438-8-zoone.rupert@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Include the headers for what the driver uses directly and drop
linux/iio/sysfs.h, which it does not use.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2:
- drop bits.h and errno.h, bitops.h and err.h bring them (Andy)
- drop mod_devicetable.h, i2c.h brings the ID table types (Uwe, Joshua)

Cc: u.kleine-koenig@baylibre.com
Cc: crofts@kernel.org

 drivers/iio/pressure/dps310.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 72f62a1aa3ea..74d4111b5e29 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -18,28 +18,37 @@
  *   c0 * 0.5 + c1 * T_raw / kT °C
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
 #include <linux/devm-helpers.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/jiffies.h>
 #include <linux/limits.h>
+#include <linux/log2.h>
 #include <linux/math64.h>
+#include <linux/minmax.h>
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

