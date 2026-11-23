Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429445;
	b=pNHVNZr1jUoDwMYxwcCsL2aAsVI1zy4/z8jIiJHGJbXvesxJt53d2hVsOP4evI9TFpzi
	 dOIXxqyLsAEveA7RPEzosuFajW7BuWdK9X+ne6l/Kc3TwAXNJX/e1zm0kywyf+bR1k7Xt
	 +it4H9ZECpDEf6MbphA6BqyH2/ux3WgTPLCP+95uVtpl5AicGmMg9aZcU55KSeUtEiZzI
	 zUbblygFXtAJTZIrKZuOiZ8T71k6gPGraZ4L9ADTkLG5+2jj77fnMe8Tpk++HpPXlLViA
	 TJubD3mYJNAN4lVVuG5miTwXD3J0ZFHlbvV657KpPYZ+nvuvKeLu+r3zY1pi9nje/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429445;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=DM8Z2kkd5DMvAM3LbwImu0YAsjyghgKUS0c1QBqKji4=;
	b=4qRouV08mTKR6XJml//7cGc1xjS1JP7L6HuPOznmVkf85UJ8uSoGDQVfLLFRvgmw14j7
	 K4q56M7r+f37r0VgCBLKVai0KXPzaZBMVVyxSfLVHDDvquF0Tqx8vCnM+GocfEtSdKgzU
	 8iAmEacEXFGIuctoqd8NW+8ly8KMDMAnOCYbhAewe9mO9kZCWNwzjs/CJa4DKQ1J8CyrR
	 4EI0q8N1SQ3/HACfZ/xY+k2Sn8UKmkUEkPn/Boo6crWcUFUWBIkFstgno/RlqUeTkA3Vr
	 iJOrFw3Yb3mSWqdKShvEBsGNWmeOwsCChdbT1sgmplR67Hp2iWmPOThei0vw3Ak8+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Wr6Thzmg;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31E606A693
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C31E606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Wr6Thzmg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DM
	8Z2kkd5DMvAM3LbwImu0YAsjyghgKUS0c1QBqKji4=; b=Wr6ThzmgCtYuIO+LZa
	v9x9o0A/NiTJeEbNjJV731shWDzIuXXJTfrwPE9oojEum82BJg5WUCMHf+D1bj5d
	TKou8N4yw1904yBs4CVDDKSF1JrhOFk25TKOz/trzZxi+0pEeAD7kJSXFZJBNbyt
	pJSHIkJflZ4mD24jDnheJBrxs=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3f3UZFARri_WlJg--.18020S2;
	Mon, 23 Nov 2026 18:23:22 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Amit Shah <amit@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_console: drop device reference when DMA allocation fails
Date: Mon, 23 Nov 2026 18:23:21 +0800
Message-ID: <20261123102321.8605-1-zihengw03@163.com>
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
X-CM-TRANSID:_____wD3f3UZFARri_WlJg--.18020S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4fZFW8Ar4kGrW5uF48WFg_yoWkJFg_C3
	48Zry7ZrykAF48Zw4UtF1SvrWI9a4fZrykZF15tFWfA34agFsxX3WxZr9YgF13Jw4DAryj
	ya98Aa13Aw17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUecyCJUUUUU==
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7RrmN2sEFBrbkQAA3N

alloc_buf() takes a device reference before dma_alloc_coherent(), but its
failure label only frees the buffer:

  get_device() -> dma_alloc_coherent() fails -> kfree(buf)
                -> device reference is permanently leaked

Release the reference on the failure path as free_buf() does on success.

Found by LLM-assisted static analysis. Build tested with allmodconfig;
no runtime fault-injection test.

Fixes: 1b6370463e88 ("virtio_console: Add support for remoteproc serial")
Signed-off-by: Ziheng Wei <zihengw03@163.com>
---
 drivers/char/virtio_console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index b1b1aaf43..ef942c0df 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -464,6 +464,8 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
 	return buf;
 
 free_buf:
+	if (buf->dev)
+		put_device(buf->dev);
 	kfree(buf);
 fail:
 	return NULL;

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

