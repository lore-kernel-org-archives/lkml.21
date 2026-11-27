Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785696;
	b=h2LX6OJgdE9l27DNZJVHlDkrAL1PvwkRRt2LO8ODwi2FTEqPFaWpb9qYi9Mny1J2PEBp
	 7JXYxr/oOr0wY9bT497hOxIYkUS7jERhRSlxsu+Tr3PyiDq4yd9HfFbLa8PFlMS0TTWfL
	 f7gt1NKjGuwc6RPJz+EJ9cwSE82ukmz8hToBnVKFvR5WOGrmToHuH0WiFDnpt1UZmgL3J
	 gr9ieJKKqbhhaoiyMr1klooV0NTWSMspDW21rgsJrdhDhBwbmZeNx+GJpJoe0WiW1+Id4
	 b1uDPx/rOrd/acclZNkfTwzRjrTSKIPkxCB6Pst324h3Y6djjFwhTa//+pKAOkGYVZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
	b=VH4YL2BYRlMsBpDnxYY6tXJ10cKeHSUSwaJtDhCNkjcib/mBsf/wzQ/kktDaoyPyb9MQ
	 RS9SqjeNdibX/2rbDmsSTGCNwrYM3j2oMMTUKhXDwZt8ybIf3fTp4cpZvYMeFiOD7Rebi
	 mqK6qbYRKOyZyWBCZ15f9yUtceHShHZIUtYBYWjmSIMPq+W4fszag05PSB1fjb1jZUJSx
	 pSTNZQqNxYLPIsT0pmHy6jXl43reG6FogNbn9LnneaxZ5YH+eh9EK+kHvnFEMBLbhWvsz
	 XFiYadP0kpmzz29mii1W3Ni5FiyRtdUJnJlyhqtKVcmIAN2knhOtI0SyORmSKxgUYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fNKGXHAS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73914606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73914606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fNKGXHAS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so65756825e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795785694; x=1796390494; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=fNKGXHAS8uT4usaoHo7mKyGJSHJLl5iK24EhrL9YH59bMJV3M+7vrSJAr5b3AfdMVV
         5+Tqlvj7256H8a9Uw7eQJj1thIs1LU3GneqxwyKA3gSdVWEzGJaj26Qt71RKUrrPr8zK
         bFiC9Prrxuznu5KYvGf2tdTBFwugrRuMhnTXXmUKxbuj2GK8jDDtQQqGgcJm17Na+f5T
         ML/XrMs4fyHreU4I8hf642P0IYJDKtNFNLxcxiiUiac9imjsOT68wEzwtFHmSZHZTwiE
         i+d41c9mPYwxtH0g/Mnc8Pzjdrael4RoctIwJynyX7Zlge82IlBL1Y7qBNOrbWjPd3rm
         f0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785694; x=1796390494;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=jfKBdazS5UQcPECjGeoOSzKPdxaCaTvoahH9tglqOvOAhhdb8jKEdlZSYdXiwIjsCM
         pQXMGZpyWXkpajOl+7hZlOyX5X/sr5P0MwKq5MexNtiSgLVwpjG8xifJq4zTH2+Riitt
         htg+/BZvZTkQp0TJkArRTyF3B+KMySB3d+bq+9/eBLeERk7JNvHXiP8qWMRXMcaT2ncU
         mSLs2vYQFuIzGbTCk/yt6aohB8xfvPDVFkxGnhgCVyTfCp1kGcdyAQjnm28zC5nQp0Zh
         0Giv3fY2bbvBruH40quNJHFTe//8MEER0EXoDhUHjzD7Md2hgw8FhAiD2hSJh97MExSX
         LiHg==
X-Forwarded-Encrypted: i=1; AL+hErEOUTpNVDuidT5dCUKhUY9MQF5eLep0h/jjU21dVwYBML8boy61yI+IXoINLUggvkXQNjDwSD95g8/IppY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M4xL5WzBZkyIpYqOyszHiMCJdNM0koLBZzz0Q9Yj6hMg3sadM
	8HH2Kgl5xniVIyjk0z5YMTdrUvxKvZvHEms/tMa5Gek1/Zc7VV9r/7zXMCK6UFqWxko=
