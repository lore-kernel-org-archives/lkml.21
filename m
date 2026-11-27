Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797302;
	b=em5BMxZRQ730YeyYGVUghq9xtU1Ck17dg554leNwyG2jJ1N2lTA+jRBh/FzL1HqYpnZ4
	 tXioL45LJF4MbMdvVAhSVsFf0U6mojcj0I7fZ7UfbxL/+TDMdQQ91DXqmbpdJBAEKwVvs
	 a20+QvZAMlVcg3f/0C/tUEnl3XtwPgM0ghRKKu8myoVPIrYdifhltzFZbqUMP5Mv9yJgU
	 p048LGOyhprLFiNRM8fGGfwNN3gQA+NGrOQ0dHf7uo6xAlvjf3z+4+wkCZKtb22F28KH1
	 G9KZuD9pk4sOhSH5ehk4udHhAT5BH6tohBg/khS2bMmR7f3V/dbmmmq0BCnvHeRNEfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
	b=yO17ZbUaF+RSbaWhv6NY2eeRXWFkYFLt1fxPVPIAg0QjEADR+tpJT9NahW5Z/ujA6ou6
	 f5xxDN+KQY6dnveXHTiiGIaCY4GrlpcvmPyt6lMUkgNM33kSJEm4LzvlATaTBCcQ5Z2oQ
	 u5Thaj50uTEPBX6vhNCSiWOzCwrw+I2LJ4mHRcfUHZV304HSH7AgYU0U53PaN8xXsilvj
	 95MsuXaQvk6iQiKkgtezf64sVTgO5QqxC68P5aiboTc5vyrSp0dGwIwwOQ5WvepN+v22I
	 wp0Br+VPe3ctgGDZ6JASNK99moeEDbq4CCLRY+dtVDJoqb+q3hKA5xZj6fu6edZ1c4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HZ/x4nYd";
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B1606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05B1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ/x4nYd
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f07a960666so59057015ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797301; x=1796402101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
        b=HZ/x4nYdEFjLN0H/Y+nuL/VXorbJWVqyhL3/AaIpw0FNAqNJtW1POFVnP2dIpfIPHd
         9RddiArK4HpszxhjFlFHVN5yeim3bWwcMl6xYbTU++uhfWqmaHBgcv1QbPUU+RLp/pz4
         QkCp5Cn8IStarn3NL14VP+a7hj5Z62BucX9IXG93eGN8fBQltS/m2ixPEDXM7SDEOZsX
         /QeW1fc2SFRNihMJYkjEzWvWXsp1nyIdkJcFHTlc2R0cl5A/hCHzrNx5jvYEJQqEagjp
         9KBFSk4v8oTLlRP5FIgdGzEDca7+1Tf4mgYkK77ejnJlklIYhvsPScUR4kctdeeP9n8q
         myOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797301; x=1796402101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08/+Tw1oVd8ocLS95JJDAmqhnR/TTdXdQcTFOlKFwGQ=;
        b=dL7ooNFmcbbPyo4seAhAZ8VxnX3MnK+yIpMPBdsNCGYXF8OA9WVc3+FLZc3Yepl0xP
         T/5NdjFIQaaU/259tmU9vkkiCwFgXJ1EbFcmpVpY/W0bMFFAYHfmT7HbgCFuL+0ZTIVT
         DCHwPLjqyYygotRpCMeBHaJKcP3Mv7iZBP0SaMRJ+5/C7+C3Cuz+vHoR+ute9dYaGf15
         IyOMynOYPqK+fqLhDeDWi6jOo9CyjyzGwEjKC4LiAU0V11fo8/ftPwQXoDREhkKV6qMX
         6Ez/aEcugaw9WHctOdwYljjYkHtlYyy0+6WSmnpnL2iHa1VAL7/tgmY5p3eQEDBx3XeG
         G4mA==
X-Forwarded-Encrypted: i=1; AL+hErFobT7H+r7vCCWPFIKLt2esq5ji7VhkbtsrBRYXE1jM0Y31j1wlrRzbagJR0yTRoEq1fk1RO/1gY04bQi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jLmLjs3l8PyhPx7UousC0qgQAmt6CFx5j18umRJAb3/qINr+o
	3lIWcDqfowcFT55t+k+LHsiK+VoDQNY1UP5xFhiCttpDwi3fQtLQjdx5oqPfZhqq
