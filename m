Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630873;
	b=JwVljOLEJPaYYXXFSzELbHjwUpCIe67d6B6GoKP8rgfbfAjcRMvO3TDIEKzo2WBvY2Zs
	 TbR/MokIyNncZp2BSMhiK98swsPSLQpw84rnZAhKamT2C80q8TYNByO5CNedPv9AabLBw
	 5iUcQBdJizd3Kn3UPDCi06a1n7PClti+6s6bd7uK/di8qphcwtBqw+/TVp9N0Nkc4DzXj
	 OSXA2Gtf1q5tnIPN1qxwZ/xUCM5soay6IJutViAGkaWsP0pYjSrGBYjWKOMi43oCpNXGV
	 2M5mafz1Yn9TdRvbGtPE1M2L/JBeIbA9uYlwm4qhYQedog7Z9j3LuFvCkOD33fKx0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630873;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
	b=vxA7it7Uz1y2LVT3oRF0NsG+oxVCC6/BPvU7vGP3GECMgPpYLU7WdU7C4hyAYusdZwM+
	 BrMe1L1c/9lZl9kTwy/A/u3jo2EsWbcDAJfo/djA2zlDUjDtgwin9mKya7HhBW4AJ4gRB
	 lnON5CMU0pU7IVgWuHcrAPXNqm1n2QY5mDWyJwx6FKMb9Rnvu7SV7LRLQn3xtoU8YwXiV
	 1WlyYqW1NRB76NFS5QbnHyrS2rVTAw2M7WJkkXT/3Ce32a+7OJ+zTPcSZy7b39uArks7m
	 5+N/KbpoQouflq8MPe/4xzz+YrV/Uh34BGaWB/EJwkouhxVcsHriq3AHjRHapi6moGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uj0GcKVj;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF8606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EF8606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Uj0GcKVj
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3552551a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630872; x=1796235672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=1JO3/pVNtFi6VE3YA5abe64iN+1VZVm1Z0qsTt/nKBo17WuyDq39/ul+K16Z+H18Ny
         miyjhiVps1wQWU9TrLf7I2bNhs/bPwLQsmSauz4EsqikoYUQ7K+NQFGqqVNkouokorwg
         WndQnSicW20VwbJ6IMlKKF5/7vPUlOprkUrI68Bpcx4yhdW+gzsm7URy/q+Ka+LpmYQU
         MPG3PMiOdQPoLYcz9PMFRNTaMazXAa+htyx7eRU4jtbWqACEU0paYOCwELcWhpDCHYUm
         6MQCaP6hbygkeVUU5l64PuS5wqC7j61uQ3fvuXuLsSO6D6GHcRgWqdrVDogB1lh2ni6N
         NmIw==
X-Forwarded-Encrypted: i=1; AL+hErESms4+OwFn1niMUpzilJ7wGKZ/URI6TlGjUc5eMK8PYBx2TLy5ndt9M468XZQrja/ouqzmF+tTnyJrt0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sa82yYzG6cF+mgZExNC4T7tlMyD5GPxlqhfkgDdwZFM//mzka
	i7BntlmOsHXi+tJ+h2MrzzUj8KNqQrxmnq6BIj3JbqejrFkqFEFEMKR5GmAJ95c0jZobFkVgm5d
	zhdupUEvk7tAuUtihOB9CHRw2vxcNmqEANnVymU+xdtA0VJxCUJE1aTlUhoL4P1ihmWx6i7lYf2
	ZgOcT34MzV26R0abVu222hKIlz82wZ7SShW/M1aj4t/j0eAx3AlJ00m9HRNRgVMZtg5W0QhUYuV
	RPdVlN4ikYGEf9z
X-Gm-Gg: AZFdTZfCTwcfSCHnAsyd15WwU5NTjXcWmsdW0swors4u1LRV+a74ZTV9QxQ1UYJkJ5a
	DFqvR6pI8fN8or6qTVgx0xe6xHw+QmUWKW6SUbgJtfc1OVgFt5H/HqyF0f6CrXHmE4/LAmkmuVT
	lPerAhPpzhSt8zPQNtljvjZ3iYZmZNv7v1JkiwwTfL2rI7F+803OlqWH4k0amq9iDkBtKIV6ux/
	5nfG6A7clJtJ/LjHquixKkffOkjFiqvPTMe/H4N4jjdpzFrDlvorrhKN9Y1qou39ksUPRWSfFJR
	aQ63g+KS/tVgoay/fFU37SKqHPToqLr15NhYJcT81L1undDrRG8IdVtR0Y45ybemx4MbynRKOqd
	e5oJX4CiOSKHooIdkCwnTlkDHcoRSlnb2Ezkp2rsTHZoTYY9blg4MPps1CGs7ZJmPVaOFCXbn4y
	nSkYNyU+hlQ6TBW4JyuBZsPmjeSLVIKdv7
