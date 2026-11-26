Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729052;
	b=DaOa+P0CpmADnGAJDuoHgXhq95BSi4nrsK25q5py8qRVSuJzWtTTb9cXSVSkLh5R559/
	 kvhJB7R4SS5FUcR6sEnuo/VYD7jGU8nwp8mOFja7vxNNuH+R+wr8xgZU6D8WoMCRAAY50
	 h0iWo2HNVggefpSGiT87dQ1Q8axUoouPmoklGpFw+T+ZwJTyzuYABNpOIOgreBDrk6vtL
	 vgyR2f2aoFYjRz0WfghkxOrHDYB/K332TzUfn2EvPJ8nB0hc5TzmYg56AYKh9Cr0OCQjF
	 mWYVWPFAkAE+8VP/ZtT2O2KJFGmm52cjHnBM/RQS9MZclL7nQ0j6rm3jDLwTPc6NrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtSscZaOAAEhQ13kt1QeGIrKWGeJGW2xn6PNjxpIljc=;
	b=wRGUFZ2nXnDSblGZxJDh1Q0htuXT4Kns24Kv1V0VhX+DJbUw1cv4MpsNkxK8xaAuPPcw
	 VYlb4TifHnEt0momxsI6SUGZrUBsaSzheTDgNJWBiA3GLi32rwefi2cwg5sHm/lE6dRvg
	 9sqw0C/311OwaCYdBi4Ue+K0yXO83UNgvlN8Hp66FXmubRALGZQuLFAf3nvVWMUGkWeXD
	 NXJxwSMtS20byYnfHeQ6Jm2c9+mvEhBuISMJ3VK2HDaLd5guDRkyGqX86FzN+KGqERN1p
	 QXpVq4Qp5GKwhlLVo6vUCcn3ir7ZqVIotQ3wx/pXYZ4tucGtEHni9AT2BqAq/ABf1yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeZEo7KS;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DA606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4DA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeZEo7KS
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3654036b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729051; x=1796333851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtSscZaOAAEhQ13kt1QeGIrKWGeJGW2xn6PNjxpIljc=;
        b=XeZEo7KS7YYo7XNkK/6rm/23627+iQqo7Uy/rlIhBJLC9Eua4fW6ajMmI7XcU8C7PM
         rTaZEZTp4yKrRjnjmUB/kINwZ2I0I6AhMhssPNkHrn3vF2V6b3kRRytD0t8tcFJrAQRQ
         rlWf43/0Bhuf3ZUYzCghMBRViSwbBrMsl245jF3rNk7u2tyUJqQ9gF3vytMJSDyE/Tyj
         y6ZaZHAASr3GWvxkq8eW2i3bKE0yEEkl+ZypWH0uVKCbq81b8gg2Y49mrGfXCmtxIwex
         AU90kSquLE7dpXuyord4BbUHAqq9dwDXD8b8Ye1lWHAzx1fJnI48jPzFGLVWOHomMVPb
         B+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729051; x=1796333851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtSscZaOAAEhQ13kt1QeGIrKWGeJGW2xn6PNjxpIljc=;
        b=QmT3Bw/kDTum8TV5KdTLOUe+2nIPIJznnajPvQwjbxyTRPDKBbsnXrqleCLiaSjRnp
         jE0ITs6xlYW3gPyRbEQyBwDuaIEk0GR34QUMC1p7I4ASyHEfqLcKrQmEqCdcWwr5tnDV
         wXlRsggroaeSUQRUmzjItq0nBrxTbPmL44rdiyS1hQYR1QC2XtGQKg3EbSI1oJ/FOTD3
         CLUowPb2hVilWzmA8mG7QnuejqV/0jbh63Si9s/X+uN0ktgyD4g/P9sk4j/POpTIhV2P
         rMI179o/iYfvwzeDaljNhVwwpYEz9SA1jb8HsRYr3UuA4Nw5cE2QgPEEe6yPy91yOo8u
         ggvw==
X-Forwarded-Encrypted: i=1; AL+hErHuaB+zbhKRBZrOnXvd01qr+q69lQqMNhE5CqXzWqougF4Ey/JcUyZPjNHIaaA3RJ9BqFcGMvhHaD9li18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UAzlseTAs8eBj3/9uYS7dPMU6pY7H+Y21wq2/kS0DtB7/5bdP
	DxWnDpoqtmYxxEFh0zLcfoOqHkrO7p+6aHPoLtyOTBuIHCoh2faCCDNs
