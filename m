Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645709;
	b=zhS2HxLWasDD4+L3Sq2c04s38ArxwKMxVM/Q85Oemg7W6a1SlnH7zZKP9JUoyeWMz/MA
	 ObBDvtVR+btXZClkT/LbL1Rf7ZU+D4rezhgt6urRt+teMkzXCJ+uCo6TeY75F6Zjih1+V
	 u8EVcZrUZqbbp3McrsqSry3sqm9r+d+/DEwsAk1Sso/bllwZJbzwZWGfU8qSitTm7sTZi
	 Vocz2N3XP1dE2JKi36NJFoYk7NsJSubEUBJ/cq0oaU14y6xpDHT2ASI2H6eYH0j9SVg0h
	 vHQHa+BoQQXxl+P283pxig6OSLT4yEzFtnrKQeYcRMyG8WBuN5QidASWWuzjpS+SKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
	b=SEUyio7rElujsfX/R1blIY87qbCoAOLeGtObJYayp7YLuusgSJ6eNH4RDeUfkOw5SXFG
	 ih+4UhqMtceyWvmeeN/0ELnplezhfwDnmdO8nDDXe1AAAJ3TrUhQe75I7W2sUcM6ZfA99
	 bqdLIiEzNc53hDvj43tH5v7OzxrHOe5K+xpOtiunIMME1fhFLeBQKCRzJmd0EDDgxWM+f
	 Q8C6peRZpNfeKFAra526Abzbx8iKMAzsjHdf0PXvpv3EKiSSvOeKfi3fN+aGu7whXWfHp
	 VD20vV/f81RQckI6Gm6/V9auV97QRZnuYee605OEV9RDz98HkyuZMlCzQ/vAO/oQTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gEuAIfW2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gEuAIfW2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so6455591eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645708; x=1796250508; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=gEuAIfW2PwwuZoWNRspnLc6yTnLsXF4VrYR69h/SaRXixoHcD++1Er7TnVuIcgATxq
         LDRSPcab9ONssZt805d131zL+AcHL2t3U8L5HADpSvbVhN3GSOMNW9e6mtTnzougCeyn
         oPpd4N47tlnfiyT/3d5tvNgb8zA3KCCjrCmCFJYiLsHZkQecTi3LVjof4Hk078j+ymmn
         3nLiBV1kEKz+c0tqRA46C7CuRuFKwIxndqXlq3BUtw/J/rDqfuJ4IkPbZIUWGYtDp/6R
         SpAZ7Xb/9eSW/a3V1dsdNa3PLZBtzysvovrSXdi1ZfLm6eCu/uJZFkQMabzwVbn+BsYk
         H4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645709; x=1796250509;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bB9dahbauIY6gVR9GUf26/TEEIOmcwn74D5zXKoaRTs=;
        b=RLnABiW/etgIDIqgNsgadttPy7dDOs2uf7OyzLf3JYlKwD7gzshRewtu9SKuQ87c/H
         CB35qd38DQww62oF/1+l4sjKvt4xJnvnkUTTHab5LG1vhrSSPKhJ6cq0Py4alZzVJNGP
         uoapDCydJ5lR7W1kP/9YENC4HAclOkbXQ60o4q37lN69yyCZi7vwDOZPbm4KkRKr+Dsj
         jW2KL0Mp5fZ4OHdgP3AN1I58Ngm5wboIamKzVUUrFKG7CYhktzarPZH2Vw67qWhVl6St
         +330jRioyJCi8EH4XHe2hI7Z9D8XpXoA4mrl4vZpTfQhfMXxJNPCWPLDIkJggkGlwX93
         a6hQ==
X-Forwarded-Encrypted: i=1; AL+hErHCWSfwwgf5WWNAABe0LZbAcHoIUg6obhd0SN9KZoaMs8XkMfm7HPfax7bzE88MfVKy2WoO0nRWRVU4a0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v/iAq9uqh0s9B92YTcNLVpgj3uGgsAK6xSY2a+KD6XJebJzKt
	sgHYvxYb34Tj+AkiQQq4gAmO81bGKH2jyi0viDopGKH/F3nETa3gVap8Nv3FL88/5mMy1zpTeVa
	gmA==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2706:b0:192:a481:361
 with SMTP id a92af1059eb24-1b5568c12e0mr18196883c88.7.1795645707988; Wed, 25
 Nov 2026 14:28:27 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222802.1451781-1-elkin@google.com>
Subject: [PATCH] media: cx231xx: clamp bulk buffer copy length to vb2 plane size
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In cx231xx-417, start_streaming() initializes bulk URB buffers of size
320 * max_pkt_size (up to 163,840 bytes for 512-byte USB 2.0 bulk
endpoints), whereas queue_setup() allocates vb2 plane buffers of size
mpeglinesize * mpeglines (65,536 bytes by default). Passing unchecked
len into buffer_filled() overflows the destination vb2 plane buffer
when actual_length exceeds the plane size.

Guard against non-positive lengths in buffer_filled(), clamp the copy
length to vb2_plane_size(), and record the payload length via
vb2_set_plane_payload().

Fixes: 64fbf4445526 ("[media] cx231xx: Added support for Carraera, Shelby, RDx_253S and VIDEO_GRABBER")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/media/usb/cx231xx/cx231xx-417.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 55af8b9f2038..0b3e856f6d21 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1297,15 +1297,18 @@ static void buffer_filled(char *data, int len, struct urb *urb,
 {
 	void *vbuf;
 	struct cx231xx_buffer *buf;
+	size_t copy_len;
 
-	if (list_empty(&dma_q->active))
+	if (len <= 0 || list_empty(&dma_q->active))
 		return;
 
 	buf = list_entry(dma_q->active.next, struct cx231xx_buffer, list);
 
 	/* Fill buffer */
 	vbuf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
-	memcpy(vbuf, data, len);
+	copy_len = min_t(size_t, len, vb2_plane_size(&buf->vb.vb2_buf, 0));
+	memcpy(vbuf, data, copy_len);
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, copy_len);
 	buf->vb.sequence = dma_q->sequence++;
 	buf->vb.vb2_buf.timestamp = ktime_get_ns();
 	list_del(&buf->list);
-- 
2.56.1.839.g22a8290db9-goog

