Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147457;
	b=im/cfsZSV84hh9rwa0ZY8G15V6zOZYG70hkj2jx42It60C2OrhXux/TZBu+1Ka2sAW6U
	 AuUL839UHx4SCLSo1wNPoDRFkeGSyeFwrFmMhLhoT+G1yP7yBanTI5The2rRxBP5NT2Fa
	 g441Z/gYB9hmNW9HZz7NDVCGUr2kjp39Tqs85zhIFaisdAPEga85ERdq0Ke5LBrLGrpMS
	 YSh3B+gj40uyvN8+f8anLlV25ggAH33vYVVxJaNOrcp3WPI3BbVuohJGDMVrUkIAzZw6V
	 RAOLHF0CrwcfiB9iOUADWjfFBd/bdXzK5Zq/sXwfLTwuk6DTc73J/5N82UaND2arqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
	b=qXtVVw2zzEbkUeE534tBRNzrPTkkPhjEiCyoGR4r38qz4cUIZjRPpborNG5v2cYUs1Mf
	 XTvefNgYXV4wpwwBvIQSLoBg3CdIZlVHdF/bdjgpM+dHS/CewJGtiWOW04xMl4VniyQ09
	 6huilfLfAsTIKfbjqm47Foud6Bfd3R+6pYHzPhHf0avLQImGKCPNbLzJ9OJRxcbc00XqF
	 kftth/dDuZiqq3spHrQNVnSbf/1pij6djPlyCzT9npL/k7ygNUlmDpAxAhdDrVABNUqO9
	 4nFoQAOnSSM8LylX8CaY6maXRk/obANp668U7ZaUH5vM86OsyPjFOKE9Hd2LPghXJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qo3HRQFj;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A5606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qo3HRQFj
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso1040504c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147455; x=1795752255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=Qo3HRQFjx3O8jMNXAKgg1oKb9MUd1NSuen3N+3oGKYxENP6OmzhPdg3ZQ/yZPRLEE0
         FcoIAtJVmPn2DAWpEuwtF0hpG9aN1A/6GpuIx5iONvMLLzGGFDZi77wALzRn6FfXgrt2
         v71IxdgiqA1/FUEssCkRvVeyuLYV3nja3ktA+PQXh4K+x58NtZtVli+wx5/Rou/Gx9tn
         J4eyi9KCGTF6H2NPrZ3qn/z3l9qXvgOa0bj+Y97/Dp9dC7mCarjm26Ex89DCIjaSi7eY
         bQtHLGlzCsF91p1Ooeq6VXxVWQhhQLdMrvBfpiOQchdxssXuXT0N6alRUq6Mj8Deyaoj
         HNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147455; x=1795752255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=QOfB8ufXTqQ5l5l12yeLKXUfx2lpfe5L6K9IvYCt4Mnfo09FFFkA5UeDayubnZRoGg
         5LjWPjsE+XH05K7RyYdYBK6TFfMPjjWne64A5UCA89Fp8Xp3xbO+Xp5J5boxrbNhs7V2
         xjumsCdRf6m5WMxmT8WQRGjHAxlAI0bMVKwRkWYcfaccpu90h6sylArkeSnbcbB/Ulb0
         /Y7gwmYZPi1qMbbwE4VZoyFCrVUZ1OwhBCBEHHdoe7vsaAZ226SonUUHlDYMwS9QAzws
         b2kyD8Z8EnIADz2L/ARdjR/vhATJjSCmlLR/5DFD0bho0qglfyAQHAY97M8vGKcn0Pml
         bZHA==
X-Forwarded-Encrypted: i=1; AL+hErFhRTn13T1rsFPFOpilK7iKZy3NFUStqFYmW36/J0wwq7je3aqBCoMNu7BFUljaXzjFBX4EfXav+UknD1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N+SLnOUPmvVNkOEFrVbd6d68tBfA78iofkfjNhCUZdXyTRPEs
	lsZRwngJQaOG357dguXMRC5AX3NtPVs0cilTcGGJbcwjX53C/p92I+uz
X-Gm-Gg: AZFdTZdURuwfB+pIDNwXTQhGBbTm3hAlYiqk3FR5kku+4Z9IYanefocPR2KihHHbySm
	JRmQ2qpPQzy6PWfIYxvIPed6HJByrLlO3jGz/URqyuZYfPxICdvKn6ZBlLzWpa4gF3HiK9hx3em
	YpVBZD8Gl8bQRohs+CXeSkjoIQpkENuw9q4xs8gckjKDkgzavul738Hd9FRajH0lj0Zcbe3Gje5
	/QBmPwfmMz0GOlFlpVQaYVjSmdXSLbWJhFNqN78W2gkh++hZiVaJBgsjk/hGdocC8X9Rl0k2xCX
	dcJxUnsntWEVW85+TOmRSfwXdGVdjAXKQUBPBnrmGIXYveh6ZJWaeS2ij6o+8NE+H7/g7H/v/45
	EvOQry13GGtkOSfaHkb+mmfTb+vijdIm1w39CXg/l7LX9lUO8iPzaddsJYn9U+BY+HpYscgY72r
	rPLS5giI75GloWZpv3E+e4S1qpAx+ryTIO59pg3x2SdRK5xLcMTK6SAUpWIVzX1o45OHV8+BxfC
	K84cSwvPChjdq/6DMYWJOneG08bJrkt3Qr8BhDa6vXl/GZvdIeVfXQ+QqE09yUrmvaNtDCJmiWu
	afKgATrcWCNnnCHdXlGBU8vKQD/lw6HGivn3LwgpBXfxHW9qPcY6M1k=
X-Received: by 2002:a05:7301:4718:b0:380:9c6f:ad0a with SMTP id 5a478bee46e88-3856e63b224mr1331961eec.10.1795147455454;
        Thu, 19 Nov 2026 20:04:15 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:14 -0800 (PST)
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
Subject: [PATCHv3 11/19] powerpc/pseries: Add context annotations for the DTL worker lock
Date: Fri, 20 Nov 2026 09:33:10 +0530
Message-Id: <b358842b6682ac165275a75541123df3d6567bf9.1795147055.git.ritesh.list@gmail.com>
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

dtl_worker_{enable,disable}() needs annotations since they acquire and
release locks. So this adds conditional annotation based on return value.

Let's also disable context analysis for vcpudispatch_stats_write(),
since based on received input, it can leave the lock held until a later
write of 0 unlocks it. So we need to mark it with __context_unsafe().

Otherwise we get following error on enabling CONTEXT_ANALYSIS on this
file:
  lpar.c:490:9: error: rw_semaphore 'dtl_access_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  lpar.c:498:2: error: releasing rw_semaphore 'dtl_access_lock' that was not held [-Werror,-Wthread-safety-analysis]

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 5dbf447d3a83..9965ead1e93c 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -461,6 +461,7 @@ static void reset_global_dtl_mask(void)
 }
 
 static int dtl_worker_enable(unsigned long *time_limit)
+		__cond_acquires(0, &dtl_access_lock)
 {
 	int rc = 0, state;
 
@@ -491,6 +492,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
 }
 
 static void dtl_worker_disable(unsigned long *time_limit)
+		__releases(&dtl_access_lock)
 {
 	cpuhp_remove_state(dtl_worker_state);
 	free_dtl_buffers(time_limit);
@@ -500,6 +502,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
 
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 		size_t count, loff_t *ppos)
+		__context_unsafe(/* dtl_access_lock is held from enable write until disable write */)
 {
 	unsigned long time_limit = jiffies + HZ;
 	struct vcpu_dispatch_data *disp;
-- 
2.39.5

