Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638737;
	b=G7IM+4Dqu9qRbTXHsxQdtk8aciOEfyDRyE/SQ7B28aDO/SSCfTURIxfmRRO39HkZlhNj
	 RK5GeAjbrz8Eb3+iVf1X2Q5ryJJLMEjAzRe4sxCNVpfFjmX0egdLoLQ84jcUb0mHoICm7
	 BQq/NeR7BezhIEs3PE/5pf6XEdM5zeQYwJgkPiQ7XSC6na2eqr4t3s5ELOXeb4anUMCPo
	 k+Ad0kxTwDgpUnALokzoTNuYjO0vYbitlJ+cdf/K0pDvK9S3LXIh0uOnEW1dmPbjx3xU5
	 hSIAM4v1ykiMA8V14XXH9qPTnEtqfKRU/h5xW7LnuTG+Z4swjHTluBWF7WaMrwO1P5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
	b=fqPYGGaSN+6kYr6querNtrLWEdxwpvjASc750ZI2ggUSv26f90sELkxPfdcgy07EfEJC
	 t5scMsyfQrtDl2eRU5mAoLTCpnmfaktGFLofLuhuttS9QyKYmVdHfumblU/3+JNqG9K+3
	 oviiJJrCRlv/Nt67L/HBmvae7ffiETFwMvehNzx/MzA0G7XSM+l2jpxn5tMvxpxR3G/Xl
	 inCS+EE73pBaD5+GHgcZ4uvInoQwM+IWhifPShcdulMqOPPr7paQv8PiNvDb1K+U4j+FH
	 wsaZvHisbI/HqkrmRLWkR5dGcM7si1SJiTDiBA6Dee29j2htocUG9os+kr6Bdbw45lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O+QxZTzG;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O+QxZTzG
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so47573871fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638735; x=1796243535; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=O+QxZTzGJKZE1f45ctwhg2D8IAzdtvGpRnSimOPHzZDyOGlf53Om/8QDO5AwZBTn60
         vJh5Q86iifYdSHQzWZRBYXmqrEIPfxgGrbPtD+4CnS10X4Oug799cbLLDXgUM5LT1SJp
         zKEQTpcWG5xIHaR7s42+95v1jOK/d/l5I0WkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638735; x=1796243535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=eSnH9VPf/5dpF9+rGNk2+0tiLpheu7H3T9UROX5iG6xr3hBAN8eMz4d1Hpc/rym34K
         7jIMjHI9X7scDviKBY44vItFNR1P9hSo+4fQR+4QTAluVYRf5Ry/Z9qtBfzd/9s0s8me
         tXFKufIF/eTSF5NeLAt8B8FOSUR+vAi4u/N/kSnN98z2iaMDnswqbmielsTgmsFaZ6HX
         rhuMLuvS8/t6wL4x6n6S+8qEgTXK5GrRO33oPRQ5t3+h8KWm14OZAvM1aYXmkevT+arv
         syZW6LMYMB3lbFoM1vX6bAn27LDqo90kuHVWqgLoZRth3a6QfbrmV0DkSEulj51ktXeM
         xQrw==
X-Forwarded-Encrypted: i=1; AL+hErHTvwAUDVBaDyhG9hz0qFn3HTE3I8l96a7g1m+RfoWsKSXdZx6wuEScqqnHo8xtV/q5eB8EiqetajGunsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YFsTG5Eq7iZLkR/bRpxFtFBdPpT2r4RLz/i1Z+oMXQI/4+3QF
	KBKImbF3EB4htLDuW6Er/dspYATYcgolcghegc9JL2+kxrMaM0FAK0+w4l56U+/uSOmaZXF+2BA
	cKleatPvP
X-Gm-Gg: AZFdTZcWU6lmu6ska2HP/Hza3qW6LM+tR2LeKmPaX55IyhcDRLBEuektNo9UkEHd+J9
	AFiBjv4k1Q++OpO+hhyamt8puOTpuaCCHOzhDZFs2tJbrkh9S+t3pk42teH2oe7MHVDxdY/e50c
	qTi4ib8TyiIRTaMp9BiAB86Ckj5cg7VRk4OQOqG8QI0tL45OajgmZw3Dv1Ah8h7F7RNKC4Hdo91
	4oL6aANcWM/fhHHwCdv6OgZLXPqm/L81Nc05o9Xp1dGCcxlB97FWvn+g0AVUAQ67tInwUrg4LI2
	+iHlPNpD2vaOgyZSJUdjXC4ruq6ZfzV11Ei8eUSJ1yEhpdMLaUhTLmAOacY0c1Akh2w+FeEnDr+
	ZjGVmCBwrDc1U3mrYWNe72krbcEyHzpj0ppan2DrAOq4grcgczgjVRL413E6AykreIRtKdifQgh
	9My/2+Fr9+fYqjeapYQgc0+/eIay3WGUgBvLB06HRUNAe+FsEv9I0HeoTUY3+zmGuT7o1zymEFz
	9RJQMaNKDHI0hM04nHyQJIQaFh5vuomtm0Bvlr+mzrQ9qIfG13as/ouXt8nzXIqL/ZkU5regVct
	5qwVzGWtudT/sQ0SeJGhlufwiArSsMOZ1GwbIQp3n71gFFH62/2cflYuYyhGREl0ryz+
