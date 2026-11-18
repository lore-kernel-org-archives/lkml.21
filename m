Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.193
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998047;
	b=GkUj7OCYGu4ohHzeplIg/QcCUlyalcvyZyynIIEfZlkeAiShMHGffZc5cxDD4O3eeROg
	 5C1m0pvAEhI64GEeUgqiM5HXF0+TuUKE3WJqCD5NEW9F3o+HyZElddmpE75iyvcCS51Gg
	 H3een8CY/gOr3Di9cS6IaGqwpXota6uvbkoTe/wadu7TwNM6nduW+P++DdBJNUJFc6uFL
	 ROwFIcLrnA1V1oTrYRRKIOtc5nRwIQCR5+aD2HHBvfMpiYuq05vl1Ryt6hBhA46O/Ayat
	 CA/Hg97WxlCetzb5xvfwm2TEVHgREktbNVjiOBkLiMSdGVCrX/g2HKDHfFl90h5niVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
	b=29/Fcm/IIiGK0M2jx+HRFWXmHQrWFS1fXMEMsIFkahS9pA2gtNfRFWQ2jmmHBdsVqqpN
	 baYcW7XAW2IWszKjCj0O3uYhZZD42sblq6GRZk7P1kgAqIFL2k1FC/YhDL5rQ+sdMLVOj
	 18OknalWENt7JQFEazFBb6NXvIXxhffJYLI0U8C4OXKK4xGLUjhIIERxedPZbvr3Hhydq
	 FV2ZFho+53XXEYythB0kXjFRAgk4fsoR9UnFrcih+hKvW/OurJJuMeIZqO1tbWp60B7fk
	 N6zozegdLJdHwiRtDo4367ktviibvgfmSySmhAcfJ4ov8Ml2OhX83yXmRAmI0JDtZmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRuL5z+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.193
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRuL5z+J
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-51f2e9e6987so1270582b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:34:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998046; cv=none;
        d=google.com; s=arc-20260327;
        b=NStHss/zwltKWC3Zmkth4KZMrCxygzN2Yy9UT9wYb6Lghz2lw5PW9AZVwiPQXtBT6c
         QXVA1xxEWzEZ4Cifo1Nh92uoTicJ5y9czUS/8YvmsGGIarZaUlh9lsgkspF5QUJZbiTN
         t4bZ9wlYOxEixhyDTszQz0mLLfJjwlp698B4T9YqxbWifDd8HXgTihBWXAF0Rtte9kw+
         uCM+pQEpJa96UaJTpyq4GqqyxIQSVIR4RbZkptXs28IlYQKlzHNXM6U1vW4VZTplTT5H
         zHJ368x/T2MxYJWujkkoPzpQRL1xS+Fo6UKVvHxQU9fnTC0AzTejhymxTX1G7svhYlTj
         +KZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        fh=JbFGpOX2L45YnBL8FPtJ3WieYTGA4OTThHlO4cC9Jvg=;
        b=ZvH2OGTXogS5bllm79eoakj8zhj9dagHc8YFIQj6r/lqVnvisIZtn0dMQ6GNcbcFKq
         JNTJd26z02Okb1haheFnYSmj4fuAf8BwFogQHLGzIO1a12UYW2zXVVKJOI1WFecIh9lK
         KrUe134h1uMAuvVx8i7GmUeB9Frx8ONDeiLqXON6lnZu2xQiq5XDKgPK8HxPOL0DKBVM
         uoTXUj2M3ncguy+K3yk9KqsahbjTkmezm24EzwJVdEyouQ3YOqKUprDOjRbBdfSReBP5
         turzh8VdduaTfNb194aO+RqkVrCxv41iDKKqh1WtR1A9I+FdZhzzqtKynuEUCHCX3Eh6
         fM8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998046; x=1795602846; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        b=TRuL5z+JyiXtqMV1bBXCt37cOPJ1DQtkjdUGdRLP2tfjFbadpin1c9cRf1MWTLL4zf
         4FfUuQdTQeFEq7Lxat9eSruKBJWV58r8ql/TshEEDB5fj/yiBrWHe2aMFxoN7QWpwV5/
         r+AT8sDVKt9RhDfJZwBYVQVTHztqY9JEzKVnrmprqph/nLew9ENehPWRiQzKZmx9znRF
         bJhLfJwa7J680QJ6b/aveaLx58Bf00yyQ1H09zPwwVtKtGEvxPyJsCt3PhTHFETB6sbR
         RGb+yjaSkGJJE5bXSmcOytI20kh/BtCtJDsvX/xg2IRtPNFqtCL2ibTXA+MTGbNSewy/
         fUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998046; x=1795602846;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        b=0vLqgdLgZabtxUpyWOr4ADAYZ7zUVQoG3oRqHH0Zvnta15mCjJQ/G2171HmaZ1VUus
         6vL+FDXrluKbgxugL097fQhmkGLIG0oMjAiVgy4oSMI+BK+wKr2d4sZ3Vqtm6ccVaRSc
         ENK7VN87O4gFJAULwSoe9bn+K05MW4KN70prlh6EWKdA3t6vaYoBbCK4ysGizwNa9Ugd
         4+STdrh/B4Kjq41Lsxt90wA5bQGnP69HnR1fl6Rrsv0uAzperVKHdwcxsCixNx3WXVeF
         ISchmzyViGVaWbEf2Nn7OdaW8UJ4W/TRfnzfj1KlDBdqhj/ForWNYcp7abCfU4t+h2oP
         OWvw==
