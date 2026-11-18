Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981902;
	b=Kxu40XUBBraw3jFA9AuQ1U2sB5TARfqvXOnhCNNVJ773qjDBnquK2LBudfmK5efgAXzJ
	 knLjq+J+tCze779V4gWwz9g+3ZEKII4llCCEegpytnM4w6sUWWnTLqok82fdfI/Fyo3En
	 7ArN9qaxUkjN/YBOXlKVWjGCSjQp6CbdmFrE/uwlPIQlbHcPI0ujcFMJEu3eszAmbJM4R
	 ycZTTk9pzqhnJgvJE1KjdG0Zp6XvCatoESACYysjnyKt1qColxXx5ixRWt0RiFIf9AzK6
	 5wxBr2DLZKpnyC3JWy7m7ZMw9YhujGbTkHTlCY21SBnT8hpbPrdiApcF40w2mHSLf0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981902;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=50UO4spYDICj4mi3ZdEnXll2Arr6GI+je5ElQT9Qz3E=;
	b=qkcRxmC9XNuAYoGSUOafxmFR1NjHnTBVwhFnyuGbB5CQZRjgrwa4mBzyojLeKrQS+0Y6
	 mwLNlT0I1ksPSg13al016lybsk9KceXcoDav6/WqMgUzf4o2zVEzy9x78U/u2SAjUmm35
	 p2DDtyot8mbQuuhBHkgcyY1g8ch9cO4ml2gnxaPmul2dqHKm/xrPplk2/x+3DaSAUU7u+
	 DLmorEbGOXFoPHGl2Y1mppTvcBXqfXxZG7j3G0NnlQHJ1zwgS1H0cCD2H6+ufdM0FdRSR
	 WoN5COPQS0TLhFaf6HKMy1VsIi5iLnXBWTnpBCboWPtqZDk8GSmzD40JK86+bB7xLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eDdeS7wX;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2198A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2198A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eDdeS7wX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=50
	UO4spYDICj4mi3ZdEnXll2Arr6GI+je5ElQT9Qz3E=; b=eDdeS7wXUAFpBLXrBb
	yKsK4gq0d8phNCG45nQzHS2uQBaxX4YcBESGkEoXbLRjU/q/Hctxinct6a1jwcCe
	OHL3WOC2c7/1z2/Gvo4BMP73t5SybZJEBxzjhx4kdemmasPsDPo8XCPIhPhrF5zs
	MKcEAViMvaq5i11hMkgur7Yic=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3HwjJP_1qmvfEIw--.16665S2;
	Wed, 18 Nov 2026 14:03:54 +0800 (CST)
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
Subject: [PATCH v1 0/2] tools/mm: slabinfo: fix inverted sorting and totals
Date: Wed, 18 Nov 2026 14:03:15 +0800
Message-Id: <20261118060317.1802620-1-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD3HwjJP_1qmvfEIw--.16665S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4xGryUGF1xZFy5ZFW8WFg_yoWDuwb_Wr
	Z7Xw1Igws2vr4xtwn7ZFsxXr4fWa4akFW8A34qq343Gw15CwnYvFn2y343tF1F9FZ5Xr4a
	9rn0qryayw43CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnk9N7UUUUU==
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzgocBWr9P8ri1AAA3J

From: Xuewen Wang <wangxuewen@kylinos.cn>

This series fixes two independent bugs in slabinfo:

  1. Return signed comparison results for unequal numeric sort keys so
     that -i correctly reverses size, activity, loss and partial sorting.
  2. Keep the per-cache partial-object average instead of overwriting it
     with a percentage before printing the PartObjs row.

Validation:

The sorting and totals fixes were additionally verified on live kernels
(v5.10 and v6.6) with root access: "slabinfo -l -S -i" is unsorted before
the sorting fix and ascending after it, with descending output unchanged;
"slabinfo -B -T" reports the PartObjs Average as a percentage (8 and 67)
before the totals fix and as the correct per-cache average
(2362 = 262202/111 and 48867 = 10897410/223) after it. No kernel slab
settings were modified.

Xuewen Wang (2):
  tools/mm: slabinfo: fix inverted numeric sorting
  tools/mm: slabinfo: preserve the average partial object count

 tools/mm/slabinfo.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.25.1

