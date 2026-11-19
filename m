Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121413;
	b=XuJHVtsDHxiy+R7zWf8C0SkDxwTWjg8CyqyYqRA9FChicjotvMw4Tt2B+ZN5eh0qri6T
	 MsMWuw50Vg7pz3LuOsnqZUV8GYS0VFf3g6JCToiQ9wSEhDP16m2dmpHGAQk3Jkpn9XIdP
	 F3ERUOIIWCRh6FiN/Wo/Iq+c0tlt1oMoU6fRYKINeZlSraYvvYE4Bh4f4FFtXCfM7OaLa
	 WiUnbNtN1Yarw4cv9QHGaGYVEMborQZYH1rURvydPnja++b4e+3y5FPIkqPQSWfltrlqa
	 VNh/sceerPO5qRpIk3+ozgGmtpNl4UACo55VQx/mlZLR27zxfhRu6Y0kR+uYN6QhCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
	b=2mQu6Wx4dCADK329bBbVJEU0lim01yYVhjJcr1KIjshkYEr+2+blyk4vHDZrE6qyEypa
	 i6j97ppLXRACKRWCZfSPBd6YhMyFn7oVl9yK9qEd1upDw2tV9jhd4ep56Iy1VJJxi+cFH
	 0Vuqg2u2RdI6q5uHvvgbHhJSqA1dDw/mXmsXURJE1RVz/1OqwZgcPc2MIb5nwguppBuV7
	 VF5t4yktrPZcYndfJtq41q+qtYawRClFWKc43s/JkLOzfZmRCbjSpGSGFVCSklF3TsJ29
	 iMHTnkQHP4LZaM/qYaeJHKl2nPHvh29jPRREFz2Gxabty5za8Ji/TBPXR3hG21LODog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cK92y7nC;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51111606A905
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51111606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cK92y7nC
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so123453f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121411; x=1795726211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
        b=cK92y7nC6jsM2N0p3OUqA5SHQHJneZfEIytU4LRo9L335uTxu+4KkZvwTv2wJrv4nn
         0BZmHn/fKdeWgiiGZf9NwnvSu7mmiOSBzmd+fNMNs6Jv+agCPTHzpQNj2cPeZ/qHrUSS
         neHMP0BnK21Ym+aGNzGPF0wvJljHS42aDBFLnZs1rvLA8Zcnkk3LvW+7mVtODaBAtQ6L
         MWuJHJr/u68J2Y2d+MaSgUK0c7uYAtvyBkU8B7hZSbl5JtLjL6/tCF5Q7x7hIAb5D04C
         XYk51YhHzAIawLl8Ne3hQNEvGOlXgXhDDTicrHX566TUuNtq01MQeqsCA/dkvuikPGoQ
         wN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121411; x=1795726211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
        b=knxlWfu/0ST+9f3NGkd87VfTh2dAsfFo1d4jE2lbteOd3h5Q45hrp/gfixIB0zOd3u
         OX0QW+WELkkYhk8sON5VB6S50eQG/FYArHdacdQb0OUbsshDHY/JLkiCJ/A91k9u+ynj
         tBj4cs0fhFXMpiCiJ+3UyTgie6DcrUeC8ELc9fWJw6OTg4+vkdc8N2UC96M6RQqWvWuO
         ApU4ximDenwndS1hYn7HIeYfmdcjLWhANutOxbCGlVTK6yL9qk5BoSQFwPQYY7HPr+rH
         dRs4w07J+ZItPF8nHeQcYbqV08Xn0odpV6tsbz47E95Cl2lhELLVf9mrrTJQoXLS9iSJ
         DoeA==
X-Forwarded-Encrypted: i=1; AL+hErFocEDwFMrnUCLlbFAWXaq0mnS3TVhgSDbPTCywLSrSzohFPCO+qmH/iDJ+VIEpB7j6KLakZrCNQWqa+a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86W+h5iWf7hz3pWyp6B8BTyXYeCh27EWlTwQu720U++f7Buf96
	0gRWGq8dDZyHLVTBjUHaj2n+KDuetYvlbl6O7+EY6Qgmij+xvj3W3PLem6SYJvreJDM=
X-Gm-Gg: AZFdTZcbU3VizYNu2OkEcVIsE3suxTqrGGaIFpNieuFHry3JCiNKe5Lq6mAkDOUkC9R
	QcbU617DzZKTiU0LkWUpBXesiHUwW43q2NdpiM3PHKZVC4KZJxuNw0uX4dCX8FnyecCVDVkdPJu
	KKCx/dEyJdmdAOIT8YhfFzGWgEBNMwIRyxy19X5H3ku45wp/YUsYCykYZbkc1WH/TD1BzZBSM66
	l1dgzBdITfvGRsjLaSabuzX5Ge+0ayStn+n5oW5tVcfAQUi5D1OJZ2jnwZYRIRJs3Zi941d1o6g
	oh63+391fpe7mt0vSQE+7bDMbV8L5hzbgr//kv0Yf5rPUDWbmiX7WTBuijQfbo9BrJI0U/MM9n5
	AaMjRkOIfhp67BvHbF8eARbkvXWUlS7uciiJ3LLE0WgbG5Li8UMPVVmvtNdLX/cE81o8Q2UG9oQ
	OdL6o8Q951Z1McQQtHfyQYoj072ZxYiQtK6IvFHbfi8rpLX67kcOdwaiB/nP/sgb6TmfXP67WRx
	2E3QkOgQCjJDrDmYc+PmGwtd0sc4zzAetOY0J6TIDCQiam5ICzyN2YBeRln4nD7N5vng0lPIoxE
	pMz6UYiYgt7+jR3zF7Xk5fOh85RqWdfrhuYQQya/xMff7Q04V1nexR94rrVv8ID1L6irZDvyLlG
	ElgYkL+ENzXKqLL+7aQ==
X-Received: by 2002:a05:6000:1a8d:b0:4a6:7ce6:4afb with SMTP id ffacd0b85a97d-4abaab633ddmr1508427f8f.6.1795121411544;
        Thu, 19 Nov 2026 12:50:11 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:11 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:31 +0100
Subject: [PATCH v3 1/4] clk: divider: Fix the divisor for rates above 4.29
 GHz
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-1-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
PLL then computes a divisor of 7, not 1, for 5.94 GHz.

Round up with (parent_rate - 1) / rate + 1 instead, building on an
earlier fix by Sebastian Reichel. It divides by the full rate and does
not overflow with clk_round_rate(clk, ULONG_MAX).

Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Brian Masney <masneyb@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..c3f46f9ee451 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -223,11 +223,21 @@ static int _round_down_table(const struct clk_div_table *table, int div)
 	return down;
 }
 
+/*
+ * DIV_ROUND_UP() without the addition, which overflows for rates close to
+ * ULONG_MAX, as with clk_round_rate(clk, ULONG_MAX)
+ */
+static unsigned long _get_div_round_up(unsigned long parent_rate,
+				       unsigned long rate)
+{
+	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
+}
+
 static int _div_round_up(const struct clk_div_table *table,
 			 unsigned long parent_rate, unsigned long rate,
 			 unsigned long flags)
 {
-	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	int div = _get_div_round_up(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -244,7 +254,7 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
-	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
@@ -423,7 +433,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 {
 	unsigned int div, value;
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = _get_div_round_up(parent_rate, rate);
 
 	if (!_is_valid_div(table, div, flags))
 		return -EINVAL;

-- 
2.56.1

