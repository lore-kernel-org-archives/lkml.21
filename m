Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795331748;
	b=1YdSB6MfzfsqQxLpIqf5Eq4+e6Do5tAnSpw10uvvYZ9o2rfk+/GWySKlc4Ys3A0rrBPl
	 1mxouXCuuO0AGBZNLWjzayPRO4maHQoz+v9kGk+lJzIobplkVA6YW1gGQxDuG8cv0HZP8
	 72Ko7X/fnldaiVGJ+QRIf+kiLeto+vDu9ET/Gph8izvPcCWRU9Krcf2M0yVMGczGB230r
	 9SWxeo9/ClkYdZdcdSARseBjIliY1wR8g6CjVp15LHk4X313h79HOE/ZgLtdf9JnfMUjA
	 tOxKvTjx2XglSeN4WlM0WZTrgjvu6JVbhptg9aAvqNA/+35I+FpUkVL6+ergq/Cufsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
	b=L4M1Vi6KL2j5m9pgoTE5CBQ0MlG8J50XxhwvK67qIg7ilP0+IQpbYnQsq6+ezr3BX4L8
	 4AH0jrH4/Inb9r13fdeH7DKfM5YpBQri+dXJXWdu/BsWW9cpngmQlCUZyUiekjyJUhc9n
	 W5waPD0ietS3iOljE4pBeMaWzDA9+UTlE/uraqIYad9ajtsoIRvXvGP+zUMdrn843ryCN
	 Q7fCnv9NLe4S4ACOddz///dlsxlogreT4vg+oUfUSRFBPwCmorKgvrAzG96KDa1toulZt
	 JCQ3ylv5Sa8cK285CprizMrKQLntkmSkRfoOwdy2k/kdBrgkNFjM58lBH8Jzsu0dObA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgOydCgG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933E606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5933E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgOydCgG
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40312e2so5227530eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795331747; cv=none;
        d=google.com; s=arc-20260327;
        b=QgjrDHITKW+E6tUnFXLA2iXElvC0lkDH+D1rQajmLbYA4WWeDeQEkOjx4D9UEV/4Y0
         8ixKEgzlTP4hG0Hl9UtrpcqoDa4gLRHEEvfCvWIxjh5pJtRYXkHoqyEeEVtl7Rw8NR7l
         BC8ostwtCCn1ceUby+OvSiHHFGkYnCxVSwLaqdEvllwEEC407mfh1cboToBbuyuXPfCW
         02EmhsjeTQQePSoK5VUM8ClG2JlDblcrlkHhqHEX+P3PY0Iefie+4C7wRnDUeiWXFavt
         FrD+m4Uo+G0LmAcC1pcOJ6UnC+0wpOVV0FceAHu4RVyquozVZucJFvq3nwn33d35Y2LX
         bnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        fh=JZS28lTCZgov0oV3GHq5ot2FpeG6Khc26mM4G3+xmTQ=;
        b=gCJ554R7/kY1qfKKdUJNJ1awIIkLMQDL1DurYon/gBbKBEzjsHsu16liLjZM8Fzixy
         yCRLMEl4KylY7OBjAweGOnP/mpLPVTDRAxIDFBdz2oRxhkm2TWvWQnMq9xgd2QVbog7g
         fI2TXyzm6Z1Oo7DlYue/y9ohtlE4EFjyn3NyXkH0+YYTrZhvsHx3BWxBLDh5fdDMwp0E
         pYC/hZhfzcD3/6jT5bjt1uPEXTAofer7Bt89FLI/hcdD8IkgKHwXbYfWCd6iaZ7o9+71
         j9L/ooobhReGNg5ekjK2CfeBPLjmSObRiAHN4rJa4cA32mkP+OA1+WwdwRRbJlEyurk2
         KKYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331747; x=1795936547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        b=zgOydCgGLvzBHGnrewiT47ZU8ehdUIjbWWf5N8uDJ69f4Vj091xIH3DxzcHRGMxAek
         HnC5elPU/gnZCscPtieK8HkhRL9dpaKv5HORB7OLuHwdaIpt4ELAQh7JXElTADKSoGpd
         y2XGih4LfJqzUM9FwpTmUiBZHLJ5SxfJpwZbdUM54QhvZPoAPGV1X4lffvEnL1MOTsei
         cG/QI43S7EYmYmewrMfu/gX81rOx7dGOA4YH6EnZSN5tER5GMg4WgQvR8k1AM0wMNOjd
         Tryyu6Xkm0N0hM6LG+d0/rkZ1mqF5MTG7JblsPGW+a/cvEJVCgZOCWvpYVYKnKOIYWke
         wY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331747; x=1795936547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9vVVtNKbsfO1loptCZ6tnTCDjeM/wB8BwK7TcAw3O8=;
        b=YxEZbaoE2hOsvkRfDEzRqkZ/J8PlO8fplqW0kC9zqCA0JxpczH2+8vLfYsx1+N3otD
         5uhRAUt8J5LY0+y+l+0LHLur3EuobI8Y2QQ55S3VBqHTfloak+ZUh4XAToyV0NueT+dx
         ssnIpabSe5lTbVfq9diHdYrqGpOut1ILwi0fsoUAcu/Cj0ws6U2qz5q2aimhcvbetibR
         kckDRwTDk/JHZG/wCyjlKyFPraCoCnE+kCPr+5Tiysr/4B2pTy3i6UdsyT5wLV9+butJ
         kq7Kqi18zBUEI3yPifGx+BoMTsoRAsmYSWcNG1KKcaYIvH31aVvhNRfkdD8Vi4bJaFOm
         kljA==
