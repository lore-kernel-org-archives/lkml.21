Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554272;
	b=VwbWJLalDQybJpl7NdflpYpB6qtftCsOA9Gei7e4pB1CL3jX6dxy40D+vsJYgGg8Z0Eb
	 w91ujBDuSrPgBWC5qPTxOrbi8VYAIWpzFx71iYkPssc6xfXDRtUpVqfI/+Aj6Zkc1MqPc
	 aejOegylZ9zmZm6qR54Rxq9JCyrq/8o9FtQwhpXjJLlI5bOHMjpSgFS4uwKcWK9D/8rEr
	 9pfGNz8LvtvmMWHCYkw+zcCvnGq0zAXKstqxW4aim4mp789o6yteP9gpIN2Ui37jNz+ph
	 iybvF4CHDDXMoidgqiuY1OpN845uJ4e+7R0c5w0wDfyTa25d3i2oaNe6vUn6G+ckc6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J/YnhMo4Ya/+v/OThw7c00+JnH2cUN6wo5CimGcOomc=;
	b=x67s05PHrv4tY9/u4d0WsR04upEEjmmV35pWCVcXQ7zVVUB/jNfnbUnKwXK/he5CLjuA
	 5iR7yRlqlLW7KQQXy/q0BjiUKN6a+AT1+wLyb2LMIo3wZ/8N8vmxjNJ+oLFXxA/JQoFrh
	 cj6YLGs5RcDhzUs47aeSjLlCz2CLUArNNI7Dm9T8LisevLTvxSuu0hlaoS8vz9jAtcLLD
	 +lktR3pruTG1Nisrbvc8LqH65fmIuPewuC//23f/aa6rUfi7+qhw4L+q96kCKjk0WMRDV
	 4PSjNSMY0x994yBXnSOwh+yrM8qCzT6wLGYow7CDox2aPz8UJ29skeWXGMsepw7B9zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="TV1qrc1/";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=IEAoRyWY;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BFD606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BFD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=TV1qrc1/;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=IEAoRyWY
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOKaWwj2982405
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=J/Yn
	hMo4Ya/+v/OThw7c00+JnH2cUN6wo5CimGcOomc=; b=TV1qrc1/BbdH151n2Rao
	1RhOES1oWzioz45nt7T9RtfB3L2CShn1jXkVprUQ5IoscXBWSL/xddG6lIAiXStD
	OeWAjYymDF1ykGxrJ5aQ4GaihpjRGcB6NQQF6g6aoGxIMXfYpqcEr63soVyGqykJ
	jPYDwocHY+7R25IAadMHF5OPPdLMQnq3vVfJE7m8OLXrwR5EQhGR1bbvFq5D+tKH
	SfQkIc8t0VOPXUsCbZukJn2b8PNlnTvjmVn70kmd/lwwBFgcuZqafQt+rwV3CniR
	uSinJMpp+vnTSczClohvMoOaE0Zsl2n7XmcFvE2HVyi8R9A55GG0UXvmuVaTBe55
	gw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j5fanhqf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:31 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210ad74fdeso88758666d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795554271; x=1796159071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/YnhMo4Ya/+v/OThw7c00+JnH2cUN6wo5CimGcOomc=;
        b=IEAoRyWYFEysOPfRb2bRWvQu2871v0KwXbpQZDfSrU5OXFfIK8FWPRklNoSYGskBQm
         93/hCNq22JBmeKcVI0DhSLFTYJl0ce54LTqhoIFsf7sx6yTTcOsPQa+UjpQCYoLe823J
         I8cU5grL4OOhg3+hamI+AQpXw1UMKI2g+6WrtUahjXPJOdmS+LhHgEfVmxFeH47OMaOm
         sM7kmyeV9ZUn/73zb58U93O941nqiOrMIIvcPjOEuCXmFJXixA8H/m0I3sJsxtGgGA+N
         z3yKZlzCG3lKiNdSRENhxX1+hFlxoG23sSFVa6C/lwFzTbEbRyCJvvt21J9TXVrO88VD
         9hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554271; x=1796159071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/YnhMo4Ya/+v/OThw7c00+JnH2cUN6wo5CimGcOomc=;
        b=lONySujKEoNk5I2k8cRgORlTk2cB/hokp2/iAHSM3tW1MTsxyFkPi7tVmpYsGBKs6B
         L43qKIYYVJuKUeMQzViVAsgEX958Eo97Dqt3bxbpP1L8khviM/ClW3zuBPvnCG2XK9iS
         Dp+k8HH3oFysCJ21crHb+/RgDVReaA5OnIu8/Q6BUnOcVFPJfzPuo20m2omvahFTFiCs
         nhvcjLxbriuFYEpmag2bj8PAd0w6OOVdBMAlEK+f2bq5pHF2y2Xxe1bYE4GNv41KM2+o
         T1jPRUvrcqkKxKOFeGnDVhuejonYQZEBdVSiepV2rKe5+BnCSqsFb0EPz5Obz9E5zNek
         3PGw==