X-Gm-Gg: AZFdTZfsBCpNxeC62AVhhSsElyW6O2FTIYsYoN/ZexNllp7qWkkR0ARwlkhQOKRdjQ2
	D2CwTmIgBn+yIwN9zdZhe5Cqg2tsHadqW1YoDTgTjRExTuIFFC/mGPhKv7Qw4/Ehue4ibFpxfdL
	Zeqrnx8JdEmNfi1YnFCwJ1LKA9MsSMLsRCN/U6OPXLvvYa7EdlpkNVm/Wc9M3H62ToIJJfL037U
	GYRyKhx0N3ywsKNFLh4U8rh8G2/fQvv4eDeuCQ4uLbDupJpOfVnRNsI8xp4PX7DpI1Z8pdWScP0
	CmtkvgmEbFenSkSnizPnkj1ZZNFnNCBTjkYvl/cGYbxzU7awXjzAN5HZWgND7a9hXbEJAzkiTnc
	vLQOHAY/A5wiIF5Zu+keNdRd6KTPffBbI366dkCccEftVL61NJl6CJM8xwSGW1uWdK8p42Khv5s
	aVv1W1kaa7DxdcB85csjAFDixENpYPGoNizSoe+ph6q5U7zjOv9os1g9agzNI7YBzTpoktJSqoK
	xhS3C3wvwwAPp0Go3tH+LWQzqzFeQ6p2Ft1/ikSTjD5kvxrKuRxM/na/866xGaoIWWoG0/0dqq0
	H18h6GmIP3uhjEMs9wzmIIKRtcKydkXbU/e2KJoQibqHKl8w
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr492570985e9.35.1795785693896;
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm772362675e9.10.2026.11.27.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
 <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
Date: Fri, 27 Nov 2026 14:21:32 +0100
Message-Id: <179578569228.3130490.14256403264790878680.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=E4dLgfAPlyGRAwDDbFxbbsD6Cc9CC30EoXytcCxZdeQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmczXf6cy9W/3oi+bV7cZXnU8vLz/4zK0vWJ22ebHPE8
 1Rj933DjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEykdjrDX9la7iuLNjZrtM37
 zPl+mruZ18OzH1TXHuZwtM4/pKVmeoLhf2VL+Znd7z8cP9NrZe//sNuyqU+n/2fIGoVzx+ZwPDh
 Txg8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9


