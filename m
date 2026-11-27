Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789452;
	b=pa19llFB6QHILeeP1CHp9CZt+lChMQ3+DUn5/qVld83UE0p5G6mdg6GxOOtxLAkcC3Dw
	 cxYZgrfX1mS3V2ujBGMZkgyw0PO58z+V2Zdkky3vMRMzkF8OnhGgf65Et3t2TZus7wyqc
	 XTAtxklZcsa6QIxsqBOXED3Y5Dudt5j8rBUW4l7tFb+xsLl0JYgTfety16qRgoRrDOOCX
	 Pop6/KvJ3l3y9HNBLs0x06qZza5DRTZ+Dq/lWFbUFQvc1pQHij0XSrCcWsJ1rzCEpyCZo
	 2+PWFfNYxWvCCaKn/aV4RWupMmV4T7hA9LrzUNjMhj8JT/hsKzIhpO+AXWKOvYUxgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789452;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl:X-GND-Score:
	 X-GND-Cause:X-GND-State;
	bh=EbhWdjlDqYXGPoxN5kboRvS2+NtSfKGLkriYPAqd7sI=;
	b=162MCdqd3SA6p6TDwJGQo8PGooRxn08LUccIDkpwQtUDUZYm/iAPgH0QHUlEQ2U8TIfn
	 jCcDcdFDWIqv//Ea3KV+Sx2h6ru67g8+g7+wySycslHu5EypXCOzId2I2afOWEuAbsoil
	 jmNm25JN/OqymvxjrlNQaofY6/AmYMnvFPQa1phjtdfkwj6Up1X8HznlbCivv2HexT2Ul
	 GZS9PbEvSWag4/osRomKxgitCIRlvy2bHMJLQWvfogd32MpsmiqVeoKyuGLwvKpQJiUXs
	 Ac0OClxYoCiXysyG/osje9iKCf0Cj6GU74DI0zcYSAXP0VWIl29yBNboKZwmWUzL0YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghiti.fr;
	spf=pass smtp.mailfrom=ghiti.fr;
	arc=none smtp.remote-ip=217.70.183.193
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A360A3808
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8A360A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 045223EF55;
	Fri, 27 Nov 2026 14:23:58 +0000 (UTC)
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
Subject: [PATCH v2] mm: free the swap slot of a dirty swapin folio
Date: Fri, 27 Nov 2026 15:23:27 +0100
Message-ID: <20261127142357.1112193-1-alex@ghiti.fr>
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
X-GND-Score: -100
X-GND-Cause: dmFkZTEp5Qx77guntm23T5dTKYs6zkxQfzo1XvkyZUuFFcykeWCOrH8Kr5kze8R7wZ4fIySIZ7IaYrQqejOU8Q3gMGl/ur5wdNsXrK4obk5i+24FUC/oaWJbOZB0ZvsGKfHSUgTDWvGYRvx6eL62wYTFiSkXjs9RLMOfNgdl3wPI0j1zPyzRK1oFemF0MptHDZQoZqtLbOrBHs28EK8PNzlU1lO8jGwJ4uJ7raKwyryg9CCodI5re44qBd2PJcoAU91yzOtviL7FgpxyVH0sQXjowh+Vi2H6AiEE59NLAaMVoNbloNtcYruRSdUMaR0Bb4OxEYA4PThK2/BhF36PnhYlk1/IdClqEivDoy6xjeL+aGavMlwHHPey4DKmyN/mRht1Moldcl/GUPau2W0dyVroWcFcnA+mdy2A/Q7B4zix2q/lQyLth2OGbpTYZBA875yiBdFcRYva19K6JbryjtEZyRo9jNOEEcPiWJTNXMBNmkh/YHJefFJnwN1Ixwqjb3pi+nHWI+PU4giv5FXRnJdXv8LK2lVVrF4XT/8zw3FGHLPbnfXLkyaqhdSt4baJoSOXyULRoHDKqRE4GKV4e5mB7XTVt3l6K/gLrxgbrHy+Jh4M04PlGMgoeUMyLHMeRQGfuAi5a+7eoshqRfkOJiDywE02GWrheKnNpfLig2Mj22SOrA
X-GND-State: clean

do_swap_page() frees the swap cache of an exclusive folio on a write
fault only. But when the folio is already dirty, the copy in its swap
slot is stale: the slot only reserves swap space until the folio is
reclaimed again or its owner exits, and the folio has to be written out
again anyway.

The common case is zswap: zswap_load() drops its compressed copy and
dirties the folio, so every zswap read fault leaves such a folio behind.
Without zswap, it only happens when reclaim bailed out after adding the
folio to the swap cache but before writing it out, or when the swap
write failed.

Such folios add up, and they are expensive to free at exit: on a large
production workload, the exit time doubled when zswap was enabled. A
third of the increase comes from the folios left in the swap cache,
each costing about 3x a resident page to tear down; the rest comes from
freeing the zswap entries.

So free the swap cache of a dirty folio as well: folio_free_swap() only
releases the slot once no other page table references it. The only cost
is a new slot allocation on the folio's next reclaim, which write faults
already pay.

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
3 GiB memcg, so that about half the reads are zswap read faults and the
task spends all its time in the kernel, throughput drops by 1.1-1.4%
(mean +- stddev of 5 runs on bare metal):

                       base            patched
  reads/s, 1 thread   37310 +- 182     36889 +- 77     (-1.1%)
  reads/s, 8 threads 291937 +- 802    287954 +- 373    (-1.4%)

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---

Changes in v2:
    - Free the swap cache of a dirty folio even when not exclusive (David)
    - Make the comment and the changelog generic, zswap being the common
      case (David, Nhat)
    
v1: https://lore.kernel.org/all/20261126094318.244973-1-alex@ghiti.fr/

 mm/memory.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index d477a4f986bc..c83c67cb759b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4711,9 +4711,12 @@ static inline bool should_try_to_free_swap(struct swap_info_struct *si,
 		return true;
 
 	/*
-	 * Free the swapcache only if we are the exclusive user and
-	 * this is a write fault.
+	 * Free the swapcache if the folio is already dirty, or if we will dirty it
+	 * immediately afterwards by writing to it.
 	 */
+	if (folio_test_dirty(folio))
+		return true;
+
 	return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
 }
 
-- 
2.53.1-Meta

