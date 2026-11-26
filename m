Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729081;
	b=K48fss+NCd8/CIJNYvy65O/PHNk0XqJcSIHqbPr1dkaOEzWArOXtDbN3NUfLlMFpnJLr
	 8xASrFXAY6zSc1jV7GrIOmog3hhiRnx6ivr3HQdsGx/2a9CiF41H47a0nYflWOex0RS3q
	 eShLmUdl1qCU72C5rUaLB6yTkbffDED7k0nNocMKNWz5jn12NuC4Rfq5JQIhgtpVtXA8U
	 eyqiqmS2awaxxTICKhBE2eNXMlMIBzM8mGQ1K9cpIVjkBEt8ECHig84zqeJaXj3TH5W6O
	 PnF7HJ6vXHu2Ouo4fhtUHeFqkOumWnqW4wX0AIlwkTcxAHhdUP2GtcD2nyq0dJuohEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K2W/5iiumMXjFlLM/N2hQ9MSD6+kLpBpFnv1u4EVM04=;
	b=XxC74bxGJUK27AWcacy9eh83aod/28uy3qwAzx6Juo7JviIX3/HWlnyTiYNO+sGTJ73D
	 b3ZiqEmZnS11Mwnp27HFZVkoNTPR2t/19vPuwOYOs90ddc1vwLBP4EiLLXEUsnUL22EBv
	 +kMSGcs6KlOUVVkmVnTqzQSXAMzn9pxgzGcZTSvHEYHxq+8dFVLimeDMAK4qqYk5RDx0i
	 qbAzYiLn2008a89a4kmOZlQnp5KPLr1lx9IQ9AXxlVvNsXEI1sKfmJq56A69FBTi2SSMg
	 lMBgnH0TCJsfTWK6EVWRiccdOpWGXufX4sSpPJPeWVEk43lrBg3xBqYifLqk3HIq04g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2qfrdTt;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2qfrdTt
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so634210a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729081; x=1796333881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2W/5iiumMXjFlLM/N2hQ9MSD6+kLpBpFnv1u4EVM04=;
        b=x2qfrdTtuJCmuejOHvH0AxDiiVjqdEwuktypRPW7t+mgckGGKNLL8IATqHxBuJcfjf
         DkwfJ2+4L9HACwcElhpSovlmkU2Ojmrb0c2r2jIOSQheYBubcriyRtk63cVZ7jN+liSs
         kjJCuLVje5STPDt0Tg3lALACLglRps8wuc+/XeHL/BVXingbu1K8mClwJPIM1+O1S1cz
         h2+AzHt83eW3XudoB23oyeDRH9syx8+jSoQ12mPrB1lcDATeVAYNS0kdqin5oGnwRu2r
         jDv/nESIE7DaOPH/6H56Jj9F9OE3541Id2REvPmgZNcU0sUXptwHptMRP3lBzo47sGpA
         b4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729081; x=1796333881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2W/5iiumMXjFlLM/N2hQ9MSD6+kLpBpFnv1u4EVM04=;
        b=LKx84XH2TztY6l/58jfXCgt0PlG6DobnMts65B2HkFkev2WoJsNojaeUV/8C49/2zl
         cIdx3A6DeK1rlf/fJSwANlulkGXAEPXMfLZVv5i0sX35EW3KCqX6sU3JreUMqXVsZ5IJ
         dCzqHHU7TrNfSlTlfIAAssay3KrjjEva+9uu0skPYnAVhJooawkHOD7jT2lsg8sXcJ9f
         nShiSiTdgJkd13FccOUlMPoao74yqVjIoky9mtD81Y94mJCnO4bghQudK2GR9EuQm7Fn
         cb0c0h5KZu2ZfKKgiWrj0aZ9qU+ItGXQ3wZA4mSoNvdNt6wcyIH6KK1G3vVaSo40TJA6
         SnDg==
X-Forwarded-Encrypted: i=1; AL+hErF+w2Gwulbe2A8AvwiHhz0Xy9inakMXVILmeHb9YRTv2ShnpMJMjPS65XlgSs9gtzkqtJfUU+oO9xBQnrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0sG/6pC3iuOU2wSueBcL53KasvAsFJgqH0+9MeeQVHJWyvpfw
	SvFtg+c4hOJIpWy2G+69CkYlDue37XD7zcWUJLNWbR5hf4o/IQxeyCf3
