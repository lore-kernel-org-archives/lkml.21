Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196471;
	b=jttvUi26Q3MkZC+1KE49UxdY5xbwtNXl3DzKBjWHNboY0Imgu1ClbnGz+RzCsUKa1bmV
	 XagPaD3ztes+usvR/j8p31LOUX/DejiLUxkc+i/jLS/oTe8D3nAvm1FxhtjS9vPr67Rno
	 xsLFKFAOK+GVRAmeX5PHOADvYzE9W1mB2GJ3wsQuphICqbI5k+s9Lxw4CoSEEyltXMHjz
	 3E6XOFZSufht0jEWoYL4AD82Z/P0KO9CLPIv+86Ea81srtsFfn6/LGRyWJyjArtZUW/HQ
	 z0WzS2f1mqKFaN5xncxmMI/a5EUqo+ejCdqzMl1PhwLsNU2H0E4KVu32rQivM6wG/nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
	b=j2RUPyXj0ZnASYpcgoto2JL9/DqNGm7+CIeTmhi2xXaPyLjkudeRofKZUClnyy7/G6Q3
	 ONUD0b7eI28YsWYseJ1MGqTBZ7ktHll9iAzXLQyROqJ5JYxRJHQQARz/YM6U+2197YSdo
	 HEBbGrRyPolrFsq0BprUZ7XVbphsg22+VUngHAY/8xMlkkCOaScI/SpgGsfYzM7dyOJG9
	 PCU6p5P8kXWExZ3Wlg1rlOdIaHEfphNmHEHt3DOKT0Wju+3HZRXYBBl3H2Bzlfj/QeFzz
	 OHelvh0RrSgaFnFlqI1N/WMbHeAlYM6LB8GYuvf3wNMnzoAYecxOwBk2TrhWwID1elw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H0YVwCbF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C71606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C71606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H0YVwCbF
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so181cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196470; cv=none;
        d=google.com; s=arc-20260327;
        b=KPUNi7Yu5Pm6/VEW0/bosNVt+sYGim2eBbGjPMVw4XIeisXpEFqNOL7knvYSym/5he
         P2S7GbRRJB/Lvp2aW/it9ijhEbEwYCdjzVLYFtsvc/u/Gm2eqRtTW9CavYqRylO6ATUh
         OwkWjYq9bEl2oVMT8HSHgTSmOmwiURn7ng4WkHld9xWEj0pnNizxJ+86LnkMpQ/UWsab
         FyPhL3AGs4FwiSABg4OkPAqJzptO9fugRaLr1ail3V4lyfxMecA52vvmUe2Inxcxylr/
         FMjLPJj/wuaO857M5bjzEYOtk1IQ1bk2oVU+oJoaqdB2StrGbNcZUbGB2v4BScTIKoZm
         vfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        fh=lN6kXJN/uFbXDZkawBnaU27YacYvHEbBzYRnm0yT/t8=;
        b=EmQ/+1Sx4nCr/Bh4nf2G4sQPIvPdnp5ng93t6oNKfVpqxAIdIOKVepp8/2vk2QXW73
         KYq2Tevnl8TwbwqNrxUzpv3Gub44pz4H9p/wn9P1q/mBJDgLjn2NaarBsMgcRHj7ltIT
         oNBYdkzC4PzNWK5/gJXnKx+xTyQtzWEfP6MFFV99yisDJtD7JxZjkECNpfuGf5b2voa/
         YVywHVo2oVgbEbJFROJlx48favPO17F4lKEOV40AP9DRMMXaM5XnRPA8oy/Hskv1A7OS
         E/mX0tiat7nvRPiJSV36uSFsvBhRbBBSG5n4MiBomkd0I37+JI9nvmJdCA22BZaMUBRw
         VWCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196470; x=1795801270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=H0YVwCbFtGsLhM2WgfyZ9CEZuscowg14WiA+lGcenJ4NsS++ZK28EXcnwg7wRJs1+8
         +z5Yyobbdw8XfgEZXrC8PmpRdfpofq5yIe+YvuleuMfjNdXoKc50YW3DxeRi4OthuRqz
         0tuKhB8OrCns8cXlXrDiBhdk9AcVh86nnuG7ZSmr8R2FYvQi1M0nS/u6ajkzKfVJ6nmL
         NMqoouL4ZyyqnOsTslkUO4QzXWMDqWVdE4LaNW/uy9MML4lLgwtkOiMZKng/4b3yRM7Z
         xhBSTJieuagig0YgfuCsKkLw/XhFOmV2jReuv3khWSxABqSkp6b77CoVKCc+9NPZMEUK
         Qzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196470; x=1795801270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=LTR66ibRpqbuxaHDbh8nZv8LPqzYxuRAGRKizH+zjUMdXNNvxc0wEsYXOGMHStbFAG
         I+x8zNLLw8RBWT+VLxX5bIWinqW8q6jr+IQDGzrXIjv6hRehIjOCIY4FoPbxL6Jk6Lif
         jCM+ocZE8zzrLQ+c883G1aJceNdO0v7MQpy3YwM5zEMvgpwZ2aHlKaClhZpSoTAvguDG
         0LpVIiOq8M4w2GNM6M90VjeMWbOmyPAu3AmITol823/SnLvKm1DPFf4KnU0GPw5bY8Ap
         x3UJjFw0EAcNthoJZTiMNj1jiONiBhZwS1WkGMktf6XGs23aC7bb102orPDCvl5YIHlz
         bT9g==
