Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027908;
	b=lJAlNOCzSw2vPRK6ITUaTZY1++azuQ19Dd+HJgaF7ryz9OLQcG3/ZWFdR8SU+aSh50jB
	 8XgpCWswUnnW+8CX1lM+4bCcWHz9MAz0rZWnqOPQSnGJ80Rr9GvTmMM5JGX/BhQOqE7p8
	 eIbjvZcU6we0aFCzarpSxrcZetycP3G4DJ4f37Tmlr163q3nKTYQ8EjAJPtFKbshqrsvk
	 KjZbGo2EweIDujDx0cuPnrJlfdWNCzCJXWueMZkERrMyA9bR3HdbVmgJjoRjGwbh486FJ
	 ZsD4jdy+Isiuv1Oa98SDLPjnS3EjfUdwQWnxyzza3TLCP+J/avDfYaW+3Vexw7gHqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
	b=qFDjLwNFCvq17BU43ujJFv2/rK+kEfVkX18e+s2bHlCaA5/iJ9f03HQpcMZiysmprkcQ
	 yu9NstXF0l5H23UjSu5OhTmeQ2k0ytxFwZ1QPAcd7ctczgtTrj1/F3q+97PJCHL6G83MF
	 s95mQPAeCPOZnRfIYTrQRCEEiN/AXJOr23H+NVLCpuxtkXCQ8KOUnS+rqc008/mn6jI9q
	 rRCrWKBQL3TMOKT5I93dJwJILgshybePX4zAZRYuctmRvVyGzeEBQO1kNjt1xCCu8vEtR
	 doXXA6EpcY6M2w6hikUSuJI/HrQ9iIGMuE/JrohmYzJIhUXB5B36QUVm0WaTAU1AwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OCJgcmaN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC1D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OCJgcmaN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so868067f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795027905; x=1795632705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=OCJgcmaNzv3idZo573FNrHHp69nwKZzTQnu0bP5Y/fzVXXfdWzfTxcWT+P2+QpOXFT
         IqA4wKP4EsZbDeKuyUmVYCtFRA45khDU3Ug39QiBJHvwH2DdI5o1Ddx/uVRFTFqIkMG0
         rvpJXaX/M3ozh3e5QC8bNKIkBGYpylLLDlcFK8pcY9jd6NDWAOxDKlFz3yP+/JDplbFx
         YD/pLZ90E8wITqvbW0gWMIZ3rSRag/uJGI7xFUS3IkImR3CyBGRXdtoWVDYDPuilRhcI
         q6jOBnAGrzOmfs+I2L23YUjqeFXhUdtSDeen3h5uLpU6+bOVWvQgATfreTMIMhVpPDU+
         D3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027905; x=1795632705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xr3ARsn3HSOBe/bAlEDhSRHDkU6XOfuvo4/af9LL+fg=;
        b=njLoJQE2n16bdKKkjsK6IC/tHB3lKh5LOSTOpvfsuXuCTaczROZKbHCCGiIFJI8Uki
         ueElWExVmdBq1+h2TOWBPGJRF7obD5vmzx+l73s2o+C51y9ZaEN6s9LDg6jC/S7JzzDt
         2FcYCJ1Xe/CyqRag4LxkTgo6pTAzqS8pwqnVDObBvDuRiraKN/OQEGafYvrb24AhfQOJ
         pPtskJyt5wdaRwjgZVHeF3X/k76eNQOB0HYy35lFzv0jQvY+ioaU081qPZzGjJnq68wm
         QEUqDKi7ZYvGnbYAr76ZvNh6qE7fpNWLxnYdCUZqgbYO7a1aaAB8D5wEuXpVMIFBK9W1
         8GDA==
X-Forwarded-Encrypted: i=1; AL+hErFvlB1b0jjjeYhbKR8uOLl7tau/gOAuN9sh3LTHGm7WVEmwknhggEl0jtgQn2ZnaZaUd92RSndUH/lU9FA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sQbBEqsoxmS7CQHCtB0MPVZF7GtJjpvmBpEYGpOKT+zKvyPFf
	gLC3DSveiVt4HLxmf/0I5mT1LxHy6a97Gu0A2sYKju9nNi1yerd0dw1PYJkNcsbghyU=
