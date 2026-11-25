Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645537;
	b=5Y0dKpHhWmXSJ3TLha7hW0XhiZD2Pf2rPxTYHkzSjKPUdNtde/ar+TzfREBrd5mOysOX
	 YRauPs51N5Ii4rXiuaHgFV8dhSk7NVA+Sr4f14BGUK9sacAfGv6Fl+DLtTaJuHrAbCdGJ
	 Ys1gAFDimOGuMM4Ko6jetaArnoG/eL0fJ3GdXSxI7eCeZW167eDdffyd38wglo+QQM4ue
	 LrZ5Vt21gfxhDL7nj0z9n3FqtIxvfh8/iUov1P1bIcP3+7SjHGQ9vxZR+sUbBrqqm5PSV
	 H749atbRtrcmR8K2ExOmlsPlylylQUBJET2uRU45cXgTeEwFXcWH8x1Se2MgKe6ARRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
	b=HX7hzdrwhfvQZzHmizZqHv1yet77q7Cyw/KTWeQe8z4y4DZGJSQTpgovwVU2m5nYKMkF
	 YWMFapYnkFkV+1RbWtI9IwzocR/7ZxNMM7tE5gDCx310d6I1qMrSaiiQ5z48GGeXOpeuw
	 XC4bHsKC43NyLd3BZnLJpcIKQtHP4lXOKNz7xjhIcYs/rdk4vL4n068cLel6C/dRxNxro
	 9jeKuRbiUCJA/1zYLXOUKIRoluubLOepgRZDQgMYcM/E4qzHR8QQzoFND0x1WeuTvuBQX
	 pUKsWEmzQ5aLDGGNy0ntr+1odP8XP0CpBwsHB/655J4+WthtcBZelkdfKP4BVWOjdLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cJqTWn5o;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49137606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49137606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cJqTWn5o
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869865a304so486465eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645536; x=1796250336; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
        b=cJqTWn5oOQhFGoNAG1Izk38rCyk4MCBgbryuLJcH4KihfOWdvM41xVsvdqVeJUAadb
         vm0h1/AT8PLlcA8HKe5q0Ds2nMAKWxik4SH46HNJfnAmz8AbRaemE3EVkVk0gfYfr6jZ
         rU0fqpBVFLi+wI5T1u/49hrWDVdhoWI0AuXb4WNKbys7fQtwz/jebrYl1NNNlwaYyauA
         1Am/JSp2ONCRKzKSYlAu13JDGD8vnkYLHV1FvQbMswaBiXxNzk342gysd0KfZPC5TAyw
         VbUgrHVInU4e0g5+xy7LNpNAWDWHkrZg6rfB9oo05nCG6a8Iicqiuch9dyBWksSeBLBP
         Kyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645536; x=1796250336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZfUBsQBjrYMkeiiy+HZZjsd5SGGB1qkI+nxVlUd/GA=;
        b=NgyAw7M5NE+2lGKYBlqeiZZfHua3OwkB3OzhELirNaE+b4lNnoFG8lzLWR+VGYO+jy
         k1CEp+s+6mqbGNUiMvP742Ojpj7Lf0SIHqDIUg1vgw4Mu5Hv+QZfGA7wNUZBuV3O8QGo
         Mh67CPwWJ6ZD/mWpRTFntBRY6f7GvJ9MDE8vDnv34A1KulXuaOVgNYIZ1b987TD0gD1G
         2XxhU+nt6/onS8L+wZnjYMUmMmWVNNCjGuf3WGv5wKSsN3gbIMgG+/u39VUZzGw3fKHE
         +fti8pl/vDTiVT5tmrP2HTts12An2qoNUM28R80jVDxBkFSowvJiaFMlyr/IjPZnwN5R
         gIFQ==
X-Forwarded-Encrypted: i=1; AL+hErEfTZ13kHg/wS/Km1/G3KNm8me/2M/1kUd+n0F778vF7ERvv2ZGDBvhZ8WBWpUDRhBrgDQ7jgqYIrqAV7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z83edm0KVbIgqAmdyIl+CbU2EYMRB4ORp+6LwBAgWTlr96gqAIU
	+iFc4cbswjqxmSb3L3cfn5uC7PUU4LIOUTKrdE33ZlnAhpfm5K4r+Erh0UiM3Nx5bBZAfvGkGkN
	pRw==
X-Received: from dybpk12.prod.google.com ([2002:a05:7301:428c:b0:377:a5e3:b669])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00f:10b0:381:1eb7:938e
 with SMTP id 5a478bee46e88-3856c9a61c1mr23535009eec.4.1795645535979; Wed, 25
 Nov 2026 14:25:35 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:13 +0000
In-Reply-To: <20261125222513.1446099-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222513.1446099-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-4-elkin@google.com>
Subject: [PATCH 3/3] drm/sitronix: st7920: Pass u8 row address when setting
 GDRAM address
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st7920_update_rect() passes &i (int *) as the data pointer for
SET_GDRAM_ADDRESS, whereas st7920_store_gdram_address() reads a single
u8 byte. On big-endian systems this reads the most significant byte (0)
instead of the row index.

Store the row index in a u8 variable and pass its address to
st7920_spi_write().

Fixes: 88b09229f34a ("drm: Add driver for Sitronix ST7920 LCD displays")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/gpu/drm/sitronix/st7920.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
index ea4566009c4b..005994a8f87f 100644
--- a/drivers/gpu/drm/sitronix/st7920.c
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -309,7 +309,9 @@ static int st7920_update_rect(struct st7920_device *st7920,
 			data_array[array_idx++] = line_buffer[j];
 		}
 
-		st7920_spi_write(st7920, SET_GDRAM_ADDRESS, &i, 72, &err);
+		u8 y = i;
+
+		st7920_spi_write(st7920, SET_GDRAM_ADDRESS, &y, 72, &err);
 		st7920_spi_write(st7920, SET_GDRAM_DATA, line_buffer, 72, &err);
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

