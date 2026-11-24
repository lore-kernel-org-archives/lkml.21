Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526380;
	b=zF//i8swr3fYuLZ73HalorrJjFYq9mPe4WXFvmfHnx8tziP50Zmm3knMSyCrwWnTXRSd
	 +5bpj7Ro7y8vSwRTdiO4dEubm9JJCQ+jEhESo4O9SsiGzVQnE2EngSJBPhODsDdS8QThD
	 FTVlBHxBLXAwsc2XsfcHk3HpwuH4TknDvg9Ah+uTsVQBwQoa2paY1xRJP46dtzq3BmRVh
	 Tp8nrCSMbY6bKOyG+P1s0a1gbkNNh/9aOkNNMyLpM9d2NMpf9tFdzyooPicWqcH2BzhAM
	 YvseyITL+Skr5fXj+rKagKAXuxZaFLZsZHxt5LzGf9l4m2/lIzuQxlKXk857RNfbSLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
	b=UzguTKKaQzlFFSKFuv9YAbRmlstTw667Hgdx1sW9AtrhhSJUe+WXGrupJVEGIlxSxzkk
	 7qZ9rFD7u6H/mXQdRRJ4BHsF2YQO6k15oZrJ/sTfrx5is1qly8BR+9UfU74JKfnd49UOt
	 PRsiW8xaImqQYXJoqGPhJZnl3WRNY1KnIqv39jEui4iasxtxDDBw6Xj3x8eu07Grf+3GI
	 YdltPkbdCEHvlj2VePqNb6+COJzmI50lCAnCRzI0Y6cpwkvbBHLso4tPVKk3CZkYmVplH
	 cceICbjNxXmvyl4GrsWEW4O/OZ0QJeEK6t7DEbLRS5vzWZ5x2ZDFnuyhw68vYZ3qbOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15734606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15734606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eBYWubu2
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so5309581a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526378; cv=none;
        d=google.com; s=arc-20260327;
        b=cCBmHp39M3EgHSpGjoxRkUKV4xxu1fL3dm68tU+zQMCSuMUA543lOiCAC/MBb/hLrk
         krBH87PZA07HSMQIqscl+sGCZIssbcntfO2WZ22G5brIqxaZaSjSBH4D1WJ97pV+n0Wu
         hBR15qh3rkwwweYAhkp7Oa++b97sAHuRoDeHJ4PwIxBjjkPNgccglOVwAEIEn2xIJS5s
         c38wLEy6wUZ3XYuOZZQ5W2+UPhLM5wgGQQeHtnrQxcLoMQ/csEJGgzf2W+lWATyDg2lJ
         X3RUhzX1ZF5r8OMuHcWe8z/IqoCRKzobak7l6j0Kzk7fphQ2ig+r4c5RBCFsroinAbr6
         sTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        fh=IzralwBpakzXzs9Q0Y0XLJ2+rM5qUt+uVxqBFca9TNc=;
        b=MSn5VZwKEgiHBO0BimrtKoYfvERRcc16WzUo515RWPAaIMHSyu4d3JHNsjqLJ0ToRQ
         oPNy+Rp62au6Zmt76dohc2ZhBZ374usaICeSx2xkXEy22wllvxZzw36wGRYLqiWpQWTw
         PPY1F0FL9Z1DbtuM2tT3k/zy+R+du3IbxAcl23mlL+95pOw0pk+U4p3rfTDyf/pso44A
         Kc7T7O8gTSAw57JgzOdxi4QpujDe+ce7ILvVgrgkZ9mcdly0eAIOGulkXRK9T/yoBS+y
         5QQlVe0O2iTAb3Xqk9B9UDuVOpkQjBjRh0kOguW4nhGoKeONxT0M0zYlmBPet/qXuJCC
         jvNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526378; x=1796131178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=eBYWubu2GiEXhpZu6NdOBq+vSwbV2FWVHzzO6RCiBLF3DvcP2g1JrmnU+BQv3R0zGN
         kvvTgrQIAxANAxro5Oi4eaxN11YT4WSo0OGv3sRSFgIFtpq2En16+JONirIcUEETALNQ
         lRVCNoT0kNT2qPFD2IWuVCxhrYBnh5jAlemWaTyIE7hEjR7KV8NybKjN0kUWJdA+sB4w
         QCdLvsMub7B5jXdqoCYHrijtJ+6czKn3vhUqvkpfWmPyXwN3GWPgW6exGBFya7/YtS85
         mfcSZbYjUeSYDWzqhY5Mvgb5gdQiAC4XUEToNNz56GmU6lGixrXnDd5LM/7NDwcPiHOn
         69aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526378; x=1796131178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=OU412rVq0mYkUMHsqTiwBQFX6gaMVwlpkevgrncMLIpdjqwUAYgFm+pQOTT/neXIDZ
         RvUekzkjYLsU/KfgDLkBofp/vBG/IbaRxtatA4N+A/GD8g0Alcz5CuuZbG1QqQHbM15X
         c+KcCQa9jJ/OF68S8sAH8msRmst+H3rojjzoCkeReRWE94vbb6L81YROh5IZuw47lztX
         n/SOnKtDYk9iuoQglE2N2k8xyNTw0ZNM2jHFD0x/FC/zYr/aWip6qSX9/YutEHmcWAhI
         uC9CIRhzfs77pEPK9r41UAbVOLlE4AbRZ1ZTZ0NHdFZzUCAxPtxAu6ErvAv3PpW0Vipg
         Ycnw==
