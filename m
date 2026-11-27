Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786280;
	b=Vj3OipurIlN3aaTaGUohlt+33XaGAiw46Um+qWOod+Pha/Z3YVNPVoDawgNRNB5wEiyA
	 d6aeJ3hKoh3ULjzY269FHFmMjMJu9sLrSy1bintCim3D59b8/aw+QC+cKQ7XArtWgtM49
	 XD6y6x7SKgzP4PRESKfHI3tLFx7to7kJLBJ/EksWfRe2e9QvnG0fbMc+nLNiXsu+c+LBU
	 wB96j4bZSnIbIEn0zqqkrb7XeemGR4DfkR0iyX4qJQlzbF7XMpEptWz8d00jHBOjWzrUG
	 KcZ4m1Roir4a+BBeVBdgf7s+OjZnmQb/T0aKC1jV5eLtWB7eHWo0O/E4HEiXcvYne8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786280;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=aA/dQ2m8MP2DvnhHqLbRZoOC81lgm/NuCGrXryaOxfU=;
	b=GFq2EcYinjcC7ZHrmzoYuPwzhPK95Q4vF7kUOm2QwACFH+1ejK6mOrQcUsXzGOcphaVx
	 JH+sEcUttYHsVx47UPQ7YOPgUJdpdW/ZzSO4/XswlcI6e837kD2F4Z3nns1nb14QvYiU4
	 nCVHI8Llj1DexMB58vxIu/t00dHT9zzAhnk6vElG8UP1jjBnkWtVqTYRzjwVUwL6PBo2f
	 ueCwIc141tp6SfviV8+jQWLCEcvvYRya6CPaJ9mTTqX0g1cBncoJIQ3SZDDHXBujqj1il
	 97q6YDXGf7GCAShrJ+40EIBZ7SumwPtLM224uA1flaALxRr/QFAModiT9KAlcBh0dPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cdbtzyef;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F57606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F57606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=cdbtzyef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=aA/dQ2m8MP2DvnhHqLbRZoOC81lgm/NuCG
	rXryaOxfU=; b=cdbtzyefGRV9BIW2M3hsUvgH+k6WaJjZKbTEu4gh3W7WPGNDQJ
	CxssMdC8xp89RA8ErvsDzwrvjsftRiAo0BsYboEDCVQwvZxQH8jkK5hHiY7Ip9O0
	Zd0UNEIaxSpiANrRpmmWN7FGA/BKWCH73pHn57ehDsG4sLaKHcNgvmObU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXI0jphQlr2eQCAQ--.2853S4;
	Fri, 27 Nov 2026 21:30:24 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] coresight: tpda: add missing MODULE_DEVICE_TABLE()
Date: Fri, 27 Nov 2026 21:30:17 +0800
Message-ID: <20261127133017.1606830-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCXI0jphQlr2eQCAQ--.2853S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyUGF17CFWkCw4rCF18Grg_yoWkurc_Cw
	1vgFyxZ34kGr9F9F1UJwnxuryxKanI9rn0va4qqFyfAwnrZ34fAr1vkrWxAay8GryDXasY
	kr1DXrs8ur4jyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2-eOUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAfsq

TPDA is an AMBA driver, but its ID table is not exported either, so the
module has no "amba:" modalias and udev never autoloads it.  On SM8750
five tpda devices stay unbound until coresight-tpda is loaded by hand,
even though the IDs in tpda_ids match.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the commands quoted in the cover
letter.

Fixes: 5b7916625c01 ("Coresight: Add TPDA link driver")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 89c8f71f0aff0..5d622d7b88f8a 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -622,6 +622,7 @@ static const struct amba_id tpda_ids[] = {
 	},
 	{ 0, 0, NULL },
 };
+MODULE_DEVICE_TABLE(amba, tpda_ids);
 
 static struct amba_driver tpda_driver = {
 	.drv = {
-- 
2.53.0

