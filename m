Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108697;
	b=v7g8Q9PoI8GwlR4JZ/6/pd1NE6Twzq4lZEQjApEercLs9mAfQYH7JgjcQvYE5SPVF+CQ
	 T2aSdqleRbctqjGWh21VPghAKhaV22HWiFyIcIKEdNbuLH0+MCNwslHrs5Qyl3KHHMidY
	 838LrfLwUul/ulLDL75tX1rKE6GCuhoaJAFnFImrFNzfqrnkcip5Q4t6SzpGavnVbNYDl
	 cIhFscxjJwJdDj8u7Y8ufbudENy3qJc8CObGd+ptdE0QHPe9JEUt60m3ADnu36CBVAqET
	 wKAwiru2gnTPWFKTWL4x8C5qBcTuT4YkK9QV4KjV787uWn4t7CTD5QvtMv9TvjXTuOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
	b=srZDngc4y4qUwIm4IJogQWMVqPnaREipFWud3lvOpTg78WTsunDfIVY3SRPnhfYji2lz
	 0bY1KoO8FbNQhIG+vD7Tku58H5xbcQtDcSIbYYgABfx5SwPPJrroI/MuD9y1VZq0sUsdm
	 yIE21D0VGzzg3wqwvxAKN9m9bXhGUZrhJpxZe+HqogZqSmkPTD1a+nLOjS4ncM9Ha4gJE
	 MGMoMLijk4ya4QwMSgmE3HU9kr0024guPAVYbQ+oXvf8pwkGp3VcLtlZ1ECr5iYIchNRf
	 oo8pCGHeOgKpwUH4kisIg8Y31XG660unuh1sHMMv8mV4Vjz1XfdwcHNaT2UL151WDiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q21WoWqm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA95606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q21WoWqm
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso762929241.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108696; cv=none;
        d=google.com; s=arc-20260327;
        b=dHdXHrYH1p3ibyjFp5zWZrycJR8pUM/4cTrcW5rfIN4KZNV6aAuyywpQrB0LIht7LX
         He/mVEJJzcsczqMXwn/0mmd6ydSHN5I4Ycyi9LLbUKvn4vqqjmNh7wOvaxcZzLP8QYPO
         fv/YF/UjbiBdX+hvfIJ1aIrRM7tywjLUmBI/VUkEW299q4dO8uD+IGm+a+NGCxKTOhig
         MxHHqosIJAmq9uaLAVrZD4I+E1+CW8rXCX9xY/puJKP1Qrjy+IiUMAb1Ye1DHRzyYRon
         URPggZ2XrHigGZKxhKwVJo9QF1S2ISGmk4I3DkA7w2q16aVe0/+YVoVQFmmnMM1D8BkQ
         2W+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        fh=Ro6PoNLmNORiq2KK6CnMgE29iZ62T3KnXSdSX81LOn4=;
        b=IMEIh1SNbR4QAKYZugn1nnmooCh27n0+nXdT8at5NhhtP/bhDNI/aWn7OF0L0Cqzwm
         KS2NyEFLVAOOIaQc9/FXV+CvIq+CfjUKG/d0b1QhntXc7tZ0UT+/2US414DZRQVAdocv
         lMUEyqLNaENUBCw87I8dqqLXfZz3B0ZRokEuOazLTyDIUp2IaOJWWlYpm61oosO8EP3P
         7hxQfrebYTuTnbVhCu+6/ZFZ7xxLjbxElQhldBYz4iW6Ie9ZPyqEVVQMKGs3MnfZLy9u
         suF6PuB6F/T7HixH1Br7K6MIyxl2NVgVrBIAocaVFr9Pwt3A8k4gbuTVopoP15DhZWFl
         WOcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108696; x=1795713496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=q21WoWqm3KaqKAME4jgDJm3/zYzOlYi0imKDKyBs5lI6uOMaw1BM2BJDBU4uPFkl1O
         b2lUzitfcHhXmRRqGcyFXX7N/RtRcBhkzcQkp9/Q9/BoU0+SfB47nU4K+Aw6rog04ssc
         A78nT+0UdrSrCkz4ycyJCpIv0+qOZMi5dtW4dNGwJNKdfajIq0I8nqidE7cxD4y2Tfax
         V+kNILQ5ue7FEWK9b6R8tA99zZ+lnljIjZkYd2aVwdToKaNMtFqSSLWq6axdgM4PCfNt
         X1QGNetP2LkZKV88MLG0u3voVS+UWoDf6HPNh5ARLeg5QkB0gLP1m6DNaFSMWJQUqA0D
         DE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108696; x=1795713496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=fzBmcPjEUgTr10KeXsOqsG08RqbfQzY8vy+D3QPIk/ATVoKffyfKJePc0/pUdwbB59
         VmBGgSLP6JXIYu7utOEZSWT5Ue5JfxdHX67WxbCUCiaaNWy5il1KBRvPscIviNBQExb0
         XAWUgwAiV4k6WMrBa+HGuyK9OZYmnLU+N2NeneRkLYMNBsUBIDkKYyQWqKQqOVJJI9V9
         c0xcZTmrbw0eVRCPeXWtecRZJD2PF1T4VFm2SGnHXa5v7GSJlVzHkpxyFpELDIEholp+
         RlMoFfDEKm3tpC60ZplShn6N6BdX7cCxZWH+EVJrogrSPlr99hrZPlQgmSALO3N6Os3e
         UBiw==
