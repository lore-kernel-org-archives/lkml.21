Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640427;
	b=wvQRmpaYqHZV+Ps39RHNOHWYKBSIWIH0JU0yTrJSEOjgI0AaGg2yEYKw+qRXbDrBjp+T
	 GDe+kzK49qOE1mVOX4cRNOHzn204Bxe1tJuHyO7JYeCsbpoPIZ4F/DGMyJ6vCUEhH3ZHi
	 jAnNR3pDGjVRFsUngJK59/37y3HPNFdb3Ay0pMnM0DME7sgNqkIHd0rcl/gvo1igKeYfk
	 ntDhEVJn2Us7P7LylrVPgg/2bj/dwvKnqoo7IH5uVePARIxpJ00ttu/E4CtYOpWbCQwAV
	 +/Js6Yeb77/LQXjBEMGep12b+61dYGZevpl4GILASPZ7s+OEJAJQtGTn+lQuy8CZHyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
	b=oJBPDrMf5sfi88psxNULogDRO1BYDhF+PWYMycIt8cMm8k/gNyuGKaauygUkpKlAknC5
	 uuWrQDs6hVGpie1xiZ6tKvg9ePMBUPPQc4G68wAofUfChBOPqC0udaY3an4pCB5AyVm5K
	 Xw16g0/4tiYPowqnj4kVu3H6tOC/xzIE6jQXyRzwLWeikpjWoYwBdTZkK3i7qMsQvm8JY
	 uHTeVHaD9ADurU6WQIZYSRSN1O/cSr1MCR+3VUc5Dlazek0VlYW+JGWHB7E19hX/27TNB
	 LXGgrKQFBvi5L9W2oSXnPBJPWCU6h6sEdO6Llpi56CyXvQ9Vd0V/49hlE+SdmysYFwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxob+OsL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F453606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F453606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cxob+OsL
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so7409671a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:00:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640426; cv=none;
        d=google.com; s=arc-20260327;
        b=bhBAbGjwcIT4IiEHq+h2VJCY4Rvv2dx0w/eg5QGFRrv5HKUESKbHEIc1xzVtSnrl/Q
         dmvplSELOMCsrz/4NfLLRceAKRs5ax1gyvO+E9IBVhQ6JDymaTYYowNGSxmI39OulVpQ
         1pRldrp8MWv2jzGTLgnXlyoq7IyMvm/fGEBgAaqOKZv37z8BU1PUeKe8BQOWk3vMMSj2
         s8xxkc+MT8TWhF9pTNoei6bjOZsFWG6O9i0gnoKIdD8qK2KEBH2D1N46BnN7Jp/3uhWc
         JMu449UzZhGZMYfH6xX4MyuEU4Agg4EzM1ODyrtE6bhu/9FXz7QE57TRLSMFixPQ/T7G
         t6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        fh=yN8NNZ4iabV+Qus38tzpKHTP9CzUq7Qlr5iQ5HYYpGw=;
        b=N9VsW4fMpDFJX/zn1jArtmhosuHPMnI3N5apEt1PfBDYDQpXyis8owSJLdq8baT42n
         Bk8UfzRa+ca1DPIJSHLGFVgldpazKilrZ9Xdq5c9FctBmQ5eRbGlEBtoKF2vlYtXLUmd
         cKYc2ToOqf41BlQ+/p0J/HIh3a0TeImA+h/Zr6JDo8lx4aGnQmqguwrDEjKHIVqBWEAG
         0KQu4iIDnkqCLQrX41JrNvmhTbeSAhYFMDERfbMPyyVIaeV9Ktw/NtIiqc5xew3kdSRc
         avnwiWT9Gjy9h5j6KRHqnDmH0J44OKFAN4PPIlXAQjrYkaXjYBUSZIGVBVglKScfuxna
         PTPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640426; x=1796245226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        b=cxob+OsLz+LI6gSbYA6thuRyfrH1dgIjuRpBF4KbHUPxZ2rsE4DJEgy8P4DAIb35b8
         bLQpEyI7Rrt+rH3GgTU3ScY+g4T12nBdONmcWbddXQE73wQ5Z+ltNR/dTHgH2Xgh+yS1
         K3OPtvWjTILA0L3n6/2wM9Z2+qE+JvbG+0GdvgiJ4JBJugOCHMihpVchUaHZwYc/8uMM
         NMJ1Z7WNAAVKzw9kBQlZNWqxbZ3gbrTrbj8UpDUxBXEi6UKTNiz5eCa86VBcXDbzmqWd
         QHyga8LyQLwMS83+UAT/Rp/i9saCnaSsqhJhnrjzMUHskYkIyh2s986CN4pMwLsly7ch
         mGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640426; x=1796245226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gmOR13tRsE/L8mv7snztTbSTrPAFMpGFrSn4syxB3I=;
        b=179lkvxeZ4jWI0wszvyOYWmR9meQf0k38HiM5rLU8OEJAwwhaHMdOudfotHERmr5Qz
         seph9LrRJng1i4IV3oJyyYfRivDW+Re8Xu+Obds/OiCKkDhlGaLQTZCGnNsEO1A/y/k2
         esyvHTKGNro5OhKs9AP9AobcgPn6dwnJ3Z3CiUMrrCQg0NOyE0PFLmFq76TSg8tEBvx9
         SL3QvlfGlJcJHMbshOhtVkFH9iBOGaW49PSKVfmRfRRTzTPZ6NSBTOKjiY/EvGBwdj2U
         mX2w4kuVLohxWufYinvZD8Zia2R/TCh4uYI4FKvF4iSYwV8Aa+ddnLoEzISvsCkwsJB8
         1ymA==
