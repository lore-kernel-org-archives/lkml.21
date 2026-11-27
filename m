Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797180;
	b=PViiPKBqXmjCEBAuDIFMLAiAG2PURZ8BAQs3PIDp+CCwAz1o+7SjWJ8TgWyh/QCM2UcR
	 hMWj4dHAvKPg6NOevjHHFMLLtw0LGzvWXaOKN7GbYWK3DiQxR6A34NHldep3fIZSDlwxG
	 AajCh6N6BVrmrXgkcTt4EdUhizw/mQRi6dcDgT+vNxtbjYpjlX3Rxs4TVy2XOE9pW2TEM
	 NHFAaSEoH/h7z8O0LGvx9FZG+/CTgXQWA+2FHPT/hmdlUZHc5C7wcnnKtOT76IujrM66d
	 gVXwdQb5YX2k3A2ptr/s/hnaB8/dlWVQdhXubsq0rD8KQR7UTQxq/axREk3wzBY3FNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
	b=wTBW43CVjmwF4+OtcrpJkGJZiDI/b6x+/vbeBNcr8olYHTfYXO0IAuLlsiVI1V9ivzSM
	 +OY6ITZF1W+BRUS3gKAyUvZUqM6bHG4AG/jcq2AulaLW+HgDl9nMDBbBG2RlF532dxaRm
	 9+Q2rPXsOpN0ZpeMzOyeCGQtiwaO4wcp25YnG+97vMFSzNrAZvdfKELzC7/LAPduxAQ2c
	 3ZHp08DuHenA8HVs/NIZJBuGhJQz+vG0UPlHUCjbklNeFusgVGI4rhts3khcMpoF0vVAd
	 blKJNLcdaO5r4ZBL4LF7kfFykoLh9JS2UKyfuQk4NrI2zFAWNfwd/v3pHiBSqDeGpwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R0OV/R8N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0OV/R8N
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93a40a9a01aso1052702085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797179; cv=none;
        d=google.com; s=arc-20260327;
        b=DxdCqC7lBM9iwJQGUQrfdBxKoC6RQzUVuk3tcgMWYjpV8T+XIKHfk96OV+byCnzSrg
         ywnYeC2EURA5wPZve98OOYXMlRY5l4VKRqaTp7dI9cgZBP+ewrX7yzAoFjKkAlRpMLf+
         37+yxqGX9/nwPWORg9KNQ+bpGgsxj0jnq43vr8smd/pJouqrmmCf/1xo2chXaOn186Rf
         RscVRHE5+twx3909tXRg4Rq0O2uc+PFqpFjOjPPqrKvn+3tN0RUEPtyNdewHhFHUuvh6
         3oWqwqxu28AGCIQWjfvHIQe1MeAGc/9W6CC3QDNLc52ZqDhMazpYMkCybiUZdceLa8eh
         PTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        fh=B8WVC+u3J851oR7VEtpQXZm+TQPC3mptVT/ltYqCjZM=;
        b=dWNsm7L9HlnrbMBhOlpK0vYeSG3YhQcOu4T/6dI7IHtIEVOnf50HuzuNk1Wv/GVktI
         fRl2CIL8RdiToUbiWJVs0mlmco3J0GhLZedsV7sg1L4CMlANDhQwfbfVjko32q1hPEL5
         Wzu0GfsHkd0O5eaGTqlydI3CZcNn/gEAne0W4cwiofFYdTGfBSKXc9uaFKN+NxMxXauN
         cfUE6FFi3IhekadMRjSN4P4wg4sQWJWTX2YllmtcOlDejbcLdGFhj43g81ax19DChVD9
         OTfXbPcXh6tww/msO6yq99YPFk5ii/KDMhgwYhmwe9D2M5ij7JkTb/bkA281rw+qYZia
         gnmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797179; x=1796401979; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=R0OV/R8N3BVXXKY1j0aTwOiPavF7AId5koBfS3gHaU4jEr5HoP+Tj640rwdSzLgRXH
         CGvg2hqLOF9uvz+3E5CeSvTj3enmbqX+80sdsC35Zd7qOQo+aGoPD10v5P1GRogm6G8t
         SmBwu0rJxJRYkL0DIta9tRVhidpGkA7hnA3xNd4BY/X9OQ4C6SCSxLW+Mjdj89Br4mTx
         WRngpZCi2qvPMoFP3fI+CtwSkMcv4e8jOvO2SlpMmWE2HLkrx5kGzmbg+muJAYWduDSB
         UJoBL0pXIs27FYQQEEXDxE6N5YTsacs8zFatD3SuAWjcsNLfNJ3jCy9LLMzfXNd31Khx
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797179; x=1796401979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ji+oVVz/nzpz5puo4DZe7HwzAlM3UJiD3cXKn2jhyog=;
        b=1KE7bJb43bJhayr1TUqZWd4ZhPTqtT4T0piKaZDJWuYSLl1N56q++Od3fZInYDnxXH
         fcoVHUNhGAUeKD8RZ1wBob6LCBOfcqJZVbVpdvG+velzKXxw9g+xhUr3Q0tncr7J1Xwt
         cvJJA3BBV+mawKYczGlGazgtxw3yB2h2hEhPfXHD62iy4DiB+rMrI5ttynO4FfIFatsu
         JAIKZppRgbG7lFQupzk1WLs5ZasdDJ/TD43kk7au4CAsqr8/PUL8vW/RKqo9r3S7f3fW
         xUTw3oDve8n4L+V7p8FWD2RNynyXbxYLvMcV3bRn3LXOi7xpc9A/C9oKe//B7lTry7UM
         1B5g==
