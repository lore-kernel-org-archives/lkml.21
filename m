Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640360;
	b=Y9bjiX5QzmeYMCzufFwt4oNHkRf9WoD/Oa+cngHZLXfV1QeOzhhuSxGS571M3vcSG9wj
	 +jB8nhOeQwdaUGwJl2iSws2ygtwqA/Frc/4UUW6XgELhz40daJUNK507XZaSTIvPP/VBd
	 FYHQtzM34eaY4D4JR2I0J74xclUHWsupo/eT0vMKjzXA5hkrwQqcQlUdnXdJVND9dzMLu
	 Ic6+bwTBP/a2P5HagGtPbpq49lczv0Q8ubqA3joOzeKGWfUp3pM/pcEaHPSYUBJiiN8NU
	 qI8dScLpTGWd9mUL7OLZZk56sKRdLzx6TGFiWxm1IoCUnQVyGl3uACiyGcabqQE4Ugw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
	b=P9MGEvpJORSCiLRnDJRBFgbHhOraFkrfATVOCGSJSMjwrvZwz59oJ/vGUzZmqTuC1zrJ
	 VJnpVNZPAULYOZHahMEtIJvxhzqCnfzf1nkMQbIydnAOUClHfqFdy3XBacrOJWE1MyUG5
	 IboD2fR1EgDVdpGlCm+cRPXZTj9SX2YxQeLHKTaV/vhvInfN2jlB6KpjQXvanazO/e3mm
	 lKGbO0EfZVm7I73uZaG/hZkNRGxY9+79F/AerdW69OyaJUUQpwI4YaBs8cmZugJ9Xe4kv
	 w9bGnF5FL/WMkpTsl9WeQvkhX/Ab6IHLvqpSmZ2SY7A8pEJRT8+mNqJ9UzSkX2RUnOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F91606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XX+oVSvl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so7219711a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640358; cv=none;
        d=google.com; s=arc-20260327;
        b=lX8RoRi8uYLieLNyEKPMGzANEjxJzbNJ1peRdNRjMWaoI3gW3NiK6nHP/1TViySC6T
         YmZkFkP77hfRCUbbOagFxmgOyznWR/yUVAAu7qAaxFNBNmYctXlZXtekKkLieZPiD0AH
         VJruujv3aOW44VrC9i4EuShsq6staJmwj6EpzhN3UMTWypz2gvAtnpcXr1yrolIj2kXO
         0bOn8lo4OmzFpW5ZuFSSuwLh/59UwfFalDKh/ZT7n3/ILpl8xqZ6IKt+4/NLXU/2xItI
         yfcz1PG5jbLfnE+dxKuuUYgjPSBNRQ2cazlnLMAIcO7zH5r+1RRwGjkPwwEWM1KWl+z+
         /ZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        fh=H2WIOVZz67j8i3JRW4v8LIGu3IGVnVYM76hF1Qpu1TQ=;
        b=rsvXf9Avac5UbNWoU6q7v2hQbLsld1CZXQ/fAVZpI0Y0GWlptvfKXyp0UMjGhaW0zx
         qwCV8l+4xHgUvVXYx/vIsajHvDWawELJZbX7O2j/FNB9cUBOk9bMyuz6FFqYXA8i4XdX
         8z/q1oOQTyGIntkZXLwIu0IM3+QUdtxZZCUjoeiiyj7dDhsLD5SlyKA7lHa/CPLeyAEO
         Fqz4+i+yzJv20UjqVc3vWtFpD/pLSN6hfa7/flJN2AIVGEMvO0LanjyOwyrCE6d3Fry+
         WqghxDmL+4FthuPDUKEiy/JKsIzkKfDQfFSG/2+Mg+FS7mXWHGNDElajERxWveDGmPnq
         3FkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640358; x=1796245158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=XX+oVSvlwbkZJl/q7Fv5V3x1hehf+uCE6xb9HMTUuDbF0ZguAJu6UzBvMyjr+3Fj+3
         Nvvze0tQocy6EAVfwsaasTedqzOkcNCy/4uKy4ga9ffBNEU7meDWoVRIhaMd/gGGMdI7
         lq5DNc74gydvwyL0KrWQjZceHBDyui3QPZeJfkBAj+1uk1bV6V6TfjBr0CGUgjMNGPgc
         30FyNBH/PxEbZNh5NMMvBcC6d1IEiDTbCGmTdLvEdJHnoUn9P1A4ajQO/glmLAXbn1d/
         mfEWoGHROTKpQHjsOwdD0NEQ3Fr4qoUCiHkHuoHNdnRzqEcdcHzI4Nnw4O/QDAzqRJsK
         rQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640358; x=1796245158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=UXJZCIVRvwrXgxzBKthfgFTTOTnh7m5dgJIXN2OYpiNF2sfzz0ev9Uch48knAdavoI
         pxRBGdCiFHpbcMBJWCOSHt9o3P/HXhZgG7+LU6k2vb4gBxSvdM5XvCAWn75L0skOMz8z
         6b4f8xIH7ea4Ag+tip07AJl5yuztR4Xee5kNvSg7kyJdcwfKsm+lcUKWIqHv1JrsBgxl
         J7HFmkhAyQZwU47ndekpApkIQK7zuSNL0iPxlRCZYQlOBRcm1CqIoApyZUs+pkqk9NNu
         c0zF0Qka/82OAQbyth7cVDzU3GJVmo76J7s396o/80USnK1aoYjR+TSII1LXaByFFwpv
         2kGg==