X-Received: by 2002:a05:6512:6682:10b0:5c1:c3b6:49ca with SMTP id 2adb3069b0e04-5c1c3b64b13mr3526662e87.42.1795638734784;
        Wed, 25 Nov 2026 12:32:14 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd051944sm4735055e87.66.2026.11.25.12.32.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:32:14 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso3971667e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:32:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE7EBxiY8n94O25/zsjX8n4SF6iKs9IMKbi/M262Qz35rVwi496rfzF2+tmULCjy19/T6gFvSA1qau5HIo=@vger.kernel.org
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4bb887865b5mr380873225e9.0.1795638297387; Wed, 25 Nov 2026
 12:24:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-3-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-3-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:24:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
X-Gm-Features: Aa3M54reZu_rV6EQr2mwr095PUCfeijuzUgiyBLvGVjyYCOWWagODc3ImgmqMIk
Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spmi: Add SmartDV SPMI controller driver
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, Nov 15, 2026 at 10:01 AM vamshi gajjela
<vamshigajjela@google.com> wrote:
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a80cf4047b86..e20fcc9f2c68 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -54,4 +54,14 @@ config SPMI_MTK_PMIF
>    This is required for communicating with Mediatek PMICs and
>    other devices that have the SPMI interface.
>
> +config SPMI_SMARTDV
> + tristate "SmartDV Technologies SPMI Controller"
> + depends on HAS_IOMEM

Please add:

depends on ARCH_GOOGLE || COMPILE_TEST

Right now "google,lga-spmi" is the only compatible string supported,
and that matches how the other controller drivers in this Kconfig file
are scoped. When another SoC family is added later, its ARCH_* symbol
can be added here too.

> [...]
> diff --git a/drivers/spmi/spmi-smartdv.c b/drivers/spmi/spmi-smartdv.c
> new file mode 100644
> index 000000000000..d4671667596e
> --- /dev/null
> +++ b/drivers/spmi/spmi-smartdv.c
> [...]
> +/* SPMI controller CONTROL register bit masks */
> +#define SPMI_CONTROL_MASTER_EN BIT(0)
> +#define SPMI_CONTROL_ARB_ENABLE_MASK BIT(1)

nit: SPMI_CONTROL_MASTER_EN omits the _MASK suffix for a single BIT(),
whereas single-bit flags like SPMI_CONTROL_ARB_ENABLE_MASK,
SPMI_REQ_COMMAND_NEW_CMD_MASK, and SPMI_REQ_COMMAND_PRIMARY_ARB_MASK
keep _MASK. Dropping _MASK on single-bit BIT() definitions would be
more consistent.

> [...]
> +#define SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT BIT(10)
> +#define SPMI_IRQ_IS_BOM BIT(11)
> +#define SPMI_IRQ_CONNECTED BIT(12)
> +
> +#define SPMI_ANY_ERROR_IRQ_FLAG \
> + ( \
> + SPMI_IRQ_ABORT_MST_CMD | \
> + SPMI_IRQ_READ_DATA_PAR_ERR | \
> + SPMI_IRQ_READ_NO_RESP_ERR | \
> + SPMI_IRQ_CMD_NACK_ERR | \
> + SPMI_IRQ_BUS_TIMEOUT | \
> + SPMI_IRQ_NO_BOM_CMD_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR \
> + )

SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT is defined right above
SPMI_ANY_ERROR_IRQ_FLAG, but isn't included in it. Shouldn't an
arbitration request timer timeout also be treated as an error?

> [...]
> +#define REQ_COMMAND_TIMEOUT_MS 100
> +#define REQ_COMMAND_TIMEOUT_US (REQ_COMMAND_TIMEOUT_MS * USEC_PER_MSEC)
> +#define REQ_COMMAND_POLL_US 1

100 ms is a very long time to busy-poll with readl_poll_timeout_atomic()
while holding spin_lock_irqsave(). If a target stops responding or the
bus hangs, a CPU will sit with local interrupts disabled for 100 ms.

