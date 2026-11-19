Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121416;
	b=vbZ6NoGk1HFABfxBR2n1TUrw3BGKEQ3gcSAfoe0l4jcUmVGoDdlvQjBQONYSxP8ShKr1
	 EZvEWWpGubn+1S3yXzP4e8JJVOJcjFruzlPb+H0nOloDLNWAmz9JfU9GqAe6RIP29USGT
	 48zSztyNOq4peHZoS1n6oG6dFRWh91NJSWUvJnajRi9HIOHlkUURqfNU9hJ4dUaNCzTRp
	 9FR9+5evxKYFdZ05jAyEKndqBnbtHBU5Mo+2dqn/L2h284UtWRR4cy5HOL+NIuQTAFyV7
	 kSlpxEuJkhix95icFAdJxRJtE2hf4bnYBOUOQ4zJy0hf1euTGQSKfNMojeixNBWBPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RaTkw3BKVxfi4dVN9Mj8xBNHuOdM54oPO/TP0oXMFHE=;
	b=FVpTf54cBXfwh0R0f8U4F72nej0OIEWQcwJqYGkqmJBAm38JBLN2SfTK6gDdzJyqX0Ib
	 MYXIkkZEBcBhPDxqmUfXn3rpA5rQOmSj+ebcqvo3fw+RhnMgraM+9iZLU9ojSQrccYpdW
	 sM4e1fw2JiI9JCtZClxj0tow8h7TRMnVmvaw8mPJ1UCVHiaq4LIxFjan/lKteo/qT+W35
	 Y0+vvr3oJ+F+/PaHZiBIb47QN1mWovJlT+Mh90+aQ/rNsGW6MbmXltAAA16oIIZeHbOFa
	 +U5+BghcbDGviRtU+L5TQMYHYOJn3j1CSRgOZuk+Cy3bmXtJzmeRw7FI56FDxUOqcwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SnnYDw3i;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D276606A936
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D276606A936
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SnnYDw3i
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so144700f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121414; x=1795726214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaTkw3BKVxfi4dVN9Mj8xBNHuOdM54oPO/TP0oXMFHE=;
        b=SnnYDw3irmGkolWMrPtK5gN39SvKIZz1047Bwvp80TjYz61TAbGqht7iG50OjC42Sd
         ulJrr8la2Fc2KsX6OVEgp1zbngEy29nZz5nBq3nYc9LCSXmA7FSauaTsfTtqHwPJ13k7
         HSQB/OdZ8D2Ij2psQmWThw4yVGMsTTsF4vwmApvrZqXBTGwJkCdSA5hw5eMexYi2Dv5v
         RyeusPmSZlSFlQT7iX3VNl8Q/hW0bdgxHHgJe2Gkcxevnxv8ZwgcQwGgs5XDMxj6Fk4w
         XXgFz4h3U2hfUYnnSke8G/tHuuhsqfWk7Ir3WVQ7kh/g6KcgkNdHlxXSXIJF4pbzM6g7
         NgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121414; x=1795726214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaTkw3BKVxfi4dVN9Mj8xBNHuOdM54oPO/TP0oXMFHE=;
        b=cEfsH0r387i7qcUnpiDf/vMCvhKKAcGT008HUaTcpbd5BBu7C8blj/90PBrkSCMveZ
         v+Dpck4o5KpTySEejJw/QgLJNZV7x1/LbbyWY90LsjrUl09PNWwevn7bKLWLjkoidyBY
         F0x9j15msxqYN2PY+rZJcFkhiPHN+ZsD2cmmbZK/tpo1K66IKNV5hfpN2a+YGrfd9dBc
         0oUs1eu/qGyodqY5W1Cpoa/RHMwYcDymxSKeoLONKPpCkbTEvI+mABJimXgjQjDLosMU
         z6v7eBodm07k0BdBaswO9LZCloeeoKpvUMWvENchrPQiIBzo7Agf0MY7Bf5qyJt2AQDO
         vZJQ==
X-Forwarded-Encrypted: i=1; AL+hErH3h8GEgIUmY/PlfYmTsnRRhqkrvC2frYBVX1CHCh8qM6RYxiza0FAFDqVPIr8XLEub3ZlNjASDgxqPqjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NdxMRhJmC3YSQxQ1qKUIugDhpMYFJnQ1v8yZSWJV8qhjX9AGl
	2UlxLj6Llb91GpiIMyOP/AoV4Xl4skRR9BqdntOlCHylSSQ7Dc3+nwX9T6J0uZh271A=
