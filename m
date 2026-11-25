Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633740;
	b=QFcZKREuoVrk7Z/CUslZzFn08fn/AFX+jD43Ks7YsIS/6+5Ojufb7d6i5yLKR7Bx1eMy
	 spE0MHfTPl+Wsmnl9l9jpAeWKu8jA7U1suTV8qu7wqf2pewntC8TRVKAl+QImW0Tq0rpF
	 xyJNL4UXsQbQT9LMsUeMFPL6bbesdiQK9TghosJrKW/VjVNTeTBk6GCNSBxV70B8ev0iA
	 N5ykrJ+e9+Wc1QbaNnAmBMZyQS+ivyZ4gfEFBRa8VEYGrbR10R+d9Vf2ZVBA0L25WMxJB
	 wbRqdYr52IWtZpUQ2btqvAAmAYeF/v7t+oOc57WOEDnJY0+we/IggqXczowj4apGGfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
	b=B0ZYIa1U8anyE6Z1EcVtLvSpqngqD4edgowXDcph2OqqauaOTGZ+2mnoYIzoJDyHL5Sx
	 DnHPMxYz8Gjaou5bzokI5j67X9W2k9pvTy0J2f32LtYQhafcqIsk3v5Jk/6cpQEB7kBHK
	 W3+jMVXyOQZzoBk4jALsm/bG99cazTXgTrd1PqyJKLleIz3KtifCkRF7LZxP8zUHPRi/3
	 RM/A2lD2Za46YQvLPHKNNmNmfyTYEh2CiohwlgXkYMX5a3rGdJ8sEQQ5iCxiZMS8YrVG/
	 R+FagNOIe6+SPEHrwpgcrzpoPQBpq41n4Rt9liL9QiZlqwwknWqrRFkpsL6Txu/M6Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIhBqlbW;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB2606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IIhBqlbW
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38699cf08dfso7389961eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795633739; x=1796238539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=IIhBqlbWbrprmxMZ+kWojREY0lc0WTXHSKBAg6UU/UXHe1Cnkm2qyYNQdRGc51qR0a
         2pYUF3yT5QTuVLqTA2AxB9OD6cZy2UZg0W3D5M2AuJwlpxuiBSy7SBnJetpNQNpU20uB
         fcUaQhiKZCVdLEj4zfd5cEMWGKjDXRdy1MJ20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633739; x=1796238539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUl61wz2FooKjKoGfr6HcICrxyIas91AkAkxcmRZVuk=;
        b=fu4fq5iSMlZhjQHlWR2Yr0zj9OJJRXRg/UyEzuhoypYln0pBgTuwHdI6F7C/JyHh9C
         //O7oBGj+rdbUFIMVciL5t5DJcdJR5D58VgE7lvjSareJ/JQm0x8iync7pqwuFSOrBOE
         fNkuZVyVaqA3AkeENt6kRuNUWXWfLb0rLalEytdleIXejuo4K/Q3CUL6421yUjhGyK6a
         ibSbQlQEY8BkudaIcwMnpo+DJjZf3Xca1e6xLTo6BWyM3hbEgYKGRqKbUyOVAkcsZals
         6nGZO8Ji4QwN7mmXSKPiXj77ynbQAgFeQhFMEFW/zMqE6XcB8gU3jky5ZuYIke1Md2rc
         EglA==
X-Forwarded-Encrypted: i=1; AL+hErG9tYvVe5Rice2WQGvT+PEy+gp3w7Og/tVaMZiTq5G7ILqoFMv0pLpnNbFobn4WjIFpuqyKwpKOjPZ8cec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aT3Myxte47QDRXFScaMJRjF84Vy7at0LyIPiLG7JuWnv8GqhQ
	q1QcqNxcATD99z623Bobs4Rz710bytjUjy/thlD1IZjPLFp89dBdv+5IXT2W4cxuSg==
