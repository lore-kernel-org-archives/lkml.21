Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528567;
	b=hxQLsZoY/deMaZJGmgTh+DHhIZbraUVCuqzxE4sWKC2nqC04elTXLdPV3SBeDYU3rtds
	 tFgy4kgkJrcT7SqBhCLL/2ZMqAjE/QxWq5Ycx99FyTSbY2Yh4eWwknt5BDXvbbrdd88+c
	 FLmWd4i1zWkWYLWueBq74nCyaoIN+wrymiuHHEqTzYDFA+IHRy4Bb/aJhWkBf8E9pGZNi
	 FzGO3jHVs3FdbBaCrqh8K+Ed/rmTsFmeNANuSKJPocQaycQ4japH1Hb7RETMCAi/hQVVQ
	 +Osa5jRsLwvKHCJWgiWIWuY2cGi8X7xZTCRnWB06G0j+b1ktm5RE0+r1kglGgjde22w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528567;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=9zxVOJsKSedTB3Xke6VoVHG3BYFHZeRSBMBTl/QPXBE=;
	b=pufEY/af9zNFRcBIU0S/7VlPXxqGDzK/5Y3p09RJZOJaEqaO73ayKaIst6QKHt+rxQgH
	 AI/5XDCuLTFzIv9o0PBMpjVec8rXOncSewdnmqBvxUA3MW9Yv7JB9rc5MQwwLv6xj3wxY
	 C/uxM4EP53d2hzS9Zf8W/GUsSzyJToIpXwBH2tjhY3uAncnScEIGAEhsjFT2gN2Mt9xsx
	 +ZQydokGTUTiN7jhtX/FcGpRQc5kMM9aV8+Hn9UFGnYvHgfXiG8T8XnTduWb9K6Rffrj/
	 TrDIk8I8d+J+KSQx1pguDXZlYajSev7baFJwG6N59id9iGMPGB4sa7L7fs1azA9Nbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C7ZNm5cq;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD807606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD807606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C7ZNm5cq
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so2254650a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528566; x=1796133366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zxVOJsKSedTB3Xke6VoVHG3BYFHZeRSBMBTl/QPXBE=;
        b=LECOB5b9ERA9FIyfwP6SgD5QUk40MpLCZIwE3bTurGH5HDaByIuIWFEizUwQ0nW8JH
         EyrqezxYsvRrfIooIt0ZikIy4JseV4xQ+twUHeEH3WVRA27IQcKhE3U3Z6e0Fbrm+ElB
         OVV6cmLAv4bU4j68Ue23DSL8wfvIkGkAGvODZcSUynyqrphR0GqEBsFWSb9Shvm9bpYF
         ZsWtIGjLtWVKO9FDTmkJF0ZzvZetCRBPnvkVrmh0qoVww1LDbgzaFHSNvGMzNtTM/Ecy
         Bx7hjT7qwLkVB8TvkU+3xsij7roZsyQgs1Wsx1m8hGgxW8+aCd9XjtJHILLCq2bBkE0A
         ZY8g==
X-Forwarded-Encrypted: i=1; AL+hErGSeqy6iDYFLnKpoD3zGHpQBQipKsAAiGAPiwS4feN7D4GZxg3qcV+zUhKyUspch7HsDszLCEJieYg/qQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZJQbkdaXWw8FahvfTM9ncz8WXCvTDLFqvz1gBwbc+mR3Iwf55
	n/hUGaiOkHD+/J02pGTvmKlzringiBA8SVUM9pnbBFLYmESqVHkFvsCP5vqR223LxJiPNkMTkJq
	/U2ywZppL9rD/tR9k8yW2PRMvqpWPjoPpOqtWHE9tQg9fIuSa8LxdTPcWPRDnBWKyXDwbkKtdgF
	X/ASnxvoDjitGIIpVb1ZtBKzgiiAgZTvwL9VBSwrfJha+4c9M6Q2Fpp5FVFQ/KOi2UG4anSDbm8
	R48UskdCJfIa5NCbQ==
