Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614691;
	b=FSVhFvUWRX83x4uW4D2GODbRkhpHVMUT+5TE5nfDj6Bd/88nVl8GOBaYHSM/iIYJvVyH
	 3wHWw9zCIYdwHlUT9kWXnZ8ZHIfyGay/aQUuLAQmW7btCKVKXS+oJ46yA2S0PctrL+gGW
	 k7J+S/THFGdbJsi41J4KVoYH4bfzZUvd5rBxaXyg3ikj/H0LAfHw/u4cwdXmg9UfkT3/r
	 sAHEHjeh0NBfq8bhLZtbOon2GYpqeE5LTjZToHNsFuNCO7IqZeSfbKqYRy3yZytt2T3Nz
	 bSzdkcHmIhscwx2j5SynDH00sKrbwHbsY4PtYWoD0WfCgrfRzANp/ovPRUXMNFGXbhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
	b=mHNybQLQLl/iW30Tm4e+vWvK5V7v+aptExgGOlQu34zLtIUUKYWxTZaAKN2upo/FpNn+
	 6LN+G5e+mstr7ifv/jpMmcCv6ezD7yv/KcUdEfP95uYOgLT3dNSzXDOzLlPsdKxuCXdB1
	 QGgn/iYKTkQzG7Ext7ZXX40ggwXH9E+iT3U4CZUhwTEgu6kXLuWddO41MlS14dvEZRI5Q
	 EhnbLpuAhU7Byg96UbwaFPUeWg9GHrcRIqtBVrHp92Dk7JutAwqPFezIhjCzdZruuaG+z
	 O62qx/KF2lEHUCqJ6+3e94li3r8mbjMxf3Vo7PzPgfYrkSPrIxBcgXIlQL7w1rx9VqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrw8qz7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqfKqobk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB74606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrw8qz7V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqfKqobk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mRSK4131722
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9Xgvibc
	Pxadi8NA=; b=mrw8qz7VJsviWHPggc/MnckouP9kLpy4wM3ID+zbWiqixOTp9nB
	R6rYFdgJCd1Pu0BinrYzcN31/dtipILpujVSHGRhtAuJR7rBtdfDbStVM7y/04YT
	Xix0uBww7/A4TP4BZ3kxIexEFYKm+9+3w/75QZIq57/GuH++L3ZkHgQKPUp5nfxT
	VJ3OBYR+jVJ/vLPij9tNhMFkhQbMV3QUC2SN0Tg0ylUiKKR2u4UCOCgDtxKEPNqH
	YOoa3rhzMxBFKo6qWAGwCn1qtxwxgT0Xg1py6LQE7h+6pvIPrcBA9SLo+VbhGAim
	fyNsHdn8EykbBNalgqVaqhSKC8IdZI/WcPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs44j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:51:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd652c0385bso4034118a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614689; x=1796219489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=iqfKqobk/Yp6Bmf8H4atA8P5eP6wfbUCvE+QGuEiCKLZl+jtjpyYQffg/mWCxGsswe
         6dZxyPWfo3OqaCQZAyGX3oHKQ1ufnVZvHSVJWwNmPkG54U/ygCeCRGIN/CcxwlR3+DpB
         SGQJFzNDYQukwBIJRMoZO4fRNhwzjjTUBG67VuZ7jD6elWRIaTp7CrqoR/OyrM0z9MFd
         ZMvy6WcWtRIi98RMl8YJGbpqHg9YQjk8oUhAJFMsVa/TfMbgywYzJ88usBVhtHpPD2DM
         24KV7Y8BlDqvjxjYKJI5gYR1pGLmhAQ3B9uciN5aEVgEIKyj6sqRLYggP/pFVgTEfrcM
         nO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614689; x=1796219489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKKsaX0iLIihjEs0HiQH6IuZ/cox9XgvibcPxadi8NA=;
        b=arqG+ZHVqW5LrJvf+cgmO++sfo+mZ/Ct0XhzMdNurYpzgdTMSK0vh4u8MnDaSYR11T
         rpYIVL9L44zIR0ag1RyqjRrCZsfMeOpFcvEppw4B83w9yQwUPZFKCBqXDztnJCsq5UX2
         1+xVOmzYV8Xsnf/mCfMZp40hP3IW7mYgLeOQr99Us/y+6KM0EuMsxgnTyed0hMPnv0Xa
         YBhFQPEn2hYcCxEEcOVLJhzNpITjiLvLgJY+ex2cYaJLONLeeXqEuwXH2UHK9ShuP4K6
         m1lLL1o4IcJmessMxHxInUeLuScN7WGI813wwUyhI5jxSzbNCCKcIvYgei1e1sLH9mlT
         U7hw==
