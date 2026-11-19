Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119026;
	b=XZvwu66w4uknY7COQSiAz//T+bWDbWZX4IaUG3k9TE+VqKQ+MDFyDung7L0Vs7UOoVE+
	 ypRx5NMnMxeGmKNc+idll15lKK/xeWAd3JgwplJsVOkCYdGHBfqDNUj8gy+KPLyOEhXic
	 vRqrv52aFfqhwlZ1DS1IazFhiU/Gj/slESTl7z3zntUXVnxFjWQrMsxS77D1WUnExkCPd
	 PPbOIkgyMO8ClX3PmPcfXxAHH16tKXUa4yGtfMjYlLwewBb4zPl/XkQlXTZMxAHl92X/W
	 AVyYEKBES6jr2N9fpigvI3pJ3aa6u+V3bQH/sCPe0LCuerrPgru8e7hDER4ds04wUrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
	b=ZPYQJOhFoT3bfdkEzR7bqoevI1+z9PRNAW4bOTcE3PgDTKmlp5fxFA8z6/06PfSw9sR0
	 us2lJplyep2wGt2zWF60t4BesYwfG9MkZZ3QAK3yj8mtFKysjEFLhWVMPhUoFoQgoNDWo
	 W1tJrF+FOedLcJfy4yY39OBYvTiCtecaAWc5Bw98fZPBOb/WHTn1Futgm0orvsuYojY7U
	 9AUZCOeVedJ2veM6cQGoDkat2On5kriQpneB+qVAb4rH+ciURRue2JmGNx9bUdu6kw/IP
	 QmBPZcSscvh6YMGggE5a61ULq1EVE1N3T9ZcmGFfb+nMc3gopBbg2ab6BW533PjF1uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpTPnwQW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6B606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpTPnwQW
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-92123971d1bso1770466d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:10:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795119025; cv=none;
        d=google.com; s=arc-20260327;
        b=Nw5NJTln3c5Qtmkq7qf4lLANOvv6FFLSvtAbIVS5GomhD4dcJ/m2zWK6Imk+Ty96x8
         xIGPkwxLnmGXbz0HQz+HRkvIuatZ/GuacjdZaDWiMe++ibwNSWVVrWJWt5JDeCN0XoIN
         37KWRJF0Q0gbfiRfD+C4jyoDRbskeuS/71VPBUAeOTwlx5L7p35uPEBGOc65GYM41LV3
         z9YAzmtru79s2GsQ+ZS/MLJFKRj52RwH6B9bADfsPkH7brZh7BlsjWc9OimGBEQjFCL9
         hGQA36VCZ4KOjn8G19tYiS3+r8n6VV+oycMpxaIG+dfqMMypCLvFIlcBGLVtDLmk1+vo
         NPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        fh=x2ydUWNNNYcJ1gmAwwRVLGLu7zq2ifEFbnhWk8bo/rg=;
        b=mukVm/sMWMOwgpGMCeYkUaQVx2zFm2BLou7HMRa262VITJPfAEHvVVNqQroucNwMor
         mWR2Lq7jVu+oc5Wsi4QPh2VshNP08MjeTCCs0UM0M+JLT2iZjFgvt+/zpgd990O2CMD7
         k0Zgls+6P6aH2s06zFEexwShRpd9FFD4+TbIqWb9W1lZjvXzAZp1AN1fSj2Hl9x4VjDi
         oPZIcHM65UQkQ41ydvi9CsahhmpXBe8918U5bpWPt7p9eFxEwKuQ+Snkl9AlCeWsaVQI
         25J9qfWMSqWpDFZTpar2yI3EDU0HewUpWNxEfH30DKLD3DGzRuljZ9N0yB2f2rg21s2e
         IszQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119025; x=1795723825; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        b=rpTPnwQWjdUNKc6ZgFkdB+zx49v4FBKxU1e1CRkTofcKF1oFtRQFkuh0n8Qn6i3roQ
         IeC48hn5oUpaft/PzmPRBkUoaKIJjlmKdfLt/adtSVBwcqwlyLlezN6GU/gEDRpnbW1S
         LQywdb4HxNV2nKbVyAUuztEEMbxykw7VWdnNCHN1+q96K5XDwFD3uAM7MC3QT+3IkM1Q
         gUXo9RFd+5vF8hQOrP4GwzuRiAwWOEg4GdJJHKkjllgj6GQtBLEsjnyf4wPs15dN/DVz
         t3nCBssVD+k3dSbBg3hcT+fOR0J0xMYSF0yrAxtILJUTsOYHx2B80pZh9JbgJcZ9TbLo
         rEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119025; x=1795723825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HVvG5YHdzvrDiN3SDoFdTlCgaktRbuUsF9vZ6apS5J8=;
        b=zuOVuFHimORosbwNfuGJOZHnTaZngTUYcHFODNU5FzI1M9ul9aeZBCHm3H9wwx/Sv3
         UjqxQ8BrJbb9aR9Xo/ooKVZdKVTJZP/PEN7VH2553Zol3z/8liJwmgCdQDeeloI+kFnh
         TrB6DpIVZ0c7iwLP8IxvS0EbSST19D3Uru+9IvHPJQiNJMVY4x/CQoHWEQAsgXEgWbrq
         PZvb5Z9fQtWeYtPG8OzWnoPb5QgPQltnpXZF0U7UZtfHdyiQIjU7wkSqVcGxcC7gRp0M
         GU8KU8YMvngMFETuzgEgpbdqz+OvChjndo8IAn8Xxph1NM3zBSi/2cHq5tmUZU6J0qfF
         8GDQ==
