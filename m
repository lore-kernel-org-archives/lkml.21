Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362518;
	b=2jme9wYF3WOTF9WHMeS/KR1CvwZKOOBjSm9hTOqInSrU4/u4aRPf3GKu0vcwBRkt2UR0
	 nE2JY9IUxHfJOtrQoY9o7tRcQ0j+XcuGjBCogH0teRoifNJ52frK8hrkuIrljU55Zrh/Q
	 U2qVQ5eVPx4haHIWnBU1b62L/ewgha2XVSecIx6eyr3pZuWMkb6i3QSnyOsqV4B85tZG7
	 fqYaoPENeBGlAu6mjbkDWsgtk+3GRO7KNTJhYIu+MbHHROkJddL8rYLBMN5pdiw9t8tGs
	 FlMJlX2sZQfgKYNILL0xJsaE/JADEb+QbpV56bFMgKW+iiBdtmmNF5saIdzIyjdsq3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
	b=JC8RgzjAZEuwY5mgmgOPYiZeAYBwQP3PfRlkDnuFHIVcT3mcSlLOJwDEGrZA0vBZ/tH+
	 S6e5PBtj43SnVBVAaPNz3jvGNzb2rFlC/SyVb/SBjYMZ6mEqNo8k9h3euoAXsKunAMnbm
	 Kk9OsXQREBJfARPWKbxx3R72CB6soB1zOGYXYxcnUOrOn9bbRbaDmnprC/wrGwNuWMo0l
	 1l/95APsKiXIaIQgP14prFhzzGyeLtkr4nxmu4iJ9zr4qqPsxJbjRrXAW8FG7QLrhK6d/
	 2bIW8YT4KY1E2V+TYjAaf0UEoMNdzQAhQijpLlcnIjGPny5BsBqeqjSINW8GBFdFCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T8rODVA7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98174606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98174606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T8rODVA7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so1448129f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362516; x=1795967316; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=T8rODVA72roFxKJBCaacctLGEbghLgA/GVqVqHKVnUQy8rhTB3ZiOVUeTaLGepyBsG
         BqFSxGGQBV/vpj/pnNuwSgnyM6VLCFjZO/35mRNrhytEmjUyA659Te8klU7vuxGe2MC/
         GDQt8x4feyPEMCNqKc8bQHc1WxuQD88LS8xQd7LP6sFpXFGvD54BjGuGA71QPYjelpCK
         pmXSHnAo8KOalk+ZkMz/yVWa47n8ZJlAlhBlPxCDSPdm7dnaZq4ED6t+AKYK+XX6LHW7
         K9Lv+PnTwIUa2VjyTNbYRv++dQzLuZIf07RRWtZsse/LEN8GAzseAXDlpMXCA+2IrZfp
         jV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362516; x=1795967316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU/4coRrYrYEMovrLhotSeDgFsbxxM6k/RzNG1xiMj4=;
        b=cxw4ksQuxD5Dn+Q0eMJ9WUJsfQhX4rxmeBHTjFhEJtx6qwptumTBSEWG79fkhFonP0
         ETu8weyzs+7xkj+Jm3/+xw8y01kE+87vCmhWvS/SMPLZVI/nr8kQwIAnwtZ8xcKhT+ra
         xtosJ4zbRHdfgZ4ZKlM64JsXvzWLWlNHhqK6BL1v9E2aZj4103CMler0J7ALrkFfc3qN
         ZV4EzKnk34HGhYJEKrZHAG34TBSMThoUKmKTKUpczEKsAg8LwdgmTJBv6UqJwUGZArkO
         J+t7pvYuYBOqR4CBElI8/FAx6byo5lbvysU1fa33PmggUrJwywkIuaOrLX9oZQpVtOeQ
         xQkQ==
X-Forwarded-Encrypted: i=1; AL+hErFxjmebfq7eMGf2jfY9JMZ6vlTQxx0vBy6b05rAYiDSAU93ej4SdGDA/qPL99YvjOuI/82yuvLxgWfyBGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PCIRSknM7O51Efkrxt2INiRQKyPUafL5W/JoeLTF/5oJHu37G
	PLiFob49skIvXAbR/nUkgLcQB1Ntf4gbZ7+JqGYQhzj0r4Nc/6ZvhM/SP+cHz0UugIGQSQw0R1p
	qvBKc03uZuw==
