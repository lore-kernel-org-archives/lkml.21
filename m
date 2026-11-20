Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196253;
	b=IWaYmg7bSYKZVa5Gzye34pFME2wbGX4j5KiolAS9IErmbDr7bGO7Fgp+rTTs7lYK5+HH
	 OncBjjc+G/bakH/qpOb6mCpeei9ajSJPlpAx/osjVg1ycZYLEJpY8h5rfhtyX5cKr0rP5
	 Xry/8p9k0z1bfi2NxO2GlrNpfeYhkuKAV7/UqwdOLtqvIWqxyvqOQGLlP2G7yIJBscs5o
	 Q2NkvYIoeJvZo8jYggy+a/e54h3Jj/ik/qxa4xs6IADvktZtyPTj3bDeRCgEtYXuGIjeF
	 FDiXMcnxTJSFTWbsU16LsNubUCoLUbCXG6E6ZoxOh5CDp2cCcRgDdJVBZM0SNlfbELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
	b=F/f1uqeGuE4qksrP9WWYTPI5UAY9LOZbxfQbyr6RWoF6IA4m4FHGEKiZwh3rbjLSh2Z7
	 2NzTbnXJ9/T7P0Vi1d+8CixYE3Q3MBXX5VXInFy/LTkTvWpxQFOjGX6fdVnf/kN/eE2Cf
	 CztwfqseRfBdcgdAia5FRHE6Cc8F4pK0eCpHv6QdrRaH5Sq6uLdBgYfTROgtW9L9WzZkr
	 DyjD5mt0AZVMO4Ch6Xq/WEXu8o0N7rVuJdpt9CSgPYG5yLsOuIGhRUagR4mtdpCChm5Pb
	 MSwjW6qp3jrXplNOtpJrG2TgKucva2kXcsIMcqMndIuHpi/NWwHn6srsd5AsmkwRu3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ao3LvQ/s";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31FC606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31FC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ao3LvQ/s
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so375201cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196252; cv=none;
        d=google.com; s=arc-20260327;
        b=XC/T9ngWWsC6nNPZygW2FrgI4Je4vgySxXiSOavSfjNH8rfx1BhqGfaM+7TyyYDE+g
         Vp8HwdqPo6weAmzzhpY86gQWWk8YdngUohJvYF6XH+rcmk5hW+2HDwlqrl++nEMM+7hX
         qc56jrU4jDT6TV43vfprqxckE+1MehmPFl0Dzjrn4V7q/Z52TUVW8Ms6nKhUNNbWX5BL
         XO1BkHaMXw136hTGKd352/bR8j14SSlcBR0rmP9S6rOVQGLaLA8a9HM0s9ggNgkq3zBA
         YIrg11S+JW87HG/w9hP5k4JcA+3Pvsut48eEU/D8da05paoIGySPgCexX2qzFCEGOLVk
         JxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        fh=HqATBtQ3HfVIw1g67knLxArlblJ1gB+NA8ALcsI7lZ0=;
        b=KEueMZLMf6iqyNmqr9Tow59ILu36DtII8JtkFo8A/oSAqEFhEzmK3XhhKMNp4yBGpd
         wBXhuocieCpEIB+Le1D2Nq9ldrtSWv1EwevLm4HO88dmkMnywN5EsQgxzaM+0wh6Y59E
         eCMSPohwqp4yFYLM7DXpZzopD7CImND3JTBsvebfs6Z1UAv9jwKsRgwc5KzdLTloZUwk
         Sxwy5Q2U7hDpX9IaSMIyKqRX7Jv5GVnlwgjm6pNGoNevRI9xAHbwwJHWCS5zKEb32TAU
         IsxEiSd5aPTEr3RR0x9q4f7B6h/Wjodrqn/QEreO3jlox40Y7dfVjdsWS1qboeVaPPIp
         ud/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196252; x=1795801052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=ao3LvQ/s2kuj5y2PKc2f/i440+KZFZGRlhQW6ftOcg1sd2y1cM747t83fR/lIetwH2
         isBkwkOvTo3oJZh5OLEVxBG5vwIajI0IqBAEiiVWeIHaY3CG6DnccJO8ipQmvsVXEARw
         9seO5brqv41S105wvOwxTqIDkMyjMxB0al+dhNOfnaz1hQQbEeTUWXoCkjJWthjIzZ9y
         yBETUllyh6L57xKmXUrRk/tWlpfnKC677MAHuFTtCCXNMOnYDbt5vBwNnZrgBD4qBVf1
         UCadeTqCAsVXFoB5ySgzSLUYeWkoofWwUUrjOsOCTos02+EpXmfF4RjysVy0o/nzbzDw
         rTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196252; x=1795801052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=IwH0MwRpBtGxESmQLIQNUyTEDGvPjcYAw/1pF+h2toGCgfRBKiynpXjaUYFcLJBp27
         WBT6AyEt4RB34r6B0sWViEGvgkjUQy+sofzhROhfILot1yfjpTMy+nfwKGv46xJ6XfDk
         kjeiP/+VedSPcG/u15Gb4FeyfqS7cyRfQnluietkGv4BcSlEqUA8F29cTFctjiAxRBdr
         KbYH49oUPH4/kCzLsbStAAQ+mxXFJZtBFyxenbIWTJquGQHHNfEUCkgF19HqH40l/MSy
         OLMRwSo+kvHnikyTnZ1rLULjm+tubLPqrJ/ECFyg7JeNtGCxHdg3MDGWYgrgXNrqjVzv
         Sl1A==
