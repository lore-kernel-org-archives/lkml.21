Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188524;
	b=DSsCrwbMo9kNewgyfBy4swoDIEUraho731kUQO9JvCPqRz4LrtEYzRkc18NzPtA6CIup
	 UoZ5qHYZ5v2ZxtQgJ4/7XP6owLZATYWfgIiIrgW/0Uo9ULwEbVVE0lhk9MhUsXnX14KIK
	 Q6GxfilIlPLmULja6eVf5Zk3K9qvrLkO/iKtNhGeidk34Ijm9zD+GgwNjjP4YLBQlqKdm
	 JmLWOaahiC1JmlZmsdf93ptPuTCIduzdNawllzHpPr1/uxdUcJ/1vUTm5+xzWLj2H+zB5
	 tmhMHxwrBMUThN5G0AMbC6v4PQgNZE+RjhasFPsWYiZlGnQYFWKRlkrVk7MZs5mG/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
	b=4/KAh7Y0+sFkzEdJWQCwmB/+9OUlVwkx5XeptieGYvf84MFovsFv2IspJU2nIEBFLIxq
	 OqeRDZAudTsFI1gi4LBklAD0eIzXQ9Qd0a2wgi/Ot5tn+QwIjC90wXh7ekO9CdtsaguH7
	 waa2WSlnUtEl9jmGy1qTg3rKpxEVEaZvilTc/U0xXZwdTV6+CeRErSVzMZuf6oJwab+7n
	 W5miq29YKhVtICUL9WuXYKm4ckE12zxB4+I2Pa4OIWf+hz5FwKT8dgvxHkXKsZwMCbyys
	 hA9BjVzv3+P2OByIAZRYTCBxMvE0l4FgAAgDkAUXBmKtEaecf05WGGD57AnWrY3Kosg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TOAWdLpc;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22060A2624
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E22060A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TOAWdLpc
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b600fae14dso364994b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188523; x=1795793323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
        b=TOAWdLpcAcKkHlmzxyh9yRom/EnpPXNdPrpn60Iq1Z5b/nVCokW4ONED+4yKQR/PDj
         8eXzBP7r3aa+GFmJllivXelCGY0YC1TNYBgNzYrxU1LSMtAxN7nertdERfJko917YZuv
         pCynmGNiCBHm6VthLCBq15bugt8pLN4e93sEbqTirI9bqDDlyZK8vITk+V0iNltyy0lM
         +F4RE9v9pefqiGaN3KKsfiZKlcp2216WKDtWEkRBsLgv8IlQUeQCmvADrtsLzYRJRHfy
         Krujl6cEQsHw3jBgzqLmc+0Jbz6QA8eOa+uj9iXNi3c7nqDzUH89eCrW9iid4BTJjZ91
         Sjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188523; x=1795793323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iFyG/TRTFnFVaxbHFa4tzavqW4H7pOjO5Kz0xPyRdE=;
        b=cbQuRDvcDzkAgb4GihG+1t8/MTLs0Cmc2SwVaC0ybtEZ/t/U3uL0u3lvZyedyHOBE0
         cbUjb+NPo5vw6A8wQaycENDo7Qy2sUm9UcGRyrPO1FPYswq4GGXgixv9xTr8D4ascYF/
         0478pOFmx9qT+6E6GfCfivqhXDw8tfV9nXaeG8QNvLH7fDy2M7DIar9LCizecFTYHkq9
         7vxRDjBjqbk+TeDBmQVuwzGL143V8/g7MWu4nN7g5JrhLlDRA0EomsErjYH9Uw5eOxQi
         S6YqBec7Xz5EnAk553LJqruS/8+5JJXIlWnp63TODf2GEk7Y+Xdg65XoJIgp355SHkym
         3CZQ==
X-Forwarded-Encrypted: i=1; AL+hErFNs2jOmcD0K7mnSZVJvgxN+mT+1zmErKG2JVifd2S7qoxBT31C663/PQ+rNVk2ZP94DbOStnZdpxokAaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gz0lYjnQkDGmmFBjlxMf/JmeL7UFwwbXz6Lx2SGfI7zOFgehQ
	66m/uxNogj/XFfG6MYLZ568acLPXLUb2YhX69Xyx8HYhTNTwsqowA3kqFI8oywqc3fc=
