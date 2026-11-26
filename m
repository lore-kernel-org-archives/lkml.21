Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681291;
	b=DPsvImYqYc8429Td/IykHBjFT92h0x4cuMBftrgJl31jonOeAn5tCHduBtBlt5RTBHXH
	 bZIE/sa+JtsZJM8n804R2hrfi4LW8Dn0MUbRz/+tB9dwKUbVigcpAf7IQEjLGpy6cshvL
	 Vy5R8LS48V2xWplV6mikj2az15bp+17S/Rxr77QAdhVlf/2J7rUjgjTWKXUdRHA2LjKFs
	 TBArSwTtBkVOUUSyu4Vz9i8eBlNSLUjhavwc42/gh6Fzhb9mcnBA4B8xPicxhAKYwtUxh
	 9JAapWs15GSXMuSW8HuGLnYKZyX9lrYJlFPlROtL3n7QRvvQR2qe2b233+nrvkcucNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WT3cQ/tGuI3u/ymiGwGvMWdg9a6EnaubOAZTrPqjTqQ=;
	b=iX+gp7kS3gU+w8cp/TLjh7MoAR437/rXU6KFsNMhOx+/0qab2y/dwGi/9Zfxsp96nHR7
	 IXGW0wJih8uP0sUJzJSi8wefk41ckUjLTbJs3bbfNX07Rg/DlWprjocKkhOdNbiPxq4sw
	 A03iHHRKsaucWgqSvGudOeI9nVEaFGCDf6R3nYKdRuYmqR3HcFUvABUn/Nf72a3bup5hY
	 KZveRfz9NeHwP0bdDsqutUuIQrSK4kDuhbs5hGsvPyXnswREWXs/DV21Bo1WJFb84dh61
	 iu8rh8Vz4EhsKrBVlp7VdS88q4uw0wT5OIu5KxqEPqJ8N4BGZ1jV2EWfu4mHOKd98EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=st3R5HEe;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C888606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C888606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=st3R5HEe
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df3912dd2so353944f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681289; x=1796286089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT3cQ/tGuI3u/ymiGwGvMWdg9a6EnaubOAZTrPqjTqQ=;
        b=st3R5HEeg42qArdKzEyvwRR/8muIMQf6j5BMqtkLibjBDT0CzunFhvQhwxjnKiP0OW
         td8Zb6Qk8+3E1V79Q1XBRDwKkSF+ho8QODqgYC3XSnvyI4jGKFKaacU/RfHWTRkgik4W
         TCKHEENz2Q9MM+JvOIhvf8GeHeLZudortG4Hn5T5nv7Oyzg6A94oaasHINFLjv8W6jvy
         JmKp9UwKSrNbSPN6ibyBwq21QJhsOxem6xHEwe8l7QDlNZXV68qajoLKqKylEa1fVdI0
         BmVGIjCnwWbUv8rl10+8/bLfFncwKsVuWsCFoxmUGLkiPnqb5Sfe9jv0DQWvpVeBVGSf
         9yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681289; x=1796286089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT3cQ/tGuI3u/ymiGwGvMWdg9a6EnaubOAZTrPqjTqQ=;
        b=WjLcZNQRU3NjqRLgz7RsW5/r15lYZOJFkEzIlEovqqq0NLzd+ovB2ad+9V140Q5uF6
         DOLHV1x4Lor0vekDNN3m81RKK+1ScnQJ6jKz1pNvwDmGd/hKb8UuyFbBhAP8Ew8ld+NH
         NRVneD1ZsQBuMqLCDxof/SoS0ZKlgot23GFJM/3EZbXJkMpJjNGzeh13lOsElTcXKBDQ
         H2ZDrTS0edPxlUI8mZ/wSlho9W64Vim6zBaXHXFUmpzO492sk6oGueLPqC0wb8S01uOf
         tzQTq55i+4mBNqMAgzMSjJtfvhtuRAqn84XmdRpCrgvdW7d/LiJ2Il/WpYQQPV6/0bmf
         JIrg==
X-Forwarded-Encrypted: i=1; AL+hErEpFrnc425NcvAUNWbkjc40I8czFdpwFUPDkf38QD3OGK3thvBymO8xWBp5n0M//N5wUcUDF9dd3W887yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NdBwMiBsESBkQ6yy8DC/8tlCyfuvHkz7jjQ8yJdbjcwzDd4j+
	/pt6c0Th2IVtmec0Mxw/HO7PIJRS2qhKcWMnUSY8oncqvZfH4OhVbycA