X-Forwarded-Encrypted: i=1; AL+hErEbPPx7FkPlNlWSI0iMwC35yFZ0yJBgzS7Na601fPwOpw2+vRAs0kGW6QYIpuACTEfYoyurx3LLWOiB0z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U9FsmN4JIHAoN29Fd61vhjYp8i37aVfMHMTN7I4xkc5acWUMj
	u9p2ogn7bjSqcJD0q/KDbRmy+45Tu40rZUT5nsy+b/fn9rIM8ZMCE9ze/1oqISHg1Cg6RI0Ik1l
	4V5hPw3TQM7NEORLDXgEV8Gb5sJ1D57B9Cr0rjscT
X-Gm-Gg: AYBFou2bxSNHwsmDZwrKxesXb9g3DZoH4qg9XYH1tAWmMHRPsCNUw9qzQENR3rEBoy1
	hQTmLqRzP7SdoMZPt2IbXcWVKKQKU2izX8i5bGuEAJlLNApSoQcv5F6raD+3YSajJHFi3eVD9lD
	WSSgXqir9RXb8ouayvrvIVD8lUd4CbG7B+gjkQGGDNJ9e4hlB2sTNs35OXozVdyfYAqS8AFJkcS
	GkT+TJFX5uN5ainBbRtxWxwoFxDvhdyCz0aKDUKZQ7Wow9dv+w5gKGzaR/7FZEKvjdeCHiA/eHW
	KCiYSJHR9wsRoF/2/g69DdQgj9VXgoL/qYB7s0e/pbjDQM2YDoMtbmldEZRNnRxy4Hd6AeFEOv6
	W7/14uot571FrLh5z55LCuBeoN6bmiu5KPCpO
X-Received: by 2002:a05:622a:58c8:b0:55b:d494:187f with SMTP id
 d75a77b69052e-55d7911a3d1mr23325621cf.5.1795196469202; Fri, 20 Nov 2026
 09:41:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
In-Reply-To: <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:40:57 -0800
X-Gm-Features: Aa3M54oOzjegUxdpX7VNYBH8UxXyKYAg5jEgHWesrq6ha6qjCQCMQopqRhJhoB8
Message-ID: <CAP-5=fWXrX+VTWP4r4daZPf8QHEEWEyfWaQ9L+oa80Y3YAZcBA@mail.gmail.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:57=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> > When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
> > lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freein=
g
> > skb, and lan966x_port_xmit() returns that negative errno directly from
> > .ndo_start_xmit. Because dev_xmit_complete() treats negative return cod=
es
> > (< NET_XMIT_MASK) as packets already consumed by the driver, skb is nev=
er
> > freed or requeued, permanently leaking the sk_buff and its socket
> > sk_wmem_alloc accounting.
> >
> > Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
> > NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.
> >
> > Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for tim=
estamping")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/dr=
ivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index b8696fc7e9b9..9c722d23e0bb 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff=
 *skb,
> >       struct lan966x_port *port =3D netdev_priv(dev);
> >       struct lan966x *lan966x =3D port->lan966x;
> >       __be32 ifh[IFH_LEN];
> > +     netdev_tx_t ret;
> >       int err;
> >
> >       memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
> > @@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buf=
f *skb,
> >
> >       if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TS=
TAMP) {
> >               err =3D lan966x_ptp_txtstamp_request(port, skb);
> > -             if (err)
> > -                     return err;
> > +             if (err) {
> > +                     dev_kfree_skb_any(skb);
> > +                     dev->stats.tx_dropped++;
> > +                     return NETDEV_TX_OK;
> > +             }
> >
> >               lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
> >               lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_ty=
pe);
> > @@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_bu=
ff *skb,
> >
> >       spin_lock(&lan966x->tx_lock);
> >       if (port->lan966x->fdma)
> > -             err =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> > +             ret =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> >       else
> > -             err =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> > +             ret =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> >       spin_unlock(&lan966x->tx_lock);
> >
> > -     return err;
> > +     return ret;
> >  }
> >
> >  static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu=
)
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Hi Ian,
>
> Thanks for the fix. The issue is real, and also on my backlog of work to
> upstream.
>
> Just a heads up, I expect the AI review to flag issues in this area. The =
lan966x
> PTP TX path has a number of known problems that I am are going to address=
 in a
> PTP series soon. I'll go through the findings once the review is in and f=
ollow
> up on this one.

Thanks for the heads-up, Daniel! Feel free to fold or supersede this
in your upcoming PTP series if that's easier than taking it
standalone.

Thanks,
Ian

> /Daniel
