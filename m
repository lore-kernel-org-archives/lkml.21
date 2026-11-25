Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604364;
	b=X9onJ8aXZJmiAkeTbEVUX6hGgSZF4f/xSbbAqzfapkwfOz0E9nFIIsSqdCALFvnurHPn
	 pSWFnB9tJlcNrx9cf+uk6o/qYiQhvSn4PjGD5xj3L3Az9hP4l1UVWs0wFw++AhrxeU+oJ
	 bDTZcsX7ZBppz6qF+O2Bizg/sF7Upa6iNb8AHiqlym2oQHXUtyWUq/traASKCTYlZUHE5
	 wctjG1LtjicU+m0cQyOQZkDTcbOWqo7QR5TXwj/jUFF/wYAOupE52onLm4e0lxUe8NZpB
	 kRXWOoe2S1xL0I/Oq2wVUSkh9/lOlzRycSJ4WBEwhGqeebAZai+oOlEEblP/G4GWD3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j1FGvTIUIAFBOZYmL6OiO8sZFEbEFDfPmxmvVzyQ4O4=;
	b=L2PxbWkP1yWFeOAHR/Xaf+EJKQHH5vhynTUZNiCWZCm0ob249BCx1oqBQAIx7UE0Eg0M
	 /SaZJY7F/lo7GdsJYo5mhlYYCx7uW3RUd0U0YUaITz1RmJZXJf0kC7gnjdgFQegjGImxR
	 r11dJ0JxXJvdB2M54YlDz1XDo/3PnSVjwZoamYdMgZu6W43aQUYFv9lpmxvPUmcQ5XXZR
	 sn9ujFMehT9dQcq0J9X2k818Z+Gc9n9O4UKne36ycrDequPu1uUn307tSZNKzNQrVvsLe
	 4+xIyP4LFLMDGqzRveed9Hva+7xrKNbqAp7tdNPOvYF58dUjBNNh2uz2GfVfYXJkFmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5paWmhl;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447DF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 447DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5paWmhl
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so11174954eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604363; x=1796209163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1FGvTIUIAFBOZYmL6OiO8sZFEbEFDfPmxmvVzyQ4O4=;
        b=l5paWmhlvul/tw/kTqteh745vQEXeh7d1Fd4bYOnqC2zUQkt7xFh/cAzBJy71FYJMk
         zUBPHGWUxP6NoIuUKIr1EE1hQJ6jDcvrQfln8HtHCDdOsigZrbAD07VS3axTCZmj4Z7g
         fp+fQY7/EgOWTDHInPtZyDoKd6+rNX6UPgKlDRYvY1d8o+Nja9d4YHG2QFGSfeVhbwph
         0+KN2ug/N3EpiORql/S6jKTNxviWcL800jv3MexSaMmsDRszh6XEuGG64ZSrFywFlFS1
         L5vIQfxcqQso3upERHrL9L0mFLhl9usZTO78V1MLASVFKWijxFUlMEaoorZ6WVcnLNuB
         gYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604363; x=1796209163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1FGvTIUIAFBOZYmL6OiO8sZFEbEFDfPmxmvVzyQ4O4=;
        b=yieBQsq0uMQl+2mTHkhF5FYXR+XQLnN20CgjLT//LbPe79LieJ7UrMj4aRl9X6Wru2
         Ll/HeoNODbz9bX0kzgY/ht2jL1vtGoH/IHqCXfCK/NZUurTiCJnW1RI0YVv67ridhT7G
         t3EvrsMbTAdSok5D8xCDQNVAbCVByWQ5bovkq8daQRct4VVmLIQrTRZBL64xhGZP5XSM
         c9wDvhS+iLi2ynNFVYHMv+oyNB5codFCF0D17WD9s15n+uhDtgCyZJCKeXycyptZ+EBe
         7vwLS4S+LIyiXJKKKhYdtfQt5Bpn92ZAO0CaOpUm6t/2eR++yX38XAKnOe2S7dHz5O1g
         x1oQ==
X-Forwarded-Encrypted: i=1; AL+hErEYRQNy7YUDErP55AuYOUoJVAYzx7BbASzUJr5yiTyz0kF3PPHgkmxbr5XZgOmpUbLPymfNVw33jZDtqts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/6QVO9jJ+IR/dQTTaLFCbcD4rqI9XZzuOTMiE1mGt5WzjKMmy
	M61D7YghyA9DyVJK2TMCM+RRyFbHJ02VA884w7taW6b7QuTNB8LJqkXt
X-Gm-Gg: AZFdTZesu45PYWXFAqvGwC5oevUi356WSmhDtLBWm839uJCXOE5htBeisJB4XGffrkZ
	q62SmGMHoTefR/CgdmtArGAVqVG6a3KWl0hyv2R04Q5LSqloSPeD/nZDJpl1hikPKu19kQSfMVj
	NVNGar6XV4XffTEFsnQ47eMaaUy0fFuMoLIP8OYtoiN/uJAdgp4DVcxkgybsq+mpJYgcWlRLVZ4
	0Lns9ur+kGZp30KSI8JTeCDKvDtSZ4e46Tl27SBQ6cn6brP/oIafPa4wdyDkNDQ913Ib9j3ikBg
	4ORbN5AVwoatBOEzsWqyyb6KuA1LSyAQg8Pkjt9DAOH0vm8S/JwfVStmFxCYtu6aP65pTINojEF
	+xzQMNy8J4jDKyMisuoCNP6pNQMBfqwHsojDNyiH16w8BUPLZgAVW/Za99zkvIPDHQQZRZqaDHY
	lMMPFvrKOqjwlmY97N5KcJ/MwaoClubXErBfZE6/Ec+dTWT/f5hz/S/Fy7NA4jhO6ed4Vn3oSBI
	q27UTKABPsHFkZOku27wCwiHDh/s5Z1eEyNeSc+Ai1RMkBtNiEpcpZemKK4Pn6fgJ/vfcnc+zgj
	OnqrYyi6r0Ql3hSWCYt2NmzsVjJCdYBhLTS5pp+ZO19VlTMN3Fruev+ObnaGzmQneIMijZ9pvnM
	SAaT5EKpk7DmluRTPKx/hgS6Q4vA=
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id 5a478bee46e88-38648c1719dmr15667422eec.37.1795604363311;
        Wed, 25 Nov 2026 02:59:23 -0800 (PST)
Received: from localhost.localdomain ([2409:40f0:12f:243a:5b38:482:e2fe:5dab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm60114815eec.24.2026.11.25.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:59:22 -0800 (PST)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: Remove unused userptr rebind tracepoints
Date: Wed, 25 Nov 2026 16:28:54 +0530
Message-ID: <20261125105854.48591-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The xe_vma_userptr_rebind_worker and xe_vma_userptr_rebind_exec
events were introduced without callers. Their definitions were
later moved to xe_trace_bo.h, but remain unused.

Remove both definitions while retaining the shared xe_vma event
class and the other events that use it.

With the tested x86-64 configuration, size reports a reduction of
936 bytes in xe_trace_bo.o, from 24146 to 23210 bytes: 344 bytes
in text and 592 bytes in data.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 36fc7eb65882..8be08d527ea5 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -150,16 +150,6 @@ DEFINE_EVENT(xe_vma, xe_vma_unbind,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_worker,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
-DEFINE_EVENT(xe_vma, xe_vma_userptr_rebind_exec,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_rebind_worker,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
-- 
2.47.3

