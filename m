Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059609;
	b=xAyHLlvxhGhgeokwAEZrJ8nuHtWzDsyWCSfzjp0VknXMfwCcgBKGL6iL5t/RQ8Kd7Jw1
	 96aOKquQQapJUyFu+OeDh/8mIvkciOJOOUiMLCTF82ZA6PutYQFc/dic1xjaWdzaS5DU8
	 O9TzEsh0KMl+60fHNlUsXfGyiE1ynFuP/sUXQB5gQ5I+O2M/s7ja9ISqt+RRuP/OhVM5x
	 +HY8ChNPGoGUVdHnjn7b2NhVpYmPwEMt0nj9BIRx1kFrQpLz6B23ba0Lz4s1f80Hpuu2h
	 9ZSiax+nb17qhCyBVjBH30DY4LXJ7JB2ag7UHD4oKbM8dvQa+R80pOFkmjOpcRcEfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
	b=eIFGP4RbTQ3Wxq8kfB5xDpTIK7ccCG6r1XjNY63G+Z30XqK+PhE2mdHi9xIzm4LXE3uC
	 Ybg7Hu8Sciv9aLnarCuHtediGVHjobMn9XLyzEXFipVL+dnF6osHAHVwlsiVOek1NHULC
	 JGw7mt7I8SoMV1VopuEwhsZ4ke7Ve9PGAxB+tTPkOwj0ws+JoQdQkLI+F+EgSgLOCQ6oi
	 P01RHz5RZGKaMBJmeFg3KZhxolP7JJ7DRhZSSvVsVoBXxnsOvlbnoPCn5rcUlFq/JrKch
	 u+bzaVzPFemWgjFqDmyJM8Ebcr8XLizZHc+sWXO0tdxkcnp3dRyTbkOuOpuusGg/kaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B+BjA1/0";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+BjA1/0
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38318d69173so2093634eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059608; x=1795664408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=B+BjA1/0xBqY8Lvhaz7fs7bClReCg+t1hKinfm+fWY9cGzIt5YLMCEi7VuxiBKMMUw
         aYRCp+naY0rKBCgR6hGGG/HGxO+WCwkw8P93ZyU20VtJpfOHKWDiZF1pXFREmwKGnLsK
         u1SEHh+9A/Q9mBLyxhQ9p0yBWP5KtHr/cL+aGgYzubM5mtPZSkdinEGKXF6RObZpbyX8
         pUh9C8nrfxZuRwPRBkugrnm6l91TicQUCnvk1u0STUHztTU5OJbq1RbzWxb5EF5O0Edc
         d+gzFZvpBZauTy0OPoU8DXttr4W3dHEd4eb/2d5MQu+ZHsjdwjjSm20h4v+KvYKzQcWK
         SoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059608; x=1795664408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=io+CTWk+B5zCdv2jhfadGeS4AMrXIMCEILzj93M705I=;
        b=DDsLTzbOpdK96NX8sos4Gw4TISRaz+OPwn7oQVJZ5HxISP9KTzmG+hH7cdJenwoI3p
         oEjjo2QXMvz1pNqFF/J/d9XF9DyviRwKuUoVe+LhfaA8LNyuyIg58tlF9QxV/qrTnOZQ
         UkuZue0PdZoRaz4mCX85WkDwia2Hu+xlPS3AQGLlX/zBELcUHzXAOmUF6wIlmVEFS6Tq
         nC2C6/TxILSajcrTVJjWp1bv3TauGWMX6SayCR8dA5M+6P2A3Y7SX2iMMKh83FQqJ5ID
         83De2CtwgiR+2A/4iI2KZ+mVSD7d1bAp8g42ZTbET6ZvmkMpxRCv/Fpa0clQGgte3sp2
         5HzQ==
X-Forwarded-Encrypted: i=1; AL+hErGV0IBIn5TqMMkFnt/9JTHX/OUyZBhEfN0MM/HV/R6eOjtbSebVFU9eO7v9ITj7/axz9pWk1PnK2G33NsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aqxN+IluaWftENSicg8PrMn6Jh+O6lZUU+iUxf2bvA0Iu1Mer
	zN0ItsqfDrE+so3TEVMI1FjmNm0fvnBgqtCUWqptouiWDxn9WI+nmSv7
X-Gm-Gg: AZFdTZc/WxRUAS5GCvqy4FNm9MtNFCJqIeMw/JsYf/wi6PpLXQOzd/3m/tYXUGo+VAu
	DXThdjcUvaoDCbYRQl27v3eBYm6h3keYrWBo8KkTsatE056PiBGblBl0KDPXeBQ5RuFHlK5uvK4
	YWiWL9oNB5o1DbPhAQ5jz+D8i+3aj7SflDuSG7fj31rzp59loowKlfij1gPE2SE369trHEZ+271
	8Nv5BT8Rv7s/NBymPDZlSoBF+CMGiqNmiT5K2PmnkoPmyNdFacOu10ayDweZxWTSi+pEVsts3q3
	A4aJbTltW/gY5M0aAk7NqwNONCbZ60pxTkMMva5E2ujVKF+RzYTAWdT/94U2NUVKfr2bkKEbi/k
	gzY4Ft+YrfoTQgE7NVpxbIVk1e62VTLHkMF1e/mxp2y3u4ElAFt8yJyk35BoSyY4/KI1n5Ag7HS
	dg7MKUqYvuDJ3dnvB8NdUdPrLLLP1ySVLGx5GHdc0UO0k+12K8hU84uYpwKOANRLcpap/+RMcrm
	gh/4DlknkgmiGP+f9TjDhdPq6kn+Ru8bOr0Jpj+OtXvqEaRdUsTBzzVX8W5MqjpACXhpTHXOx1t
	md2BmDH55Y2PBP0hNytUybt2hYjB5I+erTk/bQ5OxjGzmAouE066OAU=
X-Received: by 2002:a05:7300:e9cb:10b0:374:ea35:9069 with SMTP id 5a478bee46e88-38281fe7a00mr4592092eec.39.1795059607772;
        Wed, 18 Nov 2026 19:40:07 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:07 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 10/18] powerpc/pseries: Add context annotations for the DTL worker lock
Date: Thu, 19 Nov 2026 09:09:05 +0530
Message-Id: <eda42f05405e0d43b9fc19c8c7f4cc589c30921f.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