> >> -static const struct pll_params_table axg_pcie_pll_params_table[] = {
> >> -     {
> >> -             .m = 200,
> >> -             .n = 3,
> >> +/*
> >> + * A pre-divider value of 3 provides the best performance for
> >> + * the AXG PCIe PLL.
> >> + */
> > Again, define performance here. what does it mean ?
> 
> 
> To clarify what "performance" means in that comment:
> 
> Some target frequencies cannot be achieved with N=1, requiring a non 1 
> pre-divider.
> 
> N may not be 1 for Amlogic fixed PLLs and PCIe PLLs.
> 
> This AXG PCIe PLL is designed based on N=3 for optimal bandwidth.
> 
> 
> The AXG PCIe PLL rate is:
> 
> 24Mhz/3 * 200 /2/8 =100Mhz.
> 
> 
> I will update the comment:
> 
> /*
> 
>   * This AXG PCIe PLL needs pre-divider 3 to hit the target frequency 
> 100Mhz,
> 
>   * which also yields optimal bandwidth.
> 
>   */

All I'm seeing in your explanation is "ability" to reach a rate, nothing remotly
"performance" related. Either drop the word or explain what mean better.

> 
> >> +static const struct clk_div_table axg_pcie_prediv_div_table[] = {
> >> +     { .val = 3, .div = 3 },
> >> +     { /* sentinel */ }
> >> +};
> >> +
> >> +static struct clk_regmap axg_pcie_prediv = {
> >> +     .data = &(struct clk_regmap_div_data){
> >> +             .offset = HHI_PCIE_PLL_CNTL,
> >> +             .shift   = 9,
> >> +             .width   = 5,
> >> +             .table = axg_pcie_prediv_div_table,
> >> +             .flags = CLK_DIVIDER_INVALID_ZERO,
> >> +     },
> >> +     .hw.init = &(struct clk_init_data){
> >> +             .name = "pcie_prediv",
> >> +             .ops = &clk_regmap_divider_ops,
> >> +             .parent_data = &(const struct clk_parent_data) {
> >> +                     .fw_name = "xtal",
> >> +             },
> >> +             .num_parents = 1,
> >>        },
> >> +};
> >> +
> >> +static const struct pll_mult_table axg_pcie_pll_params_table[] = {
> >> +     PLL_MULT(200),
> >>        { /* sentinel */ },
> >>   };
> >>

[...]

> >>
> >> -static const struct pll_params_table sys_pll_params_table[] = {
> >> -     PLL_PARAMS(50, 1),
> >> -     PLL_PARAMS(51, 1),
> >> -     PLL_PARAMS(52, 1),
> >> -     PLL_PARAMS(53, 1),
> >> -     PLL_PARAMS(54, 1),
> >> -     PLL_PARAMS(55, 1),
> >> -     PLL_PARAMS(56, 1),
> >> -     PLL_PARAMS(57, 1),
> >> -     PLL_PARAMS(58, 1),
> >> -     PLL_PARAMS(59, 1),
> >> -     PLL_PARAMS(60, 1),
> >> -     PLL_PARAMS(61, 1),
> >> -     PLL_PARAMS(62, 1),
> >> -     PLL_PARAMS(63, 1),
> >> -     PLL_PARAMS(64, 1),
> >> -     PLL_PARAMS(65, 1),
> >> -     PLL_PARAMS(66, 1),
> >> -     PLL_PARAMS(67, 1),
> >> -     PLL_PARAMS(68, 1),
> >> -     PLL_PARAMS(84, 1),
> >> +static const struct pll_mult_table sys_pll_params_table[] = {
> >> +     PLL_MULT(50),
> >> +     PLL_MULT(51),
> >> +     PLL_MULT(52),
> >> +     PLL_MULT(53),
> >> +     PLL_MULT(54),
> >> +     PLL_MULT(55),
> >> +     PLL_MULT(56),
> >> +     PLL_MULT(57),
> >> +     PLL_MULT(58),
> >> +     PLL_MULT(59),
> >> +     PLL_MULT(60),
> >> +     PLL_MULT(61),
> >> +     PLL_MULT(62),
> >> +     PLL_MULT(63),
> >> +     PLL_MULT(64),
> >> +     PLL_MULT(65),
> >> +     PLL_MULT(66),
> >> +     PLL_MULT(67),
> >> +     PLL_MULT(68),
> >> +     PLL_MULT(84),
> >>        { /* sentinel */ },
> >>   };
> >>
> >> +static const struct clk_div_table meson8b_fixed_prediv_div_table[] = {
> >> +     { .val = 4, .div = 4 },
> > Previous table was showing a prediv of 1 ... here it jumps to 4 without
> > an explanation !
> >
> > Also, it is a RO clock, so what is the point ?
> 
> 
> This is similar to the AXG PCIe PLL case. The pre-divider is fixed at 4,
> which lets this fixed PLL output 2550MHz and gives optimal bandwidth.
> The table was used so the fixed PLL DCO rate can be calculated correctly.
> Without the table or `CLK_DIVIDER_ONE_BASED`, the divider would be 
> interpreted as 5,
> leading to wrong DCO rate calculation.

But you are hidding a fix in a rework then.

Your rework should keep the prediv as it was.
Then you can change explaining clearly why you are doing it, with a proper fixes tag.

-- 
Jerome

