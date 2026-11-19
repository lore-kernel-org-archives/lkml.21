Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121414;
	b=S1luZYzDb3izhJVmQS2lEMK9VEBNmpH4u70V4QcgEQOH4y3PS48AbQiJeJJH4WZtWGPD
	 uclwhtbCfLtfbXlKpl7JwVIYsW8kdFwKm+sutiJeW/2HbhdZFSFeIGdxwPiFQXlC38IFy
	 7u3Moh0dI8TCaEK/UUWVbhYUrdLh0OIyjXn3k4hKxaOfVktuMkn2hDe6YZdjDE3Ze1hZS
	 8qeMnl15zSX8KnCl+qBf8eQgOwae+go0fLdYdMm8jwFUhsUF5PxaO+Zju5m3NP5z2B3Dj
	 KNr3YxUvk8H8VZ04yHUUBxMRZ36HGUdzgrkCaQQuOxC7FTtCT9IfLhyrRk3iJCQiuwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
	b=JcLmgJJ/oUFlBJJz++170x/cx0m5U4UsrWkXk+TAtwgYW48Z7zFK/I/Y6kjK9HGgbrPm
	 G9s3Y0sdPx+OxODqMYSSiqhK6wdIwyCNe3wN+STgHzWOFgcW7Yyj2tZDX/bYX4EYs+mje
	 kj8Z0+/CMSzslqOJv8qmycq0x9k0uY2xsQdbpAQs9Fna+eCV8TKzrlgafH26/RsSOl9Jr
	 +5thzYzuPIYPdTKE8TjoCgGA8rByEncs2im4cgMg/UtbG4qBvFsvhfgD74b9Dj3IOtRDr
	 ULqoNJDeNpbZ8UBOuojkPve2DAoXAOEG8n8zByHwOft5S6f311Bh+AcypSNOil2uXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dICpkitp;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D9B606A902
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D9B606A902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dICpkitp
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso152066f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121412; x=1795726212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
        b=dICpkitp6U0AhhndJ0iCQRoYmh6OmMVJRAc26ubxWCj3TIlunk9I6G47LXE3fNDJJo
         8zhB9tOM8yKdTwiT3WWjTht92W70MXGO/P6pvGCyYHS5/1FmQqdZs1t0LkSzlitVNNhN
         V3VB7wOZeHQ/Cr6bJPWZsm0XOB12PEjayNqdgob3d/a2UnoVjlBeiFHK8un+14FZBN+i
         jwORZR6Z6jzeR9kBSKEca2dvHmOulMVKt7UdDM+OKfh9Hi4bazZWjp+UT9fP6nR+vPAp
         FbEtmxbFntG1f7afFY0olIMuITNtfwx8+E93rWNsXXZT9ohlk+tJI5IryU+S2WzH4JU+
         0j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121412; x=1795726212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
        b=FQMFHBHhMjhFN2VC27cBs+z4zsiv+eojLmN8nANA7L/uO0odwJBUmJz0iB8xhfKXit
         0ZOhrRCgXmgcYOXB0b5i9Pf+nSbZxkm+XoBYvMoGuQg81Fzv5NdbxovYIX8e/Ll7WJgt
         UlYSG0fr9Lk1qj81SesZUyir+lhm+HDDd305R8oHgeflUx5Z6NgUMR/LDksVZdHnuS3t
         32GWvJNDv5/O5Ek55y+mFkJm23Zjj0X9aU6XzrwiUKeaNrgwqaxWfcR0AnN/ZIIKV0oQ
         Q66b8InTpWiwYv1ZA55M5JT9lVLl2Ci515HK1ndMLiNADShZDFVVaBxVsEoES4USTX3X
         WFZQ==
X-Forwarded-Encrypted: i=1; AL+hErFHRweRFnw2tV9ug3yE8JjT9gr2q2A3tbRKSLNiRNPl74zfCfBddwU3TqgLc6gc/mAfYo6yUm2w3TY7Q0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G4TD0Vl257qbjK5fZ5PlMWiI2mvpttPagyg8pn/3loF9HjmQq
	ppxHBvAFMKf7FIpEA+JmCtRATFa8MnDIxuFkaR3qnNC/UrKSivIi4BDXfIzJUZ4Sjys=
X-Gm-Gg: AZFdTZfPplwYKj1MpwPOMFuA7Zd085YywpmiZdtWrCU5B8DWRNg0vJRVpFGXBOdZXVH
	E0JStBCIPYSPzSsFllqaGBptMv9EBiGIgOqomy9yS9XEC8kRNfw7+ObV+wyxn+3QHaB3pjWXEOi
	DkNlS+XcyJDmPuN5R8KJFQNt+hQj//SFmdEW8OTAGOGIIVCL7theitGm01wH8l0eanCDLVb1h2k
	Ig9/wtEIEo1UDmjFFD1Vpckz/xQjVaIWQdtBaUA3GsIqiC8deicqQN3pf+kyiOHFaRPGpQ+T1Rk
	FpxStOfF+2x96PeN17dzvYKUvWtF59h64K+SCY/lYkp/Bjkhci4rK7ThB53OkF1Wsl9y8N/DZ+0
	Wc767ymi5XjwpDC0sS4DMs6hk57CrqUGcSTjvFDqwHf+R8E0P/SF8RHn+EEktsp8NyrJICj+d+F
	XHALtDodkZtg9UfdVPhgPpb0FhcIRzq1Ozp5eCUHqjZ5Mse65TfQUDoiNOj8gkik9RW69v8Ok7y
	vi7f+hFfi+DwPaRLoA3aa10jQ/Mqx1m9q0vJtyaEOx6qCqo0r1gR7/zC81Xim/axZdKmBNOmRVy
	FY19EBUJMmVr7+rWkWvoNCTiPn6SlyZm0gCuWpMcgahnBf5o+9X2HvNxL27Y09HyuzqoyMAlCM9
	8JetdbHOEadpHRs7wLwGbPxmq/crrWK5NYzCT1CY=
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr1188682f8f.8.1795121412592;
        Thu, 19 Nov 2026 12:50:12 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:12 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:32 +0100
Subject: [PATCH v3 2/4] clk: divider: Fix round-closest for rates above the
 parent rate
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
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-2-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

When the requested rate is above the parent rate, _div_round_closest()
computes a down divider of 0 and divides the parent rate by it. Asking a
CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.

No divider goes above the parent rate, so the smallest one is the
closest. Return it before dividing.

Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when rounding to closest")
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3f46f9ee451..ed60fa9b04fa 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -254,6 +254,11 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
+	/* No divider goes above the parent rate: the smallest one is the closest */
+	if (rate >= parent_rate)
+		return table && !(flags & CLK_DIVIDER_POWER_OF_TWO) ?
+		       _get_table_mindiv(table) : 1;
+
 	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 

-- 
2.56.1

