Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385922;
	b=lKfFMDTAs58CCKtJXsWaJHJ49azWv88IBaau+QfqlLgL+6LM7Vnc6Sp4604xf42yXVxO
	 Yszz1Y20xZOBM1WTX/IRkzKR3qhdbd7YgZORyxg14uf6s3tF0eO/GyZ2P8pG3pRFFiXxt
	 h0hOuqk6KuIufAeZ1G6Bb9bZMz73h17LK7QrKj1ig//UcT+7pkXbgjdRW8nx0E5/7JetM
	 N33kJbh/rgZcwdak9GyTXkyEgHhfecHfRkv8akdnpf6P60ABel4JvQPvE/IxFkNlLRK41
	 a2Bhi2sGQm+iguMid1JPot5qGGKg+EGJ80u7z9xaGZE107EltbVJhRsZ2cEvBd7dnPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385922;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=p3q0sdxZScVzPT5Vw53EcAXgBqUf1uVRAaFg6PnqX7c=;
	b=R8j+3mNiXbeVXJAa63DR0UugJbUwyblaJzEKJi3A8Zem59yCWVco/24OiwRYkzZNfhTT
	 ZWewPhbOK8zud2D7X/BTukfFrwypJj6nOFjVfEkYxgwibl0t68sAlULKpua2nrzEpyBd6
	 mJuasLZ/L8bvX77NF7P/8tPS3W+JmOGMxF4zT2hfX+Vl0MZj1cmVEMvRpO8vvsPDd6nr2
	 2LL6103ukLIcqxaOt/5AaUKsf8fDiEMtfcrlJY4H/h5Sc3YdokOQc5l3zK5LB6uo6SDNX
	 c1wsM5BouUUe93BnXpKx6QjlV0AqhoAlMlP6KVT7o7dNwKOeKG/mwY/UnUwi8KHZ34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=EN8JIzyh;
	arc=none smtp.remote-ip=198.54.127.74
Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FE606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C8FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=EN8JIzyh
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jXk406yWYz2x9D;
	Sun, 22 Nov 2026 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795385909;
	bh=p3q0sdxZScVzPT5Vw53EcAXgBqUf1uVRAaFg6PnqX7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EN8JIzyhDUkEepzXyqoGxurZsV4ANxDQ8exo1z+j5Ul4l8ND4e0r9BeneT0D7Zcte
	 R8XiJPoRvu/CWf3nOdGRK/5/yq3WWh9siZGONHNUypkuLr9w7K1Wr3bVOxxqkGAdae
	 aTUB+0BAA2eGScveHZK1LCgP2d5bxZGxudAHP5pfIfzzUnnmauemOOFBqH1s5Jw+lG
	 FvlHPx1JDX7D3oyW6dWTG+bSJG6EsUJ8hJPWfQRwySkrOsLtJkF0dSnJlNvdymdIU1
	 BmtV/XM01115ooDGd5AQ1+yRXYMrM7E4PNmnJtL/nb+TLbeRNurQYdHXxcFz/6a2Zj
	 Ra4nLlWTfiYQA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Valla <francesco@valla.it>,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v3 2/2] remoteproc: k3-m4: Enable crash recovery for a core Linux booted
Date: Mon, 23 Nov 2026 01:17:54 +0300
Message-ID: <20261122221755.88160-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122221755.88160-1-dev@chrispinetinega.com>
References: <20261122221755.88160-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

The M4 driver disables recovery, but nothing reported a crash to the
remoteproc core, so there was nothing to recover from. Now that
RP_MBOX_CRASH reaches rproc_report_crash(), recovery resets the M4F and
boots its firmware again, while Linux keeps running. The stop is a
plain reset, so it does not need the crashed core's cooperation.

Enable recovery by default when Linux booted the M4F. Keep it disabled
in IPC-only mode, where Linux only attached: recovery boots
rproc->firmware from Linux, which need not be the firmware started
before Linux, and nothing would tell the user it was replaced.

Userspace can still change it through
/sys/class/remoteproc/remoteprocN/recovery.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v3:
- No changes.

Changes in v2:
- Keep recovery disabled in IPC-only mode, where Linux only attached
  and recovery could boot a different firmware unnoticed. (Francesco)
- Retitled from "remoteproc: k3-m4: Leave crash recovery enabled".

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4c46f4a25..b2a187ea4 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -56,7 +56,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc->has_iommu = false;
-	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
 	kproc->rproc = rproc;
@@ -105,6 +104,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	/* configure devices for either remoteproc or IPC-only mode */
 	if (p_state) {
 		rproc->state = RPROC_DETACHED;
+		/*
+		 * Recovery boots rproc->firmware, which is not necessarily what
+		 * was started before Linux attached.
+		 */
+		rproc->recovery_disabled = true;
 		dev_info(dev, "configured M4F for IPC-only mode\n");
 	} else {
 		dev_info(dev, "configured M4F for remoteproc mode\n");
-- 
2.53.0

