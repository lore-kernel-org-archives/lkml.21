Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001076;
	b=jarZ9ec9lSHm0uudLcz2OIyLEmySTx3Nb0CCrPf6vU+jmeXAjAMbb1dpe9JjYHe2WPTz
	 HB6sSYa5HNMEcGHEXwbDhshKI59eW2bulrmSwpDXRoBFOoMm8fAdfs5l3hv/4T9aPK21s
	 iqzB8tk8B0on7vEvDZVrjG7XzNKSHfpdbrCq9vvMAb3Vx21/AmFdp8xfDfBud9yYAd6wp
	 2Ff2EwQ00uTmO8tww/FrfwcrHnxu2rqyqT+TDLCD9l5vO/2H/x9RFwhLJDGXL1HvL/TWJ
	 v9oUBsnjSl0FhzBL377XdazCMFwSfbCAn9Ih2KfUOT/LDHv6qiXCjVvM0RevAuAv6Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CTu2kT6vY540i2vTNL/lOCMqwCzR7YfsabNtoI8JhQ4=;
	b=z7pOL3ho9nRyXGBF5c4A/W5aedo2NzrwOq7UP+iGRiPDZWLi/8OTWoQVY7a+9bC+/dTx
	 k5u45NRCJc+YWdKJBWQTjSs0AdYGGPIi1ZziIUp3cg3r96SWHpVzPOVNeVTG0MrsFA4a8
	 IfBWHPUB51uw8x3WMREDE6aNODhpBZy0d9nJL6rAlHd+NQOHXAAgrZhy9gaAnouANFQAd
	 tZSoE9G6d1VdEy8WsfLOSpc+1DkZl3OrfELkBtDQ7UNW4uEqTPzU0JPcD2J5/yBF30xoy
	 NPYL2g1sv3NdobNfEjYqAzURBce/YYY8gXWiMmqYeIPY7hGsl9x8tEl1DJZSS3H6C8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twWyIZ55;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C0A606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C0A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twWyIZ55
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso437792a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001076; x=1795605876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTu2kT6vY540i2vTNL/lOCMqwCzR7YfsabNtoI8JhQ4=;
        b=twWyIZ559njProg2yWQj/3Vnd7aqnM2sEXWgZyP1xXIqbTU31t8H7KzEvl28llhVKc
         ZFa7PVyLz1MXv5/5aGiqXyGo4cRMUZWeNXl/0rbfp06StiW2GeeNOLz2visK6L3oFktZ
         y5nGEPhOWPDIosfB1XftFmA+9BGwMwQOxh9p9jUfb6D6esytjhvblQx1Z4Q4L2huomFn
         bf5kfH0bb8rwnnRn192bXYWHfwwoXX7OnlQkui+GxuThTd9Ph4NnmcUhjN5kIcWs3yKQ
         Q5BokV3DTjDsk1XVrA4LcbNI5jzmrAsgsaz06u0XONnfABazZhKRXRstyoGrJn58XhIp
         MsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001076; x=1795605876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTu2kT6vY540i2vTNL/lOCMqwCzR7YfsabNtoI8JhQ4=;
        b=lTozG7ohPLFm8pyvoH4zu5wGwEwsxhw8erKfxEuZOQeJ30EJ52sUj2yD1MqWsJWqsK
         LsK/L0Ebl5eAYtx7Hj36k8jsSp3aVBKAMXWqs6f02nMsRb6pO18yjGSbShWYm0hR6Kew
         RnzA7NFCPWAsMp/715PnxEJn4/gk0nAykbr2itOHFmjQTH40HxyehzvdQkoDuct7vtvE
         TaanVCeCm0FMq7Ute9zdsBfcKj8SJ9ml8sGWEiYgtNFkfISWCDYQz/jVCf9gPhUJeJYT
         xtHY2BWKrY0kbqtBn/R8a8ziav9TASkMOYS3Ca9wTzDf1b4grDcm7YzktHTrUgxZbX9X
         QCbA==
