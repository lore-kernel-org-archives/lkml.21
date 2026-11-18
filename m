Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036290;
	b=e/YBkxLYkzV93g8TJNxb46RRNICW5BevTryKRiFEIX1BQ+z/pA4DmaYGDkvYNdFAAtNG
	 ITMzxMX1ZfNq/+dfQs85KEnbFlYGDa1hW1rd6Hv8t84577e2FD6pcutqqL6VH7KnX/iBN
	 TvPA+EFrGQiC4HPGw5gCEszesD4FHADGulERKxG4Pg3yFl79ETPuJi8GwMnvnXhgsEqnt
	 UYQAiEbPnpczTFqIl4eLvuGCI08Qk8YHJracGEj1Pt24qVbmWQJsPuYF6GDmCTXf55R2n
	 8C2anRpPj+NoqhsQcBW9UAajyWhd5v0LkV45jHPQDxlTf7d3cN2CDRuC6fSHcNn3g7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wjl8QCeGjTXH4FsXdqCnkAKCMUVZVTA5duUIZqFFOEc=;
	b=EUwVPKkHjQ27jZU94ob9/uwyJ/g0PbmlZaKSQDXFOde3KU7Q1TNMSRkTLxOAdT905Nci
	 3FylaYsDvys+wUyo+Zmlh3fE5efjwZ4Y2iMmvsQT7R4sosWsRDbDvo30HG1dbzw7CbGD/
	 aXRb1uzoVxx7XVc2RKvkJDhY2/7Iz1zC9z+3XcF7z4W898IxyRMtY2nTmzo0HoyJa8wOO
	 Cg+elPPfg8rQSwBD1mto0f/ZoESjdZBDdDNj+PD0667Y+yDRSKwKsYmaLN9NZZ8/BkBgt
	 TRmPMVA+2GRQRJRlbTArB7ldZvJCd+iym1K6jOktgjo8Uy/TtSaIi17iE2G9ct+agOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=AG3v8W6T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D8606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2D8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=AG3v8W6T
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-86103aaac12so173037a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036288; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKn1VI44bP4ZKvPSVhxfAl8+zt4GRJ0jTZAg97MEVsX7vOyonYS0Pi/UFvefPoSnD+
         1fh2o6ibymW/Iv0GJAWB3GacTnU/l4aI7PDvhJx1/AVYDfPvQyn+8EsO1fqJVJGEo5yg
         UGI8L3jqcWqrtgm0KTCLvSLaKGwZvcCuAr1T61PJrEolj/M9EeOyBKLT2VOnl00TD16H
         rNWoAepkFgEQcYdlgM5Rl6Wu0L4gYcv+Mhob+rysY24ZqYJtaz95hkUOxtLksopEgBZo
         tT2zI8jPFONgbrSl8a90H2Z/B1V3yGx98wfnCD2jr6lTMlqh+GzosyLPP+sW6y3lMitF
         FePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wjl8QCeGjTXH4FsXdqCnkAKCMUVZVTA5duUIZqFFOEc=;
        fh=Hpj58pON9YxHWh9Q9STYzK+W3Iw1HTmKWLcJ4shTvX8=;
        b=plq60ocPfKEsdTtotfsxNpy6h+IugXHA6+8giJcJ2A+4RmOmbK+JaDVtgJs5x2ixce
         /KQuRp05PAH0lv0H3jtwa4ls04xhUi02IqaE1kBGt6IT6hV8i3AHzVIuI1glsYScS4sk
         3tAFTUHvpFSoSd6ZAi+nXyGo6BdvAFqla7xrFH0pFg8Zn0FCeWdxlhFpP6vsydtdnf2Q
         kExEdeN+a7U2HPDLFhQGaTuFhrf5kcZUott5AFa3BX0lGUk8pfsvy5j2lEHDB5CttEFE
         9+T7okNs0Z9SkZBl7z6YzgMaBDv2G12h4OuVkWZgSXWJ08+ilHOVpr5jxtlQE7+jxlAp
         pLdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1795036288; x=1795641088; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjl8QCeGjTXH4FsXdqCnkAKCMUVZVTA5duUIZqFFOEc=;
        b=AG3v8W6T7aOPwxFUH+SyF3fersV5H61d1omSdqHHIAkBt5CMsJsBMSR+guQ9Erc1LS
         1zRcgwVrJRFioE6X5uI2ze9k8pcg5sFQ6tgfTaYMSkyTUP/FRMAgAlETP6Ez+rwepFq4
         FTPUYhW9ff4qJR4YX0xprvo81jNfwxLldeJNOU018NuCNIe51Wx7qHXGutcpqjX+JPO4
         I2+PsiSI4YVZhGIZtAfdwN0l+Yo6xTqJwNOTGB69UsXWTK6a4dOCutOnDcDimMMTGCtc
         Q5Q+95T4owQY6pnyHawCuMJT3D/EWkPf8yFyJJwjpuewRnlgipd8rUZxU9Bgp0vb2xzl
         H+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036288; x=1795641088;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjl8QCeGjTXH4FsXdqCnkAKCMUVZVTA5duUIZqFFOEc=;
        b=pUepMh6+d1/iz0xAA1TKSBaoYMO4ndOGfF8ArU1gHbpz0ZQABEXtsglRpvQopSJcbd
         4G77F8q6i7IwYR018yQNz6vDwckmctrSAIjAa+V+DVKZukZjWvFcEKpw2crJiAPbJiA2
         lMonw3lLD+Nk5kpw7pDrvjXt4v7FtBcQZHwQ9ayKM9SOorYtQJsHiEpigKXVQzG36wya
         aYZMZ6RnPXInJ+uAYj6wu+ohKCEHPWlyuUxTA1j89ClJTiGp3BtcHG9jmdK1467lI4I1
         HW8wd7NfFkC2N/6fsQdtiSnyhp9IEAbx+oAvd0nuji+qbvm/b+tta6K/prGZrhzXH26k
         /fOg==