X-Forwarded-Encrypted: i=1; AL+hErF8yQhEB1ehFM+2f8tGRfiIeHb4vYgwiyHKgeW4bDXIadded/jjW2Uzyx9l7jAk+TsZshdhc97FNvxZHjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qGqeLTC0g5TRQQo7HbFZs6uzu6vpCA6BPImGhREMbITicL+5D
	fQ3ETyQqsfR0o6tlna7Cw79TeKFM08KlJMhk1eFRJNeSG+TfAJQeMBJW/+UPYZ70EKh2GCusw2a
	QzLxeDC1GjRk7fKOxgt3Y5kVgGH22mydXBIDbe56E1w==
X-Gm-Gg: AZFdTZfKcvnywY+Sst6ZHGlKYLXQ3DdbVDJ3kMzhFlXn3vWrUnwQNgEQA76hXuX9jKm
	DykZKIgPd0dQI6BM72Dw/ELkDq+geVbFAQ3g0l7TncrbLPf9yqkxbfq726S1uKVHWZKGNDoe4zx
	ZgkZA5/bWyPx/VWTkYdBv1l6jVzuGrsDPwj7DzFX4ayg4sE3rETBYba4+PFto7vr19G4DVKwTOp
	+ThS23U6ovkcxc8kTqYvSfWpHzDQQUFUtcp0AhQkpOc2fFLjNy8+DCfG6K3BTS1ZVsRgXg3Fo7h
	r4mrNynzsdRSII1kqQsh9vLtemuYpdPklK8kCR9CCmyugxCnBZ24jOC8smSxqbGjzlACi5+8zBw
	n2NCrxlyJjfWZLLsEa1JwEx/5LMnSpVvTID3vg+XoDDiOZU2cd0eKveI0
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id
 4fb4d7f45d1cf-6bb06c8ce30mr940474a12.31.1795526378188; Tue, 24 Nov 2026
 05:19:38 -0800 (PST)
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
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 13:19:24 +0000
X-Gm-Features: Aa3M54ooVkb3f-H5oJfKOqKUsi4VT1Jkh00xU7wD3yuOn0cj9WC5t6c3w4KgoWc
Message-ID: <CADrjBPojS5tSJw+7E99AYec6NY46QLcM6iv=i3xodNJvvxKJRg@mail.gmail.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
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

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
>
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
>
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
>
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
>
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
>
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
>
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
>
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
>
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
>
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
>
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
>
> Thus, I think this falls somewhere between "PATCH" and "RFC".
>
> This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
> as-is (plus the aforementioned mailbox patches), and also with minimal
> additional local patches to get other components running on top
> (pinctrl, PCIe, RTC), to prove out some more realistic use cases.
>
> - Brian

FWIW, I tested this series, plus Doug's mailbox series on my Blazer
and Frankel devices. It was enough to see USB come to life as a gadget
using the already in-tree tensor USB glue and phy drivers (see patch
here https://gitlab.com/LinaroLtd/googlelt/linuxlt/-/commit/b7866f74743fd6828036bae570ca6d022e23c4ff)

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)

Regarding merging the dts/dtsi (arch/arm64/boot/dts/google) and
(drivers/soc/google) parts can go via my Tensor SoC tree. We will
likely need an immutable branch for driver/soc/google part to base the
other drivers off.

regards,

Peter