X-Forwarded-Encrypted: i=1; AL+hErEFpERIITz34VJntBUKflGx1qD+NsDP+u5hYLZGmK3tQP0zJgURUaot/JWpgk+qlsyJeTnegDb3zJ+ArtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TTeXz339VRBAgpHYYf0gY+ImdZ6LQU30W4ePgKL5dYPUg2iuw
	wBkY97H8NYRJv4aAZ3+FrYh/NkQ+DeAVGFoWBSzpFF4k2cZAiHKWzutaCXJftwIISwM33TL2Qc8
	ejqpkmED59OFQvDQ4kbJfdbacSiEVoJih4sW5qMnwcQ==
X-Gm-Gg: AZFdTZdT94HixJ55uWtHAVJqxJE14qLi7TA5xufq+tqnlLLaZ5Uf6422D+YKEaZo7/o
	0InKX3dXXK+AdRMqqLV6QNgOLrmEnwXXjaraxLbtgnhAeGxf6+9KnUsdz2VOLQcbogt3MGfOow9
	MZigpAcr7hFa4GZSVn++SRZ1gSn9a9ZXDiO/KM6fy2CsaD5ON43vwwoQ+UH9ThuyMAkgACWMEJ7
	ZwLD69+dq2svQ54sLMIesQ+xLpRmzDOlMBCs6OKwal0T2p/AWahtcu90ddacqxvn0HmL/Qoi0Uf
	JrwUk7N2Fi5ciH6aT/1hceYVgz5B5peTT2mfZoKWmfnXOq62+w8cHXCniQoMdaqnLXn23IPBtx0
	IKpNukFLl1K3g09+Maf3aPvVgOar6rcAD9/6xlRNlQJ4AULUQQhwO8GtSokAGko+LZ6PaMR2SWV
	/NiZex9D6T+tVKeNnF
X-Received: by 2002:a05:6402:4501:b0:6ba:3740:2d54 with SMTP id
 4fb4d7f45d1cf-6ba37ed4c20mr13845602a12.45.1795640425718; Wed, 25 Nov 2026
 13:00:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
In-Reply-To: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:00:14 +0000
X-Gm-Features: Aa3M54pc0dI-wBDqtT1Mj6foyP5ocu6bTueh_HXlntbnLU0FpkGjPiw7MqGkwVU
Message-ID: <CADrjBPqpioic=KH4=Vkd2S6jSgqUs+6kNg6vsmOwtZfPPvR3PQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: max77759: Set zero DMA mask
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Nov 2026 at 06:12, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> During probe of the DT-backed MFD child devices,
> platform_dma_configure() calls of_dma_configure() with force_dma=3Dtrue.
> Since the parent I2C client device leaves dma_mask as NULL, both
> DT-backed children trigger warnings in the kernel log:
>
>     platform max77759-gpio.0.auto: DMA mask not set
>     platform max77759-nvmem.2.auto: DMA mask not set
>
> MAX77759 and its child devices only communicate via I2C/regmap and do
> not perform DMA themselves (any I2C DMA uses the host controller
> device). Clear coherent_dma_mask and point dma_mask at it before
> registering the MFD children, so mfd_add_device() propagates a non-NULL
> zero DMA mask to all sub-devices.
>
> Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
> - capitalize commit subject
> - Link to v1: https://lore.kernel.org/r/20261123-max77759-dma-mask-v1-1-6=
f5c8d52904f@linaro.org
> ---
>  drivers/mfd/max77759.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> index 5818ee2811d1..e31af2c0d25a 100644
> --- a/drivers/mfd/max77759.c
> +++ b/drivers/mfd/max77759.c
> @@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
>                                      "failed to add IRQ chip '%s'\n",
>                                      max77759_pmic_irq_chip.name);
>
> +       client->dev.coherent_dma_mask =3D 0;
> +       client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +
>         ret =3D max77759_add_chained_maxq(client, max77759, irq_chip_data=
_pmic);
>         if (ret)
>                 return ret;
>
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261123-max77759-dma-mask-65417b861a53
>
> Best regards,
> --
> Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
