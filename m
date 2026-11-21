Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263952;
	b=WEui/2/TDCripj/7hKCAjL3ZiDzMn6Kj0kXB7CdX0DReqm2j3geIi2sSkmO3KwR0vo0W
	 cFwwFSf/6yWcfFQw44+Q8mgScgeDh91W1JlTWuT4XOxd8MnHP70+fQ7yrAPIv0dDyo7Ja
	 gWt3zASAN2R70nZRwbatYn64i0xi/jeCxbJA7X7/tmUM1tqAdYyh0HIqGwC0x4xPPez57
	 xgKKkU6BxyTgPosat0VzaO18qOywaFIVsgwrt7znMF8jhWkrF5A7VcFjkxtH8Xby+JSzB
	 lLn7o1K3Cn5KCYH4jG5ABxJEbduMvvuMU7gK6USC97n8roC2F4cTjNYIRFCi61M7S+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
	b=STWA9zJ6ZI1OuFed0Njs/kGVFfzIL/rFP8wgYW6/QJXgALLpUITSz9SXQzLbgArPXBtV
	 1HEtDL1YVIizAJslmcrRiNp/vBns17avunBhjTbNz2hniM3RhTDTXx3AvUEU8cADtKik2
	 MesinNb0WwSEt1SHYickVsMOjlLcvUg9thgBwNO7RkahgGJu4uNUAPL2ErNDjZx2d2voW
	 G6bKC/kRVbScI4xLpKb81fPCeYAuTaSQtWPxTXeq8B0URBE6wGKWNxNgt1fSLV+AAnbHx
	 0FVZKdAxgASHM3og9GI+rnb26n2GpEflGPRCUl8qdd/oPOTSOSqDQAIgFBzpZQGe9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eksHB53G;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23842606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23842606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eksHB53G
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1025246a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263951; x=1795868751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=eksHB53GJ89+gQaQFhKKAbEMIXH0d5Na+IHNxgLtXMX+V+Otkt2saNYJq+sWIk5mEE
         0TX9vdMOOWcifmyRSZvBSL+UovFPZ5d7Q94VU/xH2kiCRxYu1AqnIO8WPv85XsmkXRMz
         wZfB2KZidqLU1TcuraJCs3ht/7LpJ+Ow8023FRgx/rRR00NkcJK7vyxa++lRjdkMiUed
         fjRUjjONSMNje6VJjjhXmMRGbi917M7tsttfaUqfIiXruyFB3j2RVdGrl17J1y+MgiYr
         i1BINGD/+ldFMCJoG7KTRi7jtbHfUwVMCA9GEGS3SaCef1z751T/N4oz81PvpQiWfkm4
         OOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263951; x=1795868751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIad2Olj92CNzs479lQy7bfwjc0bTVZb8HfHFWlPwwE=;
        b=PpknGOmWon4x7HUVKBpkGyVQajqKRWq94hdQFvz6vfoStg77wZtcMAtQslX9FmmpDA
         qLva1Mz54X8c9Kw5KPv5tTettAh2BJELgF2iKpPTeK+5c1JFcX/3frdZyCCgxP39RXWP
         oq0LbjKWQGIGqZS3M9EecCbRmTZUvcDRjhk4DcELi+VLXLnVzw65FKmZIBNx8W+nP7HM
         gqQsLaYSh6D5IUqnJErPeUEjLERUTQ8ffjeGMFj1yq0HP5yNzyE9pO2qzZIlFtc0N+DP
         EreRvTCUOWz69PZXXxpBcdCwoOtFX9Dpkm8dN98IwcShfhnODTl9Dm6uTEk4WyRFCo22
         bdCg==
X-Forwarded-Encrypted: i=1; AL+hErG0YBvMHEgr5D3HWu7vHE4EA97kAIaxouF1BaL1K5ymBH73RATYGhe+BKcXElOqTGeeKWf6oTY8BTc2rEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V5zctMBtYaTuYEtwhDogu+4+P8ufMSwSooHy4AWKf3+Y/G81C
	0rsN9LkbWM+ljHso69eie0CYAs1WzdW1TwBCbdjgcPmT87axqEulNgp4