X-Received: by 2002:a17:90b:2e4b:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b41c8e0ce5mr11567535a91.10.1795630871591;
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm12908116a91.8.2026.11.25.10.21.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso1154662885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630870; x=1796235670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ancN5tYiJUgiK5oPhN0zaXHe/997SRSIfB0LkRBNW4=;
        b=Uj0GcKVj1kydRE6V9xgAcU/WoRE9v88Us8RI3YRc6Lx/Et1tD5IuUkMcAqf4ufOdmL
         OZV5nEldxLGUdU7LdlKKOC4fmv8KXXXM40KV68i2EgpQJlI0KjIPvNMy3cYBb3vnWWMM
         aitJaap3SMZm/Jvm0inIbBgEQ7HfQziCAkKnM=
X-Forwarded-Encrypted: i=1; AL+hErFmNA4iTa8IHw3N5zmJkSAHMwvq7kwyxWZa3uYIsivoq1ep0qU0ZSQ9tOM6uLUsbcQKx/xDb2SJI97YegI=@vger.kernel.org
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr3447623685a.6.1795630869603;
        Wed, 25 Nov 2026 10:21:09 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:5c18:5347 with SMTP id af79cd13be357-949b340227dmr3447581885a.6.1795630865589;
        Wed, 25 Nov 2026 10:21:05 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:04 -0800 (PST)
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
Subject: [PATCH v14 4/6] mmc: core: Split sdio_set_host_pm_flags()
Date: Wed, 25 Nov 2026 13:20:51 -0500
Message-Id: <20261125182053.3915833-5-kamal.dasu@broadcom.com>
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

To prepare for a subsequent change, let's split up sdio_set_host_pm_flags()
allowing the second part of it to be used as an internal function for the
core.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/core.c    | 10 ++++++++++
 drivers/mmc/core/core.h    |  1 +
 drivers/mmc/core/sdio_io.c |  7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 677e445dc48c..6cbb5ee6200c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1422,6 +1422,16 @@ int mmc_handle_undervoltage(struct mmc_host *host)
 	return host->bus_ops->handle_undervoltage(host);
 }
 
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags)
+{
+	if (flags & ~host->pm_caps)
+		return -EINVAL;
+
+	/* function suspend methods are serialized, hence no lock needed */
+	host->pm_flags |= flags;
+	return 0;
+}
+
 /*
  * Assign a mmc bus handler to a host. Only one bus handler may control a
  * host at any given time.
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 9be2875608ce..d3a2ff00b18f 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -64,6 +64,7 @@ int mmc_handle_undervoltage(struct mmc_host *host);
 void mmc_regulator_register_undervoltage_notifier(struct mmc_host *host);
 void mmc_regulator_unregister_undervoltage_notifier(struct mmc_host *host);
 void mmc_undervoltage_workfn(struct work_struct *work);
+int mmc_set_host_pm_flags(struct mmc_host *host, mmc_pm_flag_t flags);
 
 static inline void mmc_delay(unsigned int ms)
 {
diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
index 12716ec0e35d..99f857514b63 100644
--- a/drivers/mmc/core/sdio_io.c
+++ b/drivers/mmc/core/sdio_io.c
@@ -726,12 +726,7 @@ int sdio_set_host_pm_flags(struct sdio_func *func, mmc_pm_flag_t flags)
 
 	host = func->card->host;
 
-	if (flags & ~host->pm_caps)
-		return -EINVAL;
-
-	/* function suspend methods are serialized, hence no lock needed */
-	host->pm_flags |= flags;
-	return 0;
+	return mmc_set_host_pm_flags(host, flags);
 }
 EXPORT_SYMBOL_GPL(sdio_set_host_pm_flags);
 