X-Forwarded-Encrypted: i=1; AL+hErEYV7QLIDmOAHCllocE2XU5PTb1iYUXsIskINh2RbAoveNnIjJHDtac8EN9u+W2EIEAdXjW+WC32HZAdkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWms1pdV3Zoyq06NP2PW3sMB8h4r84bef3wXLFgtQKcPzaXTg
	jT+uUJ9lYFFXG2Z33UB9GAId5emTtvQ6YCyTKvJBh0+Ft7bFOUa2YxlZHQU9HGsBaiMRmP0UPhs
	TEybJ6+QQzBRVjnVDEOH/7e3s7EtO1cM=
X-Gm-Gg: AZFdTZfs/ZEeheK9OhgmMdg9ZhFPh68YQE+GsCSRbCKvdgEKgl5wBsUnPeqlrNcpLBj
	mNP99HhmMT9LUEjeWatzJ90+BkBa1ia5j1EP1IWvji1uw5C4c11/coCOk9g5Hqjx1zCajAH3LF6
	oDeIOLBrM+zqtWfXu4AUW1IPV9CFlM9jKUmNPdO/VWVYgvnX8VfBAFYTGmHpYs79GI0tbBWxFJy
	gv5tf86jJ0mSC9eZLhfh8zJhv+khDAJieNMBgtnJQHVeCUjY0P8G5q+9KyZv+1x5u19TmxYILk4
	v0UEPIdm7Ek1dmKbJ454naFP13UXSMCC7wddo8D3Pv0PYnufsls69giCcwJ4J1c23h9UcXW4HR9
	W95Gjwmb9Z0rcby7QlOGoqdTfa0DEmJVqGa104oWxxWf4i9FmIfYCTmRtx6dgPfOnkxA=
X-Received: by 2002:a05:620a:1b82:b0:946:1dc:a276 with SMTP id
 af79cd13be357-949b35ac8d5mr4672679685a.18.1795797179191; Fri, 27 Nov 2026
 08:32:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <__OIHsqpwOqb8kxVYcd2PoPvNYDhN8XO6vyXiYMCCK6o3sfyJ1gl1GNdhcGYhdfBf43tQmn6Dt6cWXcSD1uiPA==@protonmail.internalid>
 <20261127134507.125513-1-hikmahgumelar@gmail.com> <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
In-Reply-To: <012855be-7a95-436f-b0ab-11ae3134ced8@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:32:48 +0700
X-Gm-Features: Aa3M54rpV9JJE-D1PefPa0XgKPQ9lDOZXhSn9zQqqor1iBHttCk79es3V0AufT8
Message-ID: <CADA=zOPWzK7Rq+CwY0izzjYdXGvTGKdSZMk2OUgN6_7oYV2xng@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the suggestion. Splitting this into separate
series for s5k5e8, ov12a10, and the MSM8953/tissot changes (noting the
dependencies on the sensor series) makes a lot of sense.

For the gcc-msm8953 change, I will drop the board-specific reference and
update the commit message to explain the basis for using P_GPLL0 with a
divider of 8 (including comparison with similar Qualcomm GCC drivers like
gcc-msm8939.c and verification on MSM8953 hardware).

I'll re-spin with these adjustments.

Best regards,
Hikmah


Pada Jum, 27 Nov 2026 pukul 23.14 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
> > cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
> > MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
> > devicetree updates.
> >
> > Changes in v5:
> > - Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
> >    entries in drivers/media/i2c/Kconfig.
> > - Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
> >    ov12a10 driver patch to preserve per-commit bisectability, and add
> >    MAINTAINERS entries for both bindings and drivers.
> > - ov12a10: Call pm_runtime_enable() before registering the async subdev, add
> >    v4l2_subdev_cleanup() in the probe error unwind path, update the active
> >    subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
> >    post-powerdown delay when reset_gpio is absent, and match the initial
> >    V4L2_CID_EXPOSURE maximum (3372) to the default mode.
> > - msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
> >    child node under `&rpm_requests`.
> > - Include base-commit metadata via git format-patch --base.
> >
> > Hikmah Gumelar (7):
> >    clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
> >    media: dt-bindings: media: i2c: add Samsung S5K5E8
> >    media: i2c: add s5k5e8 image sensor driver
> >    media: dt-bindings: media: i2c: add OmniVision OV12A10
> >    media: i2c: add ov12a10 image sensor driver
> >    arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
> >    arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
> I recommend breaking up your patches in three separate series.
>
> 1. s5k5e8
> 2. ov12a10
> 3. SoC depends
>
> with #3 depending on #1 and #2. As is you need people to pick up patches
> individually within a series which is always tougher.
>
> ---
> bod



-- 
Best regards,
Hikmah Gumelar
