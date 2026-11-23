Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404322;
	b=VrWHNPQPW8H0pTBy901+ltObma1SjuqMRGTnVfEgLy0YPaMzkr/hr4Ucfy1yFACXnZuW
	 aeIqFhp346z0WsQk1I3DyOb22TW5LlvzWWSWdTloD8QwTWYHqNEXOFeXWBRogTw7+vF4N
	 mqwRcXsx5PPaw0rSFjehtr6pyegiDaZt1ibi7RycH+j+0a4Bo0RRF9V8HrRHBGEt84EDf
	 XyK8aK0YM0GGsRUXKxnpVHAJ9uS92bA07ewkV+URomaUJh7NRiw9CmRfBsdAxevqG/tDt
	 Z7w2x81uoKORmxsCMO9iw7NeBLBqEjVNDHws8ntQswC3+zzZjRTz542h4/l8mkFOt+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hjsx441+A3L3gxU883GSqRGMok4wbhrMVBrQT8f02Ug=;
	b=qqLPlCoFSWx0c2JSE7QhImuOwu9tO4Ra9foGZEyYBWsjMvNpamGVuE76zxPp+a/BOcmq
	 QNufdxEfFwhClPeGcyQ3tMIeoa2wcLY0dyHk0uGHtcEX/pDAo5k19xjV229DcLJLvcK1Y
	 QN7tkcwmv/Qg+Vg22oNz0UKxkkXqg07qT6J6zhdsCbg1yvbMQMZ01VHxPOBlDsXop9Des
	 y75JW0EKqM2seNlwCcSzsG+t8wodql06HOwhCWaIsnVj3IRFUYRWPECyJt9OXYq0tCqFw
	 uCAGJPRANdZ3ddBmFhKxNpPRHQ0NHhJAEx0PSCkK/xYqdspAEHaWvG6g0odPc+MG4pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+LPP6ce;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBBB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+LPP6ce
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2612845c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795404321; x=1796009121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hjsx441+A3L3gxU883GSqRGMok4wbhrMVBrQT8f02Ug=;
        b=a+LPP6ceDczacXKQ9CwXiWwiFe3AZNZV7B8k8Vlw4/oghtCSymFHye/1IdeOzZenIm
         rEay6Jm7NX89MjsRHDsFT8jh6qFDO8Yc8/pcumb4NK9cPnbF9W5jSjEb8q8ggPrk//Hv
         g6rRlXyAJkX8GHmDlpzF/Jgpbr7xX9epTg/rXPsiSS8JtpGwzeIsJLNdTlzp2TLTx61i
         bNLnYTGdO7EY++hwg+c3g3U1NGHtB5moGqPArylzRUj0NNVTrCd9Mk7NE2htG1jEv2ZT
         KFH2lN2arK4X1x6SuLOVCedQlKfV/ajd2a8ImtDHPyiGA9kdLpQop8HOA2GD4y1cqQjP
         oGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404321; x=1796009121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hjsx441+A3L3gxU883GSqRGMok4wbhrMVBrQT8f02Ug=;
        b=IPFZjfcX0jtNYz64E1yfHwLRyuHrlKX1PsQNacaN+zm5zNaKVCrEDIrP8AcihsXD2X
         nnFxZx5ryG/Tnkf0CHb+SvqDcg2RWFCc7DpSGZ0GSKm1Gv7D6XblMR9LU0AECuxceBrE
         Cf5WqfeOWJsa6sGnSMVMXkQvJOW9zRPr2oF/7o0OQgOdJ07egHr8nz3ESkHQNkMGg+DL
         R8R3t3biBGYEK2Wcp0kcZ4OFLrws6VzB1GXM/hUNel6e3BBuVENwHzgXj+kwvWv+Uopx
         uLWnDwO+l6T3dZ3yP2nltRKehY2u3G1ulDm0OA6kZBqQUjRSjmrKlyAdZG5Yd++7dRJK
         ywmw==
X-Forwarded-Encrypted: i=1; AL+hErEGGBR0WkQ8nr2zWZeNcYHLV9Wi22Yw+/n8Y7RVD57e0W/I4B+tp1OlhJwDvH2Xg+1PXvRBufJQNSXtRxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NdWQrx15b36hcnqE4fs7HzPyXKo9eb/Kf8+/ntjVXOErTAZX7
	63uk6kbb/kyYzJosWWgICtk/qt8OQbooh6G+K4Nlx9tGEfSIHeJNxg1P
X-Gm-Gg: AZFdTZfack23/NFs8Z9f0OZikRPSZcG0y2bprNmPoT3BJOuGV4KC/vCYgA4yksOG5I7
	+S2kG+KGPmXWBMSYCf3jualNvUOSCvTO3msom/9Rr9/IQ4jGg8UmXmLqS5Ocu4+hZMLjXK3BWUz
	uN0dwE0G1p0XQljRM8V0LXBWw2/HBpRjM3PpwO+LoeKyB0OOW+cSgZHiEb+AT/CfJ1MW8md6cXw
	yhoJEmX+pwgbyZwgNNJ3Br7XyyhCxEH5jpN2oKQIGI4/X7v5f0be2Cy8Y535zT0fu/xGSYCkf5l
	zuQYcCRzJoSYzod64UZRlxxOt26P83R5AnAUrWMcBsDGMHPu9Uba2uhtiDPsVZPcBNI/yRuH5sN
	Feok54A7NDiWFe27RoZ/J7I0CAooaI0R/B8fEEHJWBPrazyh6jc4ppAvK2fV89HVV2wl5nBb8Ny
	19FYMEtK1pKDhYgJsC0VsQX2OJFlx0BlwL+BsAEvad06Qfc9dYF2x8D3qpv1f0V6zWFIp9sC/Qm
	tyvDrzAjv8zjDN8ybgvUqPdx7m0RXM2VqWnYa3wfXHd6FrRdLHz8YJvrCH4HkYcCp9bL6fm1gPC
	J1pY5TJCJBAfQQ9U13md0WedHux51rg/p/gBLvSqZA7ZDy/Y
X-Received: by 2002:a05:7301:1a02:b0:376:b957:c08 with SMTP id 5a478bee46e88-3856fe5acd0mr10396229eec.9.1795404320560;
        Sun, 22 Nov 2026 19:25:20 -0800 (PST)
Received: from kernel ([103.219.206.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm52822820eec.3.2026.11.22.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:25:20 -0800 (PST)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: chengming.zhou@linux.dev,
	yosry@kernel.org
Cc: hannes@cmpxchg.org,
	nphamcs@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] mm: zswap: remove dead length check in zswap_store_page()
Date: Mon, 23 Nov 2026 08:55:12 +0530
Message-ID: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
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

zswap_compress() never succeeds with entry->length == 0, so the
condition is always true. Remove it.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 mm/zswap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index ae19e301fced..9590f333d83f 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1509,10 +1509,8 @@ static bool zswap_store_page(struct folio *folio, long index,
 	entry->swpentry = page_swpentry;
 	entry->objcg = objcg;
 	entry->referenced = true;
-	if (entry->length) {
-		INIT_LIST_HEAD(&entry->lru);
-		zswap_lru_add(entry);
-	}
+	INIT_LIST_HEAD(&entry->lru);
+	zswap_lru_add(entry);
 
 	return true;
 
-- 
2.53.0

