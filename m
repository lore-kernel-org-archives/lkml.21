Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771172;
	b=Bd16ofFceyUhxn9luV+VCqSnHf/++X2BxOWELCH+ibLdK69X80296tXK15bjsfgGVUDu
	 XRSTPYiZFvqGWV5ES8lypoyXt5rXCP+TAV9hPuctl+zPKNGq1VmOJO78BdTykncGHGoZc
	 9PlKckJkv17ZznZH371mJgk1vcpD7qEsrOMnu3tMJGJjc0lcDAqKH1h5uHXRwHyhq2PnH
	 MYffmDlsV29Prp3/MxM/S2y3TwoKK3AVGtNt5TpmfA4sYbHjFOGGjGqFaUAdeWdYh+aIC
	 qK0wPEqc8EYtaow7z/nBHTsnjDUat0FM4HshrmHU5eZGbOUfCSvMinqQwLZlVDB2+4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ybRI/ts32jMrMimcIQY5ueXv6UCOl48wZhIdKBw+kZQ=;
	b=5RbGJm9qirAkcszHLsCSqeK4A6kkeTRGV6u0jN28ZEX7DilIYYlDziT7M6Y4Fr9efHlo
	 nu0b+IEf5lXfeKtLG0rae+J0KYM9IxH9pVKpQ/cWlMn3Tgarg/zSTdu8pxwSaHKNU7nJ1
	 5QCJ5s/6I0I8dm5MN7IGt7xRTMgS1hb4TuNx2NKQWrxGnYNZtPQ+1p65wANXIXVbQaqKU
	 HZajjRQxRFgM8qxohyt/jLOv3dO/mLbN3siOi36lUlyB5Q+UfvoiGox3ZDw2J1LFtMuty
	 2hma53tLeBH96l58VadyWejJeV7b0xfa6L64EnHC/Ng1KmQ2C808C7TuQoKXS+IMQ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4ijVmk8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B388606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B388606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4ijVmk8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb66245c51so4529465e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771170; x=1796375970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybRI/ts32jMrMimcIQY5ueXv6UCOl48wZhIdKBw+kZQ=;
        b=S4ijVmk8jdZdFB0BqzQmMZGmjEYW9BaI8j17SnE7yuBVOLbsnO0Z3Ed8XTlxHTC//p
         S0QVBUS/o8n8DpLrWoCl92J0+H/356tiJSLD7aN5CCVM/0sRyx3uDydg/LBPJzr31t0I
         YqbxoQ+Hl6tQZUuyNhBnQ3jgVkLcFFwMW3IUYWYjjFMbCyL9FHY7nReAGQSZjiq8dj/H
         3fj7wTCFpBwbrUPm5BAGx5jQRqD5oAYdQ1obve79uGegAu+9txdsOSD/HC3cWDWlZ7oA
         zdDHdsgclpqm67Gx4v/5PlwBkBaQa4crJzzydHZKMymD5Z/X24JvGlpe9aVgWaSUKWmc
         2ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771170; x=1796375970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybRI/ts32jMrMimcIQY5ueXv6UCOl48wZhIdKBw+kZQ=;
        b=g7M+R/nAedknZ93EPs8Hm54HnOKLugt2D/F5Y78nbz4BOOZaKtvqZK4+8pKwnBb444
         60nsnIzvqslMC1CQIJ/WIcZFLUrF/TdI78yRwMBUWUnicOa0aiTHJ+q8raShAKQGXvH6
         FIojNMqV1/IFjqjCNyEbMrfRA+OA1JgO6q/+lRdOme6JjaCkmsjS5wVfxmnNueKLbPUW
         xt/78i+YVKJeaN0gukr+zEunJqQzuV2GnSPuEh/0JKSCmWVZlt8cjix56bypXurRCfB1
         fwbkZXMRr6AisffAeZbFzDyfQygozX1gJ/uZX0K0IxP52KkjRlPMa5roWwDcX49fH3j5
         gpMQ==
X-Forwarded-Encrypted: i=1; AL+hErEtDiL6Mz1WBLDUS5VF+BxOa39zzQi+NW2BrqK8wvsCO/ncIdtTR3b8JmQUCIxlw1mCaLxtikL0vJJoCXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t4n6zWHjocR2XO8WwtD07XWkm9nfu4TVzrL4X53cXRRR0uPtf
	S5CGM3Z0QoVhkm0wjWuuiD63pjVT+S6BCm+jlBUgP/EJD7pLLp3MvEb4
