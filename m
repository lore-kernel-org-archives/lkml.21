Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076388;
	b=4rDYGpCqi2xegAb+NioG6TWYWk11J3LVBnsHp/f8LDV0X2DdrymvaZz+XsiPiUsuwCf6
	 Y23UO1p+mzi4UE5GtCPGTLG594qsgZMkNekKi2bYQBzUBApWvjtzNAPTKwqXSX6bc4qh6
	 kjHEMRqksTesT/hNEfCUEPf0gI3IIHRlSEkMamNHKdc9MmmDZqYJAmquGW0InKJwWVExd
	 agPibi1mX8R2NyA7489pHNgCnxfjAFwxwnqNtkb9o59iUV00MpZAKTO5Ct+g8Z+klMFuv
	 HuUhPxA0Knn/2Nut+Db/mqDbdYVaHpI7XM8Fx40v6757bXlREN8R4qwy6JxsGAqWrjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
	b=Ezl8aPPGYbddVLcFEizWEuBLnym9HpTuFnIZXFyoCtj/dmngN/9xRHq4u1YYWtWT65xz
	 dmCvOYWZ29EWF5E2JlIVm+0LtzC8ISFrRd0GGNJix0tOdmcpxLtBcBI11ATPAg+KhsTZU
	 MR2YQhNHVGph96LrK4hTqIgYSqKkYsWBFqsllsV5S1h/PsW5qNm4kpmG4bAdNrR8+t6ns
	 Weuq2BbsVtBmb24ULOK6ZclZHO9bNejAl8TauswpvZ7ayTYdUrvKO8GYeVPGi0lrlxTYn
	 tpIhAN5RQNz4zDNaP7xT7MDCEAGUSOlsqPNQxZvOyuLg7+ckbEHFHIidKD4YezJVwNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wknl9oxm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C11606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wknl9oxm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so17350295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795076386; x=1795681186; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=Wknl9oxm/wTcyejMFrf5muGsLwjYaLksGm1GPXm/Z4mLQhEZEwO5VKcss/pY83dgBl
         ZQZUU8SifI3V4VdMDA+xJaPUTFPwXsAtmhWh3SOfzBIR4EgyHND1fMDq+lhD017iSI0Q
         49ZXq/2NCZ6tGI4VNzjIvNHEA8iOlT5Qz431acJqtpWGdIk09FMJA4rJO9A/gajNjKEN
         dyEOso9ykAZurpuzpofjEI1WKIVp/tS3t25X00ve7J017D4KMiFF4mpt7+xHpUMQxWzZ
         K+5BDHi6WK4scNhXr3nn6GEt79Q+PsDfk3e9yncGm7RVGronLz57IA5nFEcyc3B071/2
         wBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076386; x=1795681186;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=uCtcO0gxIcA+ZFUgp+PBoUQJ1kO33XzNqTUy+GSRYP3Q98/sMPs1ILPrVlnPddAzuI
         nq5wIDB6F7ZRgrwy7pgBX0+v1H27rooxBDrRJ4c66qQev4F2szbtuVBPux3fIEGR9cFw
         2ApFD34sKsEARChQNgDt4R+9GXxeYnWyJm2EDDfco7cLUyD0nMz1yBKQ84OdlqGkVJ9q
         EmWbsiHBxFc8sN01FHETuVoz0EHAOC4NQTdbwcignzaByOSJOxf7vN7tRqd4U+JX2GgY
         NKU6k+uPeeIUb/2hUB3j9xV32pYb5EGjzHEYmjYb0jqJjPw2ArTWFXO3OAvjIomY2zqM
         UQ0w==
X-Forwarded-Encrypted: i=1; AL+hErHEhto/KCck6580dUFqDhGLqEsDW5+a5zBS80/8QxJoD7Rbb58Ul1F+p3PxI2r5Sc9S9RyZJmHed4vBJQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BUFY9+EOfK4NuRrXoExb5e8wzDNNRHy+U0ROeOjiawZZcklNN
	2ckq+8YxcQPDvhe/Opl491ZsqAl1jmTFWen+ElwPlMoO3svNe7CH/oPgZSOrK3LJN30=