X-Forwarded-Encrypted: i=1; AL+hErGL6mzYYyYDV8PFooCEhF9ag4e3wQmshcmkOi9FP88OSwhBBQqw0oBsyyoCIKyzTzJ28CmfGdh6EhvB8O0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uqv2nX2gUVucdAzfOxATBZoSh/LhExOOUhzqrjt0NjY2pP9SB
	+dJn6D5UpzpsCxDS8fuTqiVsXJzUbtPVsxKQJnUMbajHv3gxHMT4Jqku
X-Gm-Gg: AZFdTZd4FRKyTlRyMIJd1zCV9G2GJZJ1e8XFmpcsCbNypbPMRnOCnsOo3N6wqIztpCQ
	KKEIrl8oFfSQ4OOSLPcnJX2qnkYLTrTS3Zs/G9XqYIb0m4KTqKNA6ogArmbSXlyAEM7rgR7Z0+Y
	VgK+9tP7szvvrbx3YjSwLiHpLwbOC1HQyWIWoTkgU4EsTmnv2ePXsMr3jOWkxeQ+Kk+W3b+oy2k
	b51kZPo5XRfcJQi00Vuycekq+RQx1b4XzJpoE+GC8OcZzmwf7LhUgV1k86YbJCTZreGZ7q3aNZ5
	ZqgLmX/CkZvUcHYojwdtj3kdpKHR2tOr3sAK+onwM8BBBGM38dLsjAbhmuYQ2/wHDb0ygnHtJud
	0CjHJitfwPlmeuFQ3c5wNkKEo0AhIaPncZivRR2M6PEcs5opInsT1KmRT1WazvLTZcofg+GjHcJ
	c3rofBxarcpSM1kXFRUkn2jQ8lFhJiePk91HdVMafe3O6sHm1xVPQFJIOyxYzbBZAck1+E1ojuV
	4bwMxtDujlluy1QLHu36Sa5ggdaj+mBzf/OeDakQJ9fbcR+GWnGKebe4BdWgCnXinKKDojiaWU4
	bOjttZAeRDQkfl4BNHsyKr3NcT/JjYQEu8jwjE55s/kKNAtcCg==
X-Received: by 2002:a17:90b:4d04:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b3d07597a9mr1914378a91.10.1795001075580;
        Wed, 18 Nov 2026 03:24:35 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62842b6sm11510395ad.60.2026.11.18.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:24:35 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-integrity@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] tpm: ibmvtpm: don't call tpm_ibmvtpm_resume() under rtce_lock
Date: Wed, 18 Nov 2026 20:24:18 +0900
Message-ID: <20261118112418.1009785-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tpm_ibmvtpm_send() holds rtce_lock (a spinlock) and, when the hypervisor
call returns H_CLOSED after a Live Partition Migration, calls
tpm_ibmvtpm_resume() to re-enable the CRQ before retrying.
tpm_ibmvtpm_resume() sleeps (msleep()), so calling it under the spinlock
sleeps in atomic context.

The in-flight command is already serialized by tpm_processing_cmd (other
senders wait on ibmvtpm->wq), so the rtce buffer stays valid without the
lock. Drop rtce_lock around the resume and retry.

Fixes: eba5cf3dcb84 ("tpm: ibmvtpm: retry on H_CLOSED in tpm_ibmvtpm_send()")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 51c7e2add3d2..e06c4db2e138 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -247,7 +247,14 @@ static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
 		 * ibmvtpm_send_crq() once before failing.
 		 */
 		if (rc == H_CLOSED && retry) {
+			/*
+			 * tpm_ibmvtpm_resume() re-enables the CRQ and sleeps,
+			 * so it must not run under rtce_lock. The in-flight
+			 * command is already protected by tpm_processing_cmd.
+			 */
+			spin_unlock(&ibmvtpm->rtce_lock);
 			tpm_ibmvtpm_resume(ibmvtpm->dev);
+			spin_lock(&ibmvtpm->rtce_lock);
 			retry = false;
 			goto again;
 		}
-- 
2.43.0

