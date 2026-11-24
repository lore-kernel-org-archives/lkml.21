Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504481;
	b=Ujg8uVeB62+YkXYU7D2dw+GZq1inPSMIidnYOBQKwpoU52Tm4+Ey8bGloHugOKdPUGhi
	 Vcnx4b+zf7XXhEsQYc5Srt3OFEnkRHw7vbd+Q121YRKKceMlxpwadzVT7SjdOYMak/Ep0
	 KPyS0AEFuPbG+JzqT5BbtMMm7WKaqyMDfL6s+qnq2DCJXsfM9fS5QWdL7D2PpVGP2rPGz
	 5mQUPlvaU4PjriuxqTesHwrdZEKlSuR2j1PIKflOgez7QYU0moWAs7nfwK1c0Y+qkXYGb
	 zMLY6YBlxMfgxy4zL5okC0wZqzztlrx7R5rxsaDjUORzz36aWKKLtz2krBevBTzRZ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
	b=iefvJIdFy8Ij0gHgNM4NQV5DEXzRU3FT9eJ/sQCQGW1/gThMMOVA351TZk39zSgZ35ly
	 qN9VfqZe8ODsnylcCzIFKrlNu2Mwic1E2IfNT8SdnE1UnhZaeShKepAaBEKItlBgBHV65
	 4WMjgd5/n5ss3oe+Hlb9rRTGB2t/8NKCctVLZBzZA7WDItEUchavV0fn9E/UpgOxUf2ZT
	 hjtgzHryvPI2sjZE4nmOK5bYGjw+qVK5PNveVLHG1AJoFavCXqd5DF1z/FKhBRUMxYNL2
	 eYDz5OOBW5hMDeS0mrLhbxzxIHtjSMxOrn6o2RlogSZ81F7fNIL2HyU1iPA4BrcFg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isCDh6uM;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25398606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25398606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isCDh6uM
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso2935598b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504480; x=1796109280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
        b=isCDh6uMy8QBNjMbiFtasKU35zCXhJAPQ9gO9fuxIAnyN2riSk/ZuMRWoyxi6Ic6mB
         b9t5SorjU5/FuNw6ZQkymyV0Hrulj1nEL6tn+jek9QqOafDKSFUAXNLpZsqZH7/hS/ne
         tnRa9J1XQARRwCpQmkT+MnExa0Dmua13U9ExAEfFEA3ROvjqptmywKROgALJtpmcxlcn
         VTRNFlb3r2k8R2GcD0/LQC9hReYEw9C4MZuE27XrKeSBEItGfgBYoMlif6ORopSxoUpU
         r3yKITzYR6pZWJJy3GDvDiG7g7Wo1Ei46X4O7HsHpk+wwlFMNIe1jgAPUE37Ikv4PTDc
         63LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504480; x=1796109280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
        b=FwJQgGCXkm0XfHIhmHeWAhpFyIvv13PJnRtOD8CozKyV0xZY7wPeXDiT4aeTeQrYvW
         R5TetsSY0MUj+TLbQxjIbZyB0AiRUQEzB1Ae+rPFIJ1YAu4prtXDltFfUlDK/DF3TTSG
         uLpuxOug9gmgngNTepCM2rBLio3LASQLNrOdBnn7pcF+DncdJEpuEkFPsSiOqEYFOt+y
         GZd8SmduLdmj33hAT+lTB5+gHydaw+AlIfQ0fIIlWdG6S6FWNQBiO7W6Cm5SjdKw4JN5
         I4NvmiXxbPcWkYLIuqjozevwZre8FpTN84vf8QQo1Ni0H1IOZdMyxeYdNibKmZh+3NXo
         aRYA==
X-Forwarded-Encrypted: i=1; AL+hErG1NG3JYJPWZnu8HZ5YMkfnwODqGn1R941Rjry/sgeRcgfXymkURxZL+nGpB5keK0e94bx5xoD2fDEl1/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VxeMEuXwUxHNMLtiWNU/p5s1SPOvwFDN4SxEw+ahfdmUOR5+e
	h83F2h98A5vMDANxzfNMQ14PN3MOBLaF5VK9dOHbKmQY6koxNEXKHy5L
X-Gm-Gg: AZFdTZdmf+RVvBRgcmO0h1GDO5a0OkW2bxZRUdZafI/s7TzAXORb58uTFww6+tz8fJA
	FN62t0ZWsk5XCUw+xmJL1lLxfIQDi+dANqnE1ymAQ5te75PEjeqFrSadLBfSwwyoiVHi7KV49YI
	7AAAmCYI4JnF5A5NZlC6LEWrGhWm83rDlf/38X6qy5dbZ2obRUFMsr+HlZZcWZC3B+tM4HnkgLT
	BmMks2pGmUBJNGp39b7IV6cG0as/bFLXaf+avo9mpiUvzbwCXq8Zrsd2Lxbm++zwbIHJVHmTBVR
	QpL+3NSQqMt8j+s3WN06q0+2dpun6Ad3QZ81NyjIEB4ixvxccPSgPQJ1QiLxdoz2ZLtf1N8xFHa
	7DXr+FExewndrVWEpd1tP7DenRNWSoMKS0Yero6wyURHcOmF8UsFAXlG0oy/5AU9pwVe9mukaBG
	cPz4Z2UEu2+pKqE4EZTjMiqNxr3SJPjnQMiEz+hfY7FO412wg2ZFpXPDucaGW+ZyuPy880WunpW
	qpfF9Z7dBKwb8ZYmVafjv6JehCCh6AxdN58QQ3G0Yh9i9ZqdgKjCToeCYb5wPWFkxiGGG8+bwDa
	5pERSEVXpQ1hFKREd9whr0BFhA7NpX8BqH5b96aT5GK7Ok7DyDTm0+sldm83M1e9jPJdaw==
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr15141949637.48.1795504480156;
        Mon, 23 Nov 2026 23:14:40 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:39 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 1/4] remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
Date: Tue, 24 Nov 2026 15:14:06 +0800
Message-Id: <20261124071409.972-2-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

rproc_free_vring() resets a vring entry in the resource table as it
releases it.  Resetting da to 0 leaves the entry looking like a vring
at device address 0; write FW_RSC_ADDR_ANY instead, the marker for an
unallocated address, which is what the entry means from then on.

The last sentence of the comment above the reset claims that the
cached table is only available for a processor booted by the core.
rproc_reset_rsc_table_on_{stop,detach}() now install a copy of the
table for processors started by another entity, so drop the sentence.

Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")
Fixes: 4d3ebb3b9990 ("remoteproc: Refactor function rproc_free_vring()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d5fa9d23bd5c..b6fe74d34e5c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -417,16 +417,14 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	 * At this point rproc_stop() has been called and the installed resource
 	 * table in the remote processor memory may no longer be accessible. As
 	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
-	 * resource table (rproc->cached_table).  The cached resource table is
-	 * only available when a remote processor has been booted by the
-	 * remoteproc core, otherwise it is NULL.
+	 * resource table (rproc->cached_table).
 	 *
 	 * Based on the above, reset the virtio device section in the cached
 	 * resource table only if there is one to work with.
 	 */
 	if (rproc->table_ptr) {
 		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-		rsc->vring[idx].da = 0;
+		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
 		rsc->vring[idx].notifyid = -1;
 	}
 }
-- 
2.34.1