X-Gm-Gg: AYBFou1oD3PFvzY60VY5b1m3bnFw7/EnpI221KqtkkytCWYIVowJpCX1s91pw/mOxL9
	8XbINo54kMkIh/Idy4wL6Y4Si6nXAPwI2P13XgFi5j3M7Sqtd3xGNzYVMECa990sIAizUePpbqi
	N4j5+YFwDV3uU6vDr1XWNTY5CZuss8QPOcwtXGwRQVZtJJndcEEnka93n+2FJXyyJ2OUX8VHLMU
	GF+pBz8cKlm9zoPLYYWR0oaWdXki9AnYo4xRVFJLC/BlW0wO3m3u5buz9IIOvtoXpVefsEERp5C
	JE3QcBcSUwpl3kXK2q5zzO3ZSizY9XrQBpCBLDBV4Qfgb3moZdK32S5QEz6szWbQC6KDHH4SrjA
	GVJXkK6GVa7j0faSQDBu8H7BDY9kNsqtKXBH6a4NCmXxb0xaOgc8EioIRE4gTJOmEYhs/Ak/SpY
	sL44gHaWSODugrDDdBW2sDXDsrWjWH1qQyhtrJ5Oy9vPZCW1YmXpELGeRgk5q6rmktpcaj55D0L
	oiKf4XrQVKrtBxngRLXNdSGcQnN/pQEYjeHjT4kWMX6ed0wRuPKK1vOSjh6HpoTJC5mHHxdKlA6
	tNSB70zP7CyZe6X/4F5plluuojVBTy7aQ27SFSBiCoZyur3c
X-Received: by 2002:a05:600c:8b63:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb7da27088mr96761205e9.28.1795076386236;
        Thu, 19 Nov 2026 00:19:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5656asm17330585e9.3.2026.11.19.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:19:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Gregory Williams <gregory.williams@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, kishore Manne <nava.kishore.manne@amd.com>, Izhar
 Ameer Shaikh <izhar.ameer.shaikh@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Ronak Jain <ronak.jain@amd.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/15] accel: Add AMD Versal AI Engine driver (with
 Versal Gen 2 firmware support)
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
Date: Thu, 19 Nov 2026 09:19:45 +0100
Message-ID: <1jcxs12py6.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 18 nov. 2026 at 15:31, Gregory Williams <gregory.williams@amd.com> wrote:

> This series adds a driver for the AMD AI Engine (AIE) found on Versal
> devices, together with the firmware changes the driver depends on. AI Engine
> is a tile array based accelerator used for applications such as beamforming and
> machine learning inference. Tiles are organised in columns, and groups of
> columns form partitions that an application requests, initialises and releases.
>
> Several registers in the AI Engine array (column and shim resets, memory
> zeroisation, tile clock gating, NoC and interrupt routing) are privileged
> and can only be written by the trusted firmware. The driver therefore
> packs operations into a DMA buffer and hands it to the platform firmware,
> which executes them in order.
>
> Firmware patches included
> -------------------------
> Patches 1-10 are not part of the AI Engine driver itself, but the driver
> cannot work without them, so they are included here to keep the series
> self-contained and reviewable in one place:
>
>   - 1-5:  zynqmp firmware driver refactoring and a va_start()/va_end()
>           fix (patch 2 carries Fixes: tags), preparing for the extended
>           SMCCC call format.
>   - 6-7:  Versal Gen 2 compatible string and firmware support, where all
>           EEMI APIs use the extended SMCCC payload.
>   - 8-9:  Versal Gen 2 clock binding and clk driver match entry.
>   - 10:   firmware IOCTL support for the Versal Gen 2 AIE run time
>           operations, used by the driver.
>
> I am happy to split out or reorder the firmware and clock patches if the
> maintainers prefer to take them through their own trees, and would
> appreciate guidance on how the series should be merged.