X-Forwarded-Encrypted: i=1; AL+hErEtuRj5wUAIBU9VAm3zSSSvRVqHdqydSCLR+dZzFhf49oa2MpQzWyHP7VpaUcqojBNu5b0WCXgm6FdojCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3T+VwurHnWzYH67MQ4Ma9Wskn2pVUxjqxpQePzuhrcPVOgO9o
	hwlAxeW7KfqLk99fTfP+YhEZD+IC+84x6WAqXY/nHY+XEP0HXhbMlgaDryyzelrIYWJQFnfBJsU
	/7rxi44aEmK8J7iTD34O8XH+jC9Nr00w=
X-Gm-Gg: AYBFou1JSfaboGiJoo0bySvYG2P75RGtS0nQ9UOUj2FGhspwlS2EEXYOiHMUPwCsq39
	kelYgEzLY1fH0E3shK4dk6KadwLyerosUBk1P2hYjK25+g3furvN/ISQKCZhwRF0Ed0yAnkoOn/
	6wPSywwXKm7zx51UYLx7pdCBbWY/jMbolnfSRBW8zvfx8gq8J2uuj9RTcO8s2MbLq68hubhCy9a
	JzAh+9pn0B9sONKIbQnJSUpzd5xC3Fh5yCZwZFFovpXFVpI4Lo8s29rN+hDOL2xrT8H3/NaJ+3l
	GZz7vNK4XQ+KkjOraVYKamDs1z/c8sv+MQOn3/eYw6o1uRcdsSU9baczB7lpVpVn0EXMzsdquzH
	F/2fpKzBWaNk0A4NGLC0RhQke1+Z0q0zDz+rQBg==
X-Received: by 2002:a05:6808:19aa:b0:4f5:1b84:8cd3 with SMTP id
 5614622812f47-575de219591mr3657684b6e.24.1794998045564; Wed, 18 Nov 2026
 02:34:05 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:34:05 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
In-Reply-To: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
Date: Wed, 18 Nov 2026 05:34:05 -0500
X-Gm-Features: AclHuK8WIVSjjIrb7TdnAfEEBy1zcw231lawsvJVKduGoPyZtKzF5afdrtfK-Jo
Message-ID: <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>
Subject: [PATCH net 1/2] net: phy: restore timestamping state on probe failure
To: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