X-Gm-Gg: AZFdTZe0iY09SLgcE190jdW8bZQkmby+JbQ3s9AIi4bu3kOGpJ17rrIzJElE8sQIAZe
	j/dSijKMi0ls1fjEaF2zbjkJMmMeRhvU+XXl4BZO6r06AePDhm7x9biOA8oTxgN2y1SdGatBwyP
	fOiNX9yUcViIKhYpw6mvzuosygr4PMdp6LTT2TFsLxiO6ETgITD2qRlGKXZaKmFfMvDo/XAqxwD
	AdIdjKHv7XzJpWulNaaT1L68QBlOo6n5oLmKSnZMQHZciB77B3zmnMx5odOD5X/qPP7wgFGw9R6
	0zYNa1GRrwgN4C29gtvXrCPH9P0hIeTudJpTcj9DUAP40Kmv0BVz9dij6G9GXRVhKseWTfCcgjV
	KjbOVA6BwKdjxYkQGKNa05mLHP3vz17YHB/rB87u7mPIlguQiXDmKjCpEBL9GKW7/eeCgcaphD7
	mmjTRFmIvzyWrpz3bxSU+sxCY2b6dE+8EsU3v6s3l197qE5fS6YE/LuC8glkB2KKKEamebRyq5k
	Xt5H2YmikJz+l5pgtVqRvHk/xFOZaEOoQakb4U9Wi86/0mU6kWJTJmMNPJuL2u4rLJF3StSJSpj
	ouDbHDv6JCGEipKmwpWUO5M0ivkAUZ72DDsT6lYxPXYn21MHy2kUnmkkqEoPYMLYbv8=
X-Received: by 2002:a05:693c:87d6:20b0:386:bc19:6a30 with SMTP id 5a478bee46e88-386bc196d10mr7852852eec.20.1795633739073;
        Wed, 25 Nov 2026 11:08:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm68043117eec.4.2026.11.25.11.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:08:58 -0800 (PST)
Date: Wed, 25 Nov 2026 11:08:56 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <awcySI6q3O3_M7Gp@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
 <avZkfg6WMlMzOxpn@google.com>
 <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ef7ef8-acc8-4ad5-9c09-76d9e944bf5c@kernel.org>

Hi Krzysztof,

On Wed, Nov 25, 2026 at 08:07:57AM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 02:14, Brian Norris wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> >> On 03/11/2026 03:36, Brian Norris wrote:
> >>> On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >>>> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> >>>>> @@ -0,0 +1,54 @@
> >>>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>>> +
> >>>>> +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>>>> +
> >>>>> +/*
> >>>>> + * LPCM IDs of each SSWRP.
> >>>>> + */
> >>>>> +#define LGA_LPCM_CPM			0
> >>>>
> >>>> What are all these?
> >>>
> >>> The binding doc says:
> >>>
> >>>       Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
> >>>       See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.
> >>>
> >>> and
> >>>
> >>>       Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
> >>>       2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >>>       <dt-bindings/clock/google,lga-cpm.h> for clock IDs.
> >>>
> >>> These are the IDs used in the firmware interface to talk about these
> >>> things, as many of the SoC resources involved (clocks, resets, power
> >>> domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
> >>> with indexing within each subsystem).
> >>>
> >>> In reading again, I see that the definitions and explanation of these
> >>> terms and the SoC organization are split a bit between the pmdomain
> >>> commit message and the binding doc. Where would you prefer I elaborate
> >>> more? In the binding doc, the comments here, or both?
> >>
> >> I just try to understand their placement. Bindings should not be in the
> >> soc directory, except a few things without clear subsystem owner. If
> >> this applies for both clocks and resets, maybe this could be firmware,
> > 
> > Maybe firmware, maybe power? LPCM is "Local Power and Clock Manager",
> > and I believe there's essentially 1 LPCM (microcontroller) within each
> > top-level power domain.
> 
> How does it help you to have LPCM ID in the DTS? It's derivative from
> the clock (or could be made derivative)?

For the record: in v2, the LPCM ID for clocks *is* made derivative of a
single-cell clock binding.

More info, in case you had other adjacent non-clock concerns: I settled
on dropping LPCM IDs (and other firmware IDs) from the clock binding
(and DTS) in v2. And LPCM IDs moved out of include/dt-bindings/
entirely, even for resets. I thought this addressed your feedback (after
a few weeks of waiting for further response/clarification) so I sent v2.
I'd appreciate a look at whether v2 is more to your liking.

LPCM IDs remain in the DTS for resets though (as documentation [1]; but
the driver never has to inspect them), because I still think they are
the straightforward way to describe resets, and there's much less
complexity that might imply any "risk" here (vs clocks or pmdomains).

If you look at the v2 reset driver, you see that just like any hardware
indices / GIC numbers in typical reset or IRQ drivers, the firmware IDs
are a simple address scheme that are passed directly through. If I do
the indirection you're asking for, then:

1) I have to add extra indirection tables in the reset driver and
2) the driver will now require per-SoC handling that otherwise is not
   required.

I see you had a separate semi-related question that gained its own
sub-thread. I'll reply to that separately.

Brian

[1] Aligned with Chen-Yu's suggestion:
    https://lore.kernel.org/all/CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com/
