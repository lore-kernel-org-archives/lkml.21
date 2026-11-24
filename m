Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559486;
	b=KQomsgD1ycorW6Pl16TFLkk8NLVj6XSUDppDshUljbQzjbMjsTedShCaMteMEFeQysL4
	 Zb1Xgxv/IZpVZ+Q/MQ5xsJT7OYErvmyQ2ax5wMPB4/PsVSAKzpCVYML94RzDKDcmxqn78
	 /nBISVFEsWSE1GAcD1ft/iWuzLLEmIdTAzZyOtId6dSIzaCbNUS0PKheQ9CJSKS1qzfNp
	 br7seUVf1fsgIHFvF+a1fx8cVe75zMwGpNr/RfW/IQ4yYSXpsDkYGWIPhsa8HjgIokh4F
	 Tppxnfv3+tAAfCAN17mE4E3nK6L7sqOgT0bJE0gYS1Igwehy9kYal0DjgnhJifjErEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
	b=P+29vaX7UqDynUsl0RbFL7ZiNYOf82wgJ3E1cfQjceIqCtceGHSvgWGK492G5yYr4vCv
	 ddEQNJ+73NlKNuUlbbEBUt79KUtzUsKdPgMUtc3ImzYFAe9m/bPyPY7aQja29gaJ8amkB
	 CXttVSS3e3j2ly3woD4mb1zSxCCBj8vV30wqFH9tAVuZjPZheLTYy0TQjyQ3ZpC0Iaq0A
	 +cnr1QcqFDGrDat8VUL15LCk+XMlO/1bD2nOQep5JD7iBRrYdAwBdSrPU+PLGLK02YB5L
	 v21sdreQE6VZFI0IzimDf+vd1F7Bq597ysEF5p5J/rwG+WVPw5hnpy2rWmOnuLZwuHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92CF606A6A2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92CF606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pq6hYJqL
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d427836e9so696107666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559484; cv=none;
        d=google.com; s=arc-20260327;
        b=Zbu1KDuxqvOWotDBIwRNGbRcATpXfg1LtkGzIEeZl+mpL8a6VeloG5kqabDaLV7xat
         WmfdTqoDD+uKHMz2c3qsQA3YmO1Do03Ifjdb1LcP6SfGNFY+QNBqomloxPWcKGVjL7lz
         CufsQsKxPKcylvie1vuvmrt4WTDhfjkWyvDCoFBljc3ZsZ3L8k7ipwGRjbiQOSzwSSdy
         y1wtnAX/XKzLhbN1M99ZX5GoV60v6iLTHgU0wDNwKlbeBWBmdaNWOE8pV9eV91tHlB80
         AvoQl0xu0ZdQuGiXLcIQJ6gqTRthr3XZV2Ebkdp0P4S8k1QOEKHRgdd7rQxUE26T265S
         cqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        fh=sAyGYXnZBSUq2usEw8Ce7bnAYdmBnImI9iDuXlyRdxg=;
        b=L6Vwr4pXFAU3sWgKCQcSt92bSsjZIlD25rpNiZoeGkCXpuf0WsRHxZMo+chjeC35F1
         95zSC8myfPrk2ba39+SBoaMP2Xgr0IemEp4J5+qSs69CekyWkc7iaAfqZrne3sZFTlM5
         EX+VWVyIBxeDYjWKxxA80eBN76eX9Th+uLL7e1RaFX8bjZUfG4ifXn74LucndVs3LwGT
         NJPg0C+IQMs1U7TK+5i1ImsD8zLOL3lrzDcLuYbVKfweq1ooKUQWZfEXoJW+y6vLLkIW
         R1aE63M8LVizOnR7W9norxIeEdSCXTT9vbcGdDsVSmELiYu5ft+kQZPTq4lp+PUiIUTE
         jXuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795559484; x=1796164284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=Pq6hYJqLqfjmwjq6l8NZL/b72FkWDY7/prko4BQ8KEWZLjnZPHCUw44AYwkS+F8DRi
         EUeoUtNsUmpvMracnT4N+GgMdEmq/lLExWZTQz/1x2gGNuR3gColGwjZifwMrkotSzq1
         d6CELz6FR9caGvQ5SJQ8Y9tQVYlF1B8Q2XaCePiSHWZdneDCgaC0t5wk53jlieeZPq0K
         Xr/gKY4gRbr8NIvfHqVM+4o2vEDZGfOtkWKPxClj2k43yKXLUk1wVQj7s9WACrQQEpw0
         Q98XJp/kNzbRIEqZyr+UWynhvWGPSRNCMolaQERiuhRGVt3CSC7buBUx16Xoa3CNaJR4
         u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559484; x=1796164284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=0FWkm5R5uQMgM1U30qbgJJeCQvOxkDgyCkNH1wxbsWmEEEW+qO0j6prSWioAYzTPKg
         Kj/yxx75P5ZYJGL4XVi9raw1s6ZySJpoUyygMD6wUFoR6kJNdnEz9vR31PElNGrJhJeb
         R6zfsR336dWxOZP9cAaGnIVuRbO23x+ddZOfpQ6bz6WNFcgib+LOHK3cXTYe3UIatntx
         0VvF40RI87aeGDVDPKGL7U/TRCGFr27ue7Nyq+ss36esExQTOI6TYE50HzM+/Gaztn9h
         oOTTnJbH4MbIMAfF2AdJ/WQh7gyZjWTYCqDxsnIHLU1/s+fauI0h1pjq4n3JP3Gk9ABf
         Pp8w==
