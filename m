Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606077;
	b=KO1KaguUX4CqrRJTxmSAHiS6BR8nCjZQxRR3cMVEToRadDJJJPDbyvgtVJtOclpZ83xl
	 lhz4oFZ5foRGqccVIt96XIBWSe/r2SDhZhiqcnl56qSgk2R4rJ9ePwiPUC5oDDL7kvY7u
	 xc7Ya7+uN5p8EEkc4GtzWn6xPm+TKAW/kZwlCKvpoHJ5tHJ5HWqepbduw6H4Y+n94RIn5
	 nE94ZnLWTBUPthWQMiit3nu0FLVscYkfbEAbRlUFXgzkQxHGqute69K1Kc6v5MjPsJxMG
	 vJ3GbCzAZfaDFoyEeNyVsswz9o9nf/l/JXprMEHX5JW7ZYE4xvhF3sbxMYb+rQxQ1vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=6CgTfiZOL+WTnVSNydqbdz+GPzYfHdE/NBvMC5F7pDU=;
	b=TpHqwJ0gy63vnzRRDHqwwOA/Rvqc6iWMWIvkq9BK60daMetMGiQzfA3IKIHl80Z1m3Mu
	 RHAChgAJ28dcsWm5nnSlFW3pc4+qsQKkyx50KW1r1CG7QH0G0Z1drvNBrLfeHfF8hFd6T
	 G6xh6xmdFWW8fEHDIa0r8c4xozpOENo7/SL1UGj4g+i5bGoqdDj8sDrw3Wg1HncicgcHz
	 bgPmuY/PmaAcUG6Al4qPxdr5OF88+Q6g2S+miJEiUJpFAl9pp6EFEZRxgaOMBjYcOB6zn
	 rEOgF9N3DHK2rR3RfYtNn4sQUY65rlQ2nj5XH0MxitA0H6Ty4YU9uUgWlYbPl9Nym6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAnZomgn;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1451606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1451606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAnZomgn
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so55757665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606075; x=1796210875; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CgTfiZOL+WTnVSNydqbdz+GPzYfHdE/NBvMC5F7pDU=;
        b=KAnZomgnWCxR8C5xW1D1ca3xwrSNNGJ1YDZHJr+nIMsk2zIcRtIRo+87NfYGZkZwD9
         pO1scVf/DftdoPKfcEdfMay1VLfGesUz9bM6NpShWV0NpNLdw6pG0nwiBwNTDpv5rQ2N
         H1E/dJvkNN1sIj1cJ54DvrP9axa4A0xsFZ7zvBrQLE8eZHfpWGBFVN90mq5yqWSyUOdv
         SRXnIi3NDLryXlCGLx82mrm9Nrj5gDFFc/Nc7eDrZk/G9SkIrxVA9V9RVx9uGhj/6Ly3
         4wzyM0zsTw5dWYTV+Rc21fzEwhOJEJclfIWzToHSrRFALYcyAe8oTBeiuIVFggxSzZXB
         9w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606075; x=1796210875;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CgTfiZOL+WTnVSNydqbdz+GPzYfHdE/NBvMC5F7pDU=;
        b=Vxmo9WZssP3P0kCFMr8+Z03RVaVyx5ecVDGsciEZ48irM8l+VBmJEQ2p/413rANgkw
         wdZGK62oIhFeba+Hab5f7SSSXgdHhCAkNOotjy2nI+SWFHN5RCTNtzQeCP4aBZgFezBJ
         Bixmuf8a5FfTAwQ3TcVJC8VcPyGvvW3v/Vzyff/oiDKW0+4u9PlWOAQQxJBAcgWAcJw6
         2zdQHwcEflOw5h2KSvmj9fRu1i5D2r/0+D9h+YkgRTugnytDtzWC/g8jryMEe3P+AkHF
         8umrsKUE2TmSTaXjmNwj63KFRzqltnGF8MUMQZlKEVQJeukboeNbej4l7XdEa+nJ2Q/h
         ve/Q==
X-Forwarded-Encrypted: i=1; AL+hErEIpFOmXDOXTEPR+QFIqflD1ZsZqILu6G6kPy2CJvt1wG4HU6rImbWIjn9aeSCmpWszrel3eqFut1SesNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FT5EojT6PauozFarKoAPT0ewAZG6O/xlmcxFz9f4+T0ytkIfe
	VVMdtktfZ4qny2gwlQy4D2RRVXSPtp8qoBZ6YBRwUBjhAkINoE5FZkcEhsZnZw==
X-Gm-Gg: AZFdTZekcrLbzJ7RwxgCu9xK/oKnqV6LKofBf1RCqO1BuYaapPmmsscAW156jQiHG1z
	6FFyC1fpSty4B+ZLXP8k1EXC2Q5Uf5qiYhc9F1pq1k0wz6g11JX16+shf5+er23gvvknDtM8XOD
	YSP+QX4RCvaLuGpEcoV1BMmiu6HPRHnJZLx5sp5yGDVuW/xs9em7ix42ff1vITRD53w4ESnMedP
	8mQZJQlp+kb4vr9J99yI3/P9swQOA0BCCeC/PNFYx0Lz5Ovzk72LdFVJDl9+NiNXTXphpxYleBK
	So8T5UjDw/rNx75UXjMD6fWhMn5jrL9qXt3Iv3XeAnvP3R5hk2vPbG1U07+EOQu9deiVylVEBRo
	55b0iDFH6kTrmOasI4yXkTiwpLCJXaEasUPREGSAw5Lpdzj2O8PAWYJaYt7DRLPJt1MnqmaLHYX
	oObE4Er1OZUrFd4isS4YEOl9LaBynDtAJ4K581UJS1ENhHOIb25uZ1UcpmzGTEqQQFm30a2weii
	ziw8dAOqGBQvlDLChytHpyixQYYgmCb38p3GLhkobtgIfdcOF2hu/3MNImFcq5u4038AijjfhHa
	VwEDz4XH3bJX8mc86tul2YUgLufUX254sj6z7PKvtVbo+jQ84i1dSz+HPXvqsVuV
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr360052035e9.17.1795606074854;
        Wed, 25 Nov 2026 03:27:54 -0800 (PST)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm729734405e9.13.2026.11.25.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:27:54 -0800 (PST)
Date: Wed, 25 Nov 2026 13:27:53 +0200
From: Michail Tatas <michail.tatas@gmail.com>
To: amit@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	fan.jiaming@hotmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] virtio_console: Put device on failure
Message-ID: <awbGObIpMjR21JSC@michalis-linux>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If dma_alloc_coherent() fails, the buffer is freed but not the
reference which is acquired before calling dma_alloc_coherent().
Fix by calling put_device in the error path.

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/char/virtio_console.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 62eecfa61646..de83a8a61a8f 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -451,18 +451,22 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
 		/* Increase device refcnt to avoid freeing it */
 		get_device(buf->dev);
 		buf->buf = dma_alloc_coherent(buf->dev, buf_size, &buf->dma, gfp);
+		if (!buf->buf)
+			goto free_buf_and_put_dev;
 	} else {
 		buf->dev = NULL;
 		buf->buf = kmalloc(buf_size, gfp);
+		if (!buf->buf)
+			goto free_buf;
 	}
 
-	if (!buf->buf)
-		goto free_buf;
 	buf->len = 0;
 	buf->offset = 0;
 	buf->size = buf_size;
 	return buf;
 
+free_buf_and_put_dev:
+	put_device(buf->dev);
 free_buf:
 	kfree(buf);
 fail:
-- 
2.43.0

