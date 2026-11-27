Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792669;
	b=j1BzEWAt33Lhk0VyyckQOZRkU3SzPNArCuNjcIOH3+Y40mLlpaW8GeqFOuWJXjxlJ03e
	 uYhcWIS8okz0OP5BgKUjC5fzw3nCgiW6vbuVDZukANbbUIM3nuOW5dmO/Oy9V7aSkiPm/
	 ZyzZAd32yMD0qsX8bp2Vh3XzZV9OpnJpMKI7/SgsYrIywGi98Wtwj23wMEAlFtXRc+Tay
	 LOvHHGIDL5ssyhCR1bzOIP7LNBf0ngMR7rnEffW6OHl65KLtqfgRc9mBFewU4TBDqoq63
	 QFCr9Y+ZCSKJBcLwuLcrVDtp1heLLk3isxJw4B1VcdUvP21RSsxkZd0hjLwMy+rMi0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
	b=VQT3E3VY+xg7KCB4Fr0bx7KTXHSr4uM7PpAP+HnFU1qFIMPgQV18+5GROjybLmeBq7QD
	 zTJByXjcQGRqgmaL9WFW+cKDLF5hKWojBAL59cTD6ay0dA/kNrTmJFeIhXaQp55K2kgL1
	 NzGm1zsc0YIyURgo66liNxRu9gok7dzdujE8RpQBmNSQCHaBAufd40DAbT1jOaQHxFbfL
	 er89/ux7lPC52wODuV+8b8vBjiO8wf2y9bb85WEvomFVwcrAy8nFnMNGnbUhTEh+p9w4W
	 asxikXxvABUviOQC+YCQn6IQ3N83SDC73vWlz6oqGdQKdJJULjKxNH5enNJeTv+rgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PHYJ9Vh+;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79546606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79546606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PHYJ9Vh+
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1336679666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792667; x=1796397467; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=PHYJ9Vh+E9bdwFIdCTWltq0NjvcDaQzBDSWySkN/Lq59JJ0zzLrJfQU2pScFDfc3Do
         8kCebPE2r7w/ZpYu6IisAR5Bs5+ncnSnHqFwDK0qQGVI6VhqOeN4ivDGNBqYiPho4/hp
         7Mym/cbqRsusu2NFg9FBqnFHt4860A5erqb1uV8sGtBLHgeLTABxFpLBPl66nhTOZXK/
         iiimPy8BOMPpOkuZ3Qvfd4L9iMGxIvNfsTrNDN5GEt7dgIei3fs8pOuQtsN+CKlbOKDj
         7TCQksKSG9hhoyNSYJQfN1Wfer79+Bj9nSoQwVUhsbfl5Zkv0q5jesDi39r2GEASdSc3
         CjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792667; x=1796397467;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=TvSfLJDzFJqJk9yv7mwXT26VkWXomDMXr8MI3E1+dHYcOmg9oXW9M1Wlf83gL9Hlc2
         YLR545fk+crgboV4sUB6cRomViFu6aK4MdId/L3V0JXZPpsS8D90Iyd0xtn0sBCpuUEj
         uWYqjwEAughozPZXD+5osf4Xo79wWY3AIiMlgUbqZKGtWC+vtX1i8Md0QOkm0n2Nf8i8
         q4iJKiyh0bwCS/eYqd/NW1PfKDnFyTgcvud10pT9Vc2ZmrGf/os+R/Y/ubO/CRZRMBF/
         ncO8/BBD4hzKkC+91/T7oiLKzxs1CWYRkr5xWjl5CdfrzhLwMepwjCCZZ5b24xAlh1f6
         NU3Q==
X-Forwarded-Encrypted: i=1; AL+hErGQ8EwRHiSt5kTHD+gJAg+XKrrjSru0VvJj9TjyUrUZPyq1YDngTiQW/wZQiLFbdjnY/sp0nyQ1KRu5jLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Ky3iFNvX3p6r/JER+q9UoHp1Zb3AwPR+L7+poEZs+FIEgdRv
	5SzbI1iEq86PEv1k8hiD7W3CEhDCZ8XdUMHH9P3453+CmlVyTwUi6u8/Pow1leXKahY=
X-Gm-Gg: AZFdTZdzXdCxUlR3N1Ai2SB+wOxt4OoB/q2nGfTbVVMzG9HpJsNPtBsJG+k5f0wbTt/
	ejbNeHZ3YJBm6uVE1NfZvIcohMuNcLGqfldhotmiGlUrDJpsy4fYSz+JAD182zTNNBwNIpq40Sd
	LGvWvu+EcbGFHrkdIbbSrI4cU97CXjtPAOySeSsYQ8Yn3c9UzAyaz26bKga6yp293CVz40BEkFC
	u3KdKP9j7EOCjl2PHoNXcJjmF9Ej5yZdpx4OlnhIqK2I9rcoqL1E4rfY+85wpB9cOYL0xWt7iw9
	OFkCp0SB1TtU6Wzkw2nhURmAaROwJPnX0K0IvTOI0UtYKjqcoDEyqIxwMKSJVpaun7iwImQUfh9
	f1S1wRbUkXDhDo0pngfhn8UeCeqABOyqBiJUZo5U5OrcGkxz8JVz7bpUvcL//U8SY1zxz+nhAz/
	nYdgBDZ0I3CeW8+lhIvI0Dx7OJEQukZO+0tS5OXxykrAUxZpMyexvPX0NyF1M/PGtoaLVADRtWV
	IpVoPtqkiRGPbpwwBSptQ+W1KFO5dKQXsnLkibNuYsQsJehh67oPkkQ8TJv0HQE0XZwls8BO55y
	DcShd3TYd91Ct5olay/OmMR4k+DglSF1xsbkW7jBETJfCk4V
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr1475999466b.47.1795792666943;
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm868490666b.57.2026.11.27.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
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
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261123112053.20400-2-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.15729395589845750540.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KwT62dMsS+rp93AZIY4GYCZTTc4JdLTdUPR1lLaOY8Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXD9nyo/DD900IziTDfXyfsLwu37F9nXxx7YY/2A
 VUHu7X7O0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRVjlGhr1bD0n4ZtZ9XRD1
 esH1TWtt5gitnBJw6NZEf/MKE2/rOZcYGf6+WDtb/Rz7gfqPZrfEcs3jP72QE/RYveZa6D7/e2b
 X+3gA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")

sashiko is right about this tag, this needs fixing
I'll do it while applying the change

-- 
Jerome