X-Gm-Gg: AZFdTZcGWYUf67j2NNzLH5NUKtLYUOwVxtcwxZByp8cCYQt2FWQMOHwDvxxu8FjY27n
	qnB1WJoCj+mBAWybdNp+gAFO7Mgl6TIBafc089Ifwct29zKjJvdZuoScw5WOxR8Hfn14lZJ8J5z
	6Av9IsDZOagsomZuojUShN3e85nd7436iT3JrquRzBL3uvzW/0tq4ebLNf9Dcc0oEYzkeFfqpBc
	I82Y/eXxZMSvEZ9X5Sf5exxWZdHgkXnx9F2w6JdFqygzbpEfTAvIc22skfQDhLy5Q2P5wD54hqv
	ZcyRei5xsTRT54zCCtMJdrPSu1fcttRg7iWqEQ7MJGoE4xa8o75BPksbYRWqmHO8GEqHYCoDCsm
	GrY1Vr4xlim6ASH3TS39GcBjFXixqx5608yLozpNtoe0Q7LCweZ4uD35GPLUpD9FCboO9CbHuBJ
	012XTpamrDK9tVs78i0raoj6LlgOMQYILFtZATkflFOkxgdCkeRfX0Baglcb8g44twpE1LFXsun
	yCYKO3gaiCcd4RwKwVTkPZxekldajdJhaUhXLQY68vtGq2L/9pvPT5JHuDctCMd8HB3IMlJqQSV
	ZboBIJczyuFzxNg0wb6r6tKpYR7EdjFDx5Dxe1eWsoh22OSUOrhhKOpuKW2Xi8MCc0uQyDpm0TG
	XFZGQyfvw26DORchy+N4=
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr428075425e9.2.1795771170214;
        Fri, 27 Nov 2026 01:19:30 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm926247635e9.13.2026.11.27.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:19:29 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Olof Johansson <olof@lixom.net>,
	Jeff Garzik <jeff@garzik.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] powerpc/pasemi: Remove pasemi_dma_alloc_buf() and pasemi_dma_free_buf()
Date: Fri, 27 Nov 2026 10:11:55 +0100
Message-ID: <20261127091206.13045-2-fourier.thomas@gmail.com>
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

dma_free_coherent() is called with the wrong arguments. The two last
arguments must be the virtual address and the DMA address but the
DMA address and the allocation flags are passed. If this function were
called, it would call kfree() on a DMA address and dma_unmap() on the
allocation flag.

Remove pasemi_dma_alloc_buf() and pasemi_dma_free_buf() as these
functions are not used.

Fixes: 8ee9d8577935 ("pasemi: DMA engine management library")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - remove the functions instead of fixing them

 arch/powerpc/include/asm/pasemi_dma.h   |  5 ----
 arch/powerpc/platforms/pasemi/dma_lib.c | 31 -------------------------
 2 files changed, 36 deletions(-)

diff --git a/arch/powerpc/include/asm/pasemi_dma.h b/arch/powerpc/include/asm/pasemi_dma.h
index 712a0b32120f..bb2c347dfec2 100644
--- a/arch/powerpc/include/asm/pasemi_dma.h
+++ b/arch/powerpc/include/asm/pasemi_dma.h
@@ -505,11 +505,6 @@ extern int pasemi_dma_stop_chan(const struct pasemi_dmachan *chan);
 extern int pasemi_dma_alloc_ring(struct pasemi_dmachan *chan, int ring_size);
 extern void pasemi_dma_free_ring(struct pasemi_dmachan *chan);
 
-extern void *pasemi_dma_alloc_buf(struct pasemi_dmachan *chan, int size,
-				  dma_addr_t *handle);
-extern void pasemi_dma_free_buf(struct pasemi_dmachan *chan, int size,
-				dma_addr_t *handle);
-
 /* Routines to allocate flags (events) for channel synchronization */
 extern int  pasemi_dma_alloc_flag(void);
 extern void pasemi_dma_free_flag(int flag);
diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 1be1f18f6f09..d6ce553c53bf 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -336,37 +336,6 @@ int pasemi_dma_stop_chan(const struct pasemi_dmachan *chan)
 }
 EXPORT_SYMBOL(pasemi_dma_stop_chan);
 
-/* pasemi_dma_alloc_buf - Allocate a buffer to use for DMA
- * @chan: Channel to allocate for
- * @size: Size of buffer in bytes
- * @handle: DMA handle
- *
- * Allocate a buffer to be used by the DMA engine for read/write,
- * similar to dma_alloc_coherent().
- *
- * Returns the virtual address of the buffer, or NULL in case of failure.
- */
-void *pasemi_dma_alloc_buf(struct pasemi_dmachan *chan, int size,
-			   dma_addr_t *handle)
-{
-	return dma_alloc_coherent(&dma_pdev->dev, size, handle, GFP_KERNEL);
-}
-EXPORT_SYMBOL(pasemi_dma_alloc_buf);
-
-/* pasemi_dma_free_buf - Free a buffer used for DMA
- * @chan: Channel the buffer was allocated for
- * @size: Size of buffer in bytes
- * @handle: DMA handle
- *
- * Frees a previously allocated buffer.
- */
-void pasemi_dma_free_buf(struct pasemi_dmachan *chan, int size,
-			 dma_addr_t *handle)
-{
-	dma_free_coherent(&dma_pdev->dev, size, handle, GFP_KERNEL);
-}
-EXPORT_SYMBOL(pasemi_dma_free_buf);
-
 /* pasemi_dma_alloc_flag - Allocate a flag (event) for channel synchronization
  *
  * Allocates a flag for use with channel synchronization (event descriptors).
-- 
2.53.0

