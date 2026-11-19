Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108038;
	b=dpsqLCIt8KyxKe935r/u8Dncb7Cez2Pbm08AbarNgonWnM5z2bc4J1iAIG1iTBG64t9Z
	 kAhaI43/iRFyTKTJGjRbLMWBoYfVsw3a+L/98WDxhYcGbOaXeVWeh1nIAdcohY9hj3MOh
	 MaBITUGoFb9ZVbYDAzRunBaFTNVJrItFX2Iaddg7MelVQzyyIe40Vtm4dFbux+t/aW33G
	 EFk1kCysMnwwKPHCLg+W2PjC1TnoAdjdEN6YshPiFoGPkdnvo9v3CmRUyOV+Sol2K6smt
	 +muPAASAVawt6iohncTSmDhkrecByuPWPjzPM7O3HPDB/pHOL5RE/Almt9dn6Uio0hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
	b=vOOI1AXHWt6tB7ut6GQuDwZjHM+3dc1bga8RS+FgZk39wSvBPuYXdpS4ljZKoPp3fGzL
	 a/StUq6dff5rQ9Za+xzwItamZH2mZRTHtp2EFPh3DGQpfG+qGgyhMIhBvLqhxdcxSZQm1
	 NKp4m0AyaQC5UwwNvCcPnDObKkypH8gfPeypzHsZN+WcjQWOhG8FVz45G3iV1VQyEj6N6
	 pHQhvNsWMmzaLTD0BYlBvfPMdcntRiQSjo6GxfTwYlrnxN7zJXTGYlhYw9Hasf4kaQou3
	 Q//f6tCGCXcmsaXMy7F1dEVC5EciLj1gptuJn4nyvx90b3vec9bNV2/L3QpZcYip40w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wRLpe/hA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE060A260E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DE060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRLpe/hA
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so243978766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108036; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCMmdowyFhUE2yE5wOtilDsoyrbYkYEZT7zvJDlcZUNoiVuNHtpXxv5iML3vrC/BGr
         gdwDMdkuUxw4rd5TH6/8PLxJdbbN43JcYrLtelISzQbajIHUSI+lMAxB0jUDvuqrcjFn
         v5cx0vN0gAyVIb/lcitcWDdDChVWz/X8qXL2E0GYFzBflQ4/QzxOzpzgab8VUjtxV3yo
         jngoxLI8mvoFZ5/QjHrAeoo6v1P0VUthk5XgqdjZYxRGDLw7GfrVwjYvTZL+3o6xqEeG
         ZXuILjwDD1WXf7hrLdvfKGjXF0X0C9ztJ3neiEMq+ar1f+xYSYC5Us1ewtYldTiwv69u
         bl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        fh=6no/ZP9VNWF1z1Jqt/8HxY7N3EyEU66GPpadNFBg3J4=;
        b=P8Vj2ZU9JQO8qi6V1b7UsUrj6cMuiEFR+P2nOsqer8p4vmW/bealJFstBNaQb1ObiQ
         zwYpNzk0rXVAgiXI6BgdrziA03SuJPGD8dpTauswqER3xGpI2LahjnD6CazoOJYx8xK3
         0yzJTLBju4HZVmLnJOggVnNoqF2nYBzqQnVOBYSwWJrUlLdEW7uInKU6FfIXfSUCelgc
         Qbhn2DIAv1SE9TvJrtJNsNier+3d0hFNjUVotg4k52zCHKVihUanAqlz2dtIctW5joyC
         DTPCY2Ma92sMs5DpGkayhYiqbmxj0U8lvDhqBhktXIFjTTEi88TjFZ4Bg2zKoIEEbV1i
         v0Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108036; x=1795712836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        b=wRLpe/hAAlQfJy2zz9jkXgo+e2IgHoHG7qcMY8CynhTQitdmTngCVmNATKq/DW2K+M
         XSn6cEE4E+4tioV9Jf7WaUweYgmRO+9aVBgwneYN1nTNROateHYH4yj66SlOmuDqT/no
         A8J+CydLa1+2cRL+XG8ACF+7ajxTjIc83kpd5uLpcbfuA0voT7bqnkpeLee/CD2OTKmm
         YxCwTPxZ4OmRr6tRwtbAhmW2yFM9aVQnn7a/ne8AHLuiT75e0BSu5OwwuQ493t0fZEHs
         yKdrqdkkVaUwhNyvK35zHtcnJEqEAM272ZL627oeLeSV+iUr/YnUFrE7cLsiLir/Qdvl
         tEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108036; x=1795712836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9rjfp/okberZ5UU9lPDDwdQHhMlVJDqMJwqhBEnUcg=;
        b=pP8m9Rg1I91l9Ikl/S0xOfS1mIogQsLRY7bzlNnVFow1Riau685CmDoa+jZY4j9tpL
         BKhRSwLhky5tQy3xeO55Nia1D7ROeZU5d3rI2HBH6/Kx3bpfDvVQQZpfaAuGWmXXeTsl
         dbc4htCydzYeso+s17P6OinDckJ9Xx+4pn3ILScVtFS71GQbQYK2BXyCTnWoX1FM+5+v
         fpJ5FUjMRuVCh+MTXC34wYfNAaMYaO79PhlWqMWKxWClAxGUZnpDfxpaPsaCe5sl80E4
         +SOxKDU4xLl9jDbLSPtIturk8HnrKsD1kJt/mmySSQ++khOwlnEQV8C4TGcrF8efTruD
         FkBg==
