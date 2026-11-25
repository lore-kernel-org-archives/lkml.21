Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634356;
	b=j3em79OLe70AA0VH7csAWaSVXbJOcWLExeqw0OKSM1TlD1B6WElp/TY2kvqWlztfTFDr
	 W+kjBME1h5C+EQN6i3VSO0Hf3TpfnyHe23cFglG6wy3m7hJ3QTC7ihVy3iW1/kV9igQy8
	 d1BjcXa7lW9iD7M1Ow0cGGU4dU964dNF9QsRuyhBrPAzCJbrXG+KYDeeIyQLhVDMoZ0Q+
	 KoIxnB1iFwkFBEy9uBlqBNsCqQ7v+kAJUqYnYJvgPyF+9r6XDkRCPOkUJ9f0JFphXeD9F
	 Ag+kzVqYXinojBttiPKZVNAooy7BxzzDIeNu9DayPkj8cODIoo8gFWnjXpTAXW6yVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
	b=SPDimUaDHOlY2QWW1e9MGZGlozgR+4iZgpL+QLBgs2w80FpPTctuaIT7NUEJWei1MXVD
	 7yWtLypiH2Hix5vzhwbH+bKgiQSKzfdzIfbbxWBEuzksEvJn20qKA5mG1eTpN3IoKT2c4
	 mv8eMQXNnNN3gcCVZ/vecMrAOuxOjukw7YY7yBER2eU5A3TZgW1LNCt0KV7/lRXsysRJS
	 fa3JpdaEkavvSuG/3fsQkj4HcczjuaSRD8ZEYZnYHvfIFPpGmjgGZ3us1TGvrAny3iNdV
	 9C0zRz2F9r5ikhzpdqNSequjGE/LztPo8GbNVkjLFeApY5B5KGJWkE8PkzwriGySpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="AMecBw/O";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C6A606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C6A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMecBw/O
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04ad2c46dso38663215ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634355; x=1796239155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=AMecBw/OeClvoiGfo4CBS0vwu3d45iyTlSHTdmQzaMi4s/WEAxD7o+i1BbLKkhtvmY
         i/G4pf7qbzvLrWIo/CIQbAVTuhqj0fDs0YDVEdvlpSm3ii6/q5HgItZpFVr/X6pWiP6j
         8h8AqkDhyr2qybSh1bBir5+GZm7WaXm5wg1WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634355; x=1796239155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=11HJdpkVRagKc2LEkdC9uEzQyFo3Y/xuWnUB5poWrVaY1BRxxqDhCDRnJotIIVSGHo
         VjNgjdfNdXhpCsdP++Hj1lyETlr81hhF2WKWpHSg/BVqe4xBC3ObOt0mRc+L9XLmspKO
         LCDAFuMoYalAfui6YGQC7XMfSIFXkPcij/Sa5GHyAPJfKGLp5RiOQldZztrBf5lyIXSe
         NMYRdnYwPGjdHEfcK9C2pygSK5O2hy9LhHLNhs5r2rYLlGTZyt1oly0qHFt1cAUFuQ/F
         yF2FXFoabb/Yt5tPiGxaC6PnEa8R9xVAC8ldAwVO1zOAu6xYvlmcMqJMdQ7Wa57Dtn72
         v+EA==
X-Forwarded-Encrypted: i=1; AL+hErEYxeGii9JvXPisIQgHVTmA/1nvk7eh5YCIAak31itOQhX11cDaTNgyGFyzsxo6lbh+WQTqvVCYAoBMoFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FUYbfiqKjduwjXVijZ1gKDw92z/qs6h0BhXc7MNb0U9gdl4NW
	BYac8TT/umNWc2uyS9btpv+AAFtk92FX/bbr0wl4vrCO29z+wPobWkTzfWk2anhTUQ==
X-Gm-Gg: AZFdTZfE91k4kcWrPAQFH0BVxwCWVXImZFJoX72Dw9tX8HP1Z9DqgJFr5hyQzBq1Hze
	Aq12SELL/QHjDJvsoIay4mckVdR3BDeJpZbzxOxK6cQ339JmfkKilQYPMTQ1Hw9x2xtaEOlXHzj
	LBrlyNDUuW8UcxqJtPmh21OnC0usqkcBy7AxR0qBkptZbY4da14+Tb9W6coBC0qMGRFzniY/Gmp
	Tu39qCL7V2aZUwu2DWGIi7hwj7kbAuSRRWw0A6Jk4puUwaCy4Jt5rOEv7A3bJyHCEEPqQq+jvsB
	pnugcmttb4RVu4wJM4dCsQDOCHxalZOVuIEPHIZFIVMLd4lFnS2nZGX0UTwjqzK4clJPeV0H5Jw
	qiBavySGM7tHJpyqsVegizFQqb+CKHU3QYiwWoqcbYtuta5UN24FIbmrdbM0f1kmy1csqzEwcMz
	AIUKokjXTTJd0grOx8TYZPz4Hj4DmhOC5du9tBe6DEDysWmyFNMW5IC8cQFWaoUgug9CA1+RDPu
	62wzetSH4XiHTL3z24At2IdC82T1hXDBLkxKcuwYtaHdPX1HdawUaL6PYy0GX8CiVvhgurhTRu9
	yhRJyhT0uQ6wH9QQHXevd8RWcHg93qbJJOa+rZKbLp8fDjS0r+b37RrMvQd/sYXpUPo=
X-Received: by 2002:a17:902:d511:b0:2f0:446d:30cd with SMTP id d9443c01a7336-2f0446d33f4mr180619865ad.31.1795634355343;
        Wed, 25 Nov 2026 11:19:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84364sm93389045ad.5.2026.11.25.11.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:19:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:19:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awc0sBl6q6A2Reaq@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awbJUwrBQw5TnowW@monoceros>

On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > +#include <linux/mod_devicetable.h>
> > 
> > Please include the specific <linux/device-id/*.h> that is needed
> > instead of all of <linux/mod_devicetable.h>.
> 
> Or better still, rely on the bus headers to provide the needed
> *_device_id structures. (That is <linux/platform_device.h> provides
> of_device_id (for patch #2)

Only very indirectly:

  <linux/platform_device.h>
  -> <linux/device.h>
    -> <linux/device/driver.h>
      -> <linux/device-id/of.h>

> and <linux/auxiliary_bus.h> provides
> auxiliary_device_id and of_device_id (for patches #3 - #6)).

Also quite indirectly.

I'm not sure how to take this advice. I tend to see "include what you
use" feedback (and not rely on implicit includes) elsewhere, which
suggests I should *not* do what you say here. Do I just need to guess at
when an implicit include should be deemed intentional?

At the moment, I plan to simply go with Philipp's advice, as I don't see
the harm in targeted, explicit #include.

Regards,
Brian