X-Gm-Gg: AZFdTZcXt97CAE1Zloi+oJHzRxEwePkufcUPXVLUa94FludbT+WpaVqk/IT2UW0a0Oy
	OlQqTDbx8Rxg0hkojm1hmb+/3hobC6LwbhDiCPv3F6RTwNsRYPinPCtuztdvFIGUE/o+faJhzCv
	6sJPTsDd7kealrkYDr/frCZL0/CjxVb0+WMrM4Cm3HrSi5xuUU///spy/szD0PwBw+soxH5vnBl
	DsinLy1hwMoXb6oICe05TVRjvqk9WZgUhsOd2soKQt1w64rmCOu5XbwQGT1BQmlHV0/0Ndoqgo5
	IUolg/X27rIsJ3rDC6tDGoa29JtqPiNrqkwvlZoYPub6K4RTZyartiEzLcyYkO2Gm+HQy6yHTmv
	XZgB0eySTWdnDYcJIj5yw6rILpjs8sUvO6eE2/2/iEky9paJntRTQUCTm7p4rhcyFnxVLeVJBuY
	d0VKXc/2IeAPm2M8KCmsgRtnjnjlzQl7iq2AngKuMazbmVZVRR4SHOQ3P1CxsFni7/WdOkAsTt4
	TJeacsFf5P8P3S0Rxzcygfw206BTJnje5Jq2thvLFLo8ypFwcghSKOKiiQ2Pij4NCJrxESZMiWL
	m/L7mZTqVrNegV4x92faTxhuWHD4O1FLVR39F7n0XrlQq1zoCz9Q+YXV1Merv8CfRYieYAE6fRF
	Vdv9Fms3kluhKbfzmF9Q=
X-Received: by 2002:a05:6000:4541:b0:4a6:a5f0:be41 with SMTP id ffacd0b85a97d-4abb4e6438emr579837f8f.54.1795121414234;
        Thu, 19 Nov 2026 12:50:14 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:13 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:33 +0100
Subject: [PATCH v3 3/4] clk: divider: Don't truncate divisors to int
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
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-3-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The divider stores divisors in an int, but dividing two unsigned long
rates can give more than INT_MAX. A power-of-two divider with a 3 GHz
parent then picks /1, not its largest divisor, for clk_round_rate(clk, 1).

Use unsigned long instead. Return the largest divisor when the rate needs
more, and stop the parent rate search there, as rounding up or
incrementing past it can overflow.

