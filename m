Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630872;
	b=Aq8C1C63zHRkVKqGRUTmCLrdGDgRyjfY5ZcD8+T+6FwohlOMQ6ndMUSH2Dw9Xn0HTtUX
	 3ZWBvDteEBEW0bkrGvebV8qFMXyDdfJ42gB0Ap+Wkg3GQPA9y8xMxokVAKLTx/weUqTV+
	 n6HkD1nswtfVxV05J4mX0O04K3Jb9vupcXJqyv6swPhtj4f3EpFrJbwnFhgnI8i4pvh3T
	 cswBVNBaK4yaPrCRM+nOUXrQuIfAfv/HsFRVrL8J6WaFjJOnEk1r6wEUO0Ci7bSLUBI5h
	 MWVxjhGR96ZEkvbHdbYs7CO69j3UynhG3FD08jjDkirLBgnkdZFIehOl2TsxBc7Kw3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630872;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
	b=lMpUMoBRdfuGvEHHVIc1ajmCIm/oSw5Jg5au0XyMvLREokrFcmzyGI8BkM5/ADiVN79p
	 pHWs1VGctJsWma4R2mG+UwHF9BXONKJ0nPyyTslqjWOaEbhBCmplEN6NAlTg/Cn6qPHdm
	 5FJWyv+jQB2jFTvghNnZw/DxJ8hSeJxCxh45NSu/XcPQDTR7cThHaC+msJv5g9kGUVEPj
	 Ivp5U6wI7JOOLAYcGShmLk1cVewDAf58iJaP4f0BgfKdyG8BqkMCXqJDbdY7z1ZdYulPT
	 cznUlVmX4A4bv7fIAF45Ke5SR6FqnNdUkbvoAWOHuftYzYo0e8tOFWKH8Hecvt2t/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tm1svFrH;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E5606A689
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466E5606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tm1svFrH
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3282db206d3so718547eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630871; x=1796235671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
        b=XwDK7WdFwJxDQKYlehGmMwLAuUWXFDFgK2ST4TO8o8NrOdQb2lTBWWqh3VR/9YhDUo
         DtZtSFazp8cLMeQkhZv/Jue4Bbxf2+DwocjG/pOBP5/VPuDh1NBqUmuGQ0nKStMm4MbF
         iDm6rcfuSj4eoH+GIS6Yr0NKwwO+NDFdDm2kHeI9ot6D3psQTJCxb9Qi4BnIIfM6VEq/
         Y35posOYVxfrrXXTduoOKx6SOsjDfHhSeZkAwlE3FMdeQCNLgu9vmDndmqEGko1asykD
         ges5IDwsHjbQLCetomORH90h5YuYEkZ35cIbpv75a5iOcXFvQp/Wl8Erz1cWNb0ZCM9g
         X7Jg==
X-Forwarded-Encrypted: i=1; AL+hErEfMwmcTNXaEJV2mFuda+ub8dwVynvQTuI6ibQikCXs95EZQXbGMyCw3Xbxf4GR7YUt6VK1n1QZMEiMzas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pj3LNrok19/KO/g7EzU91Zfrv94VWOY80jtVtz4nd/Ms6xX8z
	GY3HE8kiUa5GbirST+tBhs6w5KGGCj1h+ShvImWgAwNCJ7jIvuiAiU17O6jcokshyn/mHyyGSYh
	VmDIV/HdJF2W+0RdVX28ra3dJxL3/ON0vAgWQLiebSmApC8MkuoXuBrVTYKN0gnOEXegP0YsgxO
	lcE36/biymdSV51+hOn132wxUMgr0yuZmanDMVo0+dzcU46NgkKur5osIKsbO3XLqMjpcHP83kn
	uij5CywHzknZ7yq
X-Gm-Gg: AZFdTZcy9ohqS9sKRrB7LQ7azOpRWUnPB5LABECkLZ9q4iJooCMWd4Qerk8Ns/p7FJo
	h0Z/8uvh5vK3oG1uieQCgXO98+EL+ILFHARvlZ+ukJTkbnTKHWs1JoYRilayhi9j0s2b3Zik3eJ
	4dLczsF3fn8klLrT4yK4LUlBpRIGaw43zCGl6+07sLphZyhih2BjVeZjQaYChtE+oEQq4jzB0xV
	ZfZmEz4qECz/FU9JKE+eRRXyHWJieByI2XpCcOW2SO/PiDtUC5QYmXddesa0d1t0p9wMeP0xvG/
	2xggZ2jlHy0q6BaUJovbgMKVKghtBcw5ZCNjMuNKTOjt4qVyqH/s7gvu1/7PxGdKz2HvTAUbrWR
	7FBdSLlnol9i8TVW+Hw8wp/TCHMs97yia5nM/8VMhd0FDYQ8tXVDIMj8y9I1I4cqpJ9wZ0+C+zF
	BbVRLjT+CdS1EPN4JlTYNuLjcDyJexURGA2N8=
X-Received: by 2002:a05:693c:41d4:20b0:386:cedf:5e51 with SMTP id 5a478bee46e88-386cedf61efmr3264323eec.26.1795630871310;
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566cd605dsm2792866eec.12.2026.11.25.10.21.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949dc497896so471601385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630870; x=1796235670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXbDQFpiroJFmezz6SHFX01MfYfrrfJaNoc6qsYHSMM=;
        b=Tm1svFrHeAQ5l7w31QJpPA/mU+cg7r8G3LJ/ycz+998st6HwKg595XvflOADQ+U1sk
         bgyMYr+oX59/lRdGwsfVewXB/ssaVwNpNdw15T8bqJgspf6i+5UGCpg9Shn+7KgJgqQU
         /e7PWM/XTHQatTz8KfS2sYVQn9ilITsXyKcA0=