X-Forwarded-Encrypted: i=1; AL+hErGOvmJ5ltL2dcdbkSo4QiGmZ40ITu2nN6IeD+0bGkbumUme2CNR2w95vKHQx2oFcSy0w1057MSaAtp0P3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mUhMAG5t0a+qJBYt0EfHGjrTHcb+C/3D1cgHubrwFxINI0hYU
	gggu8XSu0dLeirSf5EuT6s78yfY4i0ah1Yg/k3zPMVfeYIW1gRyu5c4pVl7fKlRTGTpRv5Faue4
	fsrcFAFwP9btOGjz8oxeLBtcFTV+NQ+ScepWDzVyJ
X-Gm-Gg: AZFdTZejKKYHEN/evsiavDH1IIX7UaTgq11+fsQbYD2NoV95pVb16TDv+AyJQGtB5Bi
	o4S+LrZy2V02xr2U5YH9Ya/KtkmmFYVLhR6aS9fgH5q0zBVazARBwebjRCjNdzV+ZZDEmSaLuJk
	SWQleYNLA2qE9kM/p2fV1hatQBaA9KPkmF8v2kNFflEDAyHNwQ+jh8ulqg2aahmDQKo5NmVchDc
	4a0Cc89vQ7rSRjeRAEZEqhI/tWS50wXi5YmiNeFO7KUVtVmfGAcoF7t7FFfSiI6noQwOkRqVkI4
	i2YVIuPPMWOwUoNW7nso3txHUTug1uOqFYRR+6/eO/lvsBtb+FulbtvlMl5xJOIPTB8/XhrsUhx
	nM3r921HkblZf5LNUzxXnrpYE1VGNdJWqicN7
X-Received: by 2002:a05:622a:420a:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d78e6fe63mr22944711cf.2.1795196250681; Fri, 20 Nov 2026
 09:37:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170354.1509589-1-irogers@google.com> <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
In-Reply-To: <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:37:18 -0800
X-Gm-Features: Aa3M54r5Jmnt4Ssp-wBby_ZlWdHK7iMTTCVJuGgQMqW36wSMvbgVZ0tFQ-QRjgE
Message-ID: <CAP-5=fVj+nAvGW9m9L2AxPqzw63PDqCawS=9a6jVh1fc7ob-dw@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH net] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
To: Elad Nachman <enachman@marvell.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:39=E2=80=AFAM Elad Nachman <enachman@marvell.com>=
 wrote:
>
> > prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
> > driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
> > When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
> > returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
> > netdev_tx_t value) without freeing skb.
> >
> > In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00=
)
> > is treated as a busy/requeue condition unless dev_xmit_complete() holds=
;
> > for an unrecognized positive value like 0x01, the core neither frees no=
r
> > requeues the skb (or hits the unrecognized-return WARN path), leaking
> > the packet buffer.
>
> Did you check it yourself or was this sentence AI generated?
>
> Please check here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L122
>
> and here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L144
>
> You indeed need to free the SKB, but as long as rc < 0xf (which is true f=
or both the
> NET_XMIT_DROP and the NETDEV_TX_OK cases), the behavior of dev_hard_start=
_xmit() is the same:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/net/core/dev.c#L4074

My mistake on that paragraph - you are completely right. Because
NET_XMIT_DROP (0x01) is < NET_XMIT_MASK (0x0f), dev_xmit_complete()
returns true and dev_hard_start_xmit() assumes the driver already
consumed the skb, which is why returning without freeing skb leaks it.

> >
> > Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
> > counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 report=
s
> > the software drop), and return NETDEV_TX_OK.
> >
> > Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build=
,
> > with AI coding assistant help to audit the warning and prepare the fix.
> > Build-tested with Clang; not runtime-tested on Prestera switch hardware=
.
> >
> > Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera f=
amily ASIC devices")
> > Signed-off-by: Ian Rogers <mailto:irogers@google.com>
> > ---
> >  drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/dr=
ivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > index c4ea247d2470..7ac9220d33c5 100644
> > --- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > +++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > @@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_po=
rt *port, struct sk_buff *skb)
> >       dsa.port_num =3D port->hw_id;
> >
> >       if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       skb_push(skb, PRESTERA_DSA_HLEN);
> >       memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
> >
> >       if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) !=3D 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
> > +
> > +drop_skb:
> > +     dev_kfree_skb_any(skb);
> > +     dev_core_stats_tx_dropped_inc(port->dev);
> > +     return NETDEV_TX_OK;
>
> For the sake of clarity I would return here NET_XMIT_DROP . The behavior =
in dev_hard_start_xmit() would be the same.
> There are 53 drivers which currently return this value, this is not an is=
olated case of just the prestera switchdev one:
> https://elixir.bootlin.com/linux/v7.4-rc1/C/ident/NET_XMIT_DROP
>
> The rest of the patch is fine.

Sounds good (I had used NETDEV_TX_OK to match prestera_sdma_xmit()
just above and avoid Clang's -Wassign-enum on netdev_tx_t, which is
how I spotted the missing free). I'll send a [PATCH net v2] keeping
'return NET_XMIT_DROP;' and fixing the commit message.

Thanks,
Ian

> >  }
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Elad.
