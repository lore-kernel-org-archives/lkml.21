Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795594968;
	b=3SGxCl21O24a2n2kaCTokhXwhP/qxF/JlYiG2gAVMWCvGQIWc+zWGVFdunRKUWMEuwRi
	 a6Dr7cNc+NXXrJI7dbxY72lbibqCZhtPwn67YZxE+Y7nf2YwRDXj6bjS9BKDvb8kZ0QIy
	 0ezk0S0HYKKGzreMIatwpGaYT/wXf4qM2TaDQQCE7lqLxQGSjAZYY2+n/7K6bLbIrU3k3
	 geo4Ooh2F6PJz+Gz1feklXhygbJFMWCLbFzcqe6khwbYN2Iv9rklV8IWCHaJlUwNgY8o7
	 OsFpRqNgKjrDHhRLtsR0WnvxEUr+b0xm9t4L70OMI11fbPSOQ7e0Mtcah49SfWuvR4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
	b=oueyzdZyG7nAPIP4SOVMR/CaXusZ1sD+GDwHl25JkWJfM6/Vit9BYjr7SwujlJ5VZFNf
	 /7baF+e089kWijy5a6I0Y+uVr1uQCbSpcK9yHC7fohw1jz+PNGSTqOVTqjerciBZI8kK6
	 ylLTZfPBxvZerunPrm/cOC/fvrdcF6+ozr5PLmU5NJUoFKLyobgFXG2HeWCKx1CZSr23m
	 TnGG2A4LrQh1RFNa8SyepqLgw+hls/v2AE49uC0GHLQamIBRMiC2Wg6G1tAd+TjQ//OkF
	 TH42HYmIwhWH6y9Z+hCe5ukGEZ6y3gpjFP08fWCol1xsnNAuD8G4WF87HbKtC88ktZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ+ZhKYK;
	arc=fail smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C09E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C09E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ+ZhKYK
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5365d725440so50427671cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795594967; cv=none;
        d=google.com; s=arc-20260327;
        b=jbC94ywXVu7gpqjQyZhOGi2fEzgysXkY60rMEbiV00LnUptpQuK6Ex6sgASfruRrwO
         KBUm0L0h9j27RTYjFRqzJojAa1dac+spkwK+i9W2+1fgO6JZgCteV7EOi785jgN7lUtx
         S8rbVXjqk02FH2Jbk5FHL4Y3tHYAV6DNEA3S3mVvab6Y/wbl4f9Y2IkHvjXoWrAmgJru
         2nXNzUKf4Wa55Rr6Iwta1ufCopqNTnQuQK8+yoeaEbjcxjzMHMcyAdE7eNG2lufTcRjj
         WwcVLUnh3Knwffs3uefdKPDhlaPUN5OuiA1hwHJHmuy7zLqR1+scSXTqENIAUOztfcpE
         Xi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        fh=ET+jN2thfauPIr5XX416A39ML73pgDKZu1AinmYcCAg=;
        b=i0kv4LRnOaT9luR1zi1tHvpaYZj9EX3zK0PaEES0AutDpFQY3VoMgpHgZjThb3F+RY
         XY7azKD3CW+nYL9c7fWX79lPpzXgDEjq6HrNfBQcWzWEvjll/ioKL7Pfvp4hFqcMVPIG
         ntB7csIL7cxnt44ZOx9Ia7GjrCPAi7wLVwUaUx/SUwjYO4HU9v75g6yYgH3sTEDnnGyL
         ubLE6kaLLnwZX/w14bSVGPa+fK1SCDfX9NGSkVrDWg3t3MVKOAFgObP/H+YujLLJJahf
         g5NnCg+n63bu24Q2Q355+Vq+6DQIIvwqdse6n31IG7jUu3z1kkYBbjTrIlnxWTJ/jdRH
         cEwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594967; x=1796199767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=UQ+ZhKYKMqHz0co/m7DiXuPVLgdRwlUTsMtBcqk4UFtMBiAZjqUn8QAH0E2C5MFL3R
         9E8K//pOQ/sZCE694c860uccIJyCm++8hiPUflRAgrkV6s2FmJ30+zKSFuoHI9Y3M0H1
         c9XOIftkBrHijkFLV4tl5SsFFdQgX2QybcBcDC+FQDAyGi/ALtYRmn0Lb+AT6x7iToDm
         senCCxCI54HR2dZJoEz/u60k/Ufp8Tci00jBXQrOeaU3K9JY+GyuwLaMbyWxMnBxldx7
         QuBz3yJIEjbQoWdvjItY2FpMK/oxXtsSB6EkCHdb84lWRDW2GhKBBrtGs2UL6/Xdw1bE
         +bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594967; x=1796199767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=f4oL1coSPyXT5QPc3kGj3DnM9ju7/gjgGTJfJrTJckB4RWYTmvSSlVPicY/ZVD4uyv
         Fuz+4bu6AtXLPbf/3IQhEEYSDaotPYQZi9Q9x7MGp82T3z2UkmoU5DrOI0HlhTG1AoMk
         KQ6p0xjONPOQXo8RFRIGOtqUbllRekzKtzUdFeSjr/N5KoPuhyEzW/tVbKkvqSavUxYh
         T8fahEqdDEC3cnBrCbuS5F4+S2uxzg51IPUuT/Z5Bcww320hEV5MP62goeBYPvLMN6lA
         6w+QaIMK+bWzui+cR4zwCPoC0K9Ab38MBlXN7Y3bKdyyv9foYK01Gyq3S5u2wGE70O+r
         R1XQ==
