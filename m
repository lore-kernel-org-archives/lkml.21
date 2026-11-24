Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556458;
	b=MSwnxpC5GhJcO7SXN3F1w1JIGXz4F3RGlA2SMwTq8EW4sPLARt2rLTcLNzDBEvcgWg/y
	 /bbL0D5hTDtEZCGT7Fejibm8ys35ELw2iyebUbg/PTLqs8Xq1sFvLOkPNut7lPlPDA5P6
	 va+aoH5IprGcfZSy+uDdWpbodUKuITLaTb5ExzcNkPse/94CC7RA14d11R191UVQwJ2/f
	 BvokY+ctdYzN4UBmfc9gKELs+dF5pS+cafMnAiraCLcVQRlhdbatyEUPEQOJDgPhNMiD4
	 dvQwSE3eFA2caBHvZhVmOLFE+mFV8CyRM46JWoHsh+mJ41nge57fJrQP/oY+8XhNURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
	b=G9Ey1WJzMSC/zl4pTZGcQA5kdQfs6lsIQ/aN17LpRbv9GOycTopW1+hVqCVPnvlgd4pw
	 5+jOeBnZ2FXGXEBJtw4imptU9SJo+DopSOgiY95FlicyFjwfylGcVnWqMTb9WNrCE7icj
	 llyytfFxFrprjz7M5ewk376YhvPRXyl2ZtVcRIvK8MeXA3Gzwv7UW4y66e9GwBK8UlOuQ
	 3TkD4ugybRXM/bDyq4L2ODZsOpD/XeqiwcsHGZJQ8RE+naLNPvAUHahlI32jIZ255M/dh
	 1/cuMXEgaTBkoXCNcsSOIx5RgIRrVwvlHpHf0ZVJuudlEr0XTW42N3iw4fFAgpOi2HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhCQDxj;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D3606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908D3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjhCQDxj
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1884005137.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556457; x=1796161257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
        b=yjhCQDxjYobdGBu8sg3D0o233SJfjxrR8hjxGeet+/gqhco/LIWFYS8K+YCDPfmRK+
         OKDWwHCuqrJiLO7OxplHM2S7Lskshv4o/6p7vNeUvYsxEe9GXa8s+/OEuz+L+gGYpebJ
         uEGAohwARfNlwShXkRwrP/99abHe7V0XVbj8cEQXG5yHhwkPNea6BZqXRaTVtvk0slny
         eTr5WtB5t0KMXM9O8ugq+Qveem3q3tpNheF0QZGbv3+UJE0/P9CArEYuFm686gVj4hJ5
         0n2MWj4Q8FtyJva5Xs7pVRPe/IiDDAK5X4CteY5IgT9zUJm83rHWMokZ0uIS54L5Mt1X
         vDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556457; x=1796161257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w42z6p6tUvCwMwZ0RdL3hWrj/QD/3zaQrRloQWU7Khg=;
        b=rnWcsbw/+u+Iy92Xcz1tSI/kY1rOXcl1ZlLjfxgyc5hV21apWVInZrQQipQggSLlo1
         pF/WxuaKDmuTY1YoUl5HFWPQhlnuCoWRABuTrKRHAh3IYCPD5Jg3b3H+GOiqRwSO+1g2
         k6bdIAhg/vb6Hf3hLDgdsZqXZYnT3OkUw/Ezx32M+cxgnnYUeLXNzAJ7yxFAbVMg4s2m
         YrPfwls87deHFBOafmKj8N0L+LmjL37D8tlcHYQ7tfsIumXNzRzzUvUlNdzU941i2m9u
         ms0ekn/GcqtgfLPHj1Ordk5VHf7AxmNOgzqjQA/dxg/jOtNYBNKx9cfNJtwLJPq/lIpC
         6BSQ==
X-Forwarded-Encrypted: i=1; AL+hErEmnkyNiBKJJGK3YMk+mHtMyml0jXZ3GNrD0KCBIdzyZC5Tp265jZGIIFYFNJIPgJ1W5+boIS/Xa0PA/84=@vger.kernel.org
X-Gm-Message-State: APuU4Z90jm/4RpOkmF0zx8zurAwCiyfkA1Xv1KepE9ElF218GL+eE00i
	lAoCMXKx6/TMoy3wLB6I+VfDdnvI5EFkiHj1uHQw4qllVMK2UXuulgoO
