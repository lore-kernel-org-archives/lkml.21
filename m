Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981898;
	b=3riDpihZoEw1iRilDFvbZlRyfTFCSf9C1c06NgMQTEOO4jVBy9wmUiodbeAHPsX3lrXc
	 ObkyUeSNgA/sFby8XGfTOc3q8kvBudg814H8tkP9C5VCfhd8D2FAm5CoMylMgBU4MBnme
	 WW4JYRT0sRrSDQeNhiWo6pVgiItrt0AzlyJCfPOazk3NWR/29JTEtn74OxJKY6lDmLRGU
	 8nIbmoxHJ/vuW/N4FyBp5bXes5n2VdTkcMAHn1SIm2FrCSFWzHzR1zJDdTIASOjI64p0P
	 KefrJ86bB4zbV9KHx9YeBcOtKX8Bu07BtJLiA3OD8Ui0bM7fyGo+FvB/qtT3l6xptZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981898;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=433+jF5VmY7mJrkGv4a5VU07RrjmRllblHsG6O6S3l0=;
	b=zRZQpR3ZXABUqGAas6Cbfs835wDolqpl2WfwcA4Ad9Yzvi4r9p7sgC3OU+SORqhepHfW
	 +cqdzFQK2R0xRytvcOsQt2EV1ipAEvJq1M2zAsfj6bXH27zA2xZInUlAoAoa9EBUyEbmK
	 pXq80d51kOXeg1YEU4Sl/NU+pEu8LQj807W2lhTK9Gr2ajF6StnMrQSOr4ZjChTqk7Yr4
	 75bjCUWyFlDPQDQAECHsLiF7HSFwIq8RpKktx7bRPrh7OJrzrcxeRko+ePreBllVwIwRj
	 MinMxWaTTY40ARnl3yygj31kfbIPJtTDcAs8s56PLHEIXo+vT1m27fb/Uaoiw/xT1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="mN7/eRKf";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60056606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60056606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mN7/eRKf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=43
	3+jF5VmY7mJrkGv4a5VU07RrjmRllblHsG6O6S3l0=; b=mN7/eRKfEz6Ngv05Hv
	B0BQRae/FVfKmuRonq5m3LnVhIzpJHl60PRlTvlA4+vLnvpL728S6XGtL/cKkgM3
	WJjBZMcJvAiir+3zceuKWvdCCt4fgaYAIJPZHsX15q8PBhJ+dmgQG3/JMTnXbiDf
	9UbgOw96xfEpYpx7Yj+3Tf1Gc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3HwjJP_1qmvfEIw--.16665S4;
	Wed, 18 Nov 2026 14:03:56 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: vbabka@kernel.org,
	harry@kernel.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	rppt@kernel.org,
	mhocko@suse.com,
	surenb@google.com,
	sj@kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1 2/2] tools/mm: slabinfo: preserve the average partial object count
Date: Wed, 18 Nov 2026 14:03:17 +0800
Message-Id: <20261118060317.1802620-3-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118060317.1802620-1-wangxuewen_ky@163.com>
References: <20261118060317.1802620-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3HwjJP_1qmvfEIw--.16665S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4UWw4fArW8KrWkZr4ktFb_yoWkWwb_GF
	y7t3WkWw4UZrs7Gw4fAFZrXr10qF1agFWjyFZrtFn8Gr1UGwn8JrWvk3Zay3WF9ayvvF4a
	qwnxtaykGF4xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeSPfJUUUUU==
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7wwdBmr9P8yjdwAA3I

From: Xuewen Wang <wangxuewen@kylinos.cn>

totals() calculates avg_partobj as total_partobj / used_slabs, but then
overwrites it with total_partobj * 100 / total_objects. Consequently,
the PartObjs Average column of -T and -X reports a percentage instead
of an object count per cache.

Remove the second assignment. The aggregate partial-object percentage
is already calculated where it is printed, and avg_ppartobj separately
holds the average per-cache percentage.

Fixes: c09d87517298 ("slub: add slabinfo tool")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 tools/mm/slabinfo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/mm/slabinfo.c b/tools/mm/slabinfo.c
index 3e62a2fccaeb..116625bd1110 100644
--- a/tools/mm/slabinfo.c
+++ b/tools/mm/slabinfo.c
@@ -973,7 +973,6 @@ static void totals(void)
 	/* Per object object sizes */
 	avg_objsize = total_used / total_objects;
 	avg_objwaste = total_objwaste / total_objects;
-	avg_partobj = total_partobj * 100 / total_objects;
 	avg_memobj = total_objsize / total_objects;
 
 	printf("Slabcache Totals\n");
-- 
2.25.1