X-Forwarded-Encrypted: i=1; AL+hErFen18eAvnuo9YbnX5qRfn2pcqfNr/UjXk9GUfm5wu2cUPIDvnmZdxc32obW/NsZ2QZJ0SieLmi2OwxxNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z83XFbysU7uRONL9ngafiLp5NG/2HjnTuU7D62QwcGKbWqyVhB+
	j0rcsfEUfl199Fyg6SfdjLGHhp99fSKOkmUN95q8Z7br7rK1QU/q24+kTIaWes+rx5qb/EO5Rc7
	PW0ZblDCKygub4Kfze/UvKTERmGwa/cY8Mg==
X-Gm-Gg: AYBFou1p1pfMl9BgMfKgBmuY+EM7AKb9Ds5yvQcXNiB0b5rOeBo+TEMW0TFFqknJW+0
	fBjBiv1Xveb09vtJVCiJt+P0OzPNyed9r9Uai8KxlFv9lChPwxDR529AAt4BCEjyV4NgnW6nZbp
	60ReZZN+U96qmoHxE2m54TLrSxBGHVXit2dSWKPbOyfgNmxh9rgPzLLh53lFPKzZP9TfPyynSyc
	HMT0gYcxg2VNT6ukIa2Oz5YB1YBtNyXfamNLxDGNHK7goTDs5Zl8fM131RMlMNsD5/Ol5T53glZ
	iQ9Qyw3XjZO1mm+hD2jztWVLxpwTDKCZh9liAj4QAagVZFuDwIpg3MQl954h2qddflHbT4uW1Ia
	nn9Bp7l/iQujLGYYvv9TSJFpcPD3Pdz2jz/OqVyrO0Xp3kRS4xv1U6NkQi5tnwIlCzLq062u1kr
	tdqjUe
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr334599137.7.1795118633257; Thu, 19 Nov 2026
 12:03:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110001128.1041-1-ansuelsmth@gmail.com> <20261110001128.1041-2-ansuelsmth@gmail.com>
 <179444135864.1126566.17591616173966524369.b4-review@b4> <6afc8629.c6df0648.3437b8.c961@mx.google.com>
 <av9PgKqFIjNPSkTt@x1g10>
