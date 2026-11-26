Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684796;
	b=iBB2bD2E5ntcGf06uHSjjB6qSjTjYHQMTxpkakkWxr97aph2f6TFCmWkY1UuPbpEwLUG
	 cttglssLYUVLsCufE+LlcVJsFCbr44w6COcIqc2R9ZTswf1/z3RqnJ31pN9cXbJsv4z0g
	 5OoCUP7cM3AseTvx/I0CFT8g4CJCWfO9QZOhG0l1KN5Xd2pjaO2SnO8ZkW5xOuBn/Qcpe
	 knRjuUF1jc4ElJScdiK0tUf/bt6H/PFuUoZ6OulhGwvAHfBB+XFqnyBILSlO4/wF87vRR
	 HTQcU/wKdEpCKZHMWSDgs89EeG5H0vKaK2PyTsp6+C82NVS+JBV4QrJx64RjP8+qlDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
	b=nswTEtwb+lAUdIMu0XzuonWr5TBG2XoPybTqqof+B3/eRlSRu0nqqWfLsJ1Jx3Jb8jXU
	 pp7g/Eq5BuN1RUk6GiU0ecKWQ3nOrqhNOoS3btyTbrE2lCKEMAxZ//L176FqpK/dsJfNx
	 INFv0T8HTCCs48lJc5HxLCpiTscRaOIxnZ2l5FpELWb6oumR7CqYK3kc7vJUyEwk7wbXQ
	 skvJec7g5xwrDZhY9gcN5woXvlw2lobn7rMShaSEHIrQWe1Ss56U8T0QFkIiZjlA5mLKm
	 9S63q5YmJnp7lVNjpqlx0MW0mcKQaXOqrhL7B9uIgM7XcvyfOix1ijmd8hMlYpdWLxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6d7tzwx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8437E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6d7tzwx
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e7fc8265aso13670396d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795684794; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJ5GC90u5ePmeZtNdyX6SwNNGQP7UqIUfBvSVw3gb6Xal4d+NpJHTwjVRqqSkbdgAP
         b/FWhXFYm8Cx26Z/OyBmgTn46WMsvSWD9p8G3xm7qZVeivl3aW6Gn9c+UOm8HeTZcjRh
         +8ZI7ORzIgUu+M5LScZi+DNgAsxu+LSuRzPuTw+12kmSSxyZzybNrpn7Cz7A30G7xVbG
         8iysumGgu1Uo37UwE3w27xWgXH6tqMsd+5l2Cu5c46du7bmYorvr2A+VxxQoOcqEpyPT
         ILDBdncKJOS/E5uSfozM/INtP1Pn6VGJGpbaeSX/o9/fbdbpE+9wegpH7W8ckZR0GcTc
         n55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        fh=69flRKmdt0ngLzKQqUfgKs0Maa/Q1boYFAthoY7ZXA4=;
        b=KQTV2+Scophcnh80cgF66JWgaLq+PbrBYUVdTWSwDesBdn2gilCtQvYUfAvU4g47w3
         zsa3RG1Uhrw6+bQ0FdvtMF7avEwPC036Zg/9sPwtNyp1GBH1uu0jEYyU6RHCUIF5d+ce
         swEHA+BBXYHE3QhGRBMnVX6OCXtcL06JLa5+oiQ/sm6ThVrDizIFKb54ntBffke0SLlT
         4XDE467qqgkLxcHKS8RtYTUaMapQ5n6q0ITlJbYfwnKe7AYOG6eJeM4k43oRmrfueJq/
         HeG907s1ryQkH2pN9dNvfzQuXwZ0RnkzydSMxHEfntC+nj4IGUhm6e7uRvLDS+wRPNGI
         engw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684794; x=1796289594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=F6d7tzwx/wBnDJgy4uypNLO0KOuNPFnvh071pgdD89w3KKiShPurni1Wx1/bJYs1SZ
         Nef6FMAEfVbxGyRfALtEHLxwMBjs5+OzC2ax0YvrNYNTluZNk3vELeKACq/7S5v9EPeU
         rbmdbJ+oIunY69B6/2qN1sz85OxYLY+5xIvK3VUg1FlDw8K0UUyepNHwkK/IOsGv+II0
         wYm76ChbimtYNhfVxaoBmt6J2Tg4HRh5XqfeS7XvQlrr0EpqTc3FY1IsFBnk4L2+RSTh
         0t8cjyZgxuBWvnKvVmyNX/4LBMx0UdR+PzYZBkF2vgCn4dpuuN9ECebdS6M1RAtdl+aC
         E4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684794; x=1796289594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=pvOAO9UK097ey7BAUjIqkaNFCJVC5KMsNfW8P/eLrqG+Lfx74Hj2kbhqoBcvXiUuKv
         ytNWcdcL2WBgvKa0JmhhjV1wNBjdX7pfJBjtOK49ztJcrfOeUWqiWh+HH7+h+QC5mpm2
         oOsSxcJ1hs23SO8/QJw6gl2a3OYN73nFCjXjwSnD62LPDv4cAn1sJtMEeejeybIZJgJR
         ruSxXKJIYbt2U+2qKdOUlzuysRatGUZPbO7hSJ3/aU8VKAWcuROivSV6rf5SzE6oDtUa
         7+3TFzWPG5ctKkpxOL7jltrEVOr6bwKgsHZibZ+26A76zK+cITgjPiNCIoUA2T+n5e3o
         lMpQ==