X-Forwarded-Encrypted: i=1; AL+hErGOzoPPQGC/Ea8farS4lOM+ozzLTlvsiuPQ2c6a1cAzrhyc7ubTRcAz4GOrf1gImOcnkJWqiCF/kqWLgEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zvCLXVljyY83O5PbYWjiwzItcWkUn7gHlvSl4X8PbDQNaH4RA
	iaaUsYB4qYA2ceVeegsKAFAaSrRVSoMGilx0Uy9JP36WSnqFTaUlO0k3rUX3J/w/uFMSWuLvc92
	W9qq066EujsiK9av/Fk0faxIp1Retg/g=
X-Gm-Gg: AYBFou2Z3/serAbIKPfiWX1H2lPiusUQLG8IrSmBze3LM9AI6XknP+530daKnEMnFGD
	EkXJG344iorfGquq3FMNXZv5GRVFUFPdj0jkIGityaZt4jNRF0C8MSAh3/VKRvZaBsi3Driy74T
	3tHdmGCRzpVtQUA53n19tmF3xSiD6fRfM8tB2F1OmsFEKcihVJVa/cbEsX7hqScffWP/wNKUgPZ
	2P9Zn3XMn52hRtrklHMlsakUOv0Z6zpnOeJq0G7Cbnc16KvnnmnZJMN8yQB5FP9AFp/WDM/u8ob
	OmjGKE3+Ial0pETvZS++gqEey0H4HVK3fct3XJhHd6ynwy9pcqzLgP93xKBIA/K5yBGwR5MjAPf
	MpsgywCFL7MGHF914mONHnSevMdp9ey8Of/m/5GlK3OvnFBDvO/Z+2ySjKTkW+diMy/cqxACCoE
	M3XbeOBuETP03+jIonCiuNpWYzzMzkUsang6kGVdyUpA7J045IqXKxB+/CGyNgZ6lP2iEOSF4RH
	ufIvT7qUrSvnrsOpp7DwqNhDW9vSg==
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr101327137.4.1795108696380; Thu, 19 Nov 2026
 09:18:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <179497442968.3136.18415990643273213851@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:18:05 -0700