X-Gm-Gg: AZFdTZeHoeRq8RBqNf5TGU8dxgYrejRtcb2q9FOroFFsqfXN5QQ2xei9C0MHLXFMxaP
	LOAF1zUru3MYyy8nUVcawUZzpOHJ4c+4+O1J/PRR1pYonKG2AMqiM359EiOp3V+G+2jb7wkfL/c
	9Byj4Toy42ILVpJgqq+OS2ReL3ITPodppDJhJSyVgakgLPJfWskjSinpaRfbq3dBWhRbMYBfo4E
	LgEYqMBIkT2gDKfvBtj0EaSQ2pp9fLxVGx+UTU2g1OD1dhi3mrzJgvG9geSysMZ1TJPukp5zdjh
	uK0TKdbXXBsvmyouaO7UHlw5oY8Q+Uv99rVvztpFPYakZ3udZ82gVa34ysVDgO46dcwmZOH/YSV
	IDaXrPFzB/EW78BU+jFs4YmBO7kFGUacN4kvGpddhs3maozw/g27EQ//NP7Pjh22oIBYfZY7Sf0
	w1NHnLH6XiMQa6tZyCZq91P847Zv2AMAdxY3YoqXimikhkedIHqj9o+lyiz9t6dOQfw4BiGbvAt
	t0Ai6iKTIINiYU6Xt1X4+6kH/NSQ3kStJaxA+ubEevWHD6ipN6RPAPJQNjoHiQ97oD2RIoFdoCq
	TQjE/8vvYIBN+20asPe8ZvZuyYxVtBjkLJP2vfaf7aof1dkFuakiV4+ILFqkW+2e+3DG/5Csl5K
	rcSGsErBAQYOUttFf4mxPkSe37O7Jc/H/SKdwJukWiXOQwpT0hoECDkr3C2jKkyxURVVZFuSanq
	nYFXbTgStAenbtcx+Z4Os0tw==
X-Received: by 2002:a05:6a20:6a09:b0:3fb:2086:9060 with SMTP id adf61e73a8af0-4014cb394f8mr24110185637.12.1795729051247;
        Thu, 26 Nov 2026 13:37:31 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:37:30 -0800 (PST)
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
Subject: [PATCH v2 1/6] iio: proximity: hx9023s: fix division by zero in set_samp_freq
Date: Fri, 27 Nov 2026 03:06:46 +0530
Message-ID: <20261126213710.1047676-2-kapoorarnav43@gmail.com>
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

hx9023s_set_samp_freq() passes val * MEGA + val2 to div_u64(), whose
divisor is a u32, so the sum is truncated to 32 bits. MEGA is an
unsigned long, so on 64-bit the product itself does not overflow, but
the truncation does, and on 32-bit the product already wraps. Either
way, any value for which val * MEGA + val2 is a multiple of 2^32 gives a
zero divisor, e.g.

  echo 67108864 > sampling_frequency

(67108864 * 10^6 = 15625 * 2^32) triggers a divide error, on both 32-bit
and 64-bit architectures. Negative values wrap the same way (-67108864
also gives 0), which the check added by commit a318cfc08537 ("iio:
proximity: hx9023s: Protect against division by zero in set_samp_freq")
does not catch, as it only rejects val == 0 && val2 == 0.

Reject negative values, and reject frequencies of 1 kHz and above: they
give a period of at most 1 ms, below the smallest entry (2 ms) of
hx9023s_samp_freq_table[], so they never matched anyway. With them gone
the divisor stays below NANO and fits in 32 bits, so a plain division is
enough.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 2a6da557f22e..f5cd31a308c3 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -718,10 +718,17 @@ static int hx9023s_set_samp_freq(struct hx9023s_data *data, int val, int val2)
 	struct device *dev = regmap_get_device(data->regmap);
 	unsigned int i, period_ms;
 
-	if (!val && !val2)
+	if (val < 0 || val2 < 0 || (val == 0 && val2 == 0))
 		return -EINVAL;
 
-	period_ms = div_u64(NANO, (val * MEGA + val2));
+	/*
+	 * 1 kHz or more gives a period below the smallest table entry. Rejecting
+	 * it here also keeps the divisor below NANO, so it fits in 32 bits.
+	 */
+	if (val >= KILO)
+		return -EINVAL;
+
+	period_ms = NANO / (val * MEGA + val2);
 
 	for (i = 0; i < ARRAY_SIZE(hx9023s_samp_freq_table); i++) {
 		if (period_ms == hx9023s_samp_freq_table[i])
-- 
2.53.0