X-Gm-Gg: AZFdTZdrP+TphV8UX0gXNnIHzAwrJ+vttx/eUbx+D0NwOkCiAtAgXeYqizUSh1ne1/O
	sDOycaxyiIy+25DsD7NdfmHRl3j3YQr5UcJ/wxJiCyWZ/uCGPvoLCWXapwzxDq5Z4WED4tCkelS
	QEOQ3UXSO4SL0LP4gD0Cgx4TrbZV3wsH1OTERz2CqO8yJCKua7318Ee/g+KigGC9xmeO1nB5ZnI
	+v7+H3YOIdWK0FC/IX566Fo4aA+Lad6Lc4Ol0B+T00LUc0lHVE3k9b8jEnplU7C1yjXeh04uUyo
	mo22QCsFjiI/WbtYBBKsPQ6+xah3i/F64SdNmZ7iZfgL5Q+mUmXVgeUkOsdln52Xhyk1uLQCVxZ
	ruiTfC59qGRmwLPwhOr9fx/DkHL/5YHWsGKCwaWMRHvTCCK4tj65O6MpmPLMZeWOcQtBWSaEPwQ
	wsoQPdp2E7O7VTOyj/Poadj6q8ZgEWwIIBAQ==
X-Received: by 2002:a17:90b:2e4b:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b41c96ce70mr12522718a91.50.1795528565817;
        Tue, 24 Nov 2026 05:56:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc5245sm3947626a91.0.2026.11.24.05.56.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:56:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38531c1a566so3889773eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795528564; x=1796133364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zxVOJsKSedTB3Xke6VoVHG3BYFHZeRSBMBTl/QPXBE=;
        b=C7ZNm5cqdFN7gW7vdABsAgpXakS5sFMUzgwjhJRneRCazZjTlLtZfesGdp8tf9ivtZ
         MQYwzIs8yHKmsZoM/qot0LsezYqC4MzaFj/3sdaJT0kBeqxADkxp+S1MPUBeZxHJjpLp
         3sbKMVJnS2iN+MeQFyZJwGx3gomu7WaDBd0O0=
X-Forwarded-Encrypted: i=1; AL+hErHAs6KOqJkNuF9CbaFiLxlJof5qUNurSN1L+VJzI+YU+AVPSpRQWn1F7as7P6Szc4Kyb8cecPFA/W+D16c=@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d739696e18mr5490954137.12.1795528221402;
        Tue, 24 Nov 2026 05:50:21 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7d739696e18mr5490938137.12.1795528220780; Tue, 24 Nov 2026
 05:50:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123100746.1975030-11-vikas.gupta@broadcom.com> <179551563894.3135.1768774823155933236@kernel.org>
In-Reply-To: <179551563894.3135.1768774823155933236@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Tue, 24 Nov 2026 19:20:08 +0530
X-Gm-Features: Aa3M54oWXcw2V-nhAo2cI2E4QO87TWcvroRerYEEDkvp4h-XXnBeiP-28s29IZ4
Message-ID: <CAHLZf_seiXXZEEJ3BXV1hSxnqhxcfamibo-VDnSvj23y4-Dmzg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 10/10] bnge: add cpu_rmap support for IRQ affinity
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000435ea406610612c8"

--000000000000435ea406610612c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see a valid comment in this patch and will send out v10.

Thanks,
Vikas

