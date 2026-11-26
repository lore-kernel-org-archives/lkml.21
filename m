Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687273;
	b=of9gpMyTWvUlG8Oa5DCcXcKWOG7xSdB8FmAvxkTcNOKfJ6GPQtgoPs8GkVogbBm3/qTD
	 P2pT+gqmlhFMfvKxGfbteGhPeXAxpgu9MlD+J/tPAQVeCuLE/j6fnOYTHtYHCmO2vNVFt
	 iGaqlh35W16BRtmaP4JrVCDDF/nDUjLmIF5tcTLEa4rbQF52EyhYxPsGoFKFXrrwKFQcJ
	 GvLSMa420lHWilDbTvYekqdDwZ64OfdF9azgII1tFvtMwm4VD0JOLdeo324m2ZI6e5cZ2
	 1IRhcwlqn1ZMMJ87GsjvND2Jus0HpCv0opEZSCaWCWf0Ocp+bau+isCOLtvPr+ruqIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
	b=GsXK638ZxKTsjbKnYlNnZ5/Inxzo93Uomo8yhtbDxVmhgbqZeFUZK8Du0y7cxe6FpQWF
	 dyLIOwE7r5PRBoRMpadgS2UAZ7d/tOTI6rCk6ydiAv2bM1w2ERJOe0rp6TuIVrInmpLPi
	 ktQNxBCDSwWqytNRdoPWhVyD5zZPZVhL9P684olJKGYfwvBRPEGAEvQ4cWTEwb8KTGqrL
	 77p06GTwrwcpMJppGsSrfJD6gO1Lqs1j+HOPJLV1oCQvE7ICAAXP3w6xu+MmNmXl+le7g
	 4F6jMU9Ip7z5xMUyJNwFhu1hjD2MY+xY2sycPVVKU/sSPBM6nbrleF6CSxPpZqIvFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LGL+MJ0O;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LGL+MJ0O
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so4813015a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795687272; x=1796292072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=LGL+MJ0OPmAso0EVacerztUnAtvIZ2EUwLYi2xOHBoMu0OVHlDiq/tSehnd7MMbLui
         e6D1rVtLQaCwky7QohNEBNr4dLcpfmQX75iASGie4sK6bgAk976ILi7busCF270voK7f
         Jb75xjmAmA44oCiHl2XhPVWYiMBEoEOl9ABB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687272; x=1796292072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=VTmsHDjhsURY95rrUHPy+UoM0Z7O9pwnkwlrLPY/wfwfqteN6HyDnwaB67ngplr4GS
         Cqvo3qxadVkWWWzeP3XaiMQ6/D672TRPh5U4tVvxQsF5e2kEevhD/dztvbaEZ5tRQ81N
         v1S/T2WOd8yYDJkE9dW5wFSQV4HMxybAXfQesxr+oaT7ZlM6CW3/vTBvA2gAHerb3Og/
         yTTlRF8/mqsHFghF9DhGePP0puOqY9EssekQwPf1xhwZ8lJ2WOo4Rzs09Q03lqSAqGsh
         7ES8M78yHKQyynr6YcaHW8165IC7f08YO6Xlo0fxdFN380DXzVflO5B+hid6MKNtphwI
         UEGQ==
X-Forwarded-Encrypted: i=1; AL+hErFQTSaFwlpihRot0awpjW8uNx9sVZw26MfaeE7FtgSczh9mrc7QH6TCh5vy51BDXnne/sm7Qq1oVdvDlts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AhXC9HdZbp48MoXxaFcZaw3JYiKPvN2XkyKaBCOA0gkthz4dC
	Tz+XdJNorrNdmndzSI+P6aVcHO6vxSZg9xB3S02jreu1Fv7fbZEro98SvXSvpKK+ZMzngKUxjH/
	tFAdCdQ==
X-Gm-Gg: AZFdTZcEXCxG6tsgO8shiVRWXcJ3atAfDY5Dty/4qBYDzjIBCGP2xdESzCRn708KsTz
	hzpKnDeuFIwlWTYvjmEG3oI2CfAmyEy+Q/cpZT7OCEc8uUtKxZgjkdY16TrAlMeAHY+oYfvjZL+
	PE9jQYHFAOFVtNlCc0Qw4+SLL9W/4ZWDfqfzRm1PwNkGlWBjYqlTX/jwiaBZtzvQrHXy+yg6oH0
	QOAoOnRCLLOgndZeFlUVIN1de9VaZ5FA0nQeHvJBsGwISdKqvADCSl5mlVgoWY7TcMdmcdWJ4uL
	Tt73rtcB+uzdvY3ouZA9gGFr9Lg/mSxUfZgW7ANBzc4IqdGqwuzfO4e9UzYQCLWZpzezEAzMbfO
	+PwDhk83nDWl5fvnWUl+gWoTd9Ia55LldU2DnOS6HPqRGDmfVka8P/gFTaCiBnPodJQaIlZf1oA
	jp5SNvs9aWtRnfaOe3ERIRozMWiJdadJQXBELR5m1uV8DCJ5q0RTwMXEyPlkbKUF7+l+yU1f+97
	/5et8ADGtV250GQtQxxkD6CxBX8v5dUQtoLnHV0uTuVlFYlYouMZBeph/Vi3kZtUMzbs5mCFm7F
	AObDrX1Bfy10fvGVHbh70H17XJrIZKX+zlcnxg0o7SFPCOtln1RMK2Wpatc0eEk6LrU=
X-Received: by 2002:a17:90a:ec88:b0:3b4:127a:2bb9 with SMTP id 98e67ed59e1d1-3b41c8d9275mr19392647a91.13.1795687272023;
        Thu, 26 Nov 2026 02:01:12 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm34652141a91.16.2026.11.26.02.01.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:01:11 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4469650eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPoffgyUiDpbsgGwWkyJqib5c0gqwcj0myCBg3evYTnNB38CDYGTz9a7ilTP6SnyB3t6OP+7RPuB8G/f0=@vger.kernel.org
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id
 5a478bee46e88-386e5715040mr399450eec.13.1795687269562; Thu, 26 Nov 2026
 02:01:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 18:00:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
X-Gm-Features: Aa3M54r8mZgCPYkjyk_HhGWN4kbWoWQVSbV0f4Pj7KzdyzjM_U47c8LDiim4nPQ
Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
Subject: Re: [PATCH v2 35/46] drm/mediatek: Add support for Display Output
 Processor component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for the Display Output Processor hardware component,
> found in the MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894,
> Dimensity 9400 MT6991 and others.
>
> This hardware handles the post-stage of pixel processing in the
> layer overlaying process and is also capable of performing gamma
> correction, ensuring that the per-pixel values are within the
> expected gamma range.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 247 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   1 +
>  7 files changed, 281 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
>
[snip]
> +       priv->irq =3D platform_get_irq_optional(pdev, 0);
> +       if (priv->irq > 0) {
> +               ret =3D devm_request_irq(dev, priv->irq, mtk_outproc_irq_=
handler,
> +                                      IRQF_NO_AUTOEN, dev_name(dev), pri=
v);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Failed to request=
 irq\n");
> +       }

platform_get_irq_optional() can return error codes that need to be
handled; otherwise, mtk_outproc_bind()/unbind() will pass the negative
values to enable_irq()/disable_irq():

ret =3D platform_get_irq_optional(pdev, 0);
if (ret < 0 && ret !=3D -ENXIO)
    return dev_err_probe(dev, ret, "Failed to get irq\n");
if (ret > 0) {
    priv->irq =3D ret;
    ret =3D devm_request_irq(dev, priv->irq, ...);
    ...
}

Regards,
Fei