X-Gm-Gg: AZFdTZeVHzXDEgFaxzX+pEFiwqTBJPnW6GMtYNjt5Pz3+CRgEDKGlJO3w95ztklHoNL
	9egeBqUWtYCPyJBbNL0W0I7mh1/W5Ywl7a1FWAWwiCIBo2OgbXabxpN7Xv+6GMgmvyeYT6H5bpJ
	z3A4hHU4g2rb3MDVOehvtwBSKAn3PQlv+B037hq5m+hPJqs7VvTkgbWfwT5o8wWK1gH4ZN4kIIf
	8uuzZYRupSyFyM4uMhffk7ERHyaUqhYeBvdKkt0Lckmd192g3cTtTHiDNd33c9lwES1I3jLBVBl
	5WHKPpWYmoz9hpX0I2cEQB93oCHvn3vMgpNF2+Zg1cd9pCV3oUUTxNPLlU3p/IsTbME1xIQ0LS1
	22w4mHhZA+MUYhm/PmQ1gUFzq4fh+shAuIppOz4ujAAF+hQRSb17sepogebnVoNwqM92KIkxGCd
	N3z+8t/eEZ6zzixZSsv58qZhhAoEVOf4mceSmaqRHDnwqjAp3rwB+4rnzU+ti566CatB5WIrFma
	iIFNPEZmSsiKPDrxlftSBtLFgGuJso+5i9wMoaoybyeGv50vN3T+TV/XQEynQVCU4Tl6x7hkX9V
	dNIQPjMcdDr3P2l7qM/smpSW20enUvieDt+LL0HN86E8zncxOkRn6AMtWCYOjdkmTzMJezz0p4R
	htRFvzNQSl6hPuVM2Zf4=
X-Received: by 2002:a05:6000:22c1:b0:48d:f1b3:7e82 with SMTP id ffacd0b85a97d-4aba531f89cmr44694047f8f.0.1795681288471;
        Thu, 26 Nov 2026 00:21:28 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm40094282f8f.2.2026.11.26.00.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:21:28 -0800 (PST)
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
Subject: [PATCH] powerpc/pasemi: Fix pasemi_dma_free_buf()
Date: Thu, 26 Nov 2026 09:16:27 +0100
Message-ID: <20261126081637.13160-2-fourier.thomas@gmail.com>
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

Add the buffer argument to pasemi_dma_free_buf() and pass the right
arguments to dma_free_coherent().

Fixes: 8ee9d8577935 ("pasemi: DMA engine management library")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/include/asm/pasemi_dma.h   | 2 +-
 arch/powerpc/platforms/pasemi/dma_lib.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/pasemi_dma.h b/arch/powerpc/include/asm/pasemi_dma.h
index 712a0b32120f..9285a38ff18a 100644
--- a/arch/powerpc/include/asm/pasemi_dma.h
+++ b/arch/powerpc/include/asm/pasemi_dma.h
@@ -508,7 +508,7 @@ extern void pasemi_dma_free_ring(struct pasemi_dmachan *chan);
 extern void *pasemi_dma_alloc_buf(struct pasemi_dmachan *chan, int size,
 				  dma_addr_t *handle);
 extern void pasemi_dma_free_buf(struct pasemi_dmachan *chan, int size,
-				dma_addr_t *handle);
+				void *buf, dma_addr_t *handle);
 
 /* Routines to allocate flags (events) for channel synchronization */
 extern int  pasemi_dma_alloc_flag(void);
diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 1be1f18f6f09..d33feb32c0a1 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -356,14 +356,15 @@ EXPORT_SYMBOL(pasemi_dma_alloc_buf);
 /* pasemi_dma_free_buf - Free a buffer used for DMA
  * @chan: Channel the buffer was allocated for
  * @size: Size of buffer in bytes
+ * @buf: Virtual address of the buffer
  * @handle: DMA handle
  *
  * Frees a previously allocated buffer.
  */
-void pasemi_dma_free_buf(struct pasemi_dmachan *chan, int size,
+void pasemi_dma_free_buf(struct pasemi_dmachan *chan, int size, void *buf,
 			 dma_addr_t *handle)
 {
-	dma_free_coherent(&dma_pdev->dev, size, handle, GFP_KERNEL);
+	dma_free_coherent(&dma_pdev->dev, size, buf, *handle);
 }
 EXPORT_SYMBOL(pasemi_dma_free_buf);
 
-- 
2.53.0