X-Forwarded-Encrypted: i=1; AL+hErEa4ES8dnEDwQ/JlrVBnDEviuanCobZaHFhRSaP7ivGd/ORVtC2Cj4Jm1ioRzOCLB1F2qlV/TZZdZ6tdiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Do/r6MrBnSsd1yquTmzHEYSkUnR0oETRO3VzUbKFg5qyhwanz
	l4uLy8sbWKK89E9lzOTKz8ef/+8/QMMR8D1EzsiETssRai/LgV9Gf13yj47zCE29lpgJAdCzL7Q
	IYz3FaIr9+geumVrOqZXsqhajSPTQJ10=
X-Gm-Gg: AZFdTZeATVwokrWRJUvK34ZidVes2Hvy6wvGKmdeTtcplCzqmYPb5XszBmsZfd0s1Pd
	wa1FA2q8OppgLOEvqp26jwLc293VTxAkMygioywn6iY6qPpb7laDT6gzlW5FJbXvpQ2OxMdHtF5
	GF+iGZcyxAKiP/ArGZANgONNiYushxvrYCoXHtEuxm/xivQUVRYABI9N9+7b/WvdKDwR8bT+2fF
	UbCCMHqBbzGdhsq4VLqTMFG21O6yY58Rm3Rl+XnGNQuYdfGbWV9OH4MYgH8QiWksC/PgnisoipC
	u4i4l6OPwJ9NXDW6U1+HQXiIk6lwORZ68kff+Nf0ZEP57mhnbmBqXhmHyxtABo8w/olAH5TGiYh
	yvqrZeHYikVnNeUTrhP7K0V5/mbNkaF/YEaqA
X-Received: by 2002:a05:6214:4902:b0:921:4095:deae with SMTP id
 6a1803df08f44-9214095e374mr275869476d6.42.1795594967356; Wed, 25 Nov 2026
 00:22:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
In-Reply-To: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:22:36 +0800
X-Gm-Features: Aa3M54p_SsKnYA1fkhhch1lh4sekLQ8FDtnE0xjVxJSelF4g56LC_eSsC56YYio
Message-ID: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 12:13=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 3
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [High] On every in-tree XGMAC platform, the XGMAC half of the fix nev=
er
> >   runs.
> > - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
> >   non-NULL.
> > - [Medium] The patch turns on an FSM timeout check that resets the
> >   interface, with a hardcoded NTMRMD =3D 0x6 (about 1 s) for every=E2=
=80=A6
> > - [Low] The commit is written as a bug fix: the protection is
> >   'ineffective' and a stuck FSM 'was not reported through the safety=E2=
=80=A6
> > - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1U=
S
> >   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared=
=E2=80=A6
> > - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
> >   1us tic' register value in two places that use different conventions.
> >
> > --
> >
> > net: stmmac: program the FSM timeout timer
> >
> > This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores afte=
r
> > TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMR=
MD
> > is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> > safety_feat_config callback, and NTMRMD encoding macros are added to
> > include/linux/stmmac.h.
> >
> >> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM =
was
> >> not reported through the safety interrupt despite TMOUTEN being set.
> >>
> >> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > [Severity: High]
> > XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> > timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> > platform set plat->safety_feat_cfg?
>
> This looks valid, on what xgmac platform did you test that ?

Agreed, it's a real gap. The dwxgmac path was tested on a downstream
platform whose glue does allocate safety_feat_cfg; none of the in-tree
XGMAC platforms (dwmac-tegra, dwmac-socfpga) set it, so the timer write
never runs there.

In the next revision I'll make the timer write unconditional, matching
the unconditional XGMAC_TMOUTEN set just above, so NULL-config platforms
program it too. Adding an all_safety_feats fallback (like dwmac5 has)
and gating PRTYEN/TMOUTEN on the config is better done as a separate
patch.

>
> Maxime

> [Severity: Medium]
> Is a fixed 1s timeout long enough at every link speed? A link partner can
> send PAUSE frames with a quanta of 0xffff. At 10Mb/s that holds off the
> transmitter for:
>
>     65535 * 512 / 10e6 ~=3D 3.36s
>
> That is longer than the ~1.048s selected here. At 100Mb/s it is around
> 335ms.

Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
FSM is still timed during a flow-control stall, that would raise a
spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
link locally to verify it, and the databook only hints at a large-mode
(LTMRMD) without being explicit. Would you prefer bumping the default to
4s to be safe, or is 1s acceptable?

Best regards,
Zxyan Zhu
