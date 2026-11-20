Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147447;
	b=ZmBrKN7V3HQpl2spcrKIrQPW1cMw49YYC0egZWdz6YWiCCVdDUX3penoayWH6h52YcCc
	 0emQRemXJDvLWpp33vcPoMVbcQbew18rrxeZBmLjYDLEGPzQkxdaoQWB5P88mWnMQHEoo
	 9en8cuIEwY0qFXTiPdDf331Shxlvch3nlH4RE5j5O+UxbMo4yZyJ990FhbhcHFH4rmQmR
	 VNWEV/yzvk0Exn68+BQM8RvPxfqWib+3nYgABNIa/wbqwY6HP+i2/X7p+qIDov+nwQy/X
	 7rpe6oylZxArH7xFpyJYJRm9LdKHqbujsLrIhWRRfJntDQNBB+yTN7ufbB434fgIXug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
	b=wOu1098rYIVvRord1D0l54o7CpxsqG8ok/UbJW5EkVxwbwL/iaSe/TKLL0RIFUisAc3F
	 9yJbUSfm/3z6p3oXNiKzmvAMh1e5zXCx4TLLUdd9v52AU8RRMCt8DDuZ5+0vv3063BX11
	 UdjDAR2CU7z+zPv+kknLbBeF5f1lQsr5gPdPvsAPVRWUaZekJomwcwAlrtKcns0rgTitR
	 jyDKjXc4mZjj+PR1Q8H2W+1IoMwqb+znW8iNuoCDBeWYAjOoxAXhPtfztCeYJzYDEK77E
	 unlQgtrZLqjxttWX9oYxek53ABJV8I7yS9OCQEO/jW/jH28xmJiQamXhHS50RnEYMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZlUHnSV;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D781606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D781606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZlUHnSV
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-381f65e4e4bso703312eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147447; x=1795752247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=xZlUHnSVCNSz5ZuY11pxE5mHz8CMidSmyz+T00yOVCUGq+ORoAYRgr4aFRY8U0AJZt
         qq1j3OY5VIOjD6NqdZjtrT1L6riCCMn+LuaI8BoCmY4rKda+LNRKqJ6FetVSVrLwqSfd
         rfnCL46SDsJ2Kb7M/Zu2yU+vvQ341nJ7T++vv7t9/eUUtft4cc9AbzmTtA5BSDZ+Q7qJ
         X6Sww4njW6TvgNq5DSpySPoxNTx+urrmDvqoene+M7J3EWb1MT4pE6WDoRhRPYGXGh84
         HJ3jIXBwrFk9nIrd2UgDqEeXPF0uK3QBuidTYDhrTEDg9qIxWBabz4ilJ5xvSMcdFD+j
         DOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147447; x=1795752247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhDenXpiUHLZ1Ej69EgBT1lJ0mR2rE8poGppaQ4kv/4=;
        b=DzKvxghWogU8hw3n2IZ+uaHHq9wm0POTAIPUZ6gSqfLi5p8Ka2wka3Vwbw6wAKzkzV
         ttupe1Gd7dqtD0t+OiB3LU3/OElYLswy/DG5+OHx3S5N8AZmKHeKs7jBOK7WvGw6Tp/f
         g0BRoHSDU0zowGqtJkUXvUP28BzotVarEMehYO0dt5LStbrIxMcOQ6GVdifsLjEzm0xF
         IGw+cANqNwCH5hoTnVaDS17+dbKacnOmsvmJv6ovbodKP6LOAIhuTOHKPPq0kvSSjNXV
         k1O2bHdmviFzYOiNsW2yoJ1a2gQKAtwYeHhbGnColegBfV9+5wlaUY4CQ+Tom/vHtQdJ
         aPig==
