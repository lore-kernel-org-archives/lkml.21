Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795547275;
	b=qA7eqcKRa0frCHcwyuymBab42o0MMAKlwEgAOjXbZ3hWAnYfm81n9NIhtDnz4Qh/2ama
	 n9Su5Jgu7pvq1WHVinXIpdYWqLFgFROSdNfGbx3WIhXV68Ud/xdYRQHDijt7bXVWt2Y0Q
	 hfvvPY6FK9Nko6GnrK1USWUllyR5pjgQCK8vvRngeDzay2V1x48GeuJvCzwkxJamBNz46
	 BplUgcke437lvR+MnVJ05leJ9B3Q7bP8OsrlhrbZYQQrd+Q22bQkHnQJyVqbeXyg3qUx5
	 zDJZxSZRxemg7w++DrWfiP+hwqmxJVW6CynOac/vVh4xxM1L0SKogwumDqf9WgRihag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
	b=u4pqdoCk8Z8Xyeix2X2s/z3HX/R9WcQd/1SbhS/hIcjWd/3c3n/73HfV8lm5hhY5q8U7
	 sdovQrXOPJRYRXSPe4Prye/VOKYxtNEBnsEsm48NiBj+Q9GKRsMVUsuNCL0/00hbb4pcv
	 b+xL69ZPHFBLbbzyeu7p/52KNpEvY3IEucNQZTeBN63L36vi9D4lTKi2Yp8ejxh1WRgKc
	 sZMC3Gx6tQBzrBFfjZAgADkwhVe9QWJ/xhhoASAPy/jXUYmrrbfk4HgUgXg3bgS5DFxm5
	 6qgl2Zr/qpo07sR3PeNa1lrWeJzGYtFGE0afBv5cm9Xd6MyG37jeHcPMG/zea8RzmWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtOsztTu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtOsztTu
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e81f5ec91so1737637241.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795547274; cv=none;
        d=google.com; s=arc-20260327;
        b=MuM5xt6WktKQyqnEwLVjKZm5RBQHxbaeBlIFls127OleZemm679kpyhJmpLhgNEPAg
         z6ykL/uQRbYSXzbJxaYJZSIpP9KJ4W8vzWBlhOz81Fnyuxyp5xSeGDpFNpd9QXcXFBOj
         KxdL4OvdA49OLYD7QZi7+EBnzM/eL/hcB2Z7qplzWBkwIAM3hhmY0o/MxeEsgFjFLWuB
         hsvKent7NFTAyQb+hq1ZzL+o/mbSQOQdqKWlFa7EqWdxGMt6A6fZbPo1JXabNGsexSsv
         2LcpwtssXp+iGZcRvYFkzlMmZVaMpB3UuqcT3U6zcs2akIfxtiUkoAHQmQ4v/VglX+nK
         pVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        fh=MCS9IYN72L2JF9GIi1e1/XqLKO89MMKkcOWaun+ZjBY=;
        b=g6AQmp8Hv56iYK3HFchpQJv/+2wHSDkG/tVNeRQqaGxm7IVBNg9Whs7UntUHm/ws2/
         v+kB7eqM/SlztySVpAkxcIfNkyl75p4m7JqsUReXPGj4oegQa0SHtB5hHjkMMj9raee1
         vyDa3xydpTF4bGCivnljtgs0LLIzHZ1kQsZ39PQ1xsXF/4R6urcP5U6tAb2gfwg5FBO7
         GUFyU56iECTrlHFLuy9zugzjbJUj/teJLMpwAo3Y6ekxtfxAeeSZJ74rvWqqrkjTwH2S
         RgjQ6OJMSbDy6v1VVraHFSmSsd5HzPr8QKjdeZXqPpllE2N+Lzm5I+1H3CLsLLmoIp90
         v38g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547274; x=1796152074; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        b=qtOsztTulsvcwZ3HJXaSDCy7Z7E9KA4oQN6TdflYNyxSK0q8MrqNreP+HVnSFUk8ap
         hIR1cyBKchXrKTdCSuBFn2TeV0F19ksR1wq3+/TuDNsDTRG/aRRWukiCpk+INgcajSKj
         EYyRY/0SPyd8mvlusEiK/hhWMh2NZeJt/T6n08smKroq/ymw6ha8S0J8WdL0X7azKS0K
         G/ti3OLy3xvnEZorM+bwhF1aPrbfAuSbOIHMBIsxlze9zDX5cJVOVOCXRmFcH1zG2tdy
         NB+Cf29kxh52f++6MNJn9YfQmk5mrT1aF1TWRMG0mIyxBhYIHzOgSOq08N73QS/dJos6
         j6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547274; x=1796152074;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        b=G0Gc8VrGO2Iq7eq0SCbFSR8TsGLV/w/VgJF5arJ6JFraDJAjoZBt0xJ+z7k6PGdhd2
         A7rPxg1ZTN/Ghvv4obRmyXbPAiT273D+CrkdaMiUrJ8ZxSUde7LqiO2joj2+lMonTzzs
         TaS6qS9nwfYj55KkFXz2diF7XSwrPJbgdsnPeaXbyYo1CN2DQzp08G363ERZeyDsybY3
         AaanVBuu+Fcre7UxJ0yVDc0Ex9oPi2M2BOb0gM9UxKkhIvdi+6qLeMkrXh0YNKwfu2sR
         5diE9TRWUNxHv9vBcUAZIFd4n0FvtDhcsEG5xpbZZrdgJXV6i5+HRfM8+VwAIb1n6+sD
         G8pQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ7sTJbh/n25QiH28Pj4yp3x9zoyYiEAshw3DSx9PCHseyyg96TsbwZq+Ep2wjQv1EoJs/ixnhPJIO3YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qfwpiEhoUkPB3/zpyhiVIenRI8IqVAm90Ysx/xO38CuKJc5ZO
	I13QbaBu66YH6c//GwU6CTG3ecMGK5nysE7Kzp4zk2DjaddCvYxutVSHA18q2iXir714eg8DouD
	lRCo4Gk/NkiLVft/6tsxhXZJE9nOTQA==