X-Forwarded-Encrypted: i=1; AL+hErERc0Rgo48Ak6yBm7HB8Brlhi8rqX5RsjcpXwwH6dLt8j0q2WgPWVGMhxEggM4yyl203vzWxL8fNdC3DfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o8cg7iC5oGUsjFcpOYYPyb0ifhWq3VoDnbQ0nU0QwrI/EEqoj
	ivtsRMJk4vcve8+Ki20b4vQ2Mf+GEdqFVwYely+MOTOVkC/mBaky1HX64n2VxwFyHRR5LobdfBR
	dcC3u+KlbT3Y8xrVBNmALn4JDbrpUL0JnxL+btrzAVYo6y2ApfszmuB0=
X-Gm-Gg: AYBFou0HYMlkaa+8JWMGvg9HS150baVD1/y9BboI1Lk7AA7zSGo7+Kr6oyw1MdR0RNN
	OpKkN9nEut2HHB+6FTpFkqQ5scGWsDeqT0KMMNhRsqvY/s1LWeeCRKyymxkDYbWb9rJMT3DprbS
	WVyI+YG/ppYEBGNU9DfZ3qBOu1Uv7aEWDhropqQjSnM4TQ/3xzdL0z9yms3e9zejkx1LfBKnEvW
	ciTU3CKkkn3A6TnVL8nCLUGSE4A3YPYNUxHEwOQZDavTEBqDMtI4SVU9MvzsxpXtq0WApG9myFQ
	W8Urd6fnHnUPUG+S2xs5f8Fxe92qRjzCdncmpOacmdugapHWT7qhZDumkhhXH05FzhMyGId1bCY
	sf+XVQVIAhlsBBxGOpPYUgiMjK60Faq3mLCYnHvS66MKCvAPghRaeqf6NuQC6qdf8iKLReQMIN5
	6kexKMMoEAjHD+v+chc4SZSn5ow514HgD5u3EfqJDmqUaa
X-Received: by 2002:a05:6820:1628:b0:71a:f064:8b06 with SMTP id
 006d021491bc7-71b2a80c0cbmr534052eaf.69.1795036288307; Wed, 18 Nov 2026
 13:11:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com> <20261028164539.3471833-6-henryzhang62@gmail.com>