X-Gm-Gg: AZFdTZeGnkHMjr8ExvXXlHAgfbn09picfVLaiqEFdyimt+Ob1L1IzbZUa8QYIawd9iu
	fYg6pY/EvnNsMNzx94cczgm7avtNJHZWrrx721Gc5OV0Wm9kTxkhhRHV/JfLunBgefJ4/IKTsYq
	7trQ/Y++MQbkjMYPBF/zYyK/2hxdJzmCvgOEh6FYG30+cpqWXR/qZJTmuemGShPwhGndRgFl0qd
	SAHolS72vTocsnDrslVb7nWA16tMFks6uXIXLl5gjb2boYroFadrYuOzFEYKQubSJ0vU5HTiwlA
	Bdp+4VdFLbR2UGj7K5GKjqUrwL7K38fhsD5quY2hQ2d+DRZXKuxvdErFwgaGkmrgsS947SD7nPE
	NJA6qR1R2CjpZJeWfbE4YDNKaHkHLNWC5i3HY72pyfGnucI30Haq3LLr7A4f5gU0MvycL6CtLeS
	s3plTq9Fkx48ZgelpTAcHy1E7PKRepvruUPMNKaUhxu8cWNThsC3zYJ8A2RPai/ziUnv+a7rdvX
	ewXa7/Dt4PgpsNx3Cp4lJ3K1qRVvBR3FOwia+jHFXBTK7GdkgOYtH07JZLG7W2+9/4J8NDMvWZG
	sZL3Lh0Lp8HjY9+odDxIaVXpx1+/jQASfqBbtbr6SoPazTtfPfDMvTynh08seQqrk0Y01bNgT8V
	7Ky6HxJaTD02jgw6gWKk=
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr5500808a91.22.1795263951403;
        Sat, 21 Nov 2026 04:25:51 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm2616474a12.2.2026.11.21.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:25:50 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abhishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused ISP state control functions
Date: Sat, 21 Nov 2026 12:25:44 +0000
Message-ID: <20261121122544.428-1-chaulagainavishek14@gmail.com>
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

From: Abhishek Chaulagain <chaulagainavishek14@gmail.com>

isp_is_ready(), isp_is_sleeping(), isp_start() and isp_wake() are
defined in isp.c and declared in isp_public.h, but have no callers
anywhere in the tree. Remove the four unused functions along with
their prototypes.

isp_wake() was the only user of udelay() in this file, so drop the
now-unused linux/delay.h include as well.

Signed-off-by: Abhishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../pci/hive_isp_css_common/host/isp.c        | 32 -------------------
 .../hive_isp_css_include/host/isp_public.h    |  8 -----
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
index 39cccbfa3..13ea6d2a5 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp.c
@@ -4,8 +4,6 @@
  * Copyright (c) 2010-2015, Intel Corporation.
  */
 
-#include <linux/delay.h>
-
 #include <system_global.h>
 #include "isp.h"
 
@@ -29,33 +27,3 @@ void cnd_isp_irq_enable(
 	}
 	return;
 }
-
-/* ISP functions to control the ISP state from the host, even in crun. */
-
-/* Inspect readiness of an ISP indexed by ID */
-unsigned int isp_is_ready(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_IDLE_BIT);
-}
-
-/* Inspect sleeping of an ISP indexed by ID */
-unsigned int isp_is_sleeping(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	return isp_ctrl_getbit(ID, ISP_SC_REG, ISP_SLEEPING_BIT);
-}
-
-/* To be called by the host immediately before starting ISP ID. */
-void isp_start(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-}
-
-/* Wake up ISP ID. */
-void isp_wake(isp_ID_t ID)
-{
-	assert(ID < N_ISP_ID);
-	isp_ctrl_setbit(ID, ISP_SC_REG, ISP_START_BIT);
-	udelay(1);
-}
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
index 78abd77c5..f778922f6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isp_public.h
@@ -153,12 +153,4 @@ STORAGE_CLASS_ISP_H uint32_t isp_2w_cat_1w(
     const u16		x0,
     const uint16_t		x1);
 
-unsigned int isp_is_ready(isp_ID_t ID);
-
-unsigned int isp_is_sleeping(isp_ID_t ID);
-
-void isp_start(isp_ID_t ID);
-
-void isp_wake(isp_ID_t ID);
-
 #endif /* __ISP_PUBLIC_H_INCLUDED__ */
-- 
2.43.0