On Tue, Nov 24, 2026 at 3:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Off-by-one between aRFS rmap slots and RX queues: RX ring 0's
>   vector is never added to dev->rx_cpu_rmap, so every rule the kernel=E2=
=80=A6
> - [Medium] bnge_free_cpu_rmap() assumes each reader loads
>   dev->rx_cpu_rmap once, but set_rps_cpu() loads it twice.
>
> --
>
> bnge: add cpu_rmap support for IRQ affinity
>
> This patch allocates dev->rx_cpu_rmap when NTUPLE is enabled under
> CONFIG_RFS_ACCEL. It adds each RX ring's IRQ vector to the rmap when the
> open-time IRQs are requested, and frees the rmap in bnge_free_irq(). This
> is the patch that turns on aRFS for bnge.
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_netdev.c
> > index de7320521a3e0..dcd073d8bdfac 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
>
> [ ... ]
>
> > @@ -2569,15 +2583,53 @@ static void bnge_nq_free_irq(struct bnge_net *b=
n, struct bnge_napi *bnapi)
> >       irq->requested =3D 0;
> >  }
> >
> > +#ifdef CONFIG_RFS_ACCEL
> > +/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the poi=
nter and
> > + * wait for readers that already loaded it before the rmap is freed.
> > + */
> > +static void bnge_free_cpu_rmap(struct bnge_net *bn)
> > +{
> > +     struct cpu_rmap *rmap =3D bn->netdev->rx_cpu_rmap;
> > +
> > +     if (!rmap)
> > +             return;
> > +
> > +     WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
> > +     synchronize_net();
> > +     free_irq_cpu_rmap(rmap);
> > +}
>
> [Severity: Medium]
> Does this teardown hold up given how set_rps_cpu() reads the pointer? The
> comment assumes each reader loads dev->rx_cpu_rmap once. set_rps_cpu() in
> net/core/dev.c loads it twice, both times with plain loads:
>
> net/core/dev.c:set_rps_cpu() {
>     ...
>         if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
>             !(dev->features & NETIF_F_NTUPLE))
>                 goto out;
>     ...
>         rxq_index =3D cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
>     ...
> }
>
> cpu_rmap_lookup_index() dereferences rmap->near[cpu] without checking for
> NULL.
>
> Suppose a reader passes the NULL check before the WRITE_ONCE() and does
> the second load after it. Wouldn't it dereference NULL? synchronize_net()
> only delays the free, so it can't close that window.
>
> bnge_close_core() disables NAPI before it calls bnge_free_irq(), so the
> device's own RX path is quiet by then. But IFF_UP is still set during
> ndo_stop. A netif_rx() caller can still reach
> get_rps_cpu()->set_rps_cpu() when RFS is configured, if skb->dev is this
> netdev and queue_mapping is recorded. One example is multicast loopback
> of a forwarded packet via dev_loopback_xmit(), which keeps the ingress
> queue_mapping.
>
> If such a reader exists, this code turns a use-after-free into a window
> for a NULL dereference. If no such reader can exist, then the
> synchronize_net() and the comment aren't needed for the reason the
> comment gives.
>
> Could set_rps_cpu() load the pointer once with READ_ONCE(), or use proper
> RCU annotation? Separately, could the comment here avoid claiming
> protection it doesn't provide?
>
> [ ... ]
>
> >  static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *=
bnapi)
> >  {
> >       int map_idx =3D bnapi->nq_ring.ring_struct.map_idx;
> > +     struct cpu_rmap *rmap =3D NULL;
> >       struct bnge_dev *bd =3D bn->bd;
> >       struct bnge_irq *irq;
> >       int rc;
> >
> > +#ifdef CONFIG_RFS_ACCEL
> > +     rmap =3D bn->netdev->rx_cpu_rmap;
> > +#endif
> > +
> >       irq =3D &bd->irq_tbl[map_idx];
> >
> > +     if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
> > +         rmap && bnapi->rx_ring) {
> > +             rc =3D irq_cpu_rmap_add(rmap, irq->vector);
>
> [Severity: High]
> Is RX ring 0's vector ever added to the rmap?
>
> bnge_alloc_core() makes NQ0 bnapi[0] and binds the RX rings starting at
> index 0:
>
>         bn->bnapi[0] =3D bn->nq0;
>         ...
>                 bn->bnapi[i]->rx_ring =3D &bn->rx_ring[i];
>
> So NQ0 (irq_tbl[0]) services RX ring 0.
>
> NQ0's IRQ is only requested at probe, through
> bnge_nq0_init()->bnge_nq_request_irq(). At that point dev->rx_cpu_rmap
> and nq0->rx_ring are both NULL, so this block is skipped.
>
> At open, bnge_setup_interrupts() allocates an rmap with bd->rx_nr_rings
> slots. bnge_request_irq() then walks only bnge_for_each_open_nq(), which
> starts at BNGE_FIRST_OPEN_NQ (1). cpu_rmap_add() hands out the first free
> slot. RX ring 1's vector gets slot 0, ring 2's gets slot 1, and so on, an=
d
> the last slot stays empty.
>
> Now suppose next_cpu in set_rps_cpu() is the affinity CPU of ring k+1's
> vector. cpu_rmap_lookup_index() returns k, and bnge_rx_flow_steer()
> writes:
>
>         new_fltr->base.rxq =3D rxq_index;
>
> The flow then lands on ring k, whose IRQ is affined to
> cpumask_local_spread(k) rather than next_cpu. On later packets rxq_index
> matches skb_get_rx_queue(skb), so set_rps_cpu() leaves the wrong
> placement in place.
>
> The commit message says the rmap lets aRFS "correctly map flows to the RX
> queues serviced by the nearest CPU". It also guards against a later ring
> taking a free slot and mapping "to the wrong RX queue". Doesn't the
> missing ring 0 cause that same shift on every open when there is more
> than one RX ring?
>
> One possible fix is to add irq_tbl[0]'s vector for RX ring 0 at open
> time, before the open NQs. NQ0's IRQ stays requested across close, so its
> affinity notifier would also need to be cleared at close.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261123100746.1975030-1-vikas.gupta%40broadcom.com

pw-bot: cr

--000000000000435ea406610612c8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ZKzsTDzWEhPsCM5DcbMg/B7eD9n+rBWHxsk+yKJKdkLpkpTKdxxTd1Y5Ln+k5KCTjxlCUQQ7Q2Zz
qYU8bfRq5ZMwUVJD3NZCqEKbEIgSX2vXFS61zdPwnLyHyaC/erAWmgHLu4kzpk/V10NcnUjX9FYK
f/Ggi9MeMNG20gEIUbCg3RgYf89YLXUJDOuoz/Yajw/VuiVlwS81wF44DmJhAVcGzrI00uydpksG
oQY2qVlhYsvNTqU2V/uaBrKQnyM0PkU140cCAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYdmlrYXMuZ3VwdGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQI6pBWVwIN47wGrC1m7lYfqN94QjAN
BgkqhkiG9w0BAQsFAAOCAgEAOdSnSEyuTvTtsnmEilB0JfgRKx1MM7kNdv0pfWcINJhssfHD8Fc5
wm+JzenYR9yJAkntX0Lr9yv+OG0Jqhvy7u9gKljfI4jXO4qxZ2jf1YvI+fDK29/NV3JAQuipT3Vs
IxBI73CQO11VwMePOTsUNM1s+9cWT5zLuqOEEu+95jRo5KEtH1/4nahrToLU1Y+flylsBaAUhB72
KoBBzdewa+psa32lY8X23AWDoczIlUBmPt0hmApBvHOUCYszSiBu4/VhVDuq2iMBtnYAj2j9Q7Ct
pZHPj6fQv247S9dTDDym05r8arHAsUw7B29KvPfxeaqexL4gwQQjIsfdZeh88XYLXA+mvEej6OlO
YO3546G7bczFxIjO6V9RrvYEeAb+n7udXYymuIm02XtxIkr/Uk0gRuFoOpG2Dw1OH8xsOUER1+16
qGb2QKMgaKL/IIM3gXAuCxNVBOT+Fj/wh5hw7MFvTTXPFA8IKusoHZYpxdrr9xjoJ/wt6j4/E6K4
IO/WuSc4nM6kshiwIu5c6r97213ZtJFOrjoITiBIYFP0WQsTsEbWvaBX/7daT5IVr9rvCOCk2JA8
bOWwP4OYXCKJY5nZOntb0ECSI7RM0kGelGY4MAD42+OBWHxKU1Qvt5WK4kIXdKpdFp9Drv17PyCU
dR4AvAJyWnkqZyi5QuRg/hMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
Agxt8eaxmNwH4eu5pUowDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIDGAFDz70eQN
TYl395fZMsPKgyHU5CoYQ4j/Lkd6KlADMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTEyNDEzNTYwNFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAH3SZhZB/lW4WjsP42PWqtcLbCS6RqhNBHoHANIcn3V9AtcS
hQF2+L5ZcUrX7OHi6XzOnu5cxd1Sxce4L6DddbW61yNx/0490v/0mMP2c9Fif6P8w3y+LN+t0hC9
KrInBffGRrQEK/oRX4HtFVUnzAQ5Z79UJTPIq55Rm+U5TC/zhLfWbCqY1d9Jvrkry8hVp+6SCbEJ
qMTNEQIIVs8NUs9hJ/K38+prTd+fav69vGkLm0AEhWpt/4mJIxxi8dOdmCvRDV5w/MgJjUjPQylC
JCgt/r78kM0Y8J1HCJTLQ+fwYgfhQJzmtUibjPgC5rXpsVOLrAZ3EfESPPiFPNN2NpI=
--000000000000435ea406610612c8--
