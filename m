Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=46ziK/x/esP5ERzI1nss975bA4hTLA31S8HnwgzJxyccYMOmwfMmSvCrDD1NrUf1VPm5
	 +jqKYvVptwSKMkFh9GX2uDvntei5cSdGtzpKgHGPhCOUFBm9R7aIrMOTCGAy/KOfKejC3
	 v7w65hsALdXj6OX3Bg3teE0+a69gtpT/SkhyeBIY8+iScF79ow6P3X101J2f2udxsZssh
	 a0vJbYZqFkLftJwrM3EeW3tHvL6VwRPwXnZSpUToJngfMjsO4Anr8tQPX99F4mPN4vu1O
	 KvBF2LmiHUJERr/N7AZvimE9GU7Uh4FyrPj74lOvFItoQlP1jE8dsNZNyk1xNljM0wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eXwNm4f1iSOp1uIbGh1LM/4A3sttFi1BOEQD0XNPkUE=;
	b=ghdd0eo+NiOv2IiWd2NoPWV5Zw0fHxPC94u4C/+hSpMJc0wAhQQPMrccPEq3ZfW4tvzS
	 iyWy2W3qeoDFKqArsWjjzYe2t/o4KlSdRt0zvhAFdHpbZdxtihaX7e2y4qs5eweQgrQcz
	 57xEey7FYpmmCx5808ATSwpQIyojY9lUBYQtN7sSGrlcUeqvn0sp1IGiysjSq+MoXRRuV
	 XbFsTp2CibKTPWeAOsyXs9V6PZjigstSkSSSu7qB2RuXT34oOeIfl+6aM2aiXmuidqPix
	 DlCv8PdBzxc0898DETJbt1PiesArTCEzgrTsBSZhaNnHnd2OuPKX+6wc3i2RBswbsVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pBLaNbHq;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C48B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C48B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pBLaNbHq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=eXwNm4f1iSOp1uIbGh1LM/4A3sttFi1BOE
	QD0XNPkUE=; b=pBLaNbHqwRH/BjI6bcRQlC49yaG5wh6v/6QMToK79Y8d0HRosa
	sV5GspoKN/KelyAb9dLgm7dI9i07K4LBbmAS5jUl0fQsoGmkhiGTyv+ycC4HqA7a
	rSV01E6+KsyktbfNUKNiTl1n1P6ecZLpppDQzwYg0pNHqVfvMF6gtWnuI=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEgZaglrkHICAQ--.2585S3;
	Fri, 27 Nov 2026 19:31:42 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] coresight: ctcu: add missing MODULE_DEVICE_TABLE()
Date: Fri, 27 Nov 2026 19:31:36 +0800
Message-ID: <20261127113137.931578-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAntEgZaglrkHICAQ--.2585S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DZr48Jw4rGr15WF4kJFb_yoW8XF45pF
	4DK34YyFZ8Gr4Fva17Jw1jqFWYywsa9ayFqr15G34Uua1YyryqvF1xKw4FyrnrWF15Grya
	kwn7tryqqFZ7J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joYL9UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggANs4

The CTCU driver matches "qcom,sa8775p-ctcu", which SM8750 also falls back
to, but it never exports its OF match table.  Built as a module the driver
therefore carries no "of:" modalias, so udev cannot autoload it when the
CTCU device is registered and the device stays unbound until someone runs
modprobe by hand.

Seen on SM8750 with CONFIG_CORESIGHT_CTCU=m: "modinfo -F alias
coresight-ctcu" prints nothing, while a manual modprobe binds
10001000.ctcu immediately.  Add the missing MODULE_DEVICE_TABLE(of,
ctcu_match) so the module is autoloaded like the other Coresight drivers.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the commands quoted above.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01e..a7caa5b00b6d1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -295,6 +295,7 @@ static const struct of_device_id ctcu_match[] = {
 	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
 	{}
 };
+MODULE_DEVICE_TABLE(of, ctcu_match);
 
 static struct platform_driver ctcu_driver = {
 	.probe          = ctcu_platform_probe,
-- 
2.53.0