X-Gm-Gg: AZFdTZeVryb7rBoUIJUwpgAK8gCfQDRrFESvNIKpUVDmlonvySq5OeoJw3mlZxe3AQz
	jM2tjUOraKj6jKCtIJNmUQpIVakWhE7b3d+GMhaEYYkMcoLPz3a2bfue1DR6ZTvVLSQTywQRVfq
	28ryqxIv98ZPFAUgZUtrBRHOILuMgYI+E8XrZx7fI/DefFASiv5txgNVhRc46dNWrQIrDMobF4B
	OiBJdRIo+4NYy+Dff6IQglovStu8NUrRwogYJA1yvWlHoZtvQhud1EZ/StEvXDWS4Oloc3yaeU0
	F+HKq1/hCEdVJWUgqaIOwBOA6HpQ4iyzAsVIgxvMMye43WxqJh0mYFXMBELVOPgR/WJ4BVaPqP0
	YTXVdOwYVnQvDyLVg+xIhyMV/QGERui6At7sCj49GN13+nZ+XFa9Qfhh0HoGYVQYkqOWvKgr+fT
	8hTE0WaZ1X3hSlQGvdKJZ8gxdnNhpl5nlzt52drfL0prl4N+tg/kDKPCyby+uFqjAsrqOqPO9ZO
	LInSQe3zdnFMw53DdkNJnOEU6eB+hJizKB6KCjl9xpXa2EM8JlCF6rSUy46149RSpLLO7OqBMEE
	RX7UHOhVGcHIvjo6XMSGvdOy/KdnTnMfsZuLeLwRd5DFkpI4S0LuMelAXAf7ONp0HFV3lrK3izn
	egf7xywOxpW6pdGmdKP468mtliJmzvNaqX0jaVZAA/2QhqtpJ7ca72ZCSbcy06V6Iq4va9Kknap
	bDz8sGrT+txi/ayw7OGEg7Cw==
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr20845589a91.14.1795729080668;
        Thu, 26 Nov 2026 13:38:00 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:38:00 -0800 (PST)
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
Subject: [PATCH v2 4/6] iio: proximity: hx9023s: reject out-of-range threshold values
Date: Fri, 27 Nov 2026 03:06:49 +0530
Message-ID: <20261126213710.1047676-5-kapoorarnav43@gmail.com>
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

The proximity thresholds are 10-bit register fields in units of 32.
hx9023s_set_thres_near() and hx9023s_set_thres_far() mask val / 32 with
GENMASK(9, 0) instead of checking it, so a value out of range is
silently written as a different threshold: 32768 becomes 0, the most
sensitive threshold, and -32 becomes 1023 * 32 = 32736, the least
sensitive one.

Return -EINVAL for negative values and values above 32767, the largest
value that still maps to the field. val >= BIT(15) catches both, as
BIT() is an unsigned long. The low 5 bits are still dropped, since the
field is in units of 32; add a comment saying so.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index d509de6e265b..2d2774398259 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -441,10 +441,15 @@ static int hx9023s_get_thres_far(struct hx9023s_data *data, u8 ch, int *val)
 
 static int hx9023s_set_thres_near(struct hx9023s_data *data, u8 ch, int val)
 {
-	__le16 val_le16 = cpu_to_le16((val / 32) & GENMASK(9, 0));
+	__le16 val_le16;
 	unsigned int reg;
 
-	data->ch_data[ch].thres.near = ((val / 32) & GENMASK(9, 0)) * 32;
+	if (val >= BIT(15))
+		return -EINVAL;
+
+	/* The field is in units of 32, so the low 5 bits are dropped */
+	val_le16 = cpu_to_le16(val / 32);
+	data->ch_data[ch].thres.near = val & ~GENMASK(4, 0);
 	reg = (ch == 4) ? HX9023S_PROX_HIGH_DIFF_CFG_CH4_0 :
 		HX9023S_PROX_HIGH_DIFF_CFG_CH0_0 + (ch * 2);
 
@@ -453,10 +458,15 @@ static int hx9023s_set_thres_near(struct hx9023s_data *data, u8 ch, int val)
 
 static int hx9023s_set_thres_far(struct hx9023s_data *data, u8 ch, int val)
 {
-	__le16 val_le16 = cpu_to_le16((val / 32) & GENMASK(9, 0));
+	__le16 val_le16;
 	unsigned int reg;
 
-	data->ch_data[ch].thres.far = ((val / 32) & GENMASK(9, 0)) * 32;
+	if (val >= BIT(15))
+		return -EINVAL;
+
+	/* The field is in units of 32, so the low 5 bits are dropped */
+	val_le16 = cpu_to_le16(val / 32);
+	data->ch_data[ch].thres.far = val & ~GENMASK(4, 0);
 	reg = (ch == 4) ? HX9023S_PROX_LOW_DIFF_CFG_CH4_0 :
 		HX9023S_PROX_LOW_DIFF_CFG_CH0_0 + (ch * 2);
 
-- 
2.53.0

