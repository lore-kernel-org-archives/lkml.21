Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163835;
	b=eOGK9Mcdj4kpjU8cC4ZEdPCO9Di/VpcmR4tc17sutHIk/pxo/nByNI/aXZhsUB20dz94
	 M/YuAAzptoEx0B4rSTyvWgAjVToB6pMwkcat3vNBi8y6M62Faug7bc8o27L1/JzmW6vIP
	 6/OHo9mi5fimxryljNFyhl8nYGCIC47Lg5T2TrTjVv19jqOM4WlcEqI0pjQsk6Mt/U4A4
	 Eb2ZHK56V8Urs636A/Ouo9sFt6IQ8LUb4FS4N37ATmfvk7NkacJhPXv3a3N2IDLJJ6lRj
	 TyalG6O+vwVDHA4fknaftdU1gYfClgZBsW8p/zn6tJI6KBzty8UU6btxoeOZJTkkSqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZCyEGFLuMrF8ud7Iy/GAi36dvb9TvTE7pQNBco9ToNs=;
	b=LnV14eXBaFhtQ3pcs6saP2ZgYW3i3xoycKtURKE1nDBKG/xgpjl/aPGmxkKUTmFkyeeW
	 w87dTm9xrFWkGviatA9yy839bHa56cVgWJRdVRIRfJesw6+q0LH9mXqRQzuGvg+2uV3gY
	 Uk6n0yFKDg/Xv0nqG4nc4eHNVQd6uDImw7yz08fe9SU9MLVShKJKr35PDUhl5JmVOTulj
	 o5iKP4NDP1sfQUh0c289dHqS3cDs2h3d+NgWl6/MEnfX4yFClLGWn/qWg1eNJ1lV7cMRE
	 lwuQiKsV9cllZUOmtK2T1IGXVj2JbgDI9VIiK4O4TTyUDa9wwDwdg0HcFTp5pu2skzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPGgjm8d;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B78D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPGgjm8d
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1098740a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163834; x=1795768634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCyEGFLuMrF8ud7Iy/GAi36dvb9TvTE7pQNBco9ToNs=;
        b=tPGgjm8dHvqkhvM6qaWX27QGfhfch+yhwN+RmPTN25HBRzCfLyqMVAQWFxpyoa4mtJ
         bSfnf0bo7bGgXmOVnaXbm6JbJLCd2G/RgTMtPCBO71hgU8rQ3a4sGT0p9cTIPVQmEyGa
         SA1TWTAAZ6YAbzS8RDhjPmfDnSd3BG2Y+Pw/oMGUa+4k73ZnQqXgYYYfAVEENUa3rwEy
         pqPSDGPlcOceSwKE0cTtVhJdxsPQX47V4vbKH4BJUHf8UJBa1QmRmljkZrTlJHFTxyw8
         g7YsmMnuthmIvMKgBLuW8yMludgCDcLLXbeUNnIY/cje4YvgaW4oMhSDm+/DSxn9pA7D
         pp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163834; x=1795768634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCyEGFLuMrF8ud7Iy/GAi36dvb9TvTE7pQNBco9ToNs=;
        b=2nx180STLcx8c13XksM/E3Roz76PyeNdK4gboLs0frYesQx3jXuuwiZpcO5BNjq9Fd
         dHoNst/TMmgBOfOoqZjfUC2k/HejlisOQF/7tRtW+024xQCIsYejyfGYnZuDcTWvUwTt
         OSyl4FhF2NvWZCLSE7qJf1u5JpXzAVzYe9BqUyNVdFxIZuUKYNfUC0LGkjvdniTD/rO5
         pDLugobpOZcR3vwflfczjKZFd+cVHE7zfSLzeLX5UU8D56BMWTSnqwfNkh5YgWKC3W95
         mX3eKX+54tigc92a00bpZ37U+CE5Rs9TNWd+i4oro/MtMtOqXlVsc1ptyTmTgnb+iQ7k
         Gb3w==
X-Forwarded-Encrypted: i=1; AL+hErExsL6/P5vj85bQHStsP60R9g7tL9rj2eS9wdZlfHObokop1BP11xqPhFdsbM6tnrmRANhnE+BI8fnhAEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vq8RjR2cu/nhBsD+x1uCDhUmsRmMvrK6b3ry0bjQUYhWY/NXs
	ZxfWHrg5bBD1gcSal3aRWH2IsTuI90XSaz17ETZsCH+uxaY5IHTFRLlK
X-Gm-Gg: AZFdTZfZmZaTffyJa0+uC8FLKem09+vMzjyrjti7UjGnuWkfv4ZsAWAr/q+aYER0RqX
	JAExZHVVGHxbxW9dnKDXQhqBikJNjTfd8gg64QiGBxvkzANEl9F0fRx0nbDKLUG7k6f50W8kbGH
	T7XW+x5PLhYnCIfhrBH3feLFkmfAvKzD7k95UHnPUPzzs7PGK3RCACpdjrlZnuXN2un7uFHuaVw
	/VVhStj7/XRBtmwk7Hq19Q5D5E9Xi1OcI9ErEqRd7ShsSx7aQIW12Y2GnRYafpya/ig23cOaTW1
	yTEK51IK80jHUy4DRy5ypt95RG+LhpKZWJs6PCma09qCf+YSTeKaPc1ESfjTQEwngg8N7M/ZoNg
	ekB0gu3dtaGFeFT4/DS5yqQem67qb8khdX8frROUmlS9fEpCi3tqrsBD7+AVxFmiDzKFXhJwSdk
	dV75BBftmu7ORhfQP4Hwo4KAWo9uz3+sZXVxANyjQYi6PS3V1gQJZdclxjuCzVaep0mRIDbagOu
	j0MM2XnBipA30opPRgA+F+7Axb2xwdGSNFeoL9a0ikceMfB9HqAMW0FPmJHGE9uX57rXmulzhwS
	Ln7AmTg8l4Q5VsVpzBqxyXzpbT7VLgaUFlb7Yy5VI28MvA==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr1453272a91.30.1795163834405;
        Fri, 20 Nov 2026 00:37:14 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm3590057a91.5.2026.11.20.00.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:37:13 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: vbabka@kernel.org,
	harry@kernel.org
Cc: urezki@gmail.com,
	paulmck@kernel.org,
	qiang.zhang@linux.dev,
	akpm@linux-foundation.org,
	hao.li@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mm/slab: restore the rcutree. prefix of the kvfree_rcu parameters
Date: Fri, 20 Nov 2026 16:37:06 +0800
Message-ID: <20261120083707.296481-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

The move of kvfree_rcu() to mm/slab_common.c dropped the "rcutree."
MODULE_PARAM_PREFIX, so rcu_min_cached_objs and
rcu_delay_page_cache_fill_msec became slab_common.* and the documented
rcutree.* names are silently ignored.  Restore the prefix; the
slab_common.* names, never documented, stop working.

Fixes: bbe658d65802 ("mm/slab: Move kvfree_rcu() into SLAB")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reviewed-by: Hao Li <hao.li@linux.dev>
---
v2: as in slab/for-next-fixes.

 mm/slab_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 01c64ef661e7..41dea01a8c1f 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1367,6 +1367,10 @@ void __init kvfree_rcu_init(void)
 
 #else /* CONFIG_KVFREE_RCU_BATCHED */
 
+/* Keep the prefix inherited from RCU */
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "rcutree."
+
 /*
  * This rcu parameter is runtime-read-only. It reflects
  * a minimum allowed number of objects which can be cached

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