X-Gm-Gg: AZFdTZf8gW4DtZk+Eyijek4ZnDt8Wq6NvNxEtXVBY7ZAM7gu3muUKQ9mWnYA+HsDLAW
	B6kZ5G7HSHBATXoNdSqQltNyIIuAvQNKgQuFpK3ij1iAsjEa8zj6BA8F0E2SDhRtb6S3r7xPZqq
	P66/dNdj16eNuCkBM2Hcd8cZf8C3NKIl2L0JLa2zIvuwM69OmJpUX1UD+OLYMBrv9IEw90sEiV8
	kiu9k4MdfUeekX6P9BCbLJ1gzE36oHE9EnD+NWuso6+oOkU1VA32a2C+703sq9G9WWbEVKJpYx6
	Pyq4dJks4JM2rVHWSsiFxGoXl8r8LggluVGVrUkUwktJyi20jT9FcPXWMIFtPp0zSfn5vexRioy
	pNFecfldqheOgojAY2as/txeOWfOybok98A==
X-Received: by 2002:a05:6122:208c:b0:5ea:e223:5437 with SMTP id
 71dfb90a1353d-5ee8aed6f64mr9885695e0c.12.1795547274040; Tue, 24 Nov 2026
 11:07:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
 <20261123234050.150364-2-gianfranco.mariotti94@gmail.com> <179554337505.947306.7216985666736610034.b4-review@b4>
In-Reply-To: <179554337505.947306.7216985666736610034.b4-review@b4>
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Date: Tue, 24 Nov 2026 20:07:43 +0100
X-Gm-Features: Aa3M54q1gc0a7R36YtS_e_8LcERGdr5F5REuP_ZXLyFPnQ6qw18niLuwfZB6EYE
Message-ID: <CAAX85RsxcCES5z9nT98OzPMr-bHk-6+mO7p2H=UBqXjMHW9+3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver
 output mixer routes
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for pointing this out, I proceeded to double-check on the
AIC32x6 reference guides.

Checking all four patches against SLAA463 (TLV320AIC3206) and SLAU306
(TLV320AIC3256) in addition to SLAA557/SLAA408 (TLV320AIC3204/3254):

- TAS2505 uses its own separate soc_component_dev_aic32x4_tas2505
  component and is unaffected by this series.
- Patch 1: AIC32X4_HPRROUTE bit 4 (L_DAC Switch), AIC32X4_LOLROUTE bit 4
  (R_DAC Switch), and AIC32X4_LOLROUTE bit 0 (LOR Switch) are supported
  on both AIC32x4 and AIC32x6, whereas AIC32X4_HPRROUTE bit 0 ("HPL
  Switch", HPL output routed to HPR) is AIC32x4-only and marked Reserved
  on AIC32x6 (which uses ground-centered charge-pump headphone drivers
  rather than AVDD-powered headphone drivers).
- Patches 2 & 4: MAL/MAR power and routing (Page 1, Reg 9 and 12-15) and
  CM2_L/CM2_R negative MicPGA routing (Page 1, Reg 54 and 57 bits 1:0)
  are identical across AIC32x4 and AIC32x6.
- Patch 3: MAL/MAR bypass volume (Page 1, Reg 24-25, 0x00..0x28) is
  identical across all four guides. IN1L/R-to-HPL/R bypass volume (Page
  1, Reg 22-23, 0x00..0x75) is also identical in SLAA557, SLAA408, and
  SLAU306 (AIC3256); SLAA463B (AIC3206) omits the -6.5 dB, -7.5 dB, and
  -31.1 dB rows (shifting MUTE from 0x75 to 0x72), which looks like a
  table erratum in SLAA463B given SLAU306A has them and both parts share
  ti,tlv320aic32x6.

I will restrict "HPL Switch" and its DAPM route to AIC32X4_TYPE_AIC32X4
in v2.

Best regards,
Gianfranco

Il giorno mar 24 nov 2026 alle ore 19:03 Mark Brown
<broonie@kernel.org> ha scritto:
>
> > The HPR and LOL output routing selection registers (Page 1, Registers 13
> > and 14) support routing the opposite DAC channel's negative
> > reconstruction filter terminal as well as bridging the HPL and LOR
> > output amplifier stages for mono differential configurations:
> > - AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
> > - AIC32X4_HPRROUTE bit 0: HPL output driver to HPR
> > - AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
> > - AIC32X4_LOLROUTE bit 0: LOR output driver to LOL
>
> >  static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
> > +     SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
> >       SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
> >       SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
> > +     SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
>
> Is this supported for all the devices covered by the driver?  See
>
>    https://www.ti.com/lit/pdf/slaa463
>    https://www.ti.com/lit/pdf/slau306
>
> --
> Mark Brown <broonie@kernel.org>
