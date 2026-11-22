Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333071;
	b=qrpoSr+UyJG29ZMSdLY/8FRadDelvIS30NyvglVvJhXT+mzxDM22M+qf9NxqqraZh4eb
	 hNw+nQ9Rxq+DFIaqVDT2SJhQFULJReWiEp8uZ0jjNhjusFnqZB83DW1557vTGolhaqTm2
	 0r/iSSXj9qYHfV8GCmtcfJrwouCc9LO2L/GBGP6NIzdgvkri9GQx9cb2mBzZc9+xOOvv4
	 b4Z1tUZe4fEMuYMQ8mJp40ALPja6P6k1elRGqfHhL/1/xMOfP9Jtk3TALiEfkHxXGvMsH
	 SGNN74F20xs9O6It2fMCNyo6GPvQ7Qpah6BjlqdBwBNxl+l8588o0iYemfSHG/tPY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=j4YGurCdBlU79iqxbYdPe60ZsQ+6Te0huBGXd52spLE=;
	b=4Qcw8VcpiR6z0XNXtvdMsa3g7TH7sRW5BapoB5ZM8t14hAoNDNuS/DS+4wFt1NRjvk45
	 XGHWHkoEI1Fq3yuKnZjRXC+f2L7Dz4vQY4uGDSqdPZK9gKUC5CrzpbTywh2w/d1hgXiN2
	 WQSd/Jvouw+y9OGTkr3xnXfp95s+6EG5yMS/oEyOtq+xPqrFRK3MkBjcZxV+BbB/KJtaz
	 qQjAhHMSG2Rzk0e62wFr/FG42BLh00W3KiIlXv5iXSvr44lKseHuKKRIX/fjwAd2iwxPl
	 mC3FmNJJ8FkXWS1s45csrqwOcT5koOIpIxHXA4nubJOlbg9+e5LcTyeGZ07n9qrts4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZy3OUE6;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD2606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FD2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZy3OUE6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OX2Dl1yXBEikHAL+zTZY/BAfC4M/xpOaeaiU2uI76oM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795333069; v=1; x=1795937869;
 b=tZy3OUE6qa3SVi6r2dUIbaBeo+tNB1hk5K7KNCbrDb4ju+yRldOyjnAaYjxi/FLI6sp6OAx0
 Qy1axH3yZqGVyzkdw4HH6xyX9mRwzGdZThKoqA9LEQWggLfzYZ7gAAfNOWJygMr2tlBOdeZsd/P
 hXpD3F9V/MRAmfbB5di8UZpM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 295cb77bfbe198e6;
	Sun, 22 Nov 2026 07:37:49 +0000
X-Mizu-Trace-ID: 295cb77bfbe198e6
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 22 Nov 2026 02:37:36 -0500
Subject: [PATCH 1/3] dma-buf: align large mappings to PMD boundaries
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
Message-Id: <20261122-feat-udmabuf-huge-pfnmap-v1-1-dcba888940c2@linux.dev>
References: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
In-Reply-To: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A dma-buf exporter whose buffer is backed by physically contiguous memory
can map it with PMDs from a ->huge_fault() handler, which only works where
the user address and the buffer offset are aligned alike to PMD_SIZE.

dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
whatever page aligned address the default allocator returns. A 4 GiB
udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
its PMD-sized ranges can be mapped with a PMD.

Use thp_get_unmapped_area(), as filesystems that support huge mappings
do. It aligns a mapping that covers at least one whole PMD to the buffer
offset and leaves smaller mappings where they would be placed anyway.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5c6957f8839a8..015a03c8d04db 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -608,6 +608,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
+	.get_unmapped_area = thp_get_unmapped_area,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
 	.unlocked_ioctl	= dma_buf_ioctl,

-- 
2.43.0