X-Forwarded-Encrypted: i=1; AL+hErEvnlLwUHnX+Qzfu0c1YZ/wp/eRDwCNOj7nu8ccoS/V+M333cup0y/0DVCRENkl5/uZV06Y+hcg8PgJOxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/C/HvzoWF8OfeDbCS09QHCPMlOe2oeRBM7a/BGvpck4ANguTb
	0qm4IBhXtg1bcPnPmg/+qUYgb25xF7IqCrdNhDDjcytyRQQ5Vb8AzE+3psOtRSqcAWlqR9H8GRZ
	qyPDUjAsbpRO/Xrz5uncPhQkdiKHifnF8raAjZFMWLHwKXp4QuH/pHaveBDvA8szZa44=
X-Gm-Gg: AZFdTZf5+iAQpl+v8nKyUDqWyrjVL1D5OeLmGKFVIzbRLts6SzujXPMEm7PBKIxrGyv
	qy6bFlagWohNXunTb3BGLh7NcNKe1V7mOKb45Uht8rofdIidx0Hpi8aobuclNAwIzRj06DNMKHI
	OhRRP9G1XdvIAJfDoPaaXhj0clvqOZ5F3Jf1FKJTx4gNH2X7RAn3vJjnOI3u3GxWyT2iTMaDMi8
	fEy7jQDG3CH/nxkQ2goSEzV20n0ahU8A8miKGwmHLNACvx+f12DBEGKWp0R1eWTVDJcWQ5pTY85
	lNvWCd4pW41vUnsJUbf3RUbbvgEA13K4LbbWJfM3qWW12fKygzIIHjwPVciP5PMAZDaW6/NIPxJ
	Z5Q3dVpnaG5aJBOJDPHIKLK4yUmwwNiXDdMrVw0jK/ML6x9gXY+5WJ5y3iK0HWcnY7Pd1i63TMx
	iZfyyR8WUF5Nv+dmnh3ILyJkusUQFJM2KvR2avS+AX9mSUU1dFeAkeMcWrv/jaffjM
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507414a91.51.1795614688894;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3b4:fa3:36de with SMTP id 98e67ed59e1d1-3b41c9750e2mr15507383a91.51.1795614688084;
        Wed, 25 Nov 2026 05:51:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm27710815a91.4.2026.11.25.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:51:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com, m.szyprowski@samsung.com,
        honghuan@amd.com
Cc: joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] Revert "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
Date: Wed, 25 Nov 2026 19:21:20 +0530
Message-Id: <20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e7e2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cR5wH3shGYeZUv4u9kAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: a0cJFPZ7DN0w2f8KjiChEgHLm6Py6rpO
X-Proofpoint-ORIG-GUID: a0cJFPZ7DN0w2f8KjiChEgHLm6Py6rpO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfX0Hgl8JRTpgVa
 rMCZeOBgv42sRPz3Jyb8VktxS7brntO31kwhA2U8Df73IHPmb273Kbn2HhIpUQfjfUyftIl9WPH
 ZHCD/0wolCwvQmd7uH4czq+/7BybazQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NSBTYWx0ZWRfX56exKvxphb5r
 GMfodYus4zKBTqQ0Wm6r7s/1TuEo0+PU+2nCWWBrR+VwNEr/dNGrq9ZvqoOxF+UazmEYjLKkNoA
 IEwWeCsUAiobg4IONltXXpr+UoO0jxBeFbpE7F/8PyIMwjW8wIhWnez+7CUhEWcF5yIpoAMyz9B
 D0L97WFcWezlyHxI86lQHjgmTmG3Jgwn13FljDJ2lUvpLSB2263ZPrOwO+UvL83ccaY8mXOIHp6
 EVaDcf3yJSUkYrDLheW+ha30JlQUYusxX4O0CA/68EzxlSOkMptb/UareLdWyGxYi1IbYYpTP0H
 nIhpfn4cT1/7BI/3mBVxbyLqDdswgTMZwyUiueNNiVlzDuBvp5VGP1bpPNncTu1zhHnMujHBxf4
 n+tLYrkYu606Y15kePI+Z6TiFInCGsCAz/7sHu/F1Z4e+Dz2Y8eYBO3mN2kBgy3zlv//mqCRSqR
 vt7f1fxnjWN3rLLNeHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250055

