Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333066;
	b=woyEQO/UmzEiDNYfCWcAEpKOi16Wc/jolKuIGY18aLcGBZAZuJvBsCfx3iMICg6x4ziY
	 q79R2Fj3ytA2gz0VubhWkmyjdeCN4b4sbf/ct/0g1nq8Ady94dh27elcB9HK7AfbzpiDG
	 SsyGQT0au57A+JAcOWSq61Eoh9ej9AqQ2E/nmeS1lykg9+BpZbT8NmF7y1wpPY21ZViid
	 WS8TzJsWkKi2gnbkm+fItVw/i50VYi2Kfxd4eh3haF01jiSJ2DhamjwKcveMqrSppkvEU
	 0hZNMY0gEx1bEtoePaXBI0UvnA52tIheyGPndB7gtCQTjfB3jr30GzFgEb5HqjX7vRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333066;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=S2I91cqH+K379Jcopm9ofeEem9S17TNrqbhpkhXWgpU=;
	b=dO9Ws08e91AKI2wLpZeT4b51e/FP52g4dZQs01JqcVjF8Rhj9JLBG5/zDFG63CvbGyMY
	 5jUCcPp9s44l7QPVa2Y6y0vnn6frjeyn0hHzBNPkomXhXbeZOM+cfi3mL6F259VaV1m50
	 qgEf8XrNC45dbqp0KL1LORhx5aVZFj8g5DviKOX/WeKecJNXk9CF4F6iXyM2bKaO4yHh3
	 +Z4tIgK6Q9WXzACpa3uvoerRNYf/nQ2tXVxqXtcTeriJVEbdkXizzn9IUuKGljX1IncQT
	 kyQZ2gDCOxwQt54RO0SnRw2teTYKcqtC15Zw+O12bQZV6pUqFc9uG98QNgx91omD8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rrb+Cqxj;
	arc=none smtp.remote-ip=91.218.175.248
Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2E606A336
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C2E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rrb+Cqxj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h/GTrd6gvXy6aK8t1D7cqsfPdYQXwAl/ymNtfNBswfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795333063; v=1; x=1795937863;
 b=rrb+CqxjSEOSskj1atTey91eN/58WuuJszbA/WaZKAT+ORuH1MdXkwZHlomsdn6EMpcn6JMj
 8Hjem8dsnKejy56bS02PxKhIG9Sn4NJQvonh7cmnor+shVPcIZGJy0mQbSweNjrb43LWyMG3ANB
 qmTNpXpOmlnRyP0h2478g5lw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ac586d565c110b2;
	Sun, 22 Nov 2026 07:37:43 +0000
X-Mizu-Trace-ID: 3ac586d565c110b2
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH 0/3] udmabuf: speed up mmap() of huge page backed buffers
Date: Sun, 22 Nov 2026 02:37:35 -0500
Message-Id: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAL+bAmsC/x2MwQqFIBAAfyX2/BZyo4x+Jd7Bcq09ZKIZQfTvS
 ceBmbkhcRROMFQ3RD4lye4LqF8F82r8wii2MFBNnVKk0LE5MNvNTNnhmosQnN9MwIbanjTZWmu
 GkofITq5vPf6f5wW/Ik1zagAAAA==
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

QEMU and crosvm export virtio-gpu blob resources from guest memory as
udmabufs, which the host renderer and display mmap(). The guest memory is
often backed by 2 MiB huge pages, yet udmabuf maps it 4 KiB at a time:
mapping and touching a 4 GiB buffer inserts a million PTEs and takes over
200 ms.

Patch 1 has mmap() of a dma-buf align large mappings to PMD boundaries,
which any exporter mapping contiguous memory with PMDs needs, such as the
proposed VFIO dma-buf mmap() [1]. Patch 2 maps the huge page backed
ranges of a udmabuf with PMDs, which cuts the time to map and touch it
by 87-90% for hugetlb and shmem THP backed buffers and leaves 4 KiB
backed ones as they are. Patch 3 adds selftests.

[1] https://lore.kernel.org/r/20260527102319.100128-1-mattev@meta.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
Qiliang Yuan (3):
      dma-buf: align large mappings to PMD boundaries
      udmabuf: map huge page backed ranges with PMDs
      selftests/udmabuf: test mapping a huge page backed udmabuf

 drivers/dma-buf/dma-buf.c                         |  1 +
 drivers/dma-buf/udmabuf.c                         | 69 ++++++++++++++++-
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 90 ++++++++++++++++++++++-
 3 files changed, 158 insertions(+), 2 deletions(-)
---
base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
change-id: 20261121-feat-udmabuf-huge-pfnmap-3258272d077e

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

