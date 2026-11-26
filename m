Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673896;
	b=IZrNwEj4X6aSFEoFdIVbZWG5YsOGjPXsyJ/Wwa2Q7kPSyPqnflzzUIW6IAcJp33bBtjD
	 jrCdvovChTAe4m6txyRPcdDOHWWg7V5fei8fyjZSWA+CLs373m5AI/z1u1qPMOCjk7ex2
	 JKwS73yLCffn32JJaXMgHbzbm1Ca6oCjzshzLyOt/3hAIsxztEWllUs8FJuXQHHNHNQKd
	 y/hhKdpw+xtxqPllG1LtPGKlkauRZ7JVuKhRuECc3LE1m28NKjzgLade/bWEca4sfPZSh
	 a1PuZYdp7B20R9WkCffji6VI4wJHd8AixLoxtoicEmcuErKgKgK+K6M0BznofTR+edA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
	b=Fj/j0pDtvVm8HcgR0D8Tg5bq0NTtxIN8PqnCi7o51bsR8UWAUNHAjYeTzY3MDBhTkqqH
	 tXeC9j3ElmrTow0Aw376iZn0gH9Xog98u1OXaR8tkmI1WYluyq1DwzSbpN57MMMeVgGQZ
	 az6qQFr6T/jHP4HvWzWATo9HioU7D/CpN+cHOLUm1ez40q9S68gC6eYeGlhAnvuOBJbzt
	 6YuvaAyDXNXDPhIeyr1UoEXlu443jIiqOitzf1LuD1G7oyJjjR5Aui/GrnrSjZZHqV2Q4
	 LhWt0gszW6VK01z2KD1+hestR4ZnVq/jL9c8q3L8etusu2pCrSKggnAESZZ9ubMUTpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="gLq869I/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gLq869I/
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b502b9b702so77166057b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795673895; cv=none;
        d=google.com; s=arc-20260327;
        b=AvoynT6jKLD3l2Fbm4pBAK11/ZZlfBddo+1+ummWju+Cyx2tiP0vD9wC+71mVdin8H
         CTinpE2+c642MgO+ATZJktWhDNyA9FAhcQCLri8yg8a4KP/hI2hJ5YrPrPK8iD5PylZH
         LUxPbknqkTjk3RcWtqn0vHU4LN3UCGvffLRXGtWqzoIiA7g2QsqP6UnmBQOhXwuaV1sC
         wPyd0rMokDiRUPeGApslI29V0ajiaSR1r/VuRHns+lG8SX2FdKHugZJy1dSGLiyDzxYo
         MEvyIXWAzt1SwGfOXgBnFp4iazxOYGWVyfQEKunpfhZCygH2Ut78bzN1rUIBtgqMSo6W
         AmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        fh=JUHKcfdX88PyMzdPr45ra6WLpBIurFFeK7zCW+uozWI=;
        b=SAvGOZ2u6HI5YeCBPE+/DCxaqh7c/09Sg06u8smD1MwEpz+UTuLdrnq25da+jKlYFe
         FnbRj0gV58NV9MLQRyYb81FbvgHU5BaHpoOR+IMP+NQny0zYfhSGaeJdedx/CuQ9nVoa
         utNlGBJvZHPmgzql1VepbOdnLyQwHR/tmcnOGQRxPEOQswpbAzLT4hPZ6XMrveoZArMI
         MJJoA6pKcOoqh/DC92fWSL1MBOv99/dMjU9ZA3hdXaHYW3EV7btiQ6Z505UdCf1H0HeG
         brHRtv+5MbFy38VN0ga7dTBDticHsRffIxw4s1n5QhGcRznLUJx3sysHw+/f3PueqGzg
         YEdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795673895; x=1796278695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=gLq869I/6qlizse+VwzwIgPRWMmieNpo0tUZcjygdmskvRI2ZPWRqHTsenXWr5I1F3
         FPEEpS6S5fHY/rb2oHadHWP5QZmblRzCSLlWOrSfsAM0ZoGwixi1dllmnVS+fZEiK8DM
         upjULIxs68FNVmv9roqVaHOTAyNicVsytkUaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673895; x=1796278695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVOanH9gyLL3aaqPDmZbtrwaaIj/21AzXVfdkKlPJG0=;
        b=JnW/yTUkqf/65lNBOupQBvfWzda8gK01tehJWHL3wcgujnKxvQCyQaxp9vpp2T4s7p
         TNuy9J+JubK+JTtdLv1jDXUAGwH30+c0Fo56ebpybOO4W+QLyY3GWvkDyETSgAW3BNLY
         IuI97bLIzevmb5FFn+X+Y4C5XybUrbqaAW0F90Bl5QcRFxzcEsO45RneIDngGlSWQGf9
         dGGTVz9jHQIvIHDYUMyq6tk9we9OneukhMlBLG5ct21u9t/FeB2WWhtl8PGLc39JVC46
         6epyPfDWP3nybz8WKCan7g7qkZNveclIfbVFmaSD5w3ynyzHvqCLa+B2iUlx9mw96Maj
         gndA==
