Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631182;
	b=L2Qj7ecm2YDJ0Q4cVqndtonIFJCX3DRik8CFZXjXIBzneWkMJe8zknGxjGLBzAluHw+4
	 i4mHQayXe0Pey582kJFJ8lcd1f37K5/QQRa/EngPG/waLowivUv93SUlK28Ua+Di0dOlR
	 AjsihvOru6H3QedU3htBZGyyuqvq9klGe3SZDBz7/e6csUBrb4D7AVa12MGDAqJ2Cmz06
	 iDrxcEmc3tcMnLMQpDCsQzHTGYHW00S3/cVEljELD9a9b5OvFfz6JtAejDpdqdB22t/rO
	 Ge2UhAOFaDUaTh0rs7CRQ992LTPY0GtL7zgHw9/zw40L1Zwze2y3Eg0oQUXWGlTSpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
	b=cJ8TTD35ooBhnqSxcApUgKQ++vHPj2fpmhdRvnCA6LKHPFc7sD+HKrax6BYzhsLZEctK
	 E1Wmw/ybe4W+al6cZqlejQwIRTKESZtYFXMIsuk09ct1vY+MjoWJSaLrAcKVIfcgGZN/L
	 wt7pSrmU8vtvZUo2R/ZqABqXL1brN28+AeTvtK2HtpLve2IrB5KMDBK41Gpk1uO9gVIT4
	 XTcM4sqAoCIvSAbmcJEn62g/2GQiejjTrT+Vsp1aVZNennegsh9/485WJtXQisFeO9CZ5
	 UjLEA7t08zPbgBX7YD1YtaBF0iGdRxSXaGEu0pqJAJZHEzjPcWn+F6YDMBLk/4js0HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MdRVndwe;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MdRVndwe
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-949680e6d83so550203585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631181; x=1796235981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
        b=JFCREW2eiOFQEqQV/Jb3uuqJcY870RbySNRXELi0GxRdZBpuHl6xH6fHNa2+j7Stgc
         36NudvNRBD30b/hl3s3gdqRcpiyJsueNuMXjyCIonX5BWMwHebupEibOWslgLt4YmWRO
         ++9O2aub3VnQhppvNKrG41La3LA7NWcHksR7HUTzsxQalcgw+naff93MAOR7kBUu4eai
         Twy1nLcGjgj0HDo2PKIzsPAhtj6SbwBtwaIa/6n/t8ibNyLHiJH7ZIHqC8xl6vjA/aKZ
         0SHcdQwMGvEIldg3x568S9QNHizY0j6LZrFd/paFHBnHmCQVoyMERDfYtE83geqqoMYb
         TKuw==
X-Forwarded-Encrypted: i=1; AL+hErHiqdrPEEBA94ur5PEMkAgGQg6JsPKYETtybj+w9q+wSsaqX9Kih7apJIBOX2TUEi+idc16m5mnEPrmTmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BALaAQzjBsXy0OaY9KLxKt4ymtKXeUOnfnwUY12qyeyRiIXSF
	O8EfieHGueHLADjCsqT77Ub5SPD5QN7Xue3MdvjRPC2gEeGaadekUMQy80WQ0HcGhQE14gcf3Of
	H7LUwvEMKQema3lcveA1HTdUOxNABc/foMOqcs6RfrAdAosiLC6Cb6HeWvO6QUAtrej+3wqkCZO
	+fi75H/xh7BrgEy4/a/9w98eTy+TrKI9FiV3J0UvzjHkWwofyFuzz8TKInyeKvw+PKUkgbRrbsS
	SpaBq1ZCWsptE2m