X-Gm-Gg: AZFdTZc4iq66paAu7vn7aaSyiw10+im1VhSiZx1aw8S7PtAwwLe28cCp2K9lWNE7AxJ
	55E827CqzZW4cXh9QRIceaPXIbjTy1cIeiVobrF2pcu90s5T+xLcrtxiEIoMH+mGwWEkx0GwYJJ
	u8xnvQ6C+HK3+hewzL16m+pQiHjcKaRraBLJpDu6S0oUQJiccfbmV0pVsJJKm5lwU6MzchY/JmO
	dUQyODg9HFRwjbsSGDL2TOdwZrsSW9IaDH0AMMXO4RF5NndsbXjRuaKgFXzZNT3HZygp0ERT+d/
	lTRu6IHDIY5e47r62mr+ocfjnl7zj35+lT+L+ZrIRjr+h9MBpDiTuIyoYYCeaIVreN8twrhVQ4H
	qAm/5uJkH0lno5U+wLqdf1XQjPwiIry/AyhUX4Uk9Q63WiKorHspWx9pU8gLEH2PJJ3wB2FTtNt
	jwstqVu5SpG9rohpVCCOq6ZuAHqSnGznVy0hlQLMb/fcdh9j/+tUFAPAGUWMDCBIWJ2q/3snCwo
	fn21pdtjvbnPHz0dOIjVBSqdgLxk1xfYIAX43MiSWvxeW15Fsh/Wc/KAYix7mz343jijuwvi94G
	uk8cKN/On9xHaPE9FgKraarc//rntjJ/A2De0pqA0W1kCQPaDI7W
X-Received: by 2002:a05:6102:644d:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d739356a57mr7901936137.9.1795556457444;
        Tue, 24 Nov 2026 13:40:57 -0800 (PST)
Received: from emedev.tailf75c28.ts.net ([179.238.117.100])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm15952879241.1.2026.11.24.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:57 -0800 (PST)
From: Emerson Busson <emersonbusson@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Kameron Carr <kameroncarr@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] hv: vmbus: allocate requestor metadata with kvcalloc()
Date: Tue, 24 Nov 2026 18:40:29 -0300
Message-ID: <20261124214030.174246-4-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214030.174246-1-emersonbusson@gmail.com>
References: <20261124214030.174246-1-emersonbusson@gmail.com>
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

Opening a VMBus channel allocates a request-ID array and bitmap sized
from the ring buffer. For a 128-page NetVSC ring, kcalloc() and
bitmap_zalloc() require multi-page physically contiguous allocations
that can fail under buddy fragmentation even when order-0 pages remain
available.

Switch both guest-private structures to kvcalloc() and free them with
kvfree(), keeping slab allocation for small channels while allowing
vmalloc fallback under fragmentation. Guard against a zero requestor
size and clear the pointers after freeing.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/hv/channel.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index c0bf154915..8547b10f3d 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -733,10 +733,13 @@ EXPORT_SYMBOL_GPL(vmbus_alloc_buffer);
  */
 static u64 *request_arr_init(u32 size)
 {
-	int i;
+	u32 i;
 	u64 *req_arr;
 
-	req_arr = kcalloc(size, sizeof(u64), GFP_KERNEL);
+	if (!size)
+		return NULL;
+
+	req_arr = kvcalloc(size, sizeof(*req_arr), GFP_KERNEL);
 	if (!req_arr)
 		return NULL;
 
@@ -763,9 +766,10 @@ static int vmbus_alloc_requestor(struct vmbus_requestor *rqstor, u32 size)
 	if (!rqst_arr)
 		return -ENOMEM;
 
-	bitmap = bitmap_zalloc(size, GFP_KERNEL);
+	bitmap = kvcalloc(size / BITS_PER_LONG + !!(size % BITS_PER_LONG),
+			  sizeof(*bitmap), GFP_KERNEL);
 	if (!bitmap) {
-		kfree(rqst_arr);
+		kvfree(rqst_arr);
 		return -ENOMEM;
 	}
 
@@ -784,8 +788,10 @@ static int vmbus_alloc_requestor(struct vmbus_requestor *rqstor, u32 size)
  */
 static void vmbus_free_requestor(struct vmbus_requestor *rqstor)
 {
-	kfree(rqstor->req_arr);
-	bitmap_free(rqstor->req_bitmap);
+	kvfree(rqstor->req_arr);
+	kvfree(rqstor->req_bitmap);
+	rqstor->req_arr = NULL;
+	rqstor->req_bitmap = NULL;
 }
 
 static int __vmbus_open(struct vmbus_channel *newchannel,
-- 
2.43.0