X-Forwarded-Encrypted: i=1; AL+hErFAvdqhMgdeubt+OhbT9W4Hid/qrY8DfMcWeJqLQGjo2iN7d+e8IScaD49QcY4nrjbSZrOnT0GcGSEDRg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87NdmNDkDy70ytRpCiHCkwYfc6WHAsnYFf+hG0CJkPXQLcrBSO
	sRpqijeb4PIHGzJn8D08R4jBYiuu7TZkk8u2L+UHJZ4kGv0ax2m56RJ5561FcWg3rqGxPLq8McT
	i0i1v8MM2Cw/TMtIdcSQ8MNXD4FE6/TMGoguvEsva
X-Gm-Gg: AZFdTZcjnEcU0QVDPsn8wXQF9cT2GVDlaXyCsgX6Xrx4JNstax2Lz6fnKRpFyWEkUDf
	hm42bmUYThIT1/g+oUFSaBbFHOLTc4K1dqI9mWzBf7angIAbwjKyH1kpIxQutqvhP4WxFSRMIev
	ES9rc61XFA/O1ycISiOq3ZRIAd32yjk8DgmMn0IZoc1pRNEEDhhnIdNjyChFS3G5C0rfvB1O1ej
	SjjeAU88Kxi4CN5x6DwBnVpmpopnYGMQ8rYz1tF6qDe7uDVGv8lWaG9H5G8kEfudxSpMBrkOYXg
	FgbICvX9MfmfxZMjcQegOefUfnNi6GyNzq0AwC91Q/S7b2shg1k0WFz2vTa4gP8akddEExVVmxl
	i+WCWNYOKtNPfBaCwi5qV4vgTZyJ4D5D8GetvW+xyF3z6QSaYTbfcNdJ4BCSUnnvhT/I=
X-Received: by 2002:a05:690c:29a:b0:8b3:b5f1:89b4 with SMTP id
 00721157ae682-8b520472ed1mr75612087b3.28.1795673895189; Wed, 25 Nov 2026
 22:18:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125234822.94684-1-iasnezhkov@gmail.com>
In-Reply-To: <20261125234822.94684-1-iasnezhkov@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 14:18:03 +0800
X-Gm-Features: Aa3M54olT77g2PTxdeOuWYsBXJkE8EBtJ7XPbNnfHF5Q5XhrfHNOZbtGC_6G3kA
Message-ID: <CAGXv+5FgDoHPGcSHqMvGKb1R+2me0_JPr3xq_twbw-n693KNHg@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: fix MT6366 VDRAM2 vosel_mask
To: iasnezhkov@gmail.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 7:48=E2=80=AFAM Ilia Snezhkov via B4 Relay
<devnull+iasnezhkov.gmail.com@kernel.org> wrote:
>
> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>
> mt6366_regulators[] declares VDRAM2 with vosel_mask =3D 0x10 (a single
> bit, bit 4) on MT6358_LDO_VDRAM2_ELR0, even though vdram2_selectors[]
> uses values { 0, 12 } (0x0 and 0xc) which live in bits 3:0.
>
> MT6358 in the same file (mt6358_regulators[]) and MediaTek's downstream
> MT6358/MT6366 regulator driver both use vosel_mask =3D 0xf on
> MT6358_LDO_VDRAM2_ELR0.
>
> Change MT6366 VDRAM2 vosel_mask from 0x10 to 0xf.
>
> Found and drafted with an AI coding assistant while auditing MT6366.
>
> Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator=
")
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>

Unfortunately the datasheet does not include these registers, but I think
it makes sense that the mask should match that for the MT6358.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/regulator/mt6358-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6=
358-regulator.c
> index d6a0ec4..1d62c25 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -604,7 +604,7 @@ static const struct mt6358_regulator_info mt6366_regu=
lators[] =3D {
>         MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON=
0, 0, 1800000),
>         MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28=
_CON0, 0, 2800000),
>         MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
> -                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x1=
0),
> +                  MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf=
),
>         MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
>                    MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00=
),
>         MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
> --
> 2.54.0 (Apple Git-157)
>
>
>
>