In-Reply-To: <20261028164539.3471833-6-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Nov 2026 21:11:10 +0000
X-Gm-Features: Aa3M54ppFeoIveUP9gXLzY6cqQDP_Zvlx1z-dyeMZe7MZBe2a_LvWX7OIrzJTkU
Message-ID: <CAPY8ntD7UqYwGfSOp4XW5V6574e7o_bq_hnzNfVoq8y92-3awA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/vc4: dsi: Recover from a timed-out transfer
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
> When a transfer times out, vc4_dsi_host_transfer() disables the
> command, resets the FIFOs and returns -ETIMEDOUT. That is not always
> enough: after an LP receive timeout during a read (the peripheral did
> not complete the bus turnaround), every following transfer times out
> as well, with no interrupt and STAT reading back 0. Only a modeset,
> which goes through post_disable/pre_enable, brings the block back.
>
> Reset the DSI block and its analog front end after a timeout and restore
> the configuration programmed in pre_enable, in the same order as
> pre_enable: the block is ungated and the AFE released only after the
> timings are programmed. Keep the interrupt handler out with
> disable_irq() until the block is restored and INT_STAT is cleared, so
> that neither a late completion interrupt of the timed-out transfer nor
> an error interrupt raised during the reset can complete the next
> transfer or run in the middle of the reset. Also mask the interrupts
> until the AFE is out of reset: the error interrupts otherwise fire
> continuously while it is held in reset. The timed-out message is not
> resent, as it may already have been executed by the peripheral; the
> error is returned and the caller decides whether to retry.
>
> Only do this while the block is enabled. Between post_disable and
> pre_enable the clocks are off and there is nothing to restore; a
> transfer then times out as before. The transfer lock keeps the
> recovery from running in the middle of pre_enable or post_disable.
>
> This does not prevent the timeouts themselves. With video running,
> vc4 does not keep commands within vertical blanking, and transfers can
> still time out, sometimes several in a row after a reset. That is a
> separate issue.

Whilst it's a belt and braces approach to work around the issue, I'll
have a dig next week to see if I can reproduce it and see what is
going on.
There are very few use cases that have a need for sending DCS commands
whilst transmitting video, so it's a bit niche. The reset stopping
video isn't nice although I guess it should be fairly brief.

  Dave

> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 136 ++++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 3ee6e8e86..6edda74e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -601,8 +601,11 @@ struct vc4_dsi {
>          * bridge enable/disable paths, which reprogram the block.
>          */
>         struct mutex transfer_lock;
> +       /* The block is powered and configured. Protected by transfer_lock. */
> +       bool enabled;
>         struct completion xfer_completion;
>         int xfer_result;
> +       int irq;
>
>         struct debugfs_regset32 regset;
>  };
> @@ -826,6 +829,8 @@ static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
>
>         guard(mutex)(&dsi->transfer_lock);
>
> +       dsi->enabled = false;
> +
>         clk_disable_unprepare(dsi->pll_phy_clock);
>         clk_disable_unprepare(dsi->escape_clock);
>         clk_disable_unprepare(dsi->pixel_clock);
> @@ -1151,6 +1156,8 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
>                 DSI_PORT_WRITE(DISP0_CTRL,
>                                DSI_DISP0_COMMAND_MODE);
>         }
> +
> +       dsi->enabled = true;
>  }
>
>  static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
> @@ -1184,10 +1191,9 @@ static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
>                                  &dsi->bridge, flags);
>  }
>
> -static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
> -                                    const struct mipi_dsi_msg *msg)
> +static ssize_t vc4_dsi_transfer(struct vc4_dsi *dsi,
> +                               const struct mipi_dsi_msg *msg)
>  {
> -       struct vc4_dsi *dsi = host_to_dsi(host);
>         struct drm_device *drm = dsi->bridge.dev;
>         struct mipi_dsi_packet packet;
>         u32 pkth = 0, pktc = 0;
> @@ -1195,8 +1201,6 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>         bool is_long = mipi_dsi_packet_format_is_long(msg->type);
>         u32 cmd_fifo_len = 0, pix_fifo_len = 0;
>
> -       guard(mutex)(&dsi->transfer_lock);
> -
>         mipi_dsi_create_packet(&packet, msg);
>
>         pkth |= VC4_SET_FIELD(packet.header[0], DSI_TXPKT1H_BC_DT);
> @@ -1374,6 +1378,120 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>         return ret;
>  }
>
> +/*
> + * Reset the DSI block and its analog front end, then restore the
> + * configuration done in pre_enable. Resetting the FIFOs alone does not
> + * clear the state the block can be left in after a transfer timed out
> + * (e.g. on an LP receive timeout): every following transfer then times
> + * out as well, until the next modeset.
> + */
> +static void vc4_dsi_reset_and_restore(struct vc4_dsi *dsi)
> +{
> +       u32 en = dsi->variant->port ? DSI1_CTRL_EN : DSI0_CTRL_CTRL0;
> +       u32 ctrl = DSI_PORT_READ(CTRL);
> +       u32 afec0 = DSI_PORT_READ(PHY_AFEC0);
> +       u32 afec1 = DSI_PORT_READ(PHY_AFEC1);
> +       u32 disp0 = DSI_PORT_READ(DISP0_CTRL) & ~DSI_DISP0_ENABLE;
> +       u32 disp1 = DSI_PORT_READ(DISP1_CTRL);
> +       u32 hstx_to = DSI_PORT_READ(HSTX_TO_CNT);
> +       u32 lprx_to = DSI_PORT_READ(LPRX_TO_CNT);
> +       u32 ta_to = DSI_PORT_READ(TA_TO_CNT);
> +       u32 pr_to = DSI_PORT_READ(PR_TO_CNT);
> +       u32 phyc = DSI_PORT_READ(PHYC);
> +       u32 clt0 = DSI_PORT_READ(HS_CLT0);
> +       u32 clt1 = DSI_PORT_READ(HS_CLT1);
> +       u32 clt2 = DSI_PORT_READ(HS_CLT2);
> +       u32 dlt3 = DSI_PORT_READ(HS_DLT3);
> +       u32 dlt4 = DSI_PORT_READ(HS_DLT4);
> +       u32 dlt5 = DSI_PORT_READ(HS_DLT5);
> +       u32 dlt6 = DSI_PORT_READ(HS_DLT6);
> +       u32 dlt7 = DSI_PORT_READ(HS_DLT7);
> +
> +       /*
> +        * Mask the interrupts while the block and its AFE are in reset: the
> +        * error interrupts would otherwise fire continuously.
> +        */
> +       DSI_PORT_WRITE(INT_EN, 0);
> +       DSI_PORT_WRITE(DISP0_CTRL, disp0);
> +       DSI_PORT_WRITE(TXPKT1C, 0);
> +       DSI_PORT_WRITE(CTRL, DSI_CTRL_SOFT_RESET_CFG |
> +                      DSI_PORT_BIT(CTRL_RESET_FIFOS));
> +       DSI_PORT_WRITE(PHY_AFEC0, afec0 | DSI_PORT_BIT(PHY_AFEC0_RESET));
> +       /* AFEC reset hold time */
> +       mdelay(1);
> +
> +       /*
> +        * Same order as pre_enable: the block stays gated and the AFE in
> +        * reset until the timings are programmed.
> +        */
> +       DSI_PORT_WRITE(CTRL, ctrl & ~(DSI_CTRL_CAL_BYTE | en));
> +       DSI_PORT_WRITE(STAT, DSI_PORT_READ(STAT));
> +       DSI_PORT_WRITE(PHY_AFEC1, afec1);
> +       DSI_PORT_WRITE(HS_CLT0, clt0);
> +       DSI_PORT_WRITE(HS_CLT1, clt1);
> +       DSI_PORT_WRITE(HS_CLT2, clt2);
> +       DSI_PORT_WRITE(HS_DLT3, dlt3);
> +       DSI_PORT_WRITE(HS_DLT4, dlt4);
> +       DSI_PORT_WRITE(HS_DLT5, dlt5);
> +       DSI_PORT_WRITE(HS_DLT6, dlt6);
> +       DSI_PORT_WRITE(HS_DLT7, dlt7);
> +       DSI_PORT_WRITE(PHYC, phyc);
> +       DSI_PORT_WRITE(CTRL, ctrl & ~en);
> +       DSI_PORT_WRITE(HSTX_TO_CNT, hstx_to);
> +       DSI_PORT_WRITE(LPRX_TO_CNT, lprx_to);
> +       DSI_PORT_WRITE(TA_TO_CNT, ta_to);
> +       DSI_PORT_WRITE(PR_TO_CNT, pr_to);
> +       DSI_PORT_WRITE(DISP1_CTRL, disp1);
> +       /* Ungate the block. */
> +       DSI_PORT_WRITE(CTRL, ctrl);
> +       /* Bring AFE out of reset. */
> +       DSI_PORT_WRITE(PHY_AFEC0, afec0 & ~DSI_PORT_BIT(PHY_AFEC0_RESET));
> +       DSI_PORT_WRITE(DISP0_CTRL, disp0);
> +
> +       DSI_PORT_WRITE(INT_STAT, DSI_PORT_READ(INT_STAT));
> +       DSI_PORT_WRITE(INT_EN, DSI_PORT_BIT(INTERRUPTS_ALWAYS_ENABLED));
> +}
> +
> +static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
> +                                    const struct mipi_dsi_msg *msg)
> +{
> +       struct vc4_dsi *dsi = host_to_dsi(host);
> +       u32 disp0_ctrl;
> +       ssize_t ret;
> +
> +       guard(mutex)(&dsi->transfer_lock);
> +
> +       ret = vc4_dsi_transfer(dsi, msg);
> +       /* Only a running block can be reset and restored. */
> +       if (ret != -ETIMEDOUT || !dsi->enabled)
> +               return ret;
> +
> +       /*
> +        * Leave the block usable for the next transfer. The message is not
> +        * resent: it may already have reached the peripheral, and only the
> +        * caller knows whether it is safe to repeat.
> +        */
> +       disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
> +       dev_warn(&dsi->pdev->dev,
> +                "transfer timed out (stat 0x%08x), resetting DSI\n",
> +                DSI_PORT_READ(STAT));
> +       /*
> +        * Keep the interrupt handler out until the block is restored and
> +        * INT_STAT is cleared. The error interrupts are still enabled, and
> +        * a handler running during the reset could complete the next
> +        * transfer, or race with the register writes on DSI1 of the
> +        * BCM2835, where both go through the DMA workaround. disable_irq()
> +        * also waits for a late completion interrupt of the timed-out
> +        * transfer.
> +        */
> +       disable_irq(dsi->irq);
> +       vc4_dsi_reset_and_restore(dsi);
> +       DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
> +       enable_irq(dsi->irq);
> +
> +       return ret;
> +}
> +
>  static const struct component_ops vc4_dsi_ops;
>  static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
>                                struct mipi_dsi_device *device)
> @@ -1743,14 +1861,18 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>         /* Clear any existing interrupt state. */
>         DSI_PORT_WRITE(INT_STAT, DSI_PORT_READ(INT_STAT));
>
> +       dsi->irq = platform_get_irq(pdev, 0);
> +       if (dsi->irq < 0)
> +               return dsi->irq;
> +
>         if (dsi->reg_dma_mem)
> -               ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
> +               ret = devm_request_threaded_irq(dev, dsi->irq,
>                                                 vc4_dsi_irq_defer_to_thread_handler,
>                                                 vc4_dsi_irq_handler,
>                                                 IRQF_ONESHOT,
>                                                 "vc4 dsi", dsi);
>         else
> -               ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
> +               ret = devm_request_irq(dev, dsi->irq,
>                                        vc4_dsi_irq_handler, 0, "vc4 dsi", dsi);
>         if (ret) {
>                 if (ret != -EPROBE_DEFER)
> --
> 2.47.3
>