X-Forwarded-Encrypted: i=1; AL+hErGaQKOBYE13O66k+hAsabdWKf3AE2v6ZVMs0EFZ+11oxvxZVulbozomyjNv+WrbyzGn58WYjCpTotdxxKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tuSRNXHTwDP9bqNW+v3C8+z4qJSGRxZBBnWb6O+cEdD7esLd6
	jxgNYluPG2K8p4pKmjBsxpnfa6xr6oNzzTe6rmIkOZNC6+8Uox12RWtKgYhu13TjC4dLZDpEn0u
	TP1tIlzz+JjFE2L0+gp3TRepxyZYiORQ=
X-Gm-Gg: AZFdTZd7n9OKkPu//4X9fdtFkMbGxP2l8aZRCc+L9pV98lJJd1QMArLHX/kxcaY49f/
	Ywa+aYlI94DDzqwKVgkeU08fsEnOR7p2PehpTwMvFxUCcAvULFCdA3AA3EtgyJkoS1L+ljklJWq
	9/66e4fHsj9S9Bis0Ytxj9B4SjZBHcIt/jamilHG0VIY7wTKhruKNzkIbka6IuGx78KSVetHehf
	3LwALnLKgPbERdYwzi7MeR92W2F4csuyiUOUadzIH8zkrrSWcYAL5+Cnscn6UEsfkMG1xkiYlR2
	8q2UcfH8iL/HpxTbj5QQ87AcqdhR3IwY68+xoSf+nTr58QMcHri3LlYX+YhpzTLQJpVIC83dDZU
	jCTidnU8InVQPM8oHX0O0stPDtM8XTcSuzqLV/4QhKNAt9zG3cuvpJSShUQ==
X-Received: by 2002:a05:6214:4704:b0:921:21ed:f9d5 with SMTP id
 6a1803df08f44-92134af8629mr316655716d6.38.1795684794393; Thu, 26 Nov 2026
 01:19:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125111929.3395740-1-zxyan0222@gmail.com> <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
In-Reply-To: <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 26 Nov 2026 17:19:42 +0800
X-Gm-Features: Aa3M54oz8uKYvBtRCaFsIkKluWFn0wSjjEFxOCH-vgc1j273HD6pimb83pZTgGg
Message-ID: <CAP7veT+ZJ_oW=PueTUwrZ9jGj=oYmRxYNRfeVeM2Rkr-RThkeg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, Nov 26, 2026 at 4:07=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 12:19, Zxyan Zhu wrote:
> > stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> > MAC_FSM_ACT_Timer register.  Per the databook the checker only fires on=
ce
> > NTMRMD is programmed with a non-zero duration; NTMRMD =3D=3D 0 disables=
 the
> > timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> > never reported and the advertised timeout protection is ineffective.
> >
> > Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> > TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
> > 4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
> > quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
> > timeout could wrongly report a flow-control stall as a stuck FSM.
> >
> > The NTMRMD field holds a power-of-two microsecond timeout per the
> > databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> > 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> > 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> >
> > The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM w=
as
> > not reported through the safety interrupt despite TMOUTEN being set.
> >
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 00be2df63d22..659f5db528d3 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
> >       u32 tmouten;
> >  };
> >
> > +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> > +#define STMMAC_NTMRMD_1US            0x1
> > +#define STMMAC_NTMRMD_1MS            0x2
> > +#define STMMAC_NTMRMD_16MS           0x3
> > +#define STMMAC_NTMRMD_64MS           0x4
> > +#define STMMAC_NTMRMD_256MS          0x5
> > +#define STMMAC_NTMRMD_1SEC           0x6
> > +#define STMMAC_NTMRMD_4SEC           0x7
> > +#define STMMAC_NTMRMD_16SEC          0x8
> > +#define STMMAC_NTMRMD_32SEC          0x9
> > +#define STMMAC_NTMRMD_64SEC          0xa
>
> This whole patch starts to look good, one last comment, sorry I
> didn't spot this before. Can you put all these definitions
> in the "common.h" file in the driver folder ? These are some
> register values (same on dwmac5 and xgmac, but still), so they
> should go there.
>
> With that changed, you can send a new iteration with
>
>   Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Sure, I'll move the STMMAC_NTMRMD_* encodings to the driver's common.h.
v6 follows with your Reviewed-by.

>
> Thanks,
>
> Maxime
>
> pw-bot: cr
>
>

Thanks,
 Zxyan
