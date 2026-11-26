Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729063;
	b=rTEg+n7anCw/WJ9SJiFVSPUg2cJpaM8hSZA9cYeX8W4prA8X9Vto2zZTNR0K5YHGp+jJ
	 3R/rEdfQ8rFuLYXpqFDk7Zjtb9tdnk4YNNfF5rEnmgZvgDRTfDpOiu4pXN0aPbvWbbE3y
	 FUyT6ad479qzpKMNiaeGiiYMPhHtxuLQzJPJrUG+a1DoGB2JnotOkIOLi4hOICqEW7CT3
	 r8dyYaNBNLwNDvcTbXT+ErE3BA+C+HpduPqu/VBUCkXfqjBN6R+TMsffN4ASvr7QNVjth
	 zlEKJhmJIW1KGkDXPEvqS5jTmi1wWi4uQKogx1x0qgIM31vK7bzJ9y3q3vJYaFFQrrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1nqKyPhYmsBm0UGaYPfH+vL30mlKGB4MC7xPzvkwra0=;
	b=pRzEwssoANQsYDkphzWCKJTNIH28U1qUG7y3knpPZDZgRQVnWcgWWp+SUYcFAyxJuvMe
	 pBNqyHOizttSICODnrGpsxjlJayR35hpHQeXV/UY+vRcal38bSB1OG20t29mRXll6RXWw
	 3GRkkpxsR/qgZLuJx2H5UBdOeiaPmE0oO9GfzG3B+jIJvAjC241706WLVDNNudnk2Leej
	 WSZFRF07zHryaxzHr6xoewVkOLCZ/GLzHO4JpoWqY3d6Mb2w4V0Ovp0BzxX1zNkixWvv2
	 SJBZ0WMfExh0Aww9hxzHkCFQV63pGfea+bBUXmmyAaa+ORgLmUu2OXrKDESQzr9mQ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FRwF3d;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3449606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3449606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z5FRwF3d
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso4283601a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729062; x=1796333862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nqKyPhYmsBm0UGaYPfH+vL30mlKGB4MC7xPzvkwra0=;
        b=z5FRwF3dwle5SPubKZH4G8lrWhJeHFmUdtTn8YMPTX/Q1oaRHLRyMvlydU/VBTNLjJ
         MUA2hbq+49YtdHI854lVowmOVt5hAxPQohiPua3PUbNXhkjBil33Qp0Sg3t/WhrvF03z
         Lm/Gdl+c946x9bCTaSwUMn8xjPXYxUQiGycloIT7wBlAgarKAtHlm2OBvKkZjzSbjXlh
         uiX/NOVoueRb6MVqv0WjX1m12JJIKkauOGHOHltn2r6jTfghUbi8m8CqvpuArrj0LWj7
         NUPuBs2CMpdFCU4IIaaulGQaemqZLo6SyTfOl/oo0p1HtG8au/Hro2qU6egB25KnQndO
         VTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729062; x=1796333862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nqKyPhYmsBm0UGaYPfH+vL30mlKGB4MC7xPzvkwra0=;
        b=cFEsFSdHlsgdNM9nktWy+AOnxtJiy/VafAUZG+dMd5FMXcmStvUYkEFt2xjIMqGt5v
         fhK9xrGqM1a5F85RybJalHCvP8+MZaClW156yGRqAnbTWRkf4SlqzI5bEQLmd8dAGNKz
         i4D3M8VTUC2Uc8yPzQ8mNIzWF2OP4MqKflAEZTSzLY+DJd7wMf+4ZC/8ZznHHLsvgYKv
         kqFSk7bqju0d/4kd5OgmuuSi6aEwyLYvyKCQrdkHQBHEpJV+86q7HUPEJyXgqg91G2hi
         2w5OkB7pLawe06ymmGMzpK1bhwd5ZaKmE8Gb53/iAKMTn1jiFhApVNtPnFVtZS7i7/R+
         vtQw==
