Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686212;
	b=urYqnp/rz+K0aSZAZdlOY53eT9MkaHt5nVRnr+xDaYvhjptKv1oRBe/rj7fn9fgjd+KJ
	 iY3fJ2tp/bVoMghxHAYwRWpYOX6Vpp4ROxvUCXQURLgvJ8HN//jlPnG8w2APBbMVQijmb
	 H3RRKh36Rjj7Ajw/vguAQ2DLKBoLafM1NG2hCCZKQ1g2JcKRaXrDWVkpoOTWtsadPxgFq
	 8t+/q8JNkVaz4d/fiqsP+CRGnHOetbjhB4U5tEeh9I4J5+Psm4LJQT7VwpYnHCrC7LRV0
	 TWDaMk0iu6rgPw/XjXpsQnYlJCUwLTHlE5lJhfK6i4eX2Cr0bI8e26/U2Epwksn7tRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686212;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl:X-GND-State:
	 X-GND-Score:X-GND-Cause;
	bh=U2RG/43Gt62+a3trqh1OXBqfFh76n70yv7dg/xkqTbQ=;
	b=M2gjaLEP32upc3Q1VBAyr809Fx9ptg1Rkd22Olae2hS9qY0yWmVScAvrWrhogsKXaIST
	 GamnzUFlNjqoeFTTw55Y6zrQtjRXKWfi3wQwYw6taF3WwtR0RXCtGcuYYnG4yplo1usRL
	 LK8Sm8HDw+ALZ8dJZQc5cDljSNCq2oMxOuQgwR9GPTVEQtphjoDDP+3nZdOq76yhfYqYs
	 Z4BoYgnIzgiMO8GSmJq0pGg86L7XwRFvWK5UBnumMtAFEv/h3meqG3WbIdFqCeXCPU+P+
	 KVP9vwIeuUG7NvwGnhQFM4tuwL1XS348235sWpDd4vkpIiiNKDHWN9IvfIfA4/GGFBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghiti.fr;
	spf=pass smtp.mailfrom=ghiti.fr;
	arc=none smtp.remote-ip=217.70.183.200
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7403C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B5EF3E815;
	Thu, 26 Nov 2026 09:43:19 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <baohua@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Baoquan He <baoquan.he@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Youngjun Park <youngjun.park@lge.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] mm: free the swap slot of a dirty swapin folio
Date: Thu, 26 Nov 2026 10:42:45 +0100
Message-ID: <20261126094318.244973-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.56.1
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
X-GND-Sasl: alex@ghiti.fr
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEdJR/H4Xa4ZKuZ4nTBVEkhQ4eIOXT8KBKdz48DaOc5wbOZ2w+1WPgtVNRgprI4/22vAN1OenUTh9HkBYJ4rslBNvFArNCZXQ28g1/NkIwdm4h1XM9+oBIoN9fzUsCSpmHnfCZksERC5zH7jYF0qCl2FD6Fa8775TNfY95y0FTFrIfI6+213vdjQhq3nY6EH43SiwUTshKCRfEnuJPNOCNGDfHd/ZQa7aM47zEkhJAHXntw1KQCSIeU2xrjpqXzWS6oGdWWFqLBY1BEeZkEWyBT6qXL278TaOR0Qv+mO9gtoNMwrdYw/zT4kcBv5PTthlLQKtd7fCdHYWYj9T55opuvcVhirBRGh89bqo3wTGudx/vk/WQI9z6+eeZLs7jtXlMRrBFuXOwClvIOgiYWuceKyQWb4XC5lqTwVDas/gstcQgP4EEv68P7bS3cwV79NybjR6sUoQyytY3zDlzlR5hlB8Cxrt0y1f5q5Hse5+7ll/9+CLIyfvXr//lXZOyX6Hu/8E53L4693z8FEqIAsgaJlqjf89fYJJglU2aZNhxCiZbkXt/dA4TNqedPE9A3IhRsqgCe0boyvG60aHuesKA/xQSznQmGSK2c3G3SXO2oYOopKgPeL74TrfVfpdNjM2yvy1ovNglzu/1w4ROTeHQe8Q8iIC4jdAxsGlkv3Lm58g

do_swap_page() frees the swap cache of an exclusive folio on a write
fault only. A folio loaded from zswap is dirty: zswap drops its copy on
load, so the slot no longer holds the data and only reserves swap space
until the folio is reclaimed again or its owner exits.

Such folios add up, and they are expensive to free at exit: on a large
production workload, the exit time doubled when zswap was enabled. A
third of the increase comes from the folios left in the swap cache,
each costing about 3x a resident page to tear down; the rest comes from
freeing the zswap entries.

So free the swap cache of an exclusive dirty folio as well, so that the
slot is released at swapin, as is already done on an exclusive write
fault. The folio is dirty, so it would get written out again anyway:
the only cost is a new slot allocation on its next reclaim, which write
faults already pay.

On the production workload, this patch removed that third: the exit time
decreased by about 15%. On a simple microbenchmark, 4 GiB of anonymous
memory in a memcg pushed to swap, read back, then SIGKILLed in a QEMU
guest (mean +- stddev of 9 runs):

                     base            patched
  exit time    989 +- 24 ms       502 +- 28 ms   (-49%)

The cost is paid by folios that keep cycling between zswap and memory:
each reclaim allocates a new slot and adds the folio to the swap cache
again. On a kernel build in a 600 MiB memcg (-j4, defconfig), this is
not measurable (mean +- stddev of 5 runs on bare metal):

                       base            patched
  time (s)        592.4 +- 1.1      592.4 +- 0.9    (+0.0%)
  sys (s)         256.6 +- 1.5      257.5 +- 1.4    (+0.3%)

In the worst case, random reads over 4 GiB of anonymous memory in a
3 GiB memcg, so that half the reads are zswap read faults and the task
spends all its time in the kernel, throughput drops by 1.1-1.4%
(mean +- stddev of 5 runs on bare metal):

                       base            patched
  reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
  reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---

Notes:
    Previous discussion:
    https://lore.kernel.org/all/CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wqDqot_cXR92DjhQ@mail.gmail.com/

 mm/memory.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index d477a4f986bc..dac0f0a24bc7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4711,10 +4711,13 @@ static inline bool should_try_to_free_swap(struct swap_info_struct *si,
 		return true;
 
 	/*
-	 * Free the swapcache only if we are the exclusive user and
-	 * this is a write fault.
+	 * Free the swapcache only if we are the exclusive user and this is a
+	 * write fault, or the folio is dirty: its copy in the swap slot is
+	 * stale then (zswap loads are exclusive and dirty the folio), so the
+	 * slot only holds swap space.
 	 */
-	return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
+	return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
+			     folio_test_dirty(folio));
 }
 
 static vm_fault_t pte_marker_clear(struct vm_fault *vmf)
-- 
2.53.1-Meta