X-Forwarded-Encrypted: i=1; AL+hErFsXr7ki3gNTcNm2/PtnHIX8j+tD2ymKn+QG9V0uZJ3ZNf20ZA7dNZ8gr3sF1XNvVdVCPJaUORgqCgsDaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+exn+jfu0gNS1n7oejLWvYKBRjtgd0327vccE7r/tNVnz6xRYn
	sLRBgyq/gKKsg20rZlGTrHJtFwD1IMBcx2krvwUtssfeX1hoFJOYF66EGVl24PKMQ3XJ4cSaw4+
	a1v4xOs8Oeg976rGaXqW6jFHsMOZw8YCz9Xbrt5m+d6QZhOjA78wkWKQ+/lC4xw==
X-Gm-Gg: AZFdTZcisQs+h4MwIbpXVxggPT/Khu66A8lZpITKWBZ+UXcJD+amSJUj7xaBMIXyOvI
	YZ6wgWauI94glXASoQ+CUr4p3m5jGupO5ODyD6Dt8+EVNqKcVYXDdMBkezDlCWYV531NR6WO9of
	YmpgN15pcmv446U89/o4kra9DEYjiWzpNvOEzhdNBJ99pMxApVulMHNCyzqsAxl2JJ6Bq+hBSIY
	mvBIq+UXGu8y2Es8LU8rQZwSYE+NDARSnvlWEg3nMBIsxWPNhbr62riO/9HPTe6VWUe+02iS1RR
	zHsP/OvdY6SvyW6x5guEGxR2bf4q0Mk7st2URLM30YuypJmg+1sx1pPj0qBvd+G5Y63TKFzrt51
	FHuLZ2Pq0WT/VssAT+1jGKtnnXQCyDZlNFSLxhYseE9brr/HPfNogntJpWuQ=
X-Received: by 2002:ad4:4ea5:0:b0:921:2a52:7961 with SMTP id 6a1803df08f44-92134a69adfmr280325106d6.11.1795554270513;
        Tue, 24 Nov 2026 13:04:30 -0800 (PST)
X-Received: by 2002:ad4:4ea5:0:b0:921:2a52:7961 with SMTP id 6a1803df08f44-92134a69adfmr280324626d6.11.1795554270053;
        Tue, 24 Nov 2026 13:04:30 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm142827326d6.35.2026.11.24.13.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:04:29 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 24 Nov 2026 16:04:09 -0500
Subject: [PATCH v2 1/4] gfs2: make the log page pool per superblock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-gfs2-log-folio-v2-1-f229e90c8285@columbia.edu>
References: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
In-Reply-To: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795554268; l=7072;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=9EeFd1xHT0FOB4hwYwSuWtUHV6PLb4rf1Vb1G8NHF38=;
 b=k4x/z+JLLwK/IpBdZVzfVAt5CmYzJSVkQChNTUNgrb0y1S5Z3Iw7YsE8gNF8Iv+pfatmGd33d
 jtLQYD5L1+oA8TgsMCB6O0/J/mOk8zL7P8pmzuE7JmbhQuoWOAcG9DX
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: SG6IAGOe9JUBLiNpj_E6Z3dTwrOmW0Gs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX9JUTINEkoZ0B
 PZnTsW+dK3pu4MsAKt6PHjrpl9yNjmIUFrfLkwTR7WS7qvh/jiIMNfyBezGQWYX9ckSruiOZnr9
 6Y99OMDbcNL3sszwQQCMjX0BlAooAEY6mZNzCE/iceqnSLozifpwdGcHsjzDOGYIJddatFSTduy
 oan4ZzWXDl5zkq1cmC6CC4mH3T6bkNNjrBuIehpQiN2O6SCDJLXTEEtMywgrfg2qhRwosrWZpZw
 RK6QXHB8jYzcfVzXlIRG24cBIvp8PhOHOr7Uxa1JrUKyagOqHYJ5nfsJeBlAduraa+PWkthG900
 NNzqFNOJ7R/1O9k0G4ucVimZJuxgqyQJl7sa1Gvg110fu/GQJdz92fcffK7oCg2r9clhhxswSFr
 n5p1XT+iRRZSIBZ88Q53sr9wsGrY72PTtMSWohhuO8J9LFBsfQU9WnDrX22eQWdy1BtRi74xr35
 ilptSyJVRUi0f+NITZQ==