Fixes: 9d9f78ed9af0 ("clk: basic clock hardware types")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 74 +++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index ed60fa9b04fa..6b092ad9a26d 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -108,7 +108,7 @@ static unsigned int _get_div(const struct clk_div_table *table,
 }
 
 static unsigned int _get_table_val(const struct clk_div_table *table,
-							unsigned int div)
+				  unsigned long div)
 {
 	const struct clk_div_table *clkt;
 
@@ -118,8 +118,8 @@ static unsigned int _get_table_val(const struct clk_div_table *table,
 	return 0;
 }
 
-static unsigned int _get_val(const struct clk_div_table *table,
-			     unsigned int div, unsigned long flags, u8 width)
+static unsigned long _get_val(const struct clk_div_table *table,
+			      unsigned long div, unsigned long flags, u8 width)
 {
 	if (flags & CLK_DIVIDER_ONE_BASED)
 		return div;
@@ -167,7 +167,7 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 }
 
 static bool _is_valid_table_div(const struct clk_div_table *table,
-							 unsigned int div)
+				unsigned long div)
 {
 	const struct clk_div_table *clkt;
 
@@ -177,7 +177,7 @@ static bool _is_valid_table_div(const struct clk_div_table *table,
 	return false;
 }
 
-static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
+static bool _is_valid_div(const struct clk_div_table *table, unsigned long div,
 			  unsigned long flags)
 {
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
@@ -187,10 +187,11 @@ static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
 	return true;
 }
 
-static int _round_up_table(const struct clk_div_table *table, int div)
+static unsigned long _round_up_table(const struct clk_div_table *table,
+				     unsigned long div)
 {
 	const struct clk_div_table *clkt;
-	int up = INT_MAX;
+	unsigned long up = ULONG_MAX;
 
 	for (clkt = table; clkt->div; clkt++) {
 		if (clkt->div == div)
@@ -205,10 +206,11 @@ static int _round_up_table(const struct clk_div_table *table, int div)
 	return up;
 }
 
-static int _round_down_table(const struct clk_div_table *table, int div)
+static unsigned long _round_down_table(const struct clk_div_table *table,
+				       unsigned long div)
 {
 	const struct clk_div_table *clkt;
-	int down = _get_table_mindiv(table);
+	unsigned long down = _get_table_mindiv(table);
 
 	for (clkt = table; clkt->div; clkt++) {
 		if (clkt->div == div)
@@ -233,11 +235,11 @@ static unsigned long _get_div_round_up(unsigned long parent_rate,
 	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
 }
 
-static int _div_round_up(const struct clk_div_table *table,
-			 unsigned long parent_rate, unsigned long rate,
-			 unsigned long flags)
+static unsigned long _div_round_up(const struct clk_div_table *table,
+				   unsigned long parent_rate, unsigned long rate,
+				   unsigned long flags)
 {
-	int div = _get_div_round_up(parent_rate, rate);
+	unsigned long div = _get_div_round_up(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -247,11 +249,11 @@ static int _div_round_up(const struct clk_div_table *table,
 	return div;
 }
 
-static int _div_round_closest(const struct clk_div_table *table,
-			      unsigned long parent_rate, unsigned long rate,
-			      unsigned long flags)
+static unsigned long _div_round_closest(const struct clk_div_table *table,
+					unsigned long parent_rate,
+					unsigned long rate, unsigned long flags)
 {
-	int up, down;
+	unsigned long up, down;
 	unsigned long up_rate, down_rate;
 
 	/* No divider goes above the parent rate: the smallest one is the closest */
@@ -276,9 +278,9 @@ static int _div_round_closest(const struct clk_div_table *table,
 	return (rate - up_rate) <= (down_rate - rate) ? up : down;
 }
 
-static int _div_round(const struct clk_div_table *table,
-		      unsigned long parent_rate, unsigned long rate,
-		      unsigned long flags)
+static unsigned long _div_round(const struct clk_div_table *table,
+				unsigned long parent_rate, unsigned long rate,
+				unsigned long flags)
 {
 	if (flags & CLK_DIVIDER_ROUND_CLOSEST)
 		return _div_round_closest(table, parent_rate, rate, flags);
@@ -295,8 +297,8 @@ static bool _is_best_div(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
-static int _next_div(const struct clk_div_table *table, int div,
-		     unsigned long flags)
+static unsigned long _next_div(const struct clk_div_table *table,
+			       unsigned long div, unsigned long flags)
 {
 	div++;
 
@@ -308,13 +310,13 @@ static int _next_div(const struct clk_div_table *table, int div,
 	return div;
 }
 
-static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
-			       unsigned long rate,
-			       unsigned long *best_parent_rate,
-			       const struct clk_div_table *table, u8 width,
-			       unsigned long flags)
+static unsigned long clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
+					 unsigned long rate,
+					 unsigned long *best_parent_rate,
+					 const struct clk_div_table *table,
+					 u8 width, unsigned long flags)
 {
-	int i, bestdiv = 0;
+	unsigned long i, bestdiv = 0;
 	unsigned long parent_rate, best = 0, now, maxdiv;
 	unsigned long parent_rate_saved = *best_parent_rate;
 	unsigned long target_parent_rate;
@@ -326,6 +328,10 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 
 	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
 		parent_rate = *best_parent_rate;
+		/* Bound the divisor before rounding it up to a power of two. */
+		if (parent_rate / rate >= maxdiv)
+			return maxdiv;
+
 		bestdiv = _div_round(table, parent_rate, rate, flags);
 		bestdiv = bestdiv == 0 ? 1 : bestdiv;
 		bestdiv = bestdiv > maxdiv ? maxdiv : bestdiv;
@@ -334,7 +340,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 
 	for (i = _next_div(table, 0, flags); i <= maxdiv;
 					     i = _next_div(table, i, flags)) {
-		bool overflow = check_mul_overflow(rate, (unsigned long)i, &target_parent_rate);
+		bool overflow = check_mul_overflow(rate, i, &target_parent_rate);
 
 		if (!overflow && target_parent_rate == parent_rate_saved) {
 			/*
@@ -361,7 +367,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 			best = now;
 			*best_parent_rate = parent_rate;
 		}
-		if (overflow)
+		if (overflow || i == maxdiv)
 			break;
 	}
 
@@ -377,7 +383,7 @@ int divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 			   const struct clk_div_table *table, u8 width,
 			   unsigned long flags)
 {
-	int div;
+	unsigned long div;
 
 	div = clk_divider_bestdiv(hw, req->best_parent_hw, req->rate,
 				  &req->best_parent_rate, table, width, flags);
@@ -392,7 +398,7 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 			      const struct clk_div_table *table, u8 width,
 			      unsigned long flags, unsigned int val)
 {
-	int div;
+	unsigned int div;
 
 	div = _get_div(table, val, flags, width);
 
@@ -436,7 +442,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 		    const struct clk_div_table *table, u8 width,
 		    unsigned long flags)
 {
-	unsigned int div, value;
+	unsigned long div, value;
 
 	div = _get_div_round_up(parent_rate, rate);
 
@@ -445,7 +451,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 
 	value = _get_val(table, div, flags, width);
 
-	return min_t(unsigned int, value, clk_div_mask(width));
+	return min(value, clk_div_mask(width));
 }
 EXPORT_SYMBOL_GPL(divider_get_val);
 

-- 
2.56.1