X-Gm-Gg: AZFdTZd2sXZv/ZWPgCCUvN5GUqvxpLyDC18RKQb07Ko7mzXxXabT+DnbgYKzuPC8iL5
	6fYr1Cl8psvo9ZfhLStxhQsKWZ/EgfQZulZTrnAR3pJWrSyztpdYY/XUYHWWTopfYVk9cEqBF1A
	T1AGtIlMBfsLIlHc7ZTz31fjPermDBC66E8JVIgbIcdY/mTdhhu2ZHtGQmFnKJA3vKb946d2Egl
	IkTEoUNcIJOnQlr3zaruP+PwZEZOoBZZdC/sRTJ0R/kRvpi8c5rUSjYwiwTDEbDUNnNUOmcf+WD
	qQRYqnA8FUVNIQ1ukyRL8g1cZr8KfLy/BPjB3u26VhjUvsdW+NHo8C0/m3sfLs5isgoVRe+4GaN
	+87Ay55YuMjRsAfhWWOWl6c5W+YOU+rgLvsSfpRvGhZr9fR+LWrvidvW+dF7C6OvkU5eZJO1WfX
	9081fptz06DamZ3pwQ90jdSSUCcA4/bvLk
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr3255517085a.73.1795631180574;
        Wed, 25 Nov 2026 10:26:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3baaa8sm144450185a.15.2026.11.25.10.26.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:26:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f045e399acso52642545ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795631179; x=1796235979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcnH/jTKTxIE1YZEERyqIuGuYPlGUR+IxISmRbzT7E0=;
        b=MdRVndweNUI237DWgwd6Z8sXCmAc0FRYyv0hr2fkin4S6E4PZDXdNE8IhREY9wnjYO
         agfjoOWc9ZWVumhchxaju60ihrGJ7HSk2Rq2Ieo3lXQJ+DZfZMiJOenYRs3LfUm74xST
         K2aBwCYZoIugKMwBju2Lq2RubR244ZtKeCZ8I=
X-Forwarded-Encrypted: i=1; AL+hErFGLRMI5rFcIzLdJzMc9PlhVmo1Z3dwI3lmiJTDuXrw2LgNTSg9i+4GUPpl7AAhVtUboUsqealVLZ1bs9s=@vger.kernel.org
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr3155417585a.58.1795630864167;
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr3155409985a.58.1795630863580;
        Wed, 25 Nov 2026 10:21:03 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:02 -0800 (PST)
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
	Shawn Lin <shawn.lin@linux.dev>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v14 3/6] mmc: core: Add option to keep an eMMC powered on at system suspend
Date: Wed, 25 Nov 2026 13:20:50 -0500
Message-Id: <20261125182053.3915833-4-kamal.dasu@broadcom.com>
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

The DT property keep-power-in-suspend, allows us to specify whether the
platform is capable of keeping the power to the card during system suspend.
Up until now, this has been restricted to be used for SDIO cards only, but
let's add the initial support to allow this for eMMC too.

As the card is neither powered off nor sent a command that would switch off
the command queue engine when the cache flush is skipped, turn CQE off
explicitly if it is active before leaving the card powered on.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index a02b04938e1a..93bd9b44e7d9 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -38,6 +38,7 @@ enum mmc_poweroff_type {
 	MMC_POWEROFF_SHUTDOWN,
 	MMC_POWEROFF_UNDERVOLTAGE,
 	MMC_POWEROFF_UNBIND,
+	MMC_NO_POWEROFF_SUSPEND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2157,6 +2158,17 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	if (pm_type == MMC_NO_POWEROFF_SUSPEND) {
+		if (host->cqe_on)
+			host->cqe_ops->cqe_off(host);
+		if (host->retune_period) {
+			mmc_retune_timer_stop(host);
+			mmc_retune_needed(host);
+		}
+		mmc_card_set_suspended(host->card);
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2193,9 +2205,15 @@ static void mmc_remove(struct mmc_host *host)
  */
 static int mmc_suspend(struct mmc_host *host)
 {
+	enum mmc_poweroff_type pm_type = MMC_POWEROFF_SUSPEND;
 	int err;
 
-	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_resume(&host->card->dev);
+		pm_type = MMC_NO_POWEROFF_SUSPEND;
+	}
+
+	err = _mmc_suspend(host, pm_type);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2260,7 +2278,13 @@ static int mmc_shutdown(struct mmc_host *host)
  */
 static int mmc_resume(struct mmc_host *host)
 {
+	if (mmc_card_keep_power(host)) {
+		pm_runtime_set_active(&host->card->dev);
+		mmc_card_clr_suspended(host->card);
+	}
+
 	pm_runtime_enable(&host->card->dev);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 	return 0;
 }
 