X-Forwarded-Encrypted: i=1; AL+hErG/vWAiw6DqaXnwylycyqHWWQZfBBCMh93pnD9KJqSMHpTqFLcsIfL4BfUiklqgbyTK/9aUVdoOuXnIa04=@vger.kernel.org
X-Gm-Message-State: APuU4Z84xXbCu99ZWfqpv2Gc+xplu/E3pX07yD6n0Ri0SjxDTPfxymJJ
	GS37C1D1xQEMzb7+duaZ8dThX1kGzqrIzK3xbUCzRmIjwpERGiBqNORwjTxTY1Ic4IOagBslAab
	ZtzJdi7Z3tU+hLS8z58m2GD+MJ/cFmGs=
X-Gm-Gg: AZFdTZccV+9tMUa8xnU3lOPNO6zzuVvzg1kPv0mivzZ6waRisjb6zKpiUF7oSrSdBRI
	kqYtJzJFHsj9djNuReGUuppCnkFp/W9d2Q1LwIEAr1Lk7hoGGH9C2tAB4FiiKH+nA8KPhfxMEa0
	Zq0mkuxfqNOqxGUYvEG0SHS8Ibd7JONCqtrOgmq5siNLnDfUvKCDjWfHhGZ0eECDDLLbFGM43Sw
	GjUBWP13+X8mj+3i6fPgBiVb9da+Ysw/Museb5r2lcj1eIEDmYSKQ1Ht2x7+IvI6ZobOeTBAxue
	zC+9QBDYZUyt7qUDOO7CcE8agnLXFb/W+Nwj+T6YdArZ8Rb+ZF+Uk7fgwgQCSTc+FHF7d7p4tLi
	PvNw7EB5FdEpC6Gda+CvQ6kVBD+ldLmGNwuuPJCBrDFWkB8lPKR3WwXRETwU+U4+I9I+q9HANFp
	BpXsHl/nTAXd1l9FfLt2+xOKtN8kw3/g==
X-Received: by 2002:a05:7301:160e:b0:384:c1bd:aa5d with SMTP id
 5a478bee46e88-386a87f00a6mr1177313eec.30.1795331747418; Sat, 21 Nov 2026
 23:15:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-host1x-mipi-clk-leak-v1-1-c14ac933945a@enser.io>
In-Reply-To: <20261122-b4-host1x-mipi-clk-leak-v1-1-c14ac933945a@enser.io>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:15:36 +0200
X-Gm-Features: Aa3M54qHH4yO8CRWw6s4odlh_SwLNi-dJlAJG3IGVZ6eeuCgoP84FoSy-vDiSHQ
Message-ID: <CAPVz0n2GVmhrR7nuNLrX5n_1Ka4_r0D2kZ3dYxNHjTiQAnzanw@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: mipi: Disable the clock tegra114_mipi_power_down()
 enables
To: emcp@enser.io
Cc: Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 22 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07:1=
2 EMCP333 via B4 Relay
<devnull+emcp.enser.io@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: EMCP333 <emcp@enser.io>
>
> tegra114_mipi_power_down() enables the MIPI calibration clock to write
> the bias pad registers and never disables it. tegra114_mipi_power_up()
> pairs the same clk_enable() with a clk_disable(). Every DSI power-down
> (each DPMS off, each suspend) therefore leaves one more enable behind,
> and the clock never gates again.
>
> On a Tegra Note 7 (Tegra114) the mipi-cal enable count is 0 at boot and
> 4 after four DPMS-offs, with the clock still running while the display
> is off.
>
> No register access follows the new clk_disable(), and every other access
> in this driver takes the clock itself, so nothing depends on the leaked
> enable.
>
> Tested on that board: the mipi-cal enable count stays at 0 across three
> DSI power-down/power-up cycles.
>
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
>
> Fixes: 15372d4be7f0 ("gpu: host1x: mipi: Power down regulators when unuse=
d")
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>  drivers/gpu/host1x/tegra114-mipi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> index 49ed05d1a6..06130d453b 100644
> --- a/drivers/gpu/host1x/tegra114-mipi.c
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -197,6 +197,8 @@ static int tegra114_mipi_power_down(struct tegra_mipi=
 *mipi)
>         value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
>         tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
>
> +       clk_disable(mipi->clk);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261122-b4-host1x-mipi-clk-leak-ebf2c34b1640
>
> Best regards,
> --
> EMCP333 <emcp@enser.io>
>
>

NAK

I wonder if this is AI slopped, or straight up stolen? Or maybe both?

Existing patch sent 25th of Oct 2026:
https://lore.kernel.org/lkml/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e75=
5b4cb@tsv-stahl-riesa.de/

Reviewed by me and Mikko.
