Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872259;
	b=bFTsKWB8R3Y3Yjxl3uxdi/DqHDGCTZMsoTWsKloXgkY5N2nnHk/iDGc0bK5FROK6DW+z
	 P0qV64EikWoQCxkp2uTq+Nmsqr0Zt3/k6HuVc0MJYIqOGjufkeXpltP032R+1sGkNIYoR
	 N4Octa67CQXBAK4Qe8cIWtkTcf05AqU4HoZL+3ofshmtj1nT/Bhh19kI0qbVydgoiwCZp
	 FVdIgqQK1DiQx3MEdAdLSyRTGp+ndIyjlM0Iqxe6RXSjg9m/Ou4YkU5ArMGeDQnxuE7rZ
	 wQnsVeR8RZI1IA9avUlgjVyjWzmj57BWOJr44T+S14jFoS8Ma30kKJJNkohcdKdIe9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872259;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mv0YhMwlZaVJeB6/GGNwh8usC8IciHc2g8crk5dxwmI=;
	b=gXzxEerP82BQiCVVgrKGVP6tkMv2FdYP/5GQ7pS4Fbcvg1WHqih3GzTwuT0TRaglgfhx
	 WJIUn7doIZ1QDj2NJDN6VVZNpaVtjoyDIERSviHbtN89iIOZ7LNISJT7c7dVfenQ/HeKb
	 QdvnCI9YZqPEidoxMWsHDLVYoo9lfhWMIHwnBaSObxiroG0bCmIrQc+y5sAq0HkE5L9t4
	 OqzuuwkfpNK4zMC5wPjow6zNixGX3hbgB+IWmYLjfLK9g7oX+ELecE17Nqwa4Sy3iISe4
	 BnNAHit2Wao8a5sQ+neoRowJf9yG7m4RRzsuNI28O9h+dQh6CDzbOJVAlNVn2SMoP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=P5mykU26;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BEF606A31F;
	Sat, 28 Nov 2026 13:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79BEF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=P5mykU26
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795872250; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=mv0YhMwlZaVJeB6/GGNwh8usC8IciHc2g8crk5dxwmI=;
	b=P5mykU26mWUpWflgN0yOXxSUmit8tvVhv4cDC1P/k98yEfPsc3LD4VDyTKbZ7OX3Yn7pXELts+0e3zVnsTBbYK74a1Xsgb7kOYRqzDah0clLPHP+FrtOfD2GRSA24FKnWJ26KPZsbPYMyW1HZNFzsFKHwK3sL4l5heidBbGIbNo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XFaaN8H_1795872240;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFaaN8H_1795872240 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Nov 2026 21:24:09 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH] perf: tegra410: Fix C2C PMU init error cleanup
Date: Sat, 28 Nov 2026 21:23:55 +0800
Message-ID: <20261128132359.2246185-1-jiangtianfeng@linux.alibaba.com>
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

Fixes: 2f89b7f78c50 ("perf: add NVIDIA Tegra410 C2C PMU")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
Validation (two-patch tree):
- ARM64 defconfig W=1 build of the C2C target object
- complete ARM64 Image and C2C module modpost/final link
- checkpatch.pl reports 0 errors and 0 warnings for the code diff

NOT_RUN:
- runtime platform_driver_register() failure injection or module loading
- CPU hotplug, real PMU events, or target hardware testing

 drivers/perf/nvidia_t410_c2c_pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
index 1fc2adeb7195..d6e250fb1141 100644
--- a/drivers/perf/nvidia_t410_c2c_pmu.c
+++ b/drivers/perf/nvidia_t410_c2c_pmu.c
@@ -1034,7 +1034,12 @@ static int __init nv_c2c_pmu_init(void)
 		return ret;
 
 	nv_c2c_pmu_cpuhp_state = ret;
-	return platform_driver_register(&nv_c2c_pmu_driver);
+
+	ret = platform_driver_register(&nv_c2c_pmu_driver);
+	if (ret)
+		cpuhp_remove_multi_state(nv_c2c_pmu_cpuhp_state);
+
+	return ret;
 }
 
 static void __exit nv_c2c_pmu_exit(void)
-- 
2.47.3