In-Reply-To: <av9PgKqFIjNPSkTt@x1g10>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 21:03:42 +0100
X-Gm-Features: Aa3M54qAu9YBO9O8U07H3m9oFz0QtjgzL1ohhGwtFt71zpaesqgbV3dEdzubUI8
Message-ID: <CA+_ehUypOdyr4kZ0giRe9_yTweBq+5F6Xi637igt1VVTvxVquA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw implementation
 for en7581
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 19 nov 2026 alle ore 20:35 Brian Masney
<masneyb@kernel.org> ha scritto:
>
> Hi Christian,
>
> On Tue, Nov 17, 2026 at 05:51:50PM +0100, Christian Marangi wrote:
> > On Wed, Nov 11, 2026 at 06:55:58PM -0500, Brian Masney wrote:
> > > > In preparation for support of .set_rate, convert the clock register
> > > > logic from fixed clock implementation to full clk_hw implementation with
> > > > dedicated OPs for Airoha EN7581 SoC.
> > > >
> > > > This is just a rework and no behaviour change is expected.
> > > >
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
> > > >  1 file changed, 55 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > > > index 24fdec2e6198..6640e814d36a 100644
> > > > --- a/drivers/clk/clk-en7523.c
> > > > +++ b/drivers/clk/clk-en7523.c
> > > > @@ -126,6 +126,12 @@ struct en_clk_gate {
> > > >   struct clk_hw hw;
> > > >  };
> > > >
> > > > +struct en_clk {
> > > > + struct regmap *map;
> > > > + const struct en_clk_desc *desc;
> > > > + struct clk_hw hw;
> > > > +};
> > > > +
> > > >  struct en_rst_data {
> > > >   const u16 *bank_ofs;
> > > >   const u16 *idx_map;
> > > > @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > > >                                en7581_rst_ofs);
> > > >  }
> > > >
> > > > +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> > > > +                                 unsigned long parent_rate)
> > > > +{
> > > > + struct en_clk *c = container_of(hw, struct en_clk, hw);
> > > > + const struct en_clk_desc *desc = c->desc;
> > > > + struct device *dev = clk_hw_get_dev(hw);
> > > > + struct regmap *map = c->map;
> > > > + u32 val, reg;
> > > > + u32 rate;
> > > > + int err;
> > > > +
> > > > + err = regmap_read(map, desc->base_reg, &val);
> > > > + if (err) {
> > > > +         dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> > > > +                 desc->name, err);
> > > > +         return 0;
> > > > + }
> > > > + rate = en7523_get_base_rate(desc, val);
> > > > +
> > > > + reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > > + err = regmap_read(map, reg, &val);
> > > > + if (err) {
> > > > +         dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> > > > +                 desc->name, err);
> > > > +         return 0;
> > > > + }
> > > > +
> > > > + return rate / en7523_get_div(desc, val);
> > > > +}
> > > > +
> > > > +static const struct clk_ops en7581_clk_ops = {
> > > > + .recalc_rate = en7581_recalc_rate,
> > > > +};
> > > > +
> > > >  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> > > >                              struct regmap *map, void __iomem *base)
> > > >  {
> > > >   struct clk_hw *hw;
> > > > - u32 rate;
> > > >   int i;
> > > >
> > > >   for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> > > >           const struct en_clk_desc *desc = &en7581_base_clks[i];
> > > > -         u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > > +         struct clk_init_data init = {
> > > > +                 .ops = &en7581_clk_ops,
> > > > +         };
> > > > +         struct en_clk *en_clk;
> > > >           int err;
> > > >
> > > > -         err = regmap_read(map, desc->base_reg, &val);
> > > > +         en_clk = devm_kzalloc_obj(dev, *en_clk);
> > > > +         if (!en_clk)
> > > > +                 continue;
> > >
> > > return -ENOMEM;
> >
> > Hi Brain,
> >
> > as you pointed out in the previous revision, returning would change the
> > behaviour so I currently skip the clock in such case...
>
> It's ok if it changes the behavior to make things interact with the
> framework correctly. I just pointed out that the commit message says
> there is no behavior change. You can drop that sentence and just
> describe the behavior change in the commit message.
>

Thanks a lot for the followup even if it was on a previous revision.

Ok I will change it for v7.
