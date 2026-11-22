Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351732;
	b=U0HbFJxugersZLk/sXC2+S5U8u9OLjI4UDfgCNuTnYf+38VEzE0s7q1OlLINtdlIR1/u
	 gp5GUUlMUGYOKgOyIyRsRWWNY0n9XTJ33VibrjcTwjx6yLfSTbh+p31mbFGJSvvKF+/QE
	 w++6nmDHAnvLwfm/zFGtT4VZp+Zs4SZRzXAEY9nHuJIvploo95fBi3kh6J7KdZoRL1Zfq
	 1OQravif2mc08h6EUiz9v5mGe06/8Y3FkBp4Zdm/MeQlFFPtWG1rMBoMByOk9y9yWHWYx
	 JemfCtdvkNxurJi2SngUqIcA3f9tFxkl6f35u4FzqcakQMVgIQyFB1VKSPV7g1GvkcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351732;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=uKST39Qgob/15JyUvb1jtvUq7sR5vzYjfLPvatIKN2U=;
	b=GY/pGVwTPrVY1A15J52gWs4caK7Q5lu9X3LhMTpSi7yCz524kVMgE5jHHSHkzeLIZVmu
	 tWGOAf1z51fO2e/CNYaOMlxxLAaMf3tBc/fbF0nEPvYl9AngYGezfc++3zcwwvtygdYmt
	 L+73ttCdcmAP2kMxadP6dQ8Kl+nkjzUV1gBTC4z2uKI8ZFDzjVz+8t5atwBMK3EnTlFAp
	 N7159lfA3kNArSYBokTs9iDaYZo8HbNMLWAhUVLY1Emt6LQJ17lmLuei3kRRutqjJw0gy
	 u1bHYe4broP9fvl/OieGpQKbBwqGHr2eN9qAvMYmm7eX1cuvp4nNJ1utGzb4fpHkt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B6YkN1re;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D58606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04D58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B6YkN1re
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HaBlWQdkD212yi1iVAl8GzzPNT/gn9jVIw4YWXqbYdQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351729; v=1; x=1795956529;
 b=B6YkN1reqThtuWZ+2vBgvYXSF4caYXUX8OHC4wV0SiliYEnLI2mgL7vXDSXu4NBCooaQMTdg
 Uh4U5x0Ctr5zq52rCELs8Vc54ZC2xfWI91gf7VkO4BDc6G4wWA8kwHInMzyC/AFUwwwNwih8h8U
 TWaJv9WWKVndB8PsQ1WxZxIo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 859b52e110b08025;
	Sun, 22 Nov 2026 12:48:49 +0000
X-Mizu-Trace-ID: 859b52e110b08025
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	urezki@gmail.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	baoquan.he@linux.dev,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v6 14/14] mm, swap: skip the overcommit probe when removing xswap
Date: Sun, 22 Nov 2026 20:48:14 +0800
Message-ID: <20261122124814.3489077-5-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122124814.3489077-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
 <20261122124814.3489077-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

swap_info_remove() probes whether Committed_AS still fits under the
commit limit left after the device's pages are subtracted. An xswap
device's pages are its address space, not backing storage, but they
raised the commit limit at creation. A workload can commit into that
headroom, after which the probe refuses to destroy the device.

Skip the probe for xswap until the overcommit accounting for it is
settled. Real swap devices keep the existing protection.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 90f17edce1d0..a65afd35c7d9 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3644,10 +3644,17 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
  */
 static int swap_info_remove(struct swap_info_struct *p)
 {
-	if (!security_vm_enough_memory_mm(current->mm, p->pages))
-		vm_unacct_memory(p->pages);
-	else
-		return -ENOMEM;
+	/*
+	 * The device's pages are its address space, not backing storage.
+	 * The commit limit it added may have been committed against, so
+	 * skip the probe until the limit stops counting that space.
+	 */
+	if (!(p->flags & SWP_XSWAP)) {
+		if (!security_vm_enough_memory_mm(current->mm, p->pages))
+			vm_unacct_memory(p->pages);
+		else
+			return -ENOMEM;
+	}
 
 	spin_lock(&p->lock);
 	del_from_avail_list(p, true);
-- 
2.54.0