X-Forwarded-Encrypted: i=1; AL+hErHnM8QoIgAy3nDAB88Qa/wZpmuxwIt3+/PR//il49hI6YdSZDmLIIm136B9TTEzb3wmGTGVhWSG4o4j4AI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySVkdc+NpXQbqJWLjXEWywoeRpfh2tlGgGvrZ4WATBMmgzcot
	lRm/GHybvVlIlxQ9r6tYXkqbKLD4VJdJsLrXW1R8l3PPINC2v7KdOzDB
X-Gm-Gg: AZFdTZe0jaQv+RTcwUQIgOjwWFN4+zLGpOHHgMuM4nCGZqj/uuNHtjo1pa/3H+2Zgbh
	TOnlDZuMWWopjIq3/MJBGAHswweUzfsIAlci+G1MJLhznaElMm1zp/0IsountaHKJvCLJKCU2qF
	ns0sq3F83uHRfExz9yRJc0nvn3juXJHjhxDlRlLa3KWHPM7YO6NeScSkgPZukD+NavInWmSh8XH
	uxU1An1PtEDYRv2lGJdX7Em0p/2nQgg3ksOqswVVP+UGHiPU3jsCf29sOLwXwr9Zv/8e/L+z4t5
	UJvFy53rBThLNQK9CzVdgIoA4zvA2Xa2lWSImopS9+Sbt3I2LmMBa2kODQ1INgPeKjf1Fo+SMGn
	RDaL6y7s0Sh5eLOBjCfNNGjzBAY7sIZWAnykp7mTYdRcxtlJv49TEQVzxJO/gRQx+E3xe7buFms
	q2AopZWEVrtLjUHp4KJof4RYjXZsoscWIOQ9W4mCxcI9Sx+Acj4LcZanJxb2FC7dHSqy6/saZHV
	iuLdn/p15L8hxbedc+VyrUoU8/CNi7iHgf+C8xRDcXwxJmn5TYwcbR42JfWmd+/WFFmDl9iSyw3
	vak1PNGOjCv4ZRUv26bBO7RUf9mG6AwZJFgiJ+FdLl7/2eom97hvZD46sqSknzw5lecb6Qs9Yj4
	vDbKSELLcQa9BwFrZICm+wfdUDZOULklXxPP7efz60s/DGOpAJBVexRCVSzT/zDJsa74XRaKgba
	6CT9xZJdip9jU5T/bi3DxNSw==
X-Received: by 2002:a17:90b:180e:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b41c9e4a2dmr22048568a91.29.1795729062277;
        Thu, 26 Nov 2026 13:37:42 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:37:40 -0800 (PST)
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
Subject: [PATCH v2 2/6] iio: proximity: hx9023s: check the sampling frequency index
Date: Fri, 27 Nov 2026 03:06:47 +0530
Message-ID: <20261126213710.1047676-3-kapoorarnav43@gmail.com>
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

hx9023s_get_samp_freq() uses the PRF_CFG register value as an index
into hx9023s_samp_freq_table[], which has 32 entries, without checking
it. The driver only writes valid indexes itself, but the configuration
file loaded by hx9023s_bin_load() writes arbitrary register/value pairs,
so PRF_CFG can hold any 8-bit value. Reading sampling_frequency then
reads past the end of the table and divides KILO by whatever it finds
there, which may be zero.

Return -EINVAL if the index is outside the table.

Fixes: e9ed97be4fcc ("iio: proximity: hx9023s: Added firmware file parsing functionality")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index f5cd31a308c3..030a6265f896 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -681,6 +681,9 @@ static int hx9023s_get_samp_freq(struct hx9023s_data *data, int *val, int *val2)
 	if (ret)
 		return ret;
 
+	if (index >= ARRAY_SIZE(hx9023s_samp_freq_table))
+		return -EINVAL;
+
 	odr = hx9023s_samp_freq_table[index];
 	*val = KILO / odr;
 	*val2 = div_u64((KILO % odr) * MICRO, odr);
-- 
2.53.0