X-Forwarded-Encrypted: i=1; AL+hErHIBye1BCf931oQMq6ucc03tDG1k6+GqeWEMJCmw28SnMGXwztZZReqR1olObWnFj0EqueK4M2FX1jLezU=@vger.kernel.org
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id af79cd13be357-949cb821e7fmr2119543485a.49.1795630869863;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
X-Received: by 2002:a05:620a:2403:20b0:945:e46b:15a2 with SMTP id af79cd13be357-949cb821e7fmr2119537885a.49.1795630869236;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 6/6] mmc: core: Add support for resetting an eMMC at system resume
Date: Wed, 25 Nov 2026 13:20:53 -0500
Message-Id: <20261125182053.3915833-7-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

The DT property reset-card-at-resume specifies that we need to make a reset
of an eMMC card at system resume, assuming it also has stayed powered on
during system suspend.

To implement support for this, let's start by parsing for the new DT
property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Based
on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for the
host, to keep the eMMC powered on during system suspend.

Finally, to manage the actual reset during system resume, let's extend
mmc_resume() to support the needed behaviour.

The property only makes sense together with keep-power-in-suspend, as the
card would otherwise be powered off and system suspend is refused. Validate
that in mmc_validate_host_caps(), to make the host probe fail upfront on
such a misconfiguration.

While at it, claim the host around the reset in mmc_resume(), as it sends
commands to the card, and propagate any error from the reset so that a
failure to re-initialize the card is reported by the resume path.

Also clear MMC_PM_KEEP_POWER in mmc_host_class_complete(), as mmc_resume()
isn't invoked if system suspend is aborted after mmc_host_class_prepare()
has set the flag.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/host.c  | 26 ++++++++++++++++++++++++++
 drivers/mmc/core/mmc.c   | 12 +++++++++++-
 include/linux/mmc/host.h |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 8e9e61839198..9cb456a153ae 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
 	if (host->bus_ops->pre_suspend)
 		return host->bus_ops->pre_suspend(host);
 
+	/*
+	 * If it's required to make a reset of the card at system resume, this
+	 * indirectly also means that we must keep the card powered on during
+	 * system suspend.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
+
 	return 0;
 }
 
@@ -55,6 +63,15 @@ static void mmc_host_class_complete(struct device *dev)
 {
 	struct mmc_host *host = cls_dev_to_mmc_host(dev);
 
+	/*
+	 * MMC_PM_KEEP_POWER is set in ->prepare() and normally cleared by the
+	 * bus ->resume() callback. If system suspend is aborted after
+	 * ->prepare(), ->resume() isn't invoked, so clear the flag here to not
+	 * leave it set at runtime.
+	 */
+	if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
+		host->pm_flags &= ~MMC_PM_KEEP_POWER;
+
 	_mmc_detect_change(host, 0, false);
 }
 
@@ -375,6 +392,8 @@ int mmc_of_parse(struct mmc_host *host)
 		host->pm_caps |= MMC_PM_KEEP_POWER;
 	if (device_property_read_bool(dev, "wakeup-source"))
 		host->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 	if (device_property_read_bool(dev, "mmc-ddr-3_3v"))
 		host->caps |= MMC_CAP_3_3V_DDR;
 	if (device_property_read_bool(dev, "mmc-ddr-1_8v"))
@@ -620,6 +639,13 @@ static int mmc_validate_host_caps(struct mmc_host *host)
 		return -EINVAL;
 	}
 
+	/* Resetting the card at resume requires that it stays powered on */
+	if (caps2 & MMC_CAP2_RESET_AT_RESUME &&
+	    !(host->pm_caps & MMC_PM_KEEP_POWER)) {
+		dev_warn(dev, "reset-card-at-resume requires keep-power-in-suspend\n");
+		return -EINVAL;
+	}
+
 	/* UHS/DDR/HS200 modes require at least 4-bit bus */
 	if (!(caps & (MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA)) &&
 	    ((caps & (MMC_CAP_UHS | MMC_CAP_DDR)) || (caps2 & MMC_CAP2_HS200))) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 122ac9ba0a4b..829947374dcc 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2316,14 +2316,24 @@ static int mmc_hw_reset_recovery(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	int err = 0;
+
 	if (mmc_card_keep_power(host)) {
 		pm_runtime_set_active(&host->card->dev);
 		mmc_card_clr_suspended(host->card);
 	}
 
 	pm_runtime_enable(&host->card->dev);
+
+	if (mmc_card_keep_power(host) &&
+	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
+		mmc_claim_host(host);
+		err = _mmc_hw_reset(host);
+		mmc_release_host(host);
+	}
+
 	host->pm_flags &= ~MMC_PM_KEEP_POWER;
-	return 0;
+	return err;
 }
 
 /*
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 032c018650e0..3c0ea74e3e35 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -430,6 +430,7 @@ struct mmc_host {
 	u32			caps2;		/* More host capabilities */
 
 #define MMC_CAP2_BOOTPART_NOACC	(1 << 0)	/* Boot partition no access */
+#define MMC_CAP2_RESET_AT_RESUME BIT(1)	/* Reset the card at system resume */
 #define MMC_CAP2_FULL_PWR_CYCLE	(1 << 2)	/* Can do full power cycle */
 #define MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND (1 << 3) /* Can do full power cycle in suspend */
 #define MMC_CAP2_HS200_1_8V_SDR	(1 << 5)        /* can support */
