Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027388;
	b=IDFfVpBWYEl11AaN0u6JDdF2xwREXBx4P/w+0swuWovdk4mVcCPndGVLDffmclJv8pOk
	 OccuC6GyNj+pvH5WUSIoXW3bfmGTJdAdM0OjBrdVR3+HQ1xe4B5PXyt7IcVRaOGHfuMF9
	 NNgWpYHsnKGeuGTZFhphAiFj7eQbzfgYoi55oiJQADYc6Nvpm3J73cDMr/AsARiLvkEv0
	 OtlWUUgnzb2yF77j756qmn6mVtycOomADUpqtQm8oxiF+jo7sYuueeDA+BYd508Sf1e1t
	 YThN2u1vDA2pZ5qPzqP3/5Upza0uB5gmfs+9M6htk1p9asakeZB6AxzF8s/wMEmsHUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EcjARjGr/IicDiXvqUvCDlSEccrqjBL8eJv0mQLCiyE=;
	b=ArJWzWZDhR67Er6+Q8SYDKeqYCjT5wenmfVGV1bxDa6MgRTWlxdBxSqKoDZ2sUxvZwH/
	 w5s9+8w4zStv4a6Uw7F/nShKZStVeTk1lFftQtjQsZ7Re1vhFf1FMijEWfypwpOeKmOV+
	 7PubMzGXdfgegGlOSd/s3BB7/6l7iMloSTu5R3bhBfKANRv2nwJL8i0PG8doFuo6KKaTh
	 W0h1p9k0w6USNByisZNpXzZA6YLlNzstWSBizIK/iJPnIeaAdo2zfmCfUtQBYlY27O6+w
	 Rk7TWaU+EqW6p/LyMEGYF1FcAMKY5tMFy+olG/pbvjn3giC9RHGzGREk8Se6A40Fdyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="f/kmrIus";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB560A260B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEB560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=f/kmrIus
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ad047710aso911510eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027384; cv=none;
        d=google.com; s=arc-20260327;
        b=krWbLWPOvzM7xBd9aGx66QOVX1RyqwE5iJ4TCPpXC1sAV1wAshCzJHFvzhHI9jc+MU
         yezNPMuub45cL1h97ArM8jukcEv+mVtw9UW5Roor8Lju89YBcCp9lrozS8s0PJ4sA53a
         +BL9ght15HqXpYIS7YV5PbpTSr3ozqsOzNhSzIrHqHngey+ZN++ZpUc1t/DtEUWGMB9q
         hbTy5SJ/KTxMjNLtslcZ2UcgKiSR//1tC5drRvg9ahE/qhWeZfxvkhuRxgSCcCb4uf0d
         Mc0DcfzbW5uPhZJCoT0yewf6QsrY/COOOGZA/TBsZiTQaTuZw0Uxqwy3aeRz6X0HabZf
         gLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EcjARjGr/IicDiXvqUvCDlSEccrqjBL8eJv0mQLCiyE=;
        fh=h/UNqAwSxtqmSyboUlNW6ImQVGEZfVbraoi6uhASVmk=;
        b=gf9A07yHd2s8nWBOy8VYLglmCly9UmtkGqRE1+4Eka89Ga27TzQoAAtohNLGO0IwVs
         Yz28IwNndSC+RpAqsyzAdXvC9gnBiO9Z6giyFNicjNaX6TeaTGz9qK69HZcRwSPMY4Iu
         /J6N+MkIGLVLAQ4a+teoQTNYlFTkloq/hwDUQj/3SY5V+H+XO4L6DgzJmFcIvCV3GS2G
         l60Qpc3ANtIKi2arskPeccA8OeDS2FhLEQt6D5kUpIAdoKxSgz6pGdNsrAZOiSrkyi19
         4GUP9rR2Ucxfk9w1e8z338ygybi5oZlKKOhjR4Ch3M1MB2j6WuijYW8QvSoF6YsnFl0s
         /XoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1795027384; x=1795632184; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcjARjGr/IicDiXvqUvCDlSEccrqjBL8eJv0mQLCiyE=;
        b=f/kmrIusUQL5fYx21CdbPBk/G9NOE13brxTO1VgUrsaJQogbs1b0oN3m4nbUXrRGxa
         uG9De630y2vI2RysLvRT26YZj6gAJVS/a/wFOjE5kXYnXqOX9B3yAMjN2tqcdMfr5Ifj
         EewvYdTOwM0Pu64TIlQjqAqKE4ubcJoyRJfM8DnMmXrCe5r17Qc6f9CJImL26FTnLVU/
         5GHies4eDT4gQoLUxe/25HAbs0e5wOzYNvodqaPbOjIz+amoBLA66UlyZi9W0qlZaU35
         WM8QflB+w99q9HMuAhsNOU2wyeOkpGpG0zHp2OZqyKNmoV49WQfOqei4NMihYU6aTkol
         u1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027384; x=1795632184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EcjARjGr/IicDiXvqUvCDlSEccrqjBL8eJv0mQLCiyE=;
        b=wd6sC0N2EXffKtz76CLkYGNu+M6lf1jfYYRn94wOzEdSO9r5QptaEoLodmvLOstqOQ
         7Emwwu25QUW9q70xq5CWsIzo0s+FpjO/lHGxstSE2IYcRPRpxMC2lW2aX7VJjx5QIvT2
         f5EpVHlB4z501dHt82u1MirGzrN3AhslYBHdNBa3NPruUTjRhEclmo8rHe04XnzmS+vx
         tgzRYPzxpHjEPsrWxpCtXnF5r+rgdRMCRb6+uTaJFVrZTJzzbr/Z2eciMo2NDiEXW8gX
         SvymwHUPRJ3eWH+RxF2zA9T9tbifPJbZvEu/sFUUwG06+mtAnNY31Oios74/zmebnx83
         Qw8A==