X-Gm-Gg: AZFdTZduabuczZpLzYhLxbsYjIIT/qSTJ26tG93IKxHFg3XzKk+kx/jIsBJ+QM/TVlw
	Yy0g3CHmhQGdPfOcwNAgTC1xyW80YIaCfZtmbwO+WTlMmrTWTAhGZJwoZM91BAFWdTA5wfSkMUh
	v5unV3RtEzoDkTi/iDycPSEwJgHtGkehgr7kPhhcIZ3i6GS6N1kErFX5G8fXvXn2iYoKcvWR3gD
	N9BpGhao9v/oWA/sOn3F0rvYa3Jh4qm6vm2ZuoOYuxZSX7/OOMm29ywbQAikzDf4pcmKMelnbHs
	4W4SRt4bkJZgI6FzYIfgZ02eLpquVgDIlCMYSGJcjRq6Pr72mJks9DjDgQnjAn2hnls+RS9wBmJ
	Hq/cJOTAuZblIrN9l8o09/74uZKhdBsWUdVKna6VMEGO4NmyetZb4JgSwobmS1skXwGj0jIjQM5
	M4bbSdE/yYYylysYKj/qJfbidCURWl/lzKkIhX7m23qtBYib4Eik0Nxy8BfqXKdofHt2v/R0nAZ
	4kmyaXdjJTGpyJ0bCEWr/kD1vWrau8B/HG/FvWZ0OPhpjcQjdNnjJjb+ZqmHbxLfjoLxk5Vp3Zj
	17sp2u+j1AREh3AjNX68AXT53vTMD0peE3wqYknuEsKV5+UUX1bZv8kqdKoVewwomQsVwpshmzw
	ujoEMJ2HcQQ6aRUt37ljLm5hytO8gQhgx2dEPsPbDk45AHw==
X-Received: by 2002:a05:6000:2601:b0:4a8:647c:f965 with SMTP id ffacd0b85a97d-4a8648c3f15mr2958154f8f.41.1795027905569;
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm5807868f8f.10.2026.11.18.10.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:51:45 -0800 (PST)
Date: Wed, 18 Nov 2026 19:51:41 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
Message-ID: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179499607256.413320.18141155995846183804.b4-review@b4>

On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > 
> > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > firmware and the init sequences set them up.
> > 
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +

[...]
> > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> 
> Not sure what this imply ?

It means that each of the five bits enables one divider, while the
datasheet only documents the five bits as a single field. I'll reword
the comment to say that.

> > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > +
> > +static const struct pll_mult_range s7_pll_mult_range = {
> > +	.min = 134,
> > +	.max = 265,
> > +};
> > +
> > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > +};
> > +
> > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > +	.mult = 1,
> > +	.div = 2,
> > +	.hw.init = &(struct clk_init_data) {
> > +		.name = "gp0_pll_div0p5",
> > +		.ops = &clk_fixed_factor_ops,
> > +		.parent_data = &(const struct clk_parent_data) {
> > +			.fw_name = "gp0",
> > +		},
> > +		.num_parents = 1,
> > +	},
> 
> Is it the good old predivider here ? Shouldn't it be modelled with
> a read-only divider rather that a fixed factor ? just in case whatever
> came before did not leave things as we first expected ?
> 
> Applies to the other PLL instances

Nope, not the good old provider, this is separate from N: N is in CTRL0
and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.

Now, it was indeed a read-only divider in an earlier (messier and
unpublished) version. The problem was that with a cold PLL it could
cache the power-on setting (/1) at registration, then the VCO init
sequence would enable /2 without updating that cached parent rate
basically breaking both rate reporting and set_rate. The fixed factor
avoids this mismatch when Linux initializes the PLL.

After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
assumption is that an already-running GP0 has div0p5 enabled. That
matches the firmware I tested, but the driver does not check it.

I could (in theory) return to read-only dividers but with probe-time
setup before registering the clocks to establish the divider setting for
PLLs Linux will initialize, and selecting suitable multiplier limits for
any inherited setting we preserve (the current limits assume /2).

Any preference (or any other approach at all)?

[...]
> > +/* hifi is HIFI0 in the datasheet */
> 
> What is stopping us from calling that then ?

Nothing, I kept the S4 name.

[...]
> > +/*
> > + * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
> > + * each is two power-of-two dividers.
> 
> This comment is somehow confusing because it only partialy matches the clocks
> defined bellow. Please clarify.

Riiight. [22:19] holds od0 [20:19] and od1 [22:21], and [18:15] holds
the hdmi_pll divider [16:15] plus [18:17], which isn't modelled. I'll
clarify.

Thanks,

--
Carlo Caione
