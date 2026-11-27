Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=onLyzucCGcksiehHrvRLq/qObwzUKEiChW/D6t4Gkt6ZPgT/JhbD5KcJ/ZcpC9YYiPJu
	 pgcNuGkUWm6Axnc57a7+qv8T+H7Vt62nS+HuJsL3Apcj6pOmQnCP1jK7BLtqftwwToXvf
	 MozCes+yqlrYpLKp546eFzehU5OAUVBvGHJ6hDh0YJe/Cd8EGtmg0R9n/JNxe/t8wKU75
	 AZodITo5QCvxVGyvOALerd69jPGKmIHrqlRWPxgGz0U6q/Otdeh3j2Wifbrt4zs0SW5Zw
	 bhLeIdX/CCFRfZ8KShwwNfJspNUJ52YHd2MYyzc5KFPGCC0Pb/bQx03XuU/xvGT+Gug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=gC7ZC+mCLFfmVj6xPvyR2AO0FsDDqIFxhUG7A+5RKYA=;
	b=3CxtP4Lsp6aelJAuRzixOuO3Y4b7EHa4SFoCS4KfJZQEtxwFLBYz4o6XMcepykZf3Yex
	 /jPVDtMHNt+QiZ1DknDcUsJLUERJoMck/3csJI0aKhM6aJd8yQFTQytUE4tZlnyuCrske
	 XRFD9Mk35VGW0THs7fugMTZIiQ7X9UterdDPdzwh3W6HnR0hTQGD5AUVkltoSWuHWAN0W
	 lJYOBS8fQxTIUn/OzTG+VrDaPFpBkWY3XOyZgmfbjpNxV5BudJmL5jtzOniSBs6+cjNFv
	 LxI8/TDxeFUe1sHLonpMpZhjTUQkQSAmVAs1Lr9HjnygJUl+PIRKihgZU+WUPDyLtrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=WAhcfjHb;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C46B606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C46B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=WAhcfjHb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=gC7ZC+mCLFfmVj6xPvyR2AO0FsDDqIFxhU
	G7A+5RKYA=; b=WAhcfjHbU42eJbosOS8dI2rbf07OJGiV6GbFa8p2eJbLKENIm/
	eUVFSNm3BjXrK1UekV8kjGvcX5ZWhRdbjWmzfY8/jevBcUuwFn279GZ+MoNtDGS3
	XUSTkGVRuDgrTb81jKrtw+g3b3W31y8UhRqYwAMCN+3mKcPyYLSFahGqc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEgZaglrkHICAQ--.2585S4;
	Fri, 27 Nov 2026 19:31:45 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] coresight: tpda: add missing MODULE_DEVICE_TABLE()
Date: Fri, 27 Nov 2026 19:31:37 +0800
Message-ID: <20261127113137.931578-3-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAntEgZaglrkHICAQ--.2585S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyUGF17CFWkCw4rCF18Grg_yoWDuFg_Cw
	1vgFyxZ34kGr9IgF1UJw13uryxKanI9rnYvFyv9FyfAwnrZryfAr1vkrWxJa18GrykXasY
	k34DXrn8ur4jyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSkYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0o7K3UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAOs7

TPDA is an AMBA driver, but its ID table is not exported either, so the
module has no "amba:" modalias and udev never autoloads it.  On SM8750
five tpda devices stay unbound until coresight-tpda is loaded by hand,
even though the IDs in tpda_ids match.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and ran the commands quoted in the cover
letter.

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