At 2.4 MHz SCL, even a full 16-byte SPMI transfer is under 100 us on
the wire, and other SPMI controller drivers (spmi-pmic-arb,
hisi-spmi-controller, spmi-mtk-pmif) use timeouts of 1 ms to 10 ms.
Can this be lowered to something in the 1-10 ms range?

> [...]
> +struct smartdv_spmi {
> + struct spmi_controller *ctrl;
> + struct device *dev;
> + void __iomem *base;
> + spinlock_t lock; /* Serialize bus access */
> + struct clk *i_clk;
> + struct reset_control *rst;
> + unsigned long clk_freq;
> + u32 ctrl_reg;
> +};

nit: ctrl, i_clk, rst, and clk_freq are never used after probe() (and
platform_set_drvdata() in smartdv_spmi_probe() has no corresponding
reader either). Keeping clk, rst, and clk_freq as locals during probe
would trim struct smartdv_spmi down to the fields actually used at
runtime.

> [...]
> +static int smartdv_spmi_wait_for_done(struct smartdv_spmi *sdrv, u32 *irq_status)
> +{
> + int ret;
> +
> + /* wait for cmd done status */
> + ret = readl_poll_timeout_atomic(sdrv->base + IRQ_STATUS, *irq_status,
> + (*irq_status & SPMI_IRQ_REQ_CMD_DONE) != 0,
> + REQ_COMMAND_POLL_US, REQ_COMMAND_TIMEOUT_US);
> + /* clear all interrupts */
> + smartdv_spmi_writel(sdrv, IRQ_STATUS, *irq_status);
> +
> + return ret;
> +}

Does the hardware guarantee that SPMI_IRQ_REQ_CMD_DONE is always set
even on fault conditions like SPMI_IRQ_ABORT_MST_CMD,
SPMI_IRQ_BUS_TIMEOUT, or SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT? Or should the
poll condition check:

*irq_status & (SPMI_IRQ_REQ_CMD_DONE | SPMI_ANY_ERROR_IRQ_FLAG)

so that an error terminates the poll immediately rather than spinning
until timeout?

> +
> +static int smartdv_spmi_xfer(struct smartdv_spmi *sdrv,
> +     enum smartdv_spmi_xfer_type xfer_type,
> +     u8 opc, u8 sid, u16 saddr, size_t bc)
> +{
> + u32 irq_status;
> + u32 cmd = 0;
> + int ret;
> +
> + /* program control register, master enable */
> + smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg | SPMI_CONTROL_MASTER_EN);

Two questions/issues here:

1. IRQ_STATUS is never cleared in probe() or before writing REQ_COMMAND.
If an earlier boot stage left SPMI_IRQ_REQ_CMD_DONE latched, or if a
previous command timed out and finished on the bus right after
smartdv_spmi_wait_for_done() returned, the next transfer will see the
stale SPMI_IRQ_REQ_CMD_DONE bit immediately, read zeros out of
REQ_DATA0..3, and clear SPMI_CONTROL_MASTER_EN while the new frame is
still in flight. Clearing stale IRQ_STATUS bits before issuing
REQ_COMMAND (and after disabling MASTER_EN on timeout) would prevent
that.

2. Is there a hardware reason to toggle SPMI_CONTROL_MASTER_EN on and
off around every single transfer instead of enabling it once in probe()
(reprogramming CONTROL on resume if needed, and disabling via
devm_add_action_or_reset())?

> +
> + /* prepare req_command register */
> + cmd |= SPMI_REQ_COMMAND_NEW_CMD_MASK;
> + cmd |= SPMI_REQ_COMMAND_PRIMARY_ARB_MASK;
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_OPCODE_MASK, opc);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_ADDR_MASK, sid);
> +
> + if (xfer_type != SMARTDV_SPMI_XFER_CMD) {
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_BYTE_CNT_MASK, bc - 1);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_REQ_ADDR_MASK, saddr);
> + }
> +
> + /* request new command */
> + smartdv_spmi_writel(sdrv, REQ_COMMAND, cmd);
> +
> + ret = smartdv_spmi_wait_for_done(sdrv, &irq_status);
> + if (ret) {
> + dev_err(sdrv->dev, "request timeout.\n");
> + goto out;
> + }

nit: drop the trailing period in "request timeout.\n" to match the rest
of the driver, and consider logging sid, opc, saddr, and irq_status
here too like the error path below so it's clear which target timed
out.