X-Forwarded-Encrypted: i=1; AL+hErFrcCJ0tqA+z+TRZPA+488QL9TMhjgyojVAf7oi/Csl+MePm7y9cCfqLh41v4j5R37w43ZaMpHpIj9sLWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SZEzQj4nFyxTocuhoxAI4foDpQ0NA0h6H81ROE9hHxcQ77Ebn
	ZqPxhWM3bAFYGYcKGuqxIFZPumXQQIp7EE8BlxqTNO8XkMf3CxERetz0ZnqVtb6D/XoIZ29crpe
	iQoqu0RcodBB5vLX2xuADEKGMIhX5g5E=
X-Gm-Gg: AYBFou35tvs1ClgW/eFAXjWWeJ5mjZ70Ortw+6EVCg1ETy5yqivIDENPsJAhDJ5WCmJ
	oOTsnpmCdLnDDi02veSr48S+K0SXr6RpdWRYN87oDL80PjMBppXLs8u7wb2EjXP6R+J+dzOKo6k
	g5C6lyzF8hGy3zXhg5tT+FeVdVMAvNhuAvpWyEBbCAbPizlBMTAzKfSZkWjzVocH7rsHEwrULGj
	dO0OvDDJQZM9KIIhNB/FNpUqFYaN4HXWTTfJ1DLeSqr7IWcws399IHnyWG+0YzTgrUK3slEie/7
	4+6rMWkhRPfJDPK1WzZUPmT9/C/CoGCSh5P/FZNzUliURje3ZxnclmiRgB+XeeZNeIH9hK8jwrM
	lLagvkhzSIjQ+N78vq2FsuoFxEST7LfflzpDU6mIGcCjUNekLq04Tp9bOPlMarpEsuO4K+/Y8TB
	wPm7rSVZNXaP0nfE05A1ylT5Go3Foc4mv4jXBvVXClRWC3mStaR/Qabosrl7nQnosjS/NjwtnMI
	WDpXpGnwphH/XkHTJ3BvQ1B76af+oTrttSqtBayLD32DL+QwQI=
X-Received: by 2002:a17:907:968c:b0:c51:205e:6e8e with SMTP id
 a640c23a62f3a-c51319b6e77mr189422866b.24.1795108036207; Thu, 19 Nov 2026
 09:07:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
 <20261119-submit-dw-axi-dma-stop-pause-v1-v8-6-f8e7fe60594c@gmail.com> <av8mu_ZFxNKSgFTK@SMW015318>
