Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174051;
	b=xstN4hWjPs9jRawmUSGQrGz2RXarCa3KFZAbWsQn2pvSpcrOxjxP9tbvwxYx6LLuG06W
	 1ym8w7oeIb4UM7LUT5JoXOlrRE+6Zy1gKuGtHHJObCMgJmiD1bSgDJWtZNI4d5fzTW31W
	 5Qdqt62EOACq0m9TAE/xI3l4BM1F+KO7SzOSM/JP8TXmxy9mO7kIxGzOXZN585y1Mhlnz
	 3XE1UgahB8rgeFgIJbLeABcXywNxthJFU1XennaN4R0ZCdGvEkFFNCUkfSr9xN2Uzy0eY
	 ALnHFFU9CFlyC2Xb7YXBODoFOUDp/oxW8K7JUnGtuVtW/OYNPkde/GHeEx2YXCmxhZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174051;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ASWa0rCwAwWSXr/9bmTm1YRMhd5ao8PveDcuQoxadiY=;
	b=1ddhA+ux2ns9YcDSbDg5CnhwBGl9P+c8Ku8I7LhJ/XAdYhJxECwqHhxFgKoQGT1OCAZq
	 pdhJIHwmobKSIjk3zGBPBY+DXsywMWL3ZSU0A9EuKOw0tB6QaQvUEiFw2hBt52YHD/O03
	 d5QXZEkCArJfP19c383jqIbxL3DwFQ6tjYngsIrs3541lV+nt9Ze+5XzePt+3BxbWWu9M
	 jMk7lLZTUi55ICHaySD7UaNPbNtwJcazBxcqQW2cAQ4RALKNDTv1VI7UWrSi/UjCfo73G
	 l4npikPeMPuqIIpMpP3VCanIlzgK7cZCLuK6+WfgbkYxs7I3BLox6QR6oKlItHMcmBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX0JszoF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371C606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KX0JszoF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DC41F000D4;
	Fri, 20 Nov 2026 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174051;
	bh=ASWa0rCwAwWSXr/9bmTm1YRMhd5ao8PveDcuQoxadiY=;
	h=From:To:Cc:Subject:Date;
	b=KX0JszoFy7WOkRSRQohyhEw9oq4ueePNK9uZIe3F3UiFaAwOojTr9CEp33d2MRDGZ
	 wWGS5pw1soMSNX9fZm/0umk685jRuj+HkLdkVEVvLwWVix2OixHZyN21X1KeNk4Ze9
	 4OcRAsXq/towdZxjlkR1K6e/HqqU/9S6ACCTW5xgxM8WLa8WsIpwWVl+qJangn0kK0
	 4LgMZ0XfaaB96DWY6rxptGSHbWMMxVZod/Lchmx6QTKtWjh2RocMjU2ZGNDnpsYLCs
	 Mqqdonhxc6HuRg0SQnQS1PQpex3OFYVEkwQVQ/I3YgB3JVnWCwYPfEsPEX7A5N9k+R
	 mpz4/6FOnJbrw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dma-buf/dma-fence: Remove dma_fence_later()
Date: Fri, 20 Nov 2026 12:27:04 +0100
Message-ID: <20261120112702.2970576-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dma_fence_later() does not have any in-tree users anymore.
dma_fence_is_later() is available as an alternative.

Remove the surplus function.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
Changes in v2:
  - Rebase onto misc-next due to conflict.
  - Add Christian's Rb.
---
 drivers/dma-buf/dma-fence.c |  3 ---
 include/linux/dma-fence.h   | 26 --------------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0776ca7c795e..ab02afdb0f18 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1115,9 +1115,6 @@ static bool dma_fence_flags_valid(unsigned long flags)
  * refcount after committing with this fence, but it will need to hold a
  * refcount again if &dma_fence_ops.enable_signaling gets called.
  *
- * context and seqno are used for easy comparison between fences, allowing
- * to check which fence is later by simply using dma_fence_later().
- *
  * External locks are a relic of legacy use cases that needed a shared lock
  * to serialize signaling when no out-of-order signaling was possible through
  * &dma_fence_ops.signaled. Drivers have abandoned this concept since the
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 56c4e5beaafe..513d9dbbff47 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -626,32 +626,6 @@ static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
 	return f1 == f2 || dma_fence_is_later(f1, f2);
 }
 
-/**
- * dma_fence_later - return the chronologically later fence
- * @f1:	the first fence from the same context
- * @f2:	the second fence from the same context
- *
- * Returns NULL if both fences are signaled, otherwise the fence that would be
- * signaled last. Both fences must be from the same context, since a seqno is
- * not re-used across contexts.
- */
-static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
-						struct dma_fence *f2)
-{
-	if (WARN_ON(f1->context != f2->context))
-		return NULL;
-
-	/*
-	 * Can't check just DMA_FENCE_FLAG_SIGNALED_BIT here, it may never
-	 * have been set if enable_signaling wasn't called, and enabling that
-	 * here is overkill.
-	 */
-	if (dma_fence_is_later(f1, f2))
-		return dma_fence_is_signaled(f1) ? NULL : f1;
-	else
-		return dma_fence_is_signaled(f2) ? NULL : f2;
-}
-
 /**
  * dma_fence_get_status_locked - returns the status upon completion
  * @fence: the dma_fence to query
-- 
2.56.0