This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.

Before this commit, dma_iova_destroy() unmapped through
__iommu_dma_iova_unlink(..., free_iova=true), which set
iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
and freed the IOVA with the queued gather, exactly like
__iommu_dma_unmap(). After it, dma_iova_destroy() calls
dma_iova_unlink() and then dma_iova_free():

  - dma_iova_unlink() never marks its gather as queued and always calls
    iommu_iotlb_sync() after iommu_unmap_fast().
  - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
    the IOVA goes straight back to the allocator through
    free_iova_fast() and never through queue_iova().

DMA-FQ domains therefore get strict invalidation on this path. That
includes the block layer's blk_rq_dma_map() path, which NVMe uses for
all data transfers, so iommu.strict=0 has no effect on NVMe I/O.

hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
	       4K pages; NVMe SSD on PCIe Gen5 x4

Fio sequential read/write numbers:
  Domain                          seq write    seq read
  DMA (strict)                    2694 MiB/s   2693 MiB/s
  DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
    bypassed (this regression)
  DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
    used by dma_iova_destroy()

Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 57 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b66e83cfbc5f..e71a10e14c36 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2101,20 +2101,10 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 		arch_sync_dma_flush();
 }
 
-/**
- * dma_iova_unlink - Unlink a range of IOVA space
- * @dev: DMA device
- * @state: IOVA state
- * @offset: offset into the IOVA state to unlink
- * @size: size of the buffer
- * @dir: DMA direction
- * @attrs: attributes of mapping properties
- *
- * Unlink a range of IOVA space for the given IOVA state.
- */
-void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
-		size_t offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static void __iommu_dma_iova_unlink(struct device *dev,
+		struct dma_iova_state *state, size_t offset, size_t size,
+		enum dma_data_direction dir, unsigned long attrs,
+		bool free_iova)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -2130,13 +2120,35 @@ void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
 		iommu_dma_iova_unlink_range_slow(dev, addr, size, dir, attrs);
 
 	iommu_iotlb_gather_init(&iotlb_gather);
+	iotlb_gather.queued = free_iova && READ_ONCE(cookie->fq_domain);
 
 	size = iova_align(iovad, size + iova_start_pad);
 	addr -= iova_start_pad;
 	unmapped = iommu_unmap_fast(domain, addr, size, &iotlb_gather);
 	WARN_ON(unmapped != size);
 
-	iommu_iotlb_sync(domain, &iotlb_gather);
+	if (!iotlb_gather.queued)
+		iommu_iotlb_sync(domain, &iotlb_gather);
+	if (free_iova)
+		iommu_dma_free_iova(domain, addr, size, &iotlb_gather);
+}
+
+/**
+ * dma_iova_unlink - Unlink a range of IOVA space
+ * @dev: DMA device
+ * @state: IOVA state
+ * @offset: offset into the IOVA state to unlink
+ * @size: size of the buffer
+ * @dir: DMA direction
+ * @attrs: attributes of mapping properties
+ *
+ * Unlink a range of IOVA space for the given IOVA state.
+ */
+void dma_iova_unlink(struct device *dev, struct dma_iova_state *state,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	 __iommu_dma_iova_unlink(dev, state, offset, size, dir, attrs, false);
 }
 EXPORT_SYMBOL_GPL(dma_iova_unlink);
 
@@ -2157,13 +2169,14 @@ void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 		unsigned long attrs)
 {
 	if (mapped_len)
-		dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs);
-
-	/*
-	 * We can be here if the first call to dma_iova_link() failed and
-	 * there is nothing to unlink, so let's be more clear.
-	 */
-	dma_iova_free(dev, state);
+		__iommu_dma_iova_unlink(dev, state, 0, mapped_len, dir, attrs,
+				true);
+	else
+		/*
+		 * We can be here if first call to dma_iova_link() failed and
+		 * there is nothing to unlink, so let's be more clear.
+		 */
+		dma_iova_free(dev, state);
 }
 EXPORT_SYMBOL_GPL(dma_iova_destroy);
 
-- 
2.34.1