In-Reply-To: <av8mu_ZFxNKSgFTK@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:07:00 -0700
X-Gm-Features: AclHuK9wBfnKNfQrHKAEZR21ICySZpM18zy-as-MrTLPIUB6oIUYW_Q6FeHZQ-4
Message-ID: <CADvTj4oMoeiqsnLaojc0G-P0twOqUqO-rhGUh5aJcbt7wuhYxw@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
	Baruch Siach <baruch@tkos.co.il>, Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:41=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Nov 19, 2026 at 09:01:01AM -0700, James Hilliard wrote:
> > Termination frees every descriptor while a pending period callback can
> > still refer to one through vc->cyclic. An executing callback has alread=
y
> > cleared that pointer, but still receives a pointer to the descriptor's
> > tx_result and can use it after termination frees the descriptor.
> >
> > An error interrupt can also move the cyclic descriptor to desc_complete=
d
> > before termination. Looking only at the head of desc_issued therefore
> > does not cover every pending cyclic callback.
> >
> > Use vchan_terminate_all() after stopping the channel to clear the pendi=
ng
> > alias and move the collected descriptors to desc_terminated. The existi=
ng
> > synchronize callback drains the tasklet before reclaiming that list.
> > Descriptors already detached onto the tasklet's private completed list
> > remain owned by the tasklet. Repeated termination preserves the retired
> > list, including when called from a completion callback.
> >
> > Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cy=
clic()")
> > Reported-by: Wang YuWei <1973615295@qq.com>
> > Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EE=
BCB07@qq.com/
> > Reported-by: Mitch Barnett <mitch@accuratesound.ca>
> > Cc: Wang YuWei <1973615295@qq.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/d=
ma/dw-axi-dmac/dw-axi-dmac-platform.c
> > index 99b648d4ca76..2547f9596ae6 100644
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > @@ -1202,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >  {
> >       struct axi_dma_chan *chan =3D dchan_to_axi_dma_chan(dchan);
> >       int ret;
> > -     LIST_HEAD(head);
> >
> >       scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> >               bool enabled;
> > @@ -1219,7 +1218,7 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >               if (chan->direction =3D=3D DMA_MEM_TO_DEV)
> >                       dw_axi_dma_set_byte_halfword(chan, false);
> >
> > -             vchan_get_all_descriptors(&chan->vc, &head);
> > +             vchan_terminate_all(&chan->vc);
>
> I have not found this function, Any dependence I missed?

vchan_terminate_all() is added by patch 1/3 of the sun4i DMA series
[0], which v8 lists as a prerequisite.

>
> And keep allocate_queue when terminate,
>
> https://lore.kernel.org/dmaengine/20261104-dma40-fixes-v1-1-48c5180f5210@=
kernel.org/
>
> Look like we new APIs to distingiush terminate_all() and free channel.
>
> when free channel, need clean alloc queue, but termiate_all() should be
> keep alloc queue.
>
> terminate should means terminate all DMA engine own's queue, before
> submit, desc should be own by consumer.

I checked the helper, and it does take desc_allocated along with the
submitted descriptors. That means a client can prepare a descriptor,
terminate earlier work on the same channel, and lose the descriptor
before it has submitted it.

Termination should leave desc_allocated alone. The channel resource
cleanup path still needs to collect that list. This distinction belongs
in the virt-dma helper rather than in the DW AXI caller.

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v=
1-v2-1-fb7d258702f8@gmail.com/

>
> Frank
>
> >
> >               axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> >               chan->desc =3D NULL;
> > @@ -1234,8 +1233,6 @@ static int dma_chan_terminate_all(struct dma_chan=
 *dchan)
> >               return ret;
> >       }
> >
> > -     vchan_dma_desc_free_list(&chan->vc, &head);
> > -
> >       dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_=
name(chan));
> >
> >       return 0;
> >
> > --
> > 2.53.0
> >