X-Gm-Gg: AZFdTZcBAiSCqeXlDrH+gxiy9lu7rBSdsGVUi/t1tq0daJXKGJ2OKMlgFHsYILuhEPd
	PGytvteHPH0IkHjCOYiVrVsO/jg9gdNbFWQ78VXm0lxfg63dprGtcAqfGDCVtOKrXqeEsKHu/MB
	DicHUvpnt1Vk6i1lWvuZwF3pJpF4XTcNweygOVRxUAK1ZNP0da08kg8ePLec0Vedc5Z+TR4LUuC
	sczzioCK+cPxDRi4xMH8BgImzmDgEbjKonunCTh7hT8zcM76oRww0Gsp77mgzKSnybgmvU4C7KV
	eHBwjWROTV/UrQMRrmoNEmc1qvOJLWJwQuxNak4hZi6Fhy+Q05FGSYNNiqMgGXEBy0a/DETF6Ni
	t6AQGjYdwlp802Kr+qxrwHceAu11MIReBodyjpzWQJJrHSiNNgimgxQOY0wvkY1Zs+fc7yDXRi3
	E7Td0hd5qz6XYqeoPjagI1FrYdzWVRDz4LyCMqFjC6kSyA7VWCtLCCFm9WTk97LbM7t6T7+cgv3
	zqVYdkWZhc+2MldWKx+JNNQLNIpAJAXNWpFvT3d50oj8X13MUkKPX0AjhAcu+Zyr3VmAJ6u0Ncl
	vTBsmY5qlyxcl/FHvMRmwT4BtKVS0aGy3wtNZp49zzHIG/jI1Ik2P32wEcvM9/1Vqj4hCg==
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr185403945e9.6.1795362516062;
        Sun, 22 Nov 2026 07:48:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm279389115e9.2.2026.11.22.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:48:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
 <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
Date: Sun, 22 Nov 2026 16:48:34 +0100
Message-Id: <179536251467.2728475.8360126735543701661.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9+DCtU9MB3l+ZbzrrTv3gmLnvQYjcC8cHeWP8Lnbruw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMfJdmLT80w3j7CVfpluD1enfZmBX0eRfuDfl8uJP74
 M9MaYO+jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkWj/DP7W3sXWdLHfn/NDL
 NtvF0qLyP8s15nGl26pply9aezMeY2T4nysx89QUrcK6c4nddko6jeZeS+aG/+MX7Ge6lfb53Bt
 pZgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-18 11:39:56+01:00, Philipp Zabel wrote:
> On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> 
> > The reset IDs exposed to consumers of the StarFive JHB100 reset
> > controllers do not map one-to-one to the hardware reset bits.
> > 
> > Add struct jh71x0_reset_info, which describes the number of resets, the
> > assert/status register offsets and, for such controllers, a table of
> > hardware reset lines indexed by reset ID. Add
> > reset_starfive_jh71x0_register_with_info() to register a controller
> > described this way.
> > 
> > If a map is provided, install a custom fwnode_xlate callback that
> > translates the reset ID of the reset specifier to the hardware reset
> > line. The translation is thus done once when a reset control is
> > requested, and the reset operations are left untouched since they only
> > ever see hardware reset lines.
> > 
> > Existing users of reset_starfive_jh71x0_register() are unaffected.
> > 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
> >  .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
> >  2 files changed, 84 insertions(+)
> > 
> > diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > index d410a5a0ded4..5c64d47fb530 100644
> > --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> 
> [...]
> 
> > @@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
> >  	return devm_reset_controller_register(dev, &data->rcdev);
> >  }
> >  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> > +
> > +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> > +					     void __iomem *assert, void __iomem *status,
> > +					     const u32 *asserted,
> > +					     const struct jh71x0_reset_info *info,
> > +					     struct module *owner)
> > +{
> > +	struct jh71x0_reset *data;
> > +	int ret;
> > +
> > +	data = devm_kzalloc_obj(dev, *data);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->rcdev.ops = &jh71x0_reset_ops;
> > +	data->rcdev.owner = owner;
> > +	data->rcdev.nr_resets = info->nr_resets;
> > +	data->rcdev.dev = dev;
> > +	data->rcdev.of_node = of_node;
> > +
> > +	if (info->map) {
> > +		data->map = info->map;
> > +		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
> > +		data->rcdev.fwnode_reset_n_cells = 1;
> > +	}
> > +
> > +	spin_lock_init(&data->lock);
> > +	data->assert = assert;
> > +	data->status = status;
> > +	data->asserted = asserted;
> > +
> > +	ret = devm_reset_controller_register(dev, &data->rcdev);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> > +
> > +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> 
> Does this really need to be this verbose? Otherwise,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Hey Philipp,

With the comment above addressed, Is it Ok if we take the whole series through the clk tree ?

-- 
Jerome