X-Proofpoint-ORIG-GUID: SG6IAGOe9JUBLiNpj_E6Z3dTwrOmW0Gs
X-Authority-Analysis: v=2.4 cv=acr0Dhot c=1 sm=1 tr=0 ts=6b05fbdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=Heh9kxYnpbWIbXrPXb4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXy5QD3cR8z9ja
 zN9V3sWBctY+6Mh/1KXXOisixEurb1FD3jLJ5ellEskzWqxSj5ERhGOg7D8HmBA0RPeFVVOYydn
 g9ABXH/7+VEcZHg9fhYAKDVg3OqQv7jkmElC9D4n2fokkutRGYZJ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=10 malwarescore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240083

The log headers, descriptors, revoke blocks, and escaped block copies
come from gfs2_page_pool, a single mempool shared by every mounted
filesystem. Give each superblock a pool of its own, sd_log_buf_pool. A
per-superblock pool can hold buffers of the filesystem's block size,
which a global one cannot.

The pool is set up in gfs2_fill_super() once the superblock has been
read and is destroyed in free_sbd(). Its elements are still pages, so
each mount now reserves 64 pages of its own.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/incore.h     |  2 ++
 fs/gfs2/log.c        |  2 +-
 fs/gfs2/lops.c       | 10 +++++-----
 fs/gfs2/main.c       |  8 --------
 fs/gfs2/ops_fstype.c |  5 +++++
 fs/gfs2/util.c       |  1 -
 fs/gfs2/util.h       |  3 ---
 7 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 1ff19f87d3bd..60748b99d39a 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -21,6 +21,7 @@
 #include <linux/lockref.h>
 #include <linux/rhashtable.h>
 #include <linux/mutex.h>
+#include <linux/mempool.h>
 
 #define DIO_WAIT	0x00000010
 #define DIO_METADATA	0x00000020
@@ -846,6 +847,7 @@ struct gfs2_sbd {
 	struct rw_semaphore sd_log_flush_lock;
 	atomic_t sd_log_in_flight;
 	wait_queue_head_t sd_log_flush_wait;
+	mempool_t sd_log_buf_pool;
 	int sd_log_error; /* First log error */
 
 	unsigned int sd_log_tail;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 1baaaf30c4fa..e7076db3ba46 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -850,7 +850,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 	if (gfs2_withdrawn(sdp))
 		return;
 
-	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+	page = mempool_alloc(&sdp->sd_log_buf_pool, GFP_NOIO);
 	lh = page_address(page);
 	clear_page(lh);
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 657edd406dd1..7a2c29652fec 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -229,7 +229,7 @@ static void gfs2_end_log_write(struct bio *bio)
 			gfs2_end_log_write_bh(sdp, folio, bvec->bv_offset,
 					bvec->bv_len, bio->bi_status);
 		else
-			mempool_free(page, gfs2_page_pool);
+			mempool_free(page, &sdp->sd_log_buf_pool);
 	}
 
 	bio_put(bio);
@@ -377,7 +377,7 @@ static void gfs2_log_write_bh(struct gfs2_sbd *sdp, struct buffer_head *bh)
  * @page: The struct page
  *
  * This writes the first block-sized part of the page into the log. Note
- * that the page must have been allocated from the gfs2_page_pool mempool
+ * that the page must have been allocated from the sd_log_buf_pool mempool
  * and that after this has been called, ownership has been transferred and
  * the page may be freed at any time.
  */
