Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729097;
	b=1OiffLigj0pXAxZyJ7RrVi/7LqscQdUNc23u3XjDQ//ilK6DUI+sRZJsGQDNV6ZV6GSW
	 dWsQaqw1y/5VgS3IJ7dQs+y+L+VwaZ4jXMYgnfSCVAYSfME+tn9X2pTyG1I5KuIsiDQpG
	 dwB7/GDFWLUinE7nmvYMD8PT1t3+/riyOyjUmhfT5k8EPiKRgBYfI09s9xQ2lKgbWdTbS
	 D6wT5qgErZ/R53TWkrZxvoQ3TJkOhOrPd1PegJbI2BBLyws3RDnpwLkaMumxhrLj9kBz+
	 5nBarzmgdDpnhKQ635MWEmCypxJr4uaeuTvyqAa51SxYYyzS9NI0CIfKYTrf21H6kMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F1pncYdCQPYqKl02KctTzcxHlBl0h69nvP+CZBv6X9M=;
	b=piTSqWTeE0GrowayPmhUGAphKcHsfi3umo9eE1HtWU61KMOgmpC/vqooxKzOt93xmBp+
	 NJ2h+Qtaz2MdBvBZ4PBj9+K15YE0xb2VWzRgPKFybHEKKcUFlYRG/KxDzY+XR4bqSsiwQ
	 l1EkN7lwBESXG4v1kGVWKTJlXe7R34KJiX+CeWIFycBI05d36otGIaF2Ha1ciNAjFPEQ8
	 4xKipwXePmyydbqYD4NttlfJQDeu77rL8suujs9jeOsXguwCxv1mYqHx1BAOAgs9viZvu
	 alsDa4UdSe/kA0cYiUenXcQxFcnICNPhRNC3wlUqJfvVBPpfUS46z2Ye1kjdFELvdZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCd+6YUJ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B312606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B312606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCd+6YUJ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so2925010b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729097; x=1796333897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1pncYdCQPYqKl02KctTzcxHlBl0h69nvP+CZBv6X9M=;
        b=LCd+6YUJ62QRUVvAFAIUT7r7G3Uk9Ecc4qbUzB7gZSXWlXa6KVDFoP3jLX23Iuvf4q
         nxjKHwzsH4R+f5REozi+DNgz0a/Sz6O295rSeH3Ya66cqa+lYqdiPDeQN4q6+sHfXMGH
         p0n3i3vrATHWlxgF8MNGVfZS0/juyYTy6QDYRJzhfta8h8crAE+4R3Eyn6CDlQK1sYdY
         ldi2Er1CzC7ldyDez+UnckmxPQd39OsArBzCklf0UiSvdNEbFZXqSRqM3otmc9jO0WGX
         xvKjo4jiFoNnJT875sKyFkixiD9E+bgsncGWLpccjllwjuBRgP9m71MwSWthGtZjMJRO
         zZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729097; x=1796333897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1pncYdCQPYqKl02KctTzcxHlBl0h69nvP+CZBv6X9M=;
        b=YbxnQsY8ClkqCokVSykuyBatSIMZSjsmGmn3xcQbjXE/tToaA59+WhsRneVwompeY5
         vyjYQDdqB2eOB0myTrFNKoABUGLv/9QA8+KXeYIewp+3Ul4q3Ghs/ecdEJllu1jrOkD8
         wfD27GGvgdNwQmG5PNlzzfhrFNcPk4BUjtPesTvUo0FevVuG6xlrzuyxRDWicu4aX3tS
         Qhk41V9Sd3ocQuKT1Q+jZP/FtreuQiDg09Q8Ehs10a2xxP3xirZ0U+g+IEKy+KqnfI9k
         qFTZUOonuwCwXuKZvnTMYuViYZRkyaJg0J9YGda6u6tQ1W0aP/AbzbGUZLvoFrm15EJw
         X7gg==
X-Forwarded-Encrypted: i=1; AL+hErGvym0z+pIdyAV0L2Z92auyMcHI436NS7QwO6tpiPH3JiFaD9kMbXZXlwNVyMeMLUeU4u+6ixn3PHFaHDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GXzmSn/8cUdt45po/wYk8DrnyfXyN8FFS4GdpJHYvsZYO0iSS
	X+eOXfsIwzTmaTErqrhCRrKJD5RuQGN0clvAYOoLKf6poW1VfadFJgJL
X-Gm-Gg: AZFdTZdJ/+62eDxV/AC/JAEIjENYW4sfNhnaTXP40sQ9iBS3/j+/nsdrIhMUFB4YZTC
	Teg0tgO1x2KyX83o1d+2wcwnFLhtRzSrmCfXyHKHzjujwapOZCryCagg34IUrB7H1iMkEErJYSp
	wL2ZvXb2jIfh1kRvxm0q8qB1jphpIEGHEc4HyempmSp1WtWnmgEKvb+Jv4L2pxkysbgxRi9z0SY
	zVmKAXH5YOkoTHTGZt0MQc4kVmN5DuWDM2VmddhjqSkVRpcQx2nHjyQLp9MP7Obq6cgLFl0alr5
	NmSHCnnQoiVSO3+Sv3vByNcHESgks6vThv7bmlKdtIG6MnQv0Z5NdDGnL1+/emUYmfw9UCLSQU+
	XIrQ+hvBxHK1eVLXUrj8uNciQiktCiRojNIKci5dcHlwwWfc0s32D7vbV1t/8ccGXPa2sVQHVUJ
	ud5dRjjtsNah3nqjohks4VvI43cPcijmD3ozWG02V9sig03u/pQPtumQInUzctoCedphoEveAfG
	7XZrgsQXu2GbpgOkCkJev8qvWlGwgTXdtRB9++nC57dDF+F5fYwgQ4w6w0fIeRoN+DOXLbioXOs
	bxspb0+wFRqWrMSsNbR73pLDpHSfqIyYU4UPizOAgike2l9inxkLej4RLrLgEb+blHlGnfV8Sqk
	6YUeoKlr/JK5evRwPMxYK2GqT+lZwUBKzlpyNGEWxDGn9uwioJ6PBm05bAXy+YjR4F9zyYqaTlj
	she0qCRZemTHraiw6Q5lTm1Q==
X-Received: by 2002:a05:6300:408a:b0:3f9:a6b6:e184 with SMTP id adf61e73a8af0-4014dd5f981mr20640395637.74.1795729096794;
        Thu, 26 Nov 2026 13:38:16 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:38:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 6/6] iio: proximity: hx9023s: use plain division in get_samp_freq
Date: Fri, 27 Nov 2026 03:06:51 +0530
Message-ID: <20261126213710.1047676-7-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
References: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
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

hx9023s_get_samp_freq() computes the fractional part of the sampling
frequency with div_u64(), but nothing here needs 64 bits: KILO % odr
is at most 1000, so the dividend is at most 10^9 and fits in an
unsigned long on 32-bit as well. Use a plain division, and drop the
linux/math64.h include, which has no other user left after the
previous patches.

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index c2718723db27..98b65a3e69e1 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -18,7 +18,6 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
-#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm.h>
@@ -702,7 +701,7 @@ static int hx9023s_get_samp_freq(struct hx9023s_data *data, int *val, int *val2)
 
 	odr = hx9023s_samp_freq_table[index];
 	*val = KILO / odr;
-	*val2 = div_u64((KILO % odr) * MICRO, odr);
+	*val2 = (KILO % odr) * MICRO / odr;
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-- 
2.53.0