For the clock, it would defenitely be prefered if you could split out
clock part, especially if you later need an immutable branch.

`b4` makes it very easy to handle series deps, please consider using the
related tags

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

>
> AI Engine driver
> ----------------
>   - 11:   devicetree binding for the AI Engine.
>   - 12:   driver core: device probe, partition request and release.
>   - 13:   pm ops: building and sending firmware operation packets.
>   - 14:   enabling and disabling tile clocks.
>   - 15:   partition initialize and teardown (reset operations).
>
> Previous submission
> -------------------
> This driver was posted for review a little over a year ago:
>
>   https://lore.kernel.org/dri-devel/20250702155630.1737227-1-gregory.williams@amd.com/
>
> Since then the scope of what is proposed for upstream has changed, this series
> is considerably different from that posting, in particular targeting only Versal
> Gen 2 support. All comments received on the earlier posting have been addressed
> or in this version.
>
> Abhyuday Godhasara (1):
>   drivers: firmware: xilinx: Add IOCTL support for the AIE run time
>     operations
>
> Gregory Williams (5):
>   dt-bindings: soc: xilinx: Add Versal AI Engine DT binding
>   accel/amd-ai-engine: Add AMD AI Engine device driver
>   accel/amd-ai-engine: Add pm ops for firmware calls
>   accel/amd-ai-engine: Add support to enable/disable tile clocks
>   accel/amd-ai-engine: Add reset operations
>
> Naman Trivedi (1):
>   dt-bindings: clock: versal: add Versal Gen 2 compatible string
>
> Senthil Nathan Thangaraj (8):
>   firmware: xilinx: Separate TF-A checking
>   firmware: xilinx: Call va_start after pm feature check
>   firmware: xilinx: Add comments about number of arguments
>   firmware: xilinx: Use match data for ZynqMP/Versal
>   firmware: xilinx: Rename zynqmp_pm_invoke_fw_fn()
>   dt-bindings: firmware: xilinx: Add Versal Gen 2 compatible string
>   firmware: xilinx: Add support for Versal Gen 2
>   clk: zynqmp: Add Versal Gen 2 compatible string
>
>  .../bindings/clock/xlnx,versal-clk.yaml       |   5 +-
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |   3 +
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   |  61 +++
>  MAINTAINERS                                   |   9 +
>  drivers/accel/Kconfig                         |   1 +
>  drivers/accel/Makefile                        |   3 +-
>  drivers/accel/amd-ai-engine/Kconfig           |  15 +
>  drivers/accel/amd-ai-engine/Makefile          |  14 +
>  .../accel/amd-ai-engine/ai-engine-aiemlv2.c   | 441 ++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-clock.c | 154 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-dev.c   | 255 ++++++++++
>  .../accel/amd-ai-engine/ai-engine-internal.h  | 377 ++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-part.c  | 140 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-pm.c    | 472 ++++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-res.c   | 184 +++++++
>  drivers/accel/amd-ai-engine/ai-engine-reset.c |  69 +++
>  drivers/clk/zynqmp/clkc.c                     |   1 +
>  drivers/firmware/xilinx/zynqmp.c              | 340 +++++++++++--
>  include/linux/amd-ai-engine.h                 | 115 +++++
>  include/linux/firmware/xlnx-zynqmp.h          |  65 ++-
>  20 files changed, 2679 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>  create mode 100644 drivers/accel/amd-ai-engine/Kconfig
>  create mode 100644 drivers/accel/amd-ai-engine/Makefile
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aiemlv2.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-clock.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-dev.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-internal.h
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-part.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-pm.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-res.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-reset.c
>  create mode 100644 include/linux/amd-ai-engine.h
>
> -- 
> 2.34.1
>

-- 
Jerome