> [...]
> +static int smartdv_spmi_read_cmd(struct spmi_controller *ctrl,
> + u8 opcode, u8 sid, u16 saddr, u8 *__buf, size_t bc)
> +{
> + struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
> + unsigned long flags;
> + int ret;
> + u8 opc;
> +
> + switch (opcode) {
> + case SPMI_CMD_READ:
> + opc = SMARTDV_SPMI_CMD_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READ:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READL:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ_L;
> + break;
> + default:
> + dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
> + return -EINVAL;
> + }
> +
> + spin_lock_irqsave(&sdrv->lock, flags);
> +
> + /* clear req_data registers by writing zeros */
> + smartdv_spmi_clear_req_data_reg(sdrv);
> +
> + /* clear read status register */
> + smartdv_spmi_writel(sdrv, REQ_RD_STATUS, 0x0);

A few things in smartdv_spmi_read_cmd() (most apply to
smartdv_spmi_write_cmd() too):

1. Even though spmi-core currently bounds lengths to 1..16 in
spmi_ext_register_*(), REQ_DATA0..REQ_DATA3 is only 16 bytes and
REQ_RD_STATUS sits immediately at REQ_DATA3 + 4 (0x24), plus bc - 1
underflows if bc == 0. Please add a defensive bounds check (e.g.
!bc || bc > SMARTDV_SPMI_MAX_BYTES) in read_cmd and write_cmd like
spmi-pmic-arb, spmi-mtk-pmif, and hisi-spmi-controller do, so
smartdv_spmi_write_req_data() can never walk past REQ_DATA3 into
adjacent CSRs.

2. You clear REQ_RD_STATUS before a read, which is nice, but
smartdv_spmi_read_err_status_dump() also logs RD_ERR_INDEX. Should
RD_ERR_INDEX be cleared to 0 here too so an error dump doesn't report
stale bits from an earlier failed read?

3. nit: rename __buf to buf in both smartdv_spmi_read_cmd() and
smartdv_spmi_write_cmd() (there is no local buf variable shadowing it),
and consider guard(spinlock_irqsave)(&sdrv->lock) from
<linux/cleanup.h>.

4. nit: "invalid read cmd %#x\n" here to match "invalid write cmd %#x\n"
in smartdv_spmi_write_cmd().

> [...]
> +static int smartdv_spmi_init_clk_reset(struct smartdv_spmi *sdrv)
> +{
> + struct device *dev = sdrv->dev;
> +
> + sdrv->i_clk = devm_clk_get_enabled(dev, NULL);
> + if (IS_ERR(sdrv->i_clk))
> + return dev_err_probe(dev, PTR_ERR(sdrv->i_clk), "could not get i_clk\n");
> +
> + sdrv->clk_freq = clk_get_rate(sdrv->i_clk);
> + if (!sdrv->clk_freq)
> + return dev_err_probe(dev, -EINVAL, "i_clk rate not defined\n");
> +
> + sdrv->rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> + if (IS_ERR(sdrv->rst))
> + return dev_err_probe(dev, PTR_ERR(sdrv->rst),
> +     "could not get and deassert reset\n");
> +
> + return 0;
> +}

1. The reset needs to be optional:

devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

I saw from the v1 review that resets was made required for v2, but on
Tensor G5 only the LSIO_E SPMI instance (0x3a1b0000, RST_LSIO_E_SPMI)
exposes a reset control to Linux. The CPM SPMI instance (0x053f1000,
connected to the MAX77779 PMIC) has its reset managed by CPM and has no
resets property, so probe() fails with -ENOENT there unless this is
optional.

2. Right now probe() fails if clk_get_rate() returns 0, yet
sdrv->clk_freq is never used for anything except a dev_dbg() print in
smartdv_spmi_pr_info(), while google_lga_spmi_cfg hardcodes
.prescaler = 4 below. That assumes i_clk is always 19.2 MHz (giving
2.4 MHz SCL), even though the LSIO_E SPMI instance is fed by a
CPM-managed clock (CLK_LSIO_E_SPMI) whose rate isn't hardcoded to
19.2 MHz. Wouldn't it be better to specify the target max bus frequency
(e.g. 2.4 MHz) in smartdv_spmi_config and compute prescaler from
clk_get_rate()? (Or if a fixed prescaler is really intended, please
don't fail probe() when clk_get_rate() returns 0.)

> +
> +static u32 smartdv_spmi_build_ctrl_reg(const struct smartdv_spmi_config *cfg)
> +{
> + return FIELD_PREP(SPMI_CONTROL_VERSION_MASK, cfg->spmi_version) |
> +       FIELD_PREP(SPMI_CONTROL_PRESCALER_MASK, cfg->prescaler);
> +}

In v1, DEFAULT_ARB_RETRY_LIMIT and DEFAULT_READ_LATENCY were both 32,
whereas v2 leaves SPMI_CONTROL_ARB_RETRY_LIMIT_MASK and
SPMI_CONTROL_RD_LATENCY_MASK as 0. Just want to double-check: is 0
intended for both fields on Tensor G5, or were those defaults dropped
accidentally when removing the v1 DT properties?

-Doug
