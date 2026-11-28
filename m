Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872239;
	b=MYNHF5S+olxOCA1Jm1B3EWis69OuEYxrGtHvQ80JI6F5vjZlsA9Yxb4pQvSmv4gWNKkb
	 55ELSmEgbEGa8BJxVBPB/2oDOEG+d+BCIS/rUaJyaBB3F9jfWtbELNb/kmSnnJUGyffkB
	 m1rbPjUJcvHxa+V5/3FLIs6OOj9SYMF6uLlVP9YN/uZpZgWrA3Ty2hyd6FNuh9T2vpi6n
	 Ims9mvuZmY7FfMeQfqynyrO/Ip6xyljK7jctgv+vrfbNgERz/jq+PfCOlQhyVg7ezQ4jc
	 bDrlwSxcmVL4bs7va5IbfNplqZFNQQgcQ/TdSEjKXJ8M9sgV1NviaQ8jzXloerV4VNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872239;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E35p4R70u7TrgbSUaSKkoVU7X3Rp3LnYt19GghgOlh8=;
	b=d1cu114cS148oHNMujl/gSH+NLzz9bQ8Q/8bT67qj+5UHQYoEwCw4N9kh/E2bRIJ/Mbn
	 IYwOeV2rZOl2+13E6Fae0okcEfUgCsdyZkaABDzo7qDy6Co8D+zMScs5LXCCQYqPYr54a
	 Vj0Zbr3EBfEz3lf41+3oD28qNE/k6Pq2bhcuSNWtA0ygba8l/092GZyGYOHsnqRFqntuE
	 dXW08gYKFcAQfDsbvwdkwAZstjR3AGb5vk+y7EP7tKiqI3ZFZDT4AVQ7hfCwxu48BpokC
	 +JO46Gy8FNBAEApkiZ/TmZan7F+DAPy9aPgjYBEgXtmylfcXh6dYay/cRiZGBfh7T/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=avAphLJZ;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6A2606A31C;
	Sat, 28 Nov 2026 13:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=avAphLJZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795872226; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=E35p4R70u7TrgbSUaSKkoVU7X3Rp3LnYt19GghgOlh8=;
	b=avAphLJZZhiYYdt3uP2bVAxuKU1rEggB86pHrKDqtht0WWItOhHO9T2hosPsCZGJt+1LHj0dmRqSd4CdDngSx/BAO93l79leEO01R0dqLZay2EGQ3XHzxJtz6gJcr3vHyOQZtiIqeR+wCB+XGIsoYgiae4OGwSoN8BqzejPKxO4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFaaN3g_1795872216;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFaaN3g_1795872216 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Nov 2026 21:23:46 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH] perf: tegra410: Fix CMEM PMU init error cleanup
Date: Sat, 28 Nov 2026 21:23:27 +0800
Message-ID: <20261128132334.2245174-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
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

If platform_driver_register() fails after cpuhp_setup_state_multi()
succeeds, the dynamically allocated CPU hotplug state remains registered.

Remove the state before returning the registration error.

Qoder, an AI coding assistant, helped analyze the issue, develop the fix,
and draft this description.

Fixes: 429b7638b2df ("perf: add NVIDIA Tegra410 CPU Memory Latency PMU")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
Validation (two-patch tree):
- ARM64 defconfig W=1 build of the CMEM target object
- complete ARM64 Image and CMEM module modpost/final link
- checkpatch.pl reports 0 errors and 0 warnings for the code diff

NOT_RUN:
- runtime platform_driver_register() failure injection or module loading
- CPU hotplug, real PMU events, or target hardware testing

 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
index f1eff644b0ba..71b2f04b57f1 100644
--- a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
+++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
@@ -719,7 +719,11 @@ static int __init cmem_lat_pmu_init(void)
 
 	cmem_lat_pmu_cpuhp_state = ret;
 
-	return platform_driver_register(&cmem_lat_pmu_driver);
+	ret = platform_driver_register(&cmem_lat_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(cmem_lat_pmu_cpuhp_state);
+
+	return ret;
 }
 
 static void __exit cmem_lat_pmu_exit(void)
-- 
2.47.3