X-Gm-Features: Aa3M54poH74flJHm30nVUNh5kQyVyqEvjxxcHU_6uijb8f_Ea6AWdb-4l3_B2EM
Message-ID: <CADvTj4p9bBOTCk5xbiVMRtcv5gL3L8Nn2Umxm4i5VD_6jJBbNg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, clabbe.montjoie@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:00=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
>   NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS=E2=80=A6
> - [Low] When RX checksum offload is turned back on, frames the sun8i MAC
>   received while EMAC_RX_DO_CRC was clear can be marked=E2=80=A6
>
> --
>
> net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting
>
> Before this patch, sun8i_dwmac_rx_ipc_enable() always set
> EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
> hw->rx_csum, so that turning off RX checksum offload through ethtool
> also turns off the hardware checksum engine.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 2ece7ba9dd73b..98cc7503bddeb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_de=
vice_info *hw)
> >       u32 v;
> >
> >       v =3D readl(ioaddr + EMAC_RX_CTL0);
> > -     v |=3D EMAC_RX_DO_CRC;
> > +     if (hw->rx_csum)
> > +             v |=3D EMAC_RX_DO_CRC;
> > +     else
> > +             v &=3D ~EMAC_RX_DO_CRC;
>
> [Severity: Medium]
> Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
> FCS check, and not only the IP/L4 checksum engine?

It doesn't on H616. I sent 100 frames with a deliberately incorrect
FCS in each setting and checked that bit 27 changed. With normal
filtering, none produced an RX descriptor. With error forwarding
enabled, all 100 produced descriptors with RDES0_CRC_ERROR set in
both settings, and the driver discarded them. All 100 good-FCS
controls were received in both settings.

>
> The bit is named after the CRC:
>
>     #define EMAC_RX_DO_CRC BIT(27)
>
> The probe code says the hardware features were "copied from Allwinner
> drivers". That code sets this bit with the comment "Enable CRC & IPv4
> Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
> CRC and check the IPv4 Header Checksum".
>
> On this path, sun8i does not have the hardware strip the FCS.
> stmmac_rx() removes it in software without checking it:
>
>     /* ACS is disabled; strip manually. */
>     if (likely(!(status & rx_not_ls)))
>         len -=3D ETH_FCS_LEN;
>
> The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
> ndesc_get_rx_status() turns into discard_frame.
>
> Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
> off", the path is stmmac_set_features() -> hw->rx_csum =3D 0 ->
> sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
> longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
> with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
> than "RX checksum offload off".
>
> Is there a datasheet reference or a bad-FCS test showing that bit 27
> gates only the L3/L4 checksum? If the hardware ties the two checks
> together, a different approach may be needed. For example, keep bit 27
> set and, when rx_csum is 0, stop discarding frames whose only error is
> the IP or payload checksum.
>
> [Severity: Low]
> Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
> checksum-verified once RX checksum offload is turned back on?

Yes. In a separate test, frames with bad UDP checksums were already
in the RX ring when offload was turned back on. When NAPI processed
them, invalid datagrams reached the UDP socket in both the IPv4 and
IPv6 tests. The driver used the new offload setting for descriptors
filled under the old one. Changing the order of the register and
software flag updates would not fix that case.

>
> When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
> software flag before the MMIO write that re-enables the engine:
>
> stmmac_set_features() {
>     ...
>     if (features & NETIF_F_RXCSUM)
>         priv->hw->rx_csum =3D priv->plat->rx_coe;
>     else
>         priv->hw->rx_csum =3D 0;
>     ...
>     stmmac_rx_ipc(priv, priv->hw);
>     ...
> }
>
> NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
> Meanwhile, stmmac_rx() may run on another CPU and read the flag
> directly:
>
>     int coe =3D priv->hw->rx_csum;
>     ...
>     if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
>         (status & csum_none))
>         skb_checksum_none_assert(skb);
>     else
>         skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>
> sun8i uses normal descriptors. ndesc_get_rx_status() never returns
> csum_none, so nothing in the descriptor says whether the hardware
> actually checked a given frame.
>
> Any unchecked frame still in the RX ring would then be passed up as
> CHECKSUM_UNNECESSARY. That covers frames received before the writel()
> in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
> Before this patch, the bit was never cleared, so this state could not
> happen on sun8i.
>
> Swapping the two writes would narrow the window, but it would not cover
> frames already in the ring. Would RX need to be quiesced or drained
> across this transition?
>
> >       writel(v, ioaddr + EMAC_RX_CTL0);
> >
> >       return 1;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com