X-Forwarded-Encrypted: i=1; AL+hErE4c/BxXf10zp6C7NiXLsDoXWINQ5E+/qFhXoeuTrMPTNjm+wKyf6fbXB7OyzL2Hb2BxGdGK87Wjyb9/b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qzhnrFJV0u7HZ0Igtyf0b+vBpoqFROKFj4rjWImp/jpIBA4Lo
	cq4gDruZLE+wqHVj/gE9yUFTIRNso5YcdlFuhkTAh+rY/0nMRkda93fK4ejM0zJn3dTPv0jXnMb
	1qrpBWPR4sFOx0r8+2PiI0Q54eXmHQdHQUOzefLQwMQ==
X-Gm-Gg: AZFdTZdbbN3YuoQL04Ro7Rzh6XMHvMmpIxOM/Hx717CAAq8oj75+eUhIdaItUMmttlw
	6zDGY0mowhpbtf2UewjwwC7zfbBW3GFqftAxf4PK+tfFbMAZlLCn66byYLoKNiqNY0xYGeuAWls
	FWiLQsciFUh+RfKIwvx6JbV8j1102lSGK0pGDg/nDyrmg7+fLXGl1L2NwgBkh8umh3HqEpwJsVL
	icpB2MPg7387UsHD7RfJleIqxa0l3RQMnzCsWnOCutReJM8g0kyBdtd0N6ZknaLf24XidJGtuYh
	Ytq4BqI5echgIlnZonq+bhQ9eM2OnlI4wKbX9s4gIwlZUKwzyb9hEfLubYaEXIZlTciPA/3JOG4
	MLmLCJDKwxR4asAWR747GqZTKp3E3o7YrGgpQ8mao67lHQalBu85jEgXUhGFPrYf3Zf98MpLKhE
	NzDRegs1P9uf0vOmAB
X-Received: by 2002:a05:6402:15d4:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6ba37ec031amr9043918a12.36.1795559484024; Tue, 24 Nov 2026
 14:31:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com> <awXf86suGgKeazZx@google.com>
In-Reply-To: <awXf86suGgKeazZx@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 22:31:11 +0000
X-Gm-Features: Aa3M54olM1DKVBX3EQP9Zt-gD9WnHLwb_Lxu-JjOzcrrRgxAqJXxzL4OnVB7R18
Message-ID: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > Hi Brian,
> >
> > Thanks for your series; it's great to see more Laguna support being posted.
> >
> > On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > > SoCs, as used on Pixel phones. CPM supports power-management and a
> > > number of other features.
> > >
> > > The Application Processor communicates with CPM over a pair of mailbox
> > > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > > reset, interrupt services, and more.
> >
> > [..]
> >
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +       tristate "Google Tensor CPM MailBox Array Interface"
> > +       depends on ARCH_GOOGLE || COMPILE_TEST
> > +       depends on MAILBOX
> >
> > Should we also have "depends on OF"?
>
> Why, precisely? It's not actually a compilation dependency (I tested),
> although it's needed at runtime. It doesn't seem like this is
> consistently done simply for runtime dependencies, and instead work has
> generally been done to ensure everything builds fine and fails closed
> without CONFIG_OF.
>
> Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
guess since no 0-day failure has been reported in this thread, perhaps
it isn't required.

Peter