X-Forwarded-Encrypted: i=1; AL+hErHujEuP5SFEeF2SR0+whJdu5mFg59buFfxMHv4m9h9IlR3fulbspNQ2jeYloVkp09LT1hzWg5zfqGRj8BM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9//q/kAx8X3vkkyta2xKOf3Oi7mX9HWicvTDVRdDfFnE0FKal9
	VjzydHI6jAl7RWsbBKNnH8POguBtGOMh84WxVBy4wGWtWXZtbMvWyqcf
X-Gm-Gg: AZFdTZdBx9VZiOvmdZ3z8zByrlK9lkfXzQSWU1K3+zd8zKQQDF0RfuDG/ukFpXIHn0F
	3V1/GUvTkrjaSKEAQ7jvYke9+101D4eLSToWax0YhSP77Q5qWHW+8yUgFx3I1nEb2O7DFKEvarQ
	5Js8JvUqWkdXziCzfVU9lDGWkFQSB0UojpUOZAQqnID1qD8Zwrn0SIFcwcagpGwDi1WtJ3WzYrL
	YaP9n7B6bQgKfZkRnqMLIZ9s3COe7w/+vyJ9yqU6vKOWwhi8ijfZx4rf7wbuM3M0adlwePCza53
	Eoec9bg9+RPpmzkR1a7zqD8lUYfgW50zxXqUFE7RG2JLzmwrV4dtclleyoY8+KQmb7kdgOfWWvx
	Mgwwz5CEczwpI+J62nMW6qCI4blDW+zQfBJgYv/udDl3ZQ+UfnlceBk9XrPDb/PcL59v+2v87Gs
	UGfilPnIgUCRcmpqW0EWZxuazSDxBBq0qJRAwxtbdz+pk1BxT4RSNaDxsgcqljFCJzVAUyfijhy
	LGhjDsdp/r3DKBXhuBVAvCOXAgJFhpzlIrb3TmzZIuUJSQyOcMnFuZMXI9pjcE66dlrvHPmaoJ5
	hMmqY1fMeimtfIc5rrJLDCwb7IXR0plePhCI3MoCeufUhQmewTlZL5s=
X-Received: by 2002:a05:7301:182b:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-3856f256533mr1246303eec.10.1795147446708;
        Thu, 19 Nov 2026 20:04:06 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:06 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 09/19] powerpc/pseries: Rework hugepage invalidate to remove conditional locking
Date: Fri, 20 Nov 2026 09:33:08 +0530
Message-Id: <eb366c26835d6451c6484c7cf20155264a9ad7d3.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

Clang's compiler based static context analysis does not work with locks
that are conditionally taken like in __pSeries_lpar_hugepage_invalidate().

lpar.c:1240:6: error: spinlock 'pSeries_lpar_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]

But this also simplifies the function definition in my opinion - so this
is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 94cd30e9f6e1..abd77c45cbf4 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1224,26 +1224,33 @@ static void hugepage_bulk_invalidate(unsigned long *slot, unsigned long *vpn,
 		BUG_ON(rc != H_SUCCESS);
 	}
 }
-
-static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+static void __pSeries_lpar_hugepage_invalidate_unlocked(unsigned long *slot,
 						      unsigned long *vpn,
 						      int count, int psize,
 						      int ssize)
 {
-	unsigned long flags = 0;
-	int lock_tlbie = !mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE);
-
-	if (lock_tlbie)
-		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
-
 	/* Assuming THP size is 16M */
 	if (is_supported_hlbkrm(psize, MMU_PAGE_16M))
 		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
 	else
 		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
+}
 
-	if (lock_tlbie)
+static void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
+						      unsigned long *vpn,
+						      int count, int psize,
+						      int ssize)
+{
+	unsigned long flags = 0;
+
+	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE)) {
+		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
+		__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 		spin_unlock_irqrestore(&pSeries_lpar_tlbie_lock, flags);
+		return;
+	}
+
+	__pSeries_lpar_hugepage_invalidate_unlocked(slot, vpn, count, psize, ssize);
 }
 
 static void pSeries_lpar_hugepage_invalidate(unsigned long vsid,
-- 
2.39.5