X-Forwarded-Encrypted: i=1; AL+hErHVcKk/FpK7IQ8PsGYrLANMNufkie5dI0ecSulUIEQAHdp7L4Q79mL5e+eRIl9cHLNleL78wWhogOQ47lE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8XAjNrLMXVhDIKf7POjO7dH+jNO2c2+JY+ZokNvABynPOQkxE
	sNuqLd+swvLqkIUjk5emfm24dINvcrFXRbadHbErvUKyhUdH28d86kcxYURgTEcF3GAJ+bo4bB3
	eCOAiP8LZClfywVfGoGi2X5d1Gv50f0s4gDqDm0h0/7FY9/VkpXJoU//nYA==
X-Gm-Gg: AYBFou0aA15TktfJtaA7poXZCoThTzv2mtUkf5nRXa2/LtrfimhjMJIQBMx/wPeRgbd
	+xR8SLbMYSeXaIe2q2t17dNcjqk/qgnqETioYmPfDQHNi39xDjfffaLSBhPF1j42vEV/1iZW+30
	UYgYPHsOEs1MOhGOOXzj0BD75rRrWGy3id2TeogE6r+OldqxuSHMvPI/PymjhGFkFwcN6jD4ChR
	uJl0qqetRta1EnrqMPmupZglJD0Tlg/eiRYGFnyHmKO+p0qe/wlJrp+wh1XrMQpUjAAiexhNEz4
	2SJ2TiFmRQhGftqF0n1q2nwiy/zjKL5zCIEUvSDXBhBJd2vPY/NFd1lZs8M1O9k18ApCjhjKxND
	H0FAmVmhVOEHBKtx3nuhFHwACf5VBw7si9NgDUlxicFQtKh3ix/VQ/m5c2rPrJCxccmDb7mkMgD
	MOoSghHpjr7GSYOsKABi75YzjknakbQSsc5HcKNKCagXuqVjDDo9u4eQ==
X-Received: by 2002:a05:6820:a789:b0:702:dd8d:316e with SMTP id
 006d021491bc7-71b18567b6emr1905469eaf.25.1795027383749; Wed, 18 Nov 2026
 10:43:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com> <20261028164539.3471833-5-henryzhang62@gmail.com>
In-Reply-To: <20261028164539.3471833-5-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Nov 2026 18:42:47 +0000
X-Gm-Features: AclHuK_8CSqY4sWJhVcrZV2Foot33L1p_hxdBf1gCfb__EBplFVm726JFlspi5I
Message-ID: <CAPY8ntAXPpJbid2LXc6r0g-sr95uQ3hckxVqa09qPNMi5JSp6g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/vc4: dsi: Serialize host transfers
To: Henry Zhang <henryzhang62@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