A PHY driver can install a devm-backed mii_timestamper and select it as
the default before its probe sequence has completed. If a later probe
step fails, the driver core releases the driver's devres, but the
phy_device retains both timestamping fields.

If the generic PHY driver later attaches, skb_defer_rx_timestamp() can
dereference the freed mii_timestamper. This also affects non-PTP packets
because the receive path tests hwtstamp_set before classifying the
packet.

Save the incoming mii_ts and default_timestamp state and restore it on
every probe error path. Restoring the previous values also preserves a
timestamper installed externally before the probe.

On an x86_64 KASAN kernel, a KUnit reproducer using a real mii_bus,
phy_device and phy_driver triggered a slab use-after-free after the
failed probe, driver-core devres cleanup and generic-PHY fallback. The
same test passes after this change.

Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some
Broadcom PHYs.")
Cc: stable@vger.kernel.org
Signed-off-by: Kimberly Morris <gy770616@gmail.com>
---
 drivers/net/phy/phy_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945..4017568 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3812,8 +3812,10 @@ EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
 static int phy_probe(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
+	struct mii_timestamper *mii_ts = phydev->mii_ts;
 	struct device_driver *drv = phydev->mdio.dev.driver;
 	struct phy_driver *phydrv = to_phy_driver(drv);
+	bool default_timestamp = phydev->default_timestamp;
 	int err = 0;

 	phydev->drv = phydrv;
@@ -3951,6 +3953,9 @@ static int phy_probe(struct device *dev)
 		phydev->drv->remove(phydev);

 out_reset:
+	phydev->mii_ts = mii_ts;
+	phydev->default_timestamp = default_timestamp;
+
 	/* Re-assert the reset signal on error */
 	phy_device_reset(phydev, 1);

-- 
2.55.0.windows.3




On Wed, 18 Nov 2026 05:33:45 -0500, Kimberly Morris <gy770616@gmail.com> wrote:
> Hello,
>
> Following Greg's request for an applyable patch, this series addresses the
> automatic PHY probe-failure lifetime path from the earlier report. It does
> not rely on the root-only sysfs driver-unbind trigger.
>
> A PHY driver can publish a devres-backed mii_timestamper before its probe
> has completed. If a later probe step fails, driver-core cleanup frees the
> owner while the phy_device can retain the published timestamping state. A
> later generic-PHY fallback can then reach the freed object from
> skb_defer_rx_timestamp(). Broadcom BCM54210E/BCM54213PE also leaves a
> registered PHC backed by the same freed storage.
>
> Patch 1 restores the timestamping state that existed before phy_probe().
> Patch 2 adds the missing managed Broadcom PHC and timestamper cleanup.
>
> I reproduced the first issue on an x86_64 KASAN kernel with a KUnit test
> that registers a real mii_bus, phy_device and phy_driver, follows the real
> failed-probe and devres cleanup paths, attaches the generic PHY driver, and
> passes a non-PTP skb to skb_defer_rx_timestamp(). Before the fix KASAN
> reported a slab use-after-free; after the fix the test passed without a
> KASAN report.
>
> Tested on:
>
>   - upstream master 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
>   - net/main 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
>
> The submitted series is generated against current upstream master
> 63fdb511c27afcebce797e3db580b3534ddfa639. I have not tested it on physical
> BCM54213PE hardware, and I am not claiming an attacker-controlled probe
> failure, privilege escalation, or code execution.
>
> Please let me know if the rollback belongs in individual PHY drivers rather
> than phylib core.
>
> Thank you.
>
> Kimberly Morris (2):
>   net: phy: restore timestamping state on probe failure
>   net: phy: broadcom: release PTP clock with PHY devres
>
>  drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
>  drivers/net/phy/phy_device.c  |  5 +++++
>  2 files changed, 24 insertions(+)
