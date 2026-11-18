Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996082;
	b=zJ7EcqWuo6acRGVlZElzB/GnnXqJaX+eMWraCnw7F7k9k4sCd3yWcVvIH1W0BPRzKvzW
	 96y68IRguDREyFI3sWNW8E+RHGothH0+Z2fO9sBLA3UVQSThbpURUurGHV5v+8qelvqus
	 1bAqSrsBGy/rmFGylWFCxJPQ/VEutvWZdbe0Dv96vzsALm0H+nEzOuwptzD0FCWYtHAGG
	 kCEeyXzu5oay/5G2psC5HiHbubUu8i21ZJpf7bjyUY317oFTkdh6CjFYKVq7zDED+w28p
	 RxNUFhuVV1YA+gjADirYmxm4qtlSuLXE6PLIDVfVhcthYqxujFebHCiMgB9GW1WytYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
	b=xeReA3Fo4xE0ZZZycyS44VbPxa1yd0GsriuUHgnCwd9QDdiZEV0XuecpAaxuwqDnhSpL
	 0gxhvqZQ/NVz9VN3CL/gNDWWtTEsd+hxyEoNgXpeuoDm3XzNbJHN78Mq1PaoDEeFtpdO8
	 tNEtybNBoluEStgW848f94wv493w95skYpOVf2VA8thXZcTtzdpV6Uf7+FFhB9iR/4F+k
	 7RUwjKFhAFsWIyRxhCaZtXK7WaW4r+70xiCWx70wE41x0bpBzgz+iteCVQarCT+Q620fi
	 QZvJ6SoKBT6eSheFtAd3qzN36/5ZxfJgpLL1fzkmH3M4Db1P2tMaPgCQ9STWaN3NmOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98310606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98310606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5853035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996080; x=1795600880; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=NXWSjALHejmhCRttwQozmx01nKaGgerN7LqPA50/6M/Up0+oOC7WYwnske2NEfpBj/
         YwUYxX8x+tCnf9iOLp55QQMNxSUgR0LDbGsi9DeIQ/RubdWjsMckzmNbxDtBS8N+Pu9A
         Be87Qq6Yqf6fj29/0F93dnvNOcMHwb7Or2RVaOkNyPTovsmfWOcZ6XuHH4ZmEYxYv1kz
         OmXTaDorO35YQvd8ePOrSpHnTlTxN4c6xlkcO52I5y1JFN3PfhZvxiB8M73etRzafEA+
         wqH5dWc/uUSajzaqItwMe4ige1CnmIaqPPR8HmZT1D0L35bwdIae6+w0D68NPj7OSNKH
         G+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996080; x=1795600880;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=I6lQyyAdyNO+UfYFem5j7dVeNTUlaIbqRSBGbHd7vz0wlf/by1pc0puD39BuYY4JeM
         jZVszCWim7WIR3HzxfKDZCJwU02hMNUkR1Tj3rAa9Jzc0574/HV12YnEkRbn5BYh0Dqx
         IJkvxMWuhsfjGf8O+jQzqkaDYOT4oPEH/M9zibKLrsdi2ITlBTxLswlmZ0aY4tCrds5/
         8FRJPfkcwBIi7zDAR7DNf+7tfybeoDCau7NlrIMF+U4P+DiwszRJP//WOPLYEnYNfZkM
         oiYQGg8Va3fLoIxIuXmf3x2tqmZ4wjZjNHs1Ph4q6dJunOsrUHM794W0rAY+1Kqjmjh9
         DCUQ==
X-Forwarded-Encrypted: i=1; AL+hErGroLMB+nI+3nSaoUW3FgIWhx//kz7AVAhtoanHZOpgH8fwcWhe6yX8nXPGs224pWfbTTRtxpNVQ1WNGCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PV6waBF/xr3WfjJBn5Mw1ICFIWjH7srq69xTaoTXEVnqn9et3
	aTPYvnIoEuNCziZftHIjvIQvTmkVLxmhdnDzfyR1DV0wvR3yIwiCWpogRh4IKAoR6lE=
X-Gm-Gg: AYBFou2exQAqrRR4cKK8ra+lABLvniqjRw4sm8CP3PoNMUBuyQoBY0OPzBtrkqhRZWR
	PYGwXffkR6f776WKMetvQTkLwt/ohENq0yPXUPxoUogzymhOSpI3uV3r2HDCnD9H7O6QWz0Xe2g
	avJGetij/8xrgsm/PA2E3a1nnzxRo+grc6LTHB7Ladxx5ckgNtrx97P3uK2kYWIkTIqsz6Gm14b
	Eko7/xwkrJrwFhU0WOk5Eon6aZ1hAKdkf904/Aw8bQcSzQfnR0a5AopBniXuZqjlL0WUx8AeWP+
	fPN/l3tO5+zphTfuI/2PCrgdJpDtP74Iwv7dgpeXlXgW3mJlCk/eczGodRQmObZH1fttLvTfdSR
	x+Xpo8Sc5YfLy6goFDxeQuhW3odWDhxPzy8tdHWtDJyziY7/S1eLTl0bDNZr25X7HbJQFeUZ0DJ
	Rl7cVLkG0+IHgKU9C+rEEUHBuaQz9Cq3b6fe2spuv6P/zovrpZRAQUDXAa9uKxq7Qmc88rJWcLV
	I1OyLfJBy2myzRxtc4uYRwabGQWsKBUBQ1imSeQ3Jw0tZ7Uz/dqD1+cqiBmWiZAQeCNLqi5vP43
	p9mJzokELgN5AoVsHk49P38MuPwx8fG3uTAWmZtKHkCc1OM6
X-Received: by 2002:a05:600c:4ecf:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb7da2eaa2mr40922415e9.23.1794996079988;
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm3910716f8f.21.2026.11.18.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
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
Subject: Re: [PATCH 3/7] clk: meson: pll: Support active-low resets
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.553972685734176286.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q33DSpltm5vwmAzvC7fHaPbc9BM0xB8WQVVAhH5UiqE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3PKLqkKiK4KL9OeNlVYi5vpyrLt++ZICz9b2v0+M
 NKhqSS7o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPhO8bwT/ObRNYFFWbhO4dv
 lmje/SC04FFI1KPbrlWh23OnJe9KCGH4H76H4dc1wYz1vUpzPhXvOsXz0cWI/2B2iGTEnGvxN0z
 LOQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that the reset of a PLL is active high. The
> S7 HDMI PLL has an active-low reset, and its lock flag only rises
> reliably when the PLL goes through it.
> 
> Add a flag for PLLs with an active-low reset so this PLL can use the
> common implementation.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 44b33051405f..4ac5e45c1e9b 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  	return -ETIMEDOUT;
>  }
>  
> +static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
> +				   struct meson_clk_pll_data *pll)
> +{
> +	unsigned int rst;
> +
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return false;
> +
> +	rst = meson_parm_read(clk->map, &pll->rst);
> +
> +	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;

nitpick: exclusive or ?

> +}
> +
> +static void meson_clk_pll_reset(struct clk_regmap *clk,
> +				struct meson_clk_pll_data *pll, bool reset)
> +{
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return;
> +
> +	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +		reset = !reset;

same here.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