X-Gm-Gg: AZFdTZcr66ISqDj7SMUk0wA3EhFeyLKIVZjYYC7kNfzEAxBX5zjIjIOmCdHuzEFs18d
	HgCtQMHb2n6mzT3LQh5D5FrgfnFKfIUr/0boY/4dwWToXIyhRIgVx13XwyEVyZRIHKf9SRR/E/l
	UZBfIqF1giYXZ2ZBxoRbLrf29ubHWzWAxJIKEmjo+DlfO2LW+CURSNcgAAjIAPnoD6eHdkd/OUb
	1AbdgT3v1pU+2YIYf4FrAH0i07gx3HL8YlmDSScxBO96L/TPdFwuzMQFsctn3LAbEmVMhl08Kcc
	u1sTt8cEGZbD4pza691Afti7lpdWYsHndBzJ4Ax3zHyOSEU4Hes50WLk6KWrntm0hj+Acd0yA67
	L+SSgLaEwUmlUt9uyuCu+8uAcNU+rhKazjQnqro1nV1c5fIBsLLNQRAsrxuv014Jwhaak+OVMfF
	W/2Z/gVglTw9DoCriysqv6NACyt+C/had4ZCzHNTRDDGHqlTRVk4+SP/jQwyc7zPbplPG4+gakd
	LDDCisIETk1rnhJXfUdW5RCuN2Pi4gehIbKfRagqNfkb6iDhoD2d5C0dNYhr/tkEYF0bzaiRLed
	FPxhEl6g4a3VBZ53qj7eKyJfK2VOCdB4taCVLPR8pdANO6K831p307OtxpkXagy5agTese+JPGU
	qG2syHQsA/qTtC5dTZWM8qNn7cMhR3okG/Ak7cX/mPsaRlLvi9rD2lO0KkV5Edg==
X-Received: by 2002:a17:902:e80b:b0:2ed:2b2f:8632 with SMTP id d9443c01a7336-2f03f11e582mr276703145ad.22.1795797301078;
        Fri, 27 Nov 2026 08:35:01 -0800 (PST)
Received: from localhost.localdomain (bb121-7-41-33.singnet.com.sg. [121.7.41.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm100482945ad.8.2026.11.27.08.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:35:00 -0800 (PST)
From: Suyuan Wang <shyckless@gmail.com>
To: ulfh@kernel.org,
	adrian.hunter@intel.com
Cc: konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-msm: Disable clocks when runtime resume fails
Date: Sat, 28 Nov 2026 00:34:47 +0800
Message-ID: <20261127163447.238-1-shyckless@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Suyuan Wang <stevewong@hust.edu.cn>

sdhci_msm_runtime_resume() enables the bulk clocks first. If restoring
the SDR DLL config or resuming the ICE fails after the clocks have been
enabled, the callback returns the error without undoing the clock
enable. On the ICE error path the OPP performance vote also stays in
place.

The PM core then keeps the device in the suspended state, so
sdhci_msm_runtime_suspend() does not run and nothing drops the vote or
disables the clocks.

On both error paths, disable the clocks first and only then drop the
performance vote with dev_pm_opp_set_opp(dev, NULL), so the clocks are
never left running after the vote is gone. On the DLL error path the
vote has not been taken again yet; the OPP core returns early in that
case, so dropping it there is harmless.

Found with a static analysis tool and checked by hand.

Fixes: 21f1e2d457ce ("mmc: sdhci-msm: Re-initialize DLL if MCLK is gated dynamically")
Fixes: c93767cf64eb ("mmc: sdhci-msm: add Inline Crypto Engine support")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1, sparse). I don't have the hardware.

sdhci_msm_runtime_suspend() also drops the vote before disabling the
clocks. I left it alone to keep this fix small, and can send a separate
patch for it if you want.

Changes in v2:
- Disable the clocks before dropping the OPP vote, and drop it with
  dev_pm_opp_set_opp(dev, NULL). dev_pm_opp_set_rate(dev, 0) does not
  touch the clock, and calling it first left the clock running without
  the vote (Konrad)
- Link to v1: https://lore.kernel.org/r/20261124-sdhci-msm-v1-1-75c70ed6569f@gmail.com
---
 drivers/mmc/host/sdhci-msm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba4..967843a30 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2978,20 +2978,27 @@ static int sdhci_msm_runtime_resume(struct device *dev)
 	if (msm_host->restore_dll_config && msm_host->clk_rate) {
 		ret = sdhci_msm_restore_sdr_dll_config(host);
 		if (ret)
-			return ret;
+			goto err_disable_clks;
 	}
 
 	dev_pm_opp_set_rate(dev, msm_host->clk_rate);
 
 	ret = sdhci_msm_ice_resume(msm_host);
 	if (ret)
-		return ret;
+		goto err_disable_clks;
 
 	spin_lock_irqsave(&host->lock, flags);
 	host->runtime_suspended = false;
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	return ret;
+
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
+				   msm_host->bulk_clks);
+	/* Only drop the performance vote once the clocks are off. */
+	dev_pm_opp_set_opp(dev, NULL);
+	return ret;
 }
 
 static int sdhci_msm_restore(struct device *dev)
-- 
2.43.0