@@ -607,7 +607,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 static struct page *gfs2_get_log_desc(struct gfs2_sbd *sdp, u32 ld_type,
 				      u32 ld_length, u32 ld_data1)
 {
-	struct page *page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+	struct page *page = mempool_alloc(&sdp->sd_log_buf_pool, GFP_NOIO);
 	struct gfs2_log_descriptor *ld = page_address(page);
 	clear_page(ld);
 	ld->ld_header.mh_magic = cpu_to_be32(GFS2_MAGIC);
@@ -696,7 +696,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 			if (buffer_escaped(bd2->bd_bh)) {
 				void *p;
 
-				page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+				page = mempool_alloc(&sdp->sd_log_buf_pool, GFP_NOIO);
 				p = page_address(page);
 				memcpy_from_folio(p, bd2->bd_bh->b_folio,
 						  bh_offset(bd2->bd_bh),
@@ -872,7 +872,7 @@ static void revoke_lo_before_commit(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 
 		if (offset + sizeof(u64) > sdp->sd_sb.sb_bsize) {
 			gfs2_log_write_page(sdp, page);
-			page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+			page = mempool_alloc(&sdp->sd_log_buf_pool, GFP_NOIO);
 			mh = page_address(page);
 			clear_page(mh);
 			mh->mh_magic = cpu_to_be32(GFS2_MAGIC);
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index a607e98eb45f..8a45b2e9b618 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -16,7 +16,6 @@
 #include <linux/rcupdate.h>
 #include <linux/rculist_bl.h>
 #include <linux/atomic.h>
-#include <linux/mempool.h>
 
 #include "gfs2.h"
 #include "incore.h"
@@ -166,10 +165,6 @@ static int __init init_gfs2_fs(void)
 	if (!gfs2_freeze_wq)
 		goto fail_wq3;
 
-	gfs2_page_pool = mempool_create_page_pool(64, 0);
-	if (!gfs2_page_pool)
-		goto fail_mempool;
-
 	gfs2_register_debugfs();
 	error = register_filesystem(&gfs2_fs_type);
 	if (error)
@@ -187,8 +182,6 @@ static int __init init_gfs2_fs(void)
 fail_fs2:
 	unregister_filesystem(&gfs2_fs_type);
 fail_fs1:
-	mempool_destroy(gfs2_page_pool);
-fail_mempool:
 	destroy_workqueue(gfs2_freeze_wq);
 fail_wq3:
 	destroy_workqueue(gfs2_control_wq);
@@ -240,7 +233,6 @@ static void __exit exit_gfs2_fs(void)
 
 	rcu_barrier();
 
-	mempool_destroy(gfs2_page_pool);
 	kmem_cache_destroy(gfs2_trans_cachep);
 	kmem_cache_destroy(gfs2_qadata_cachep);
 	kmem_cache_destroy(gfs2_quotad_cachep);
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6ec47376aecf..f62a893ce5a2 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -67,6 +67,7 @@ void free_sbd(struct gfs2_sbd *sdp)
 {
 	struct super_block *sb = sdp->sd_vfs;
 
+	mempool_exit(&sdp->sd_log_buf_pool);
 	free_percpu(sdp->sd_lkstats);
 	sb->s_fs_info = NULL;
 	kfree(sdp);
@@ -1218,6 +1219,10 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (error)
 		goto fail_locking;
 
+	error = mempool_init_page_pool(&sdp->sd_log_buf_pool, 64, 0);
+	if (error)
+		goto fail_sb;
+
 	/* Turn rgrplvb on by default if fs format is recent enough */
 	if (!sdp->sd_args.ar_got_rgrplvb && sdp->sd_sb.sb_fs_format > 1801)
 		sdp->sd_args.ar_rgrplvb = 1;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 529c3ec37a18..d42db8a9f5aa 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -34,7 +34,6 @@ struct kmem_cache *gfs2_rgrpd_cachep __read_mostly;
 struct kmem_cache *gfs2_quotad_cachep __read_mostly;
 struct kmem_cache *gfs2_qadata_cachep __read_mostly;
 struct kmem_cache *gfs2_trans_cachep __read_mostly;
-mempool_t *gfs2_page_pool __read_mostly;
 
 void gfs2_assert_i(struct gfs2_sbd *sdp)
 {
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index ffcc47d6b0b4..0179ddcd4c22 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -12,8 +12,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #endif
 
-#include <linux/mempool.h>
-
 #include "incore.h"
 
 #define fs_emerg(fs, fmt, ...)						\
@@ -165,7 +163,6 @@ extern struct kmem_cache *gfs2_rgrpd_cachep;
 extern struct kmem_cache *gfs2_quotad_cachep;
 extern struct kmem_cache *gfs2_qadata_cachep;
 extern struct kmem_cache *gfs2_trans_cachep;
-extern mempool_t *gfs2_page_pool;
 extern struct workqueue_struct *gfs2_control_wq;
 
 static inline unsigned int gfs2_tune_get_i(struct gfs2_tune *gt,

-- 
2.39.5