X-Gm-Gg: AZFdTZcirFDBLtlRtD4HlyuZmqmplpcOIBJqbw7v5sog9C6anVN2L9bfQN6WlYeulMo
	JmXnT1NlxX490pK/paHYLyOHAZ7HM5YgOIbYvA0jEn4iMpum6SHSbjJjnIebto34tP/zFjpMS9G
	msGLGcZGuf9JshtpK2KYmaybm/S57I6gmMSovg3cnhwd2ETyWmYwq+o639dKdrOMhWaVxvUeNYk
	TZA03TXg6zCd9vDX7KonoqQ/VpgqdfRNKSGeFS6so44MgDupC5Mfxbi/SWh2johpU2Ap3k43Tfm
	+OY0UbAjhb0+IYJ6rwY1s9XB2/B4Vv+eeLlTj5Ke84ZVrVO6P8WqnqCFhVbQE8AwLrX3rJVWJjF
	9wOaNhdDummiSeJOYnxYSzX3ehWJwmVU/7FLXL4DQpglluNXNwPryhM2YVCJ6Gep73A/0MnIBIf
	yepWzccaE5GMaX5SzuQ/erZmQCxuca4noV6xzdkmmFwMTQ1Ia1D5rWaaAU+yQzM1YpzYU2bDYFT
	XBcF1MS+1ETPh5Xk1Usax6OM0bdqIHASKsxAfoIsFMnR/+mTFzMnXx/IZxsJTi8dKlrPpNJV+tK
	bmuZ/OsRUbx7wfjkKHE6Zpm4FM/n+kk4gxCsZEfPuqg=
X-Received: by 2002:a05:6a00:1ac9:b0:874:705d:f65d with SMTP id d2e1a72fcca58-8c87cf2ad20mr3193643b3a.43.1795188523647;
        Fri, 20 Nov 2026 07:28:43 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm1637924b3a.32.2026.11.20.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:42 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion never arrives
Date: Fri, 20 Nov 2026 07:28:24 -0800
Message-ID: <20261120152830.699712-3-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
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

When HWRM_RING_FREE is sent over a completion ring, __hwrm_send() waits
for NAPI to consume the completion and gives up if it never arrives,
without looking at the response.

If a completion is not posted within the timeout, check the response
before giving up. If resp_len is set, the sequence id matches, and the
valid byte is set then the firmware completed the command and only the
notification was lost. Fall through to the normal error_code handling in
that case.

This check runs only after the full command timeout. A response that is
still being written reads a zero valid byte, so the command is still
treated as failed. The rest of the response is read only after the valid
byte has been seen.

Log the response state on both paths so there is more data when this rare
event occurs.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 47 +++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
index de02d1baa751..53667c0c38aa 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 		}
 
 		if (READ_ONCE(token->state) != BNXT_HWRM_COMPLETE) {
-			hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
-				 req_type);
-			goto exit;
+			__le16 resp_seq_id;
+			u8 valid_byte = 0;
+
+			/* Only HWRM_RING_FREE checks the response here. The
+			 * other users of a completion ring depend on the
+			 * completion itself: the IRQ self test, and
+			 * HWRM_RING_RESET, which reuses the ring. A cancelled
+			 * wait means the device is being torn down.
+			 */
+			if (req_type != HWRM_RING_FREE ||
+			    READ_ONCE(token->state) == BNXT_HWRM_CANCELLED) {
+				hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
+					 req_type);
+				goto exit;
+			}
+
+			/* The completion was not delivered, but the firmware
+			 * may still have freed the ring. Check the response
+			 * before giving up and log the state.
+			 */
+			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+			if (len && resp_seq_id == ctx->req->seq_id)
+				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
+
+			if (!valid_byte) {
+				hwrm_err(bp, ctx,
+					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
+					 req_type, len,
+					 le16_to_cpu(resp_seq_id),
+					 le16_to_cpu(ctx->req->seq_id));
+				goto exit;
+			}
+
+			/* Read the rest of the response after the valid byte */
+			dma_rmb();
+			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
+				netdev_warn(bp->dev,
+					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
+					    req_type, len, valid_byte,
+					    le16_to_cpu(ctx->resp->error_code));
+		} else {
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		}
-		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		valid = ((u8 *)ctx->resp) + len - 1;
 	} else {
 		__le16 seen_out_of_seq = ctx->req->seq_id; /* will never see */
-- 
2.53.1-Meta