On Wed, 28 Oct 2026 at 16:46, Henry Zhang <henryzhang62@gmail.com> wrote:
>
> vc4_dsi_host_transfer() fills the command FIFOs and the TXPKT registers
> and waits on a single completion without any locking. Two callers
> sending at the same time, for example a panel driver and a backlight
> update, can overwrite each other's packets. Nothing keeps a transfer
> from running while the bridge callbacks reprogram the block either,
> for example while pre_enable sets up the PHY timings.
>
> Add a mutex and hold it for the whole host transfer and in the bridge
> pre_enable, enable, disable and post_disable callbacks. None of these
> callbacks calls into the DSI device, so the lock is never taken
> recursively.

I'll agree that there's an issue, but as it will affect all DSI host
controllers it feels like it should be handled centrally in the core
mipi_dsi_device_transfer rather in all the drivers.

One for the core DRM maintainers to comment on. A quick check says it
would affect at least vc4_dsi, mtk_dsi, mcde_dsi, and cdns-dsi-core.

And your use case is genuine as panel-jdi-lt070me050000.c does exactly
what you describe with the backlight functions are controlled via DCS
commands. It would take quite exact timings to update the backlight
from userspace at the same time it sends the power on init sequence
though.

> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index be9caaf50..3ee6e8e86 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -25,6 +25,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/io.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -595,6 +596,11 @@ struct vc4_dsi {
>          */
>         struct clk *pixel_clock;
>
> +       /*
> +        * Serializes host transfers against each other and against the
> +        * bridge enable/disable paths, which reprogram the block.
> +        */
> +       struct mutex transfer_lock;
>         struct completion xfer_completion;
>         int xfer_result;
>
> @@ -805,6 +811,8 @@ static void vc4_dsi_bridge_disable(struct drm_bridge *bridge,
>         struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
>         u32 disp0_ctrl;
>
> +       guard(mutex)(&dsi->transfer_lock);

Do we need to take the mutex in any of these functions except
vc4_dsi_host_transfer?
This driver will misbehave if you request a host transfer before
pre_enable or after post_disable. It's been on my list for a while to
look into that one.
But I don't believe there is anything in these functions that would
interrupt a transfer, hence they wouldn't need the mutex.

  Dave

> +
>         disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
>         disp0_ctrl &= ~DSI_DISP0_ENABLE;
>         DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
> @@ -816,6 +824,8 @@ static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
>         struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
>         struct device *dev = &dsi->pdev->dev;
>
> +       guard(mutex)(&dsi->transfer_lock);
> +
>         clk_disable_unprepare(dsi->pll_phy_clock);
>         clk_disable_unprepare(dsi->escape_clock);
>         clk_disable_unprepare(dsi->pixel_clock);
> @@ -891,6 +901,8 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
>         unsigned long phy_clock;
>         int ret;
>
> +       guard(mutex)(&dsi->transfer_lock);
> +
>         ret = pm_runtime_resume_and_get(dev);
>         if (ret) {
>                 drm_err(bridge->dev, "Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
> @@ -1148,6 +1160,8 @@ static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
>         bool debug_dump_regs = false;
>         u32 disp0_ctrl;
>
> +       guard(mutex)(&dsi->transfer_lock);
> +
>         disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
>         disp0_ctrl |= DSI_DISP0_ENABLE;
>         DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
> @@ -1181,6 +1195,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>         bool is_long = mipi_dsi_packet_format_is_long(msg->type);
>         u32 cmd_fifo_len = 0, pix_fifo_len = 0;
>
> +       guard(mutex)(&dsi->transfer_lock);
> +
>         mipi_dsi_create_packet(&packet, msg);
>
>         pkth |= VC4_SET_FIELD(packet.header[0], DSI_TXPKT1H_BC_DT);
> @@ -1807,6 +1823,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct vc4_dsi *dsi;
> +       int ret;
>
>         dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
>         if (IS_ERR(dsi))
> @@ -1814,6 +1831,9 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
>         dev_set_drvdata(dev, dsi);
>
>         dsi->pdev = pdev;
> +       ret = devm_mutex_init(dev, &dsi->transfer_lock);
> +       if (ret)
> +               return ret;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node = dev->of_node;
>  #endif
> --
> 2.47.3
>