X-Forwarded-Encrypted: i=1; AL+hErFP6blahaL5VWA9fDpkvYUdj0X2Bc4TvO1oOKFfCXlslGGhoQlmTtjfSjEHcCm/YjnfB1luNjmP2uenlz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gwNhF24E16ui78HsOa9j/mKhUHKdWDuU4P+IyjtalLCFXes1i
	HiICX6qoJnCmgt6CP6Luxvok/xPBKbtGI2cjescRUsQwoZw+TqBdORFAzAUMA1igYxRT9571UY8
	GJ8/PDjoZoWhjalKuSCPXLlvpI+EOa+ES0eTqGFDmtQ==
X-Gm-Gg: AZFdTZeclzImHwyMn4QG1tCMlUTDHgwsrFJHJmxJ6HBPORvNQSgXlNOFtwi9HaD0Gzr
	arJW5yAtYQbt7J+6NY6mUAz3175xqQoZZN2e+D1iZGvHEcihKC1f+B7DU1Rj6nGFy9miCA1nM5e
	HLAjS08Jb3Yqv9vNxBwTo4vJDlNDhKzGsxJHhnuDWWmmVOff90YoKIy2v3+vj4x04SFHJYZK173
	QRSTFhHK4jjU3fBFt4L3z+Y1SmTqdykgF2D+Ou2NGABoZAiOTbKdJurYE0nAxPUDK5awIC5gwpo
	BPT2OwoMYBxvNJeib6+ENUE8fbHZaYiz5X4fjc7p+vPsEPeZdg1RG9XrDovE0EH232T5tEcTBP0
	3Yhnj59HCFLOC/7z2WWyhV46uMmJiwKMmd0Vnopf5H3MFy5qAzkgcbewcfTjXhMDREWXgcgo=
X-Received: by 2002:aa7:cf85:0:b0:6b1:a509:875 with SMTP id
 4fb4d7f45d1cf-6ba37e66febmr9344235a12.20.1795640358409; Wed, 25 Nov 2026
 12:59:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-8-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-8-lee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 20:59:06 +0000
X-Gm-Features: Aa3M54qBKC7-tr-B2jw-93nT_AW_sr-oGI0v4yuTHgh0h7sm-7QQngWZhmScpnM
Message-ID: <CADrjBPq2OmgLjzs8qYybQSKRDBC5QK5DTrO8Wy4gbUoo0Ydu6g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Abraham <thomas.ab@samsung.com>, 
	Chander Kashyap <k.chander@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, 
	Tomasz Figa <t.figa@samsung.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Marian Mihailescu <mihailescu2m@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 16:49, Lee Jones <lee@kernel.org> wrote:
>
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
> exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
> exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the four PLL rate tables.
>
> Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
> Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
> Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
> Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
> Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..35baeabf3ccb 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1419,6 +1419,7 @@ static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __ini
>         PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
>         PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
> @@ -1430,6 +1431,7 @@ static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
>         PLL_35XX_RATE(24 * MHZ, 275000000, 275, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 206000000, 206, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 165000000, 110, 2, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
> @@ -1448,6 +1450,7 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>         PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
>         PLL_36XX_RATE(24 * MHZ,  45158401U, 90, 3, 4, 20762),
>         PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> @@ -1459,6 +1462,7 @@ static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
>         PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
> +       { /* sentinel */ }
>  };
>
>  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
> --
> 2.56.1.750.gf70dc682cf-goog
>
