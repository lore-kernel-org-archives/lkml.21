Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681542;
	b=QzyJbfkH9uFRhkkJpudG3EgmAEC+hUTkzgbMqWqO5q32xFMefbwIRDfh3GbJnEehj9g8
	 Krvf/XAb//4qiFGsYUbuDXSbtgopDMQUsUf4MwNwrYaBD2cBakcM8QUsVEkscg51D/xp2
	 1dTuPW+ClSt3M6q4mVlKIPODU+dLO4wn1RGVF6j4frMLvtQEMrpqFJEsEfsRQNI04ncCI
	 Jt5Ur1kXr3+TtbACXWetOGsRWp3qYpJMq1DoT+Ic99/H2Ji0Q/WplNBBbC37Y5FS880KI
	 lVy1M7Ur4yWfkGa17d92eyssUNECCr1YU4YMMJkcDXTy4p5W5EZz4lHRlaFLGXYUF9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681542;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=pV34MEjJzIXyAgSSzoHes9E3PzUVQjec7W3fcI+egbM=;
	b=3tDtSRdlyTrplbuXKgMRgeaN8qVtzRfLKqIt+6DwytAcRHN+dgj7uBPVx3DOglpgpfL1
	 MAwhgQuf0XwXQeL51a1L9UNzwD9aEh2RSafdLfssrq0c9163iN3QTSN0UsNi3g1pD0S1N
	 qS/jW53GUDcygi8TZa92tK7RnnO3Rnu7xOIvhJeEKeoaCkGfr7+0YL4LxFoJKinfSoZGG
	 qwqoPsr0/KG17imNUm68xrn3YnIdbUemp5gtObg7u7DTPC/8wHNomo3tSlEiuIyMuWQXw
	 cQwzzBtlncbafylRaSMBM8ZcuO5eANqUC3o6toA/bPW0JWwh7SDfzxrml2AsR4YpYOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=USyCG1e0;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFF606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDFF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=USyCG1e0
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5617268cc;
	Thu, 26 Nov 2026 16:25:30 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] extcon: max14577: Fix potential use-after-free on removal
Date: Thu, 26 Nov 2026 16:25:29 +0800
Message-ID: <20261126-a35bb25eb5-u60-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f5b27e03a1kunmdeb530e53c2916
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUhCVk9NSUpPHh9NGkxOH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=USyCG1e0Xi2ORcXzUlEVWilyMRRTGKx+5w5zgeRujvQ++hcad+IubLd6JxKOffNK7JnmWyIuOMOqA703UuMS7Beb8addgt5LcZBPNY8eueSyHMq6K50fZEiwPYvRTftn/5a59Spdc+K6vSl1IJMvjS/mE8Jh+jIognhDjKAPIa0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=pV34MEjJzIXyAgSSzoHes9E3PzUVQjec7W3fcI+egbM=;
	h=date:mime-version:subject:message-id:from;

Probe queues delayed cable detection, but removal does not cancel it.
The worker can therefore run after the device resources and private
data have been released.

Use managed delayed work so cable detection is cancelled before its
extcon device and private data are released.

This issue was found by our static analysis tool under development.

Fixes: 962e56bfcf0b ("extcon: max14577: Add extcon-max14577 driver to support MUIC device")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/extcon/extcon-max14577.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 7eefc13e9f59..dc13f1997f41 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -763,7 +763,10 @@ static int max14577_muic_probe(struct platform_device *pdev)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, max14577_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &info->wq_detcable,
+					   max14577_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			delay_jiffies);
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

