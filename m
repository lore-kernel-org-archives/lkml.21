Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695226;
	b=Gd1eqvYa0CV6bD+aOoh3W4k+wTb/ckd3VJAGeCSrgodHhcRPX3kO3etdf8ZIFRMICE1d
	 qVbZTNsM0hchxiK5ZpWz7SoEQObtqL6ar4gaqyvM+HFX0JWzvcvYvJTbRf/1aX7f8gEk3
	 Z9VXB2xiE2AwnfiDR2MTHg7C9EJRxAY/0y99kKlSv8cpCCwP6vnpUthaQu2tqEviOPOsw
	 1zw8RutzZxJPIvXBoSH05Dtyx0Sy2ZstvquoFw6B5C6vdrqkalc5oATclCYfsAB174U6C
	 /3Kl4opugTVWlMEj4cq8ZIRijsEw0//b8ryAuIaGjOl1MyBefhE6K48ZQm3CMk8J4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tcANGGo5MkDIwyhgXmQGaJsdJHZsNNGXY83sETzkkmo=;
	b=o33sKX3JeLmfR6XDvrtCqrdDT/KLZmxBcagl5T1U/DqLhbDmx9iXt0bYiChr2hmiVevg
	 xbDPs5m3Lo9dsgZQbQDW7WNoQZK7NwDZLWuPH1UU+HuBU8z0bG0PZYSGlfgk4UcX96/Pm
	 Mp+BHHJxwOtL2F1C2m0DXYWOMAwzJ8pyVSU1NYfzXOh6cD2tpIDmDWxHyUCkP91v284C5
	 +cImPVTGIRyXRs+XlhC3wp2+6DBwXmOWMan0fB9eIl9eQ4GIcQyRLwaXTtZkCpntG/j0B
	 2U42RF7rnl2FfHSDwIRUJE5erNuBZWKrOdiTUxtU02lCuSrrIU3FSbOuYPCvVFdtdwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2IUb0vz;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3276606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3276606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2IUb0vz
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adef977ad9so51481921fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695224; x=1796300024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcANGGo5MkDIwyhgXmQGaJsdJHZsNNGXY83sETzkkmo=;
        b=Q2IUb0vzzkjcBHWyx3EtI9HxLkJdeCdgJll0PJCmbxclaXehtBoAXJ0PAQ+9B7WIlz
         +zPZ9qRHGZpL9k8+WqJ9ZPPTbcCxgq1neJvUcJqMu+NnPu5zIOwtv+poaop4ReOLWRWB
         FfumIHkeOqPgvROkY+4NzVerGHur1jkHhonog2wv0kDeHMl9Ven+tUMyKejax2izf/1w
         Li4z3N39BNlX78yd2MR9L78lk2z6FHgRH41jpzxCXY7M1CRbql+9WwXs4v+IcJS8RgOW
         AAJnXnCkcCvsFuAYhFWA0gKTXoE5ZI/RgiBKljbmGjlWE7ooQO/UC7CmiiPv2P94qwYz
         HJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695224; x=1796300024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcANGGo5MkDIwyhgXmQGaJsdJHZsNNGXY83sETzkkmo=;
        b=hXsjgsMX+hfAgVLRwnxswjrseAxQZ7jP16Zju0A5SRyFEvMYYoGk5qYIHMlM1A8dDp
         Ov426Or9mfTOspfmYWCRDxRHm87rw7gTTkeIJ5DDqdwfGr0soReKCgre/UJ7RY0VvBEl
         WG0TGRdz8Sufi+elq3xvo5GcDL3QVBXz9p7/xQ1rT5WD9KAqw7gVqlNpOSOyiSHE2Z7R
         gqmYkSYwT61/pw8aN4QEyuyFr+kL+JR494xQfzCMaNJF5sqEu0yh6sO5sOU2xDXIG8Ki
         pvxepkeHDR5mm6blG6B8lSvfWwnuakQtOl3z8D+6eUc84pkXsHewCF8OYBQQ0KCFuylS
         3Jjw==
X-Forwarded-Encrypted: i=1; AL+hErEPJFb0/soMrAD+7SMEwQJm26hejsrw4gaPigqqe6botljrArPXB9MkTmpc8SEjMfoj/ip5b7SD6WVGFjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FqyLMzEg5nu0p5tpFw3rM+E4sYfC+z1M6+MGy6yVmvDwkJT6w
	3wegxHGISHjY5V+wM4SQexwlKG//DT4XcK1JXWSpRHpgDkCkwGlxXBLQ
X-Gm-Gg: AZFdTZcmuSvBr9iQTd7J95MI3M6wyIjcPsaufeExy1gFKCVsrw6LLjLlKUph8vOQGVh
	ya0dFTHDnYoTgXgo424CHCNqXMte8z/3GGboDPCrzYRFRZ9M/FTkuIfg0x+y8XS0pk0EMFHhHNC
	ooe5LVztNS8KtW8jzWj+UG/xE5MhthWk5dm3eMgvc1rlTeWaO20xpByJY1yHkVGizzgxUb/xRAN
	Zr3FIN/6FYO++BDAVpkSk382oalgoRYz0wV/dlupj3DZlG9DQXiDtRtHm+lZMC+X9uaS7AbBAlp
	8nnaS0dkbIwIc5yI7pnsPeUU0TDQGjQLnPPdwCcq3QdtpNYX3hXMgxDXWODtjw75caUfEV5yHI0
	ExyzxrvJCZcYoON2c6RyUNskUDjEbg7u5LTUUIsDe2jETlaaFg6Kf6j1DzGw+UiBCpScNoksH61
	KLcCf4a8IQsil8wxsHSg/Yk3FmoOMiItfaflq2FTLc7QjnQLc60T+h9rgPLGADK6XVrELDEgr8s
	eof1k4/bDoU/11duhGwX3MGGqd9E109xzp1pMyPVNYYCRtFigNXPPd16TYEycoYWoEBFyWRQ0p5
	45q2PEdD8ByMtTijn+o90duAknlsZ03cl8Xh3rQZKei5dULFAjkwEhxOm/C3m0G7sl2jUF+kb0v
	exajaIPaXalqrNoDkeQZmULXW9Hq0ubZSpDOc
X-Received: by 2002:a05:651c:31c5:b0:3ae:25db:8a10 with SMTP id 38308e7fff4ca-3ae7f9f4fc4mr54946551fa.18.1795695223962;
        Thu, 26 Nov 2026 04:13:43 -0800 (PST)
Received: from yantra.. (nekmmqtmzjx8yvukhae-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:68b4:f70:61d8:6e86])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e8e0sm56541791fa.5.2026.11.26.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:13:43 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v2 3/7] iio: pressure: dps310: use min() instead of min_t()
Date: Thu, 26 Nov 2026 14:13:26 +0200
Message-ID: <20261126121331.10438-4-zoone.rupert@gmail.com>
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
Content-Transfer-Encoding: 8bit

min() accepts s64 and int, both signed, so min_t() and the cast are
not needed.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index abf1652980ea..493eb56bde98 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -848,7 +848,7 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	if (pressure < 0)
 		return -ERANGE;
 
-	*val = (int)min_t(s64, pressure, INT_MAX);
+	*val = min(pressure, INT_MAX);
 
 	return 0;
 }
-- 
2.43.0

