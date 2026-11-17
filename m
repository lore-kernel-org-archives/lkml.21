Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951871;
	b=MwFuriFDJDoHKIzeSukX4Zq6Hpg2Zd5lU2p14lAJwGwuZU0CfkTotlu2EblcKoGDRICw
	 VUgUxwzyTiyKl5fy33HZs0/czlIW5xKZASi/s0+CQWWFnzGaUpo1KBt2K6s6eJMOOKwSn
	 p1J1qh/fc2DyrXDtgN4Jmcg1wN04OAmHJoF1sY6z1P8iMSGerVrWcnmKh2LAy13kiUzsW
	 cAnWRNGIsnfgnpqFo2PgMu8lWZXF8jNFLx7Zg2jU6czPmTJE5nIA2R3Dz8Wa0uN5XJ/De
	 RJiGPb1kmydtwoy+w0PAsn+YDLij6vD3a3qEloD8cAKpdDct8rXYXld+OX4NS5mN0Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
	b=teSpsliCZKVM7+9DcOdPUVr0ayP18g9gh3EQVANzrVCRAEkD0RkfzhL2iuOzEFBg8Izl
	 wtJgE2IpgYcb95oI2lZrsIx2IhmOVu80CD6hyJJHt265JQpm9FPKjGj+GxwmfU0P+A0E+
	 SNhJOhLGh5KCLYA9wbcp0Ow/uh+5jbI0bUB5b3Vx5gmC8jxWt0TUdq1obm7lRUrsU+HYk
	 bW3jzr8bHmi+q2Opq4544xvRHEnLJLVuvqoBnNaZlU2v8gJID3ykJa19P2N1o6O0bc82J
	 w6WhsgxSaivNNxxfyc4jkZaQGtDUaYlOoOKx1zVflbayCvKqjUsA62OuBAqADA4t8sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTi38666;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15448606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15448606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTi38666
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso139927f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951869; x=1795556669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
        b=sTi38666AWtS7JfMORy5MwVPdkJ+ickQLCzaqgGle027BHNnJ8p1JYt7WCZhsEE+Mx
         SCUO8nzNOFgaSLKAVLYqp1KCGSKNgvCV6O/54cWyO1O7Ob2bymnxyTB5XFo6Igw0YuYL
         RSo8H5diWapFdhj3kQdWebo7irYKvV6lh7whTxN2evVf/lKIlWyyYgreu/lIrpoi/O2c
         O5zM9GMNM2ZfCkGNsRd0gbLKKfU/oa0tBd38j7auEAXWkDN696SEHSHwQyZt/1+6PEwh
         brVh08egxePkU9EWSMX6P3ZcuzQNJlFy86CqQCQ6GHvD1TB7tVvWP/EfpFL7lN/RxA4p
         UxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951869; x=1795556669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
        b=IrfIFRUe8gzjtq7XIyQVJLsoBhAJzCs4VQCg8lWDyp6yhVpZZUtAdh4CUQmIPVg5BN
         XO5mzDekVkpXKbMNuQzVy30UJEYefJmuAXicm2K63/4QTs1KpR0zx7RGidVB5UqFR+Cd
         06rpL8PpoW/3OfucybKUE6EPPhRSspKN9doMDlGUtY3XTER0u/Iuo1D5XzH7V0ZH4lmb
         w6+oumZ8DdZ6Uldw/KnIKII71wTGiQOvwTJtgsRcizB7KBBRMRwyPVSMvGUiK6RJN8ai
         MPcz2CNBbDnIb9YFa5R9P4rVzLls7lQytbWyOTNturO0niDedfpbJ1+OitEkcXib3Ar7
         xaRQ==
X-Gm-Message-State: APuU4Z9VMOnyKfwLR705uLXa8OZ36WC7hbbVzLqJl5pLyRbVi4Hlp+Ll
	qz3pP8Q9ps3Vde2N1aqaiAwhyN1oMOee4+ijzevyTPWv6yRygOjtOQxvxHRufp3n7u8=
X-Gm-Gg: AYBFou0paWb6DTdlkR0nEU1h5HtE7rBXv00+n/Cd2JIY/RQUCFqm/vFvdjGF+2/8YOn
	g09fGflF7xOYsUzrnGO7WlsKC9h5JvSb9EDR0H6jaZbbXYzJfo7VbGUXAg2Z9mCyHfvml3DmQSi
	cqRsAuTUO9YfHRGl0MgKkKralG0L+EoaMGFcrqsfQoEXx8zbpSGVb1qXEBdVyUX356yBmJ85w+H
	XvnY2t6xWu8wryKcOax/JekHmq8cuyEg+Te0dWAV1l99XGP4UGgM8tfdxUWpng83KyqUfXsJ/cd
	yCxiroHzb8ZXznwQxXKRNRhUY30oxwMmSewYK2h+v27WwsO9qUXGpSDOedgEw+RVOgV1SKLkg6h
	651uXZ6SjMPIKPxo9du+YaC1iYaUa1Z3Chpdk24vy3ySTO5yrPdLPRQvv8jx51sA7NRFo6seqHk
	PBU4tHFTfGSmC8PkqyplMD/PjcmLUa/xon9LpgoEKpsEQONUpfm8M60+RFX6uxDnZ/tcmGAfJ7v
	IatAf2ZUIpTNNJMEor3voWu63b21rWyGiMx4uRycVT0GMDWDPyUxpszxQh93mMC32mDlJact/xm
	msjZVAzw21sgKpi0RTkN27nHUr3qeLTVWqVWv5tLArvxp7ZABVlsEBaM8HEEgg==
X-Received: by 2002:a05:600c:524d:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb7da46d69mr8423315e9.32.1794951869309;
        Tue, 17 Nov 2026 13:44:29 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:27 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mary Guillemard <mary@mary.zone>,
	nouveau@lists.freedesktop.org,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	Thomas Andersen <phomes@gmail.com>
Subject: [PATCH 1/3] drm/nouveau: do not return early from a synchronous VM_BIND
Date: Wed, 18 Nov 2026 01:43:50 +0400
Message-ID: <20261117214352.337961-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
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

A synchronous VM_BIND waits for its job with an interruptible wait and
ignores the result. On a signal the ioctl returns 0 while the job is
still queued. Userspace can then use the new mappings before the page
tables are written, and the channel can take an MMU fault.

Wait uninterruptibly. A synchronous job takes no syncobjs, so only the
jobs queued before it on the same scheduler can delay it.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index b3f02c490ecb..680ddffefca1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -328,7 +328,11 @@ nouveau_job_submit(struct nouveau_job *job)
 	mutex_unlock(&sched->mutex);
 
 	if (done_fence) {
-		dma_fence_wait(done_fence, true);
+		/* The job is queued and its VA space changes are applied. It
+		 * can neither be restarted nor reported as failed, so wait
+		 * until it has run.
+		 */
+		dma_fence_wait(done_fence, false);
 		dma_fence_put(done_fence);
 	}
 
-- 
2.56.1

