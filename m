Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958906;
	b=nuSHjF6SZ4xm83DBIZzRpvf2NimHPzv44YrSgV5J3Y8NiWczq1AghbhQV2tf9QugRlFB
	 AoFMxdUi0UH23LaQ4/wmS6YQxmlPGp7ovicvZbkLkA7UFHXtGIG3tPymFCqtgAWpouTgq
	 mYIdAR+YcsboTzrdWn8ghmpWCyO9HqlPPOvvF4HVPiAYmBlZ06mkj9nQJHFeaLy4ZOICB
	 8KSZyVdW62v807U2p9lQYyPOMo1iruIT1+fBxady+fiWL+g0NNDe88h6OBaS/mxwCn9EM
	 NG3nFRqnpM3/tKaGxvpBdBKlijL/xF0RdY6VGQsXXb263zIb8ophWYg7P7a2J51ZoFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m1Cjer+iNpU1iImlMMK+vYAvWTpXzGaSEtw1yB5pZVQ=;
	b=3pyqxI2RwKC8Hu0tEGQ+hc8ZXWWNEeu1A/psDvR/ZH+MD+lRxyBZQG4o0lKiZCQagCtf
	 u4HX9WACP+MziQcC9Smy3iB0jrYedf3rt9zCmYqBkUXWikq5RnHKsWre5PZnGE1eiJ+FN
	 etwfiKCdC2G9FCydsjQOLtiANXfrOVaiJXJPwKv4+50w9vWEZlw4VpJp124ZOrIMUs4DT
	 i1VfWpKQmlIzDU8/J8KQO4eoC/Nfa1qYJqxsudvJE8WDwVyDZpqNuPVkDV2aFnt3dVecb
	 p0XRbaPC532jc8T5C8w0YjFb4sCod4Tzhgn0KdNw0L8XqlDXSJexEyObBnz1hP0h5fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFNU0gti;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8991606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8991606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFNU0gti
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b546061d58so17054c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794958905; x=1795563705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1Cjer+iNpU1iImlMMK+vYAvWTpXzGaSEtw1yB5pZVQ=;
        b=XFNU0gtidEIMh4GIS3UkejbeGeuxgN0Ra3P0s8eSUt2GYpligihcdcY1aZRpdyd8hA
         3SMQm6mUZNwK/tkg54ppZMb3Z5oT3bPpSiS6HYmDnV/aNikM0ZGNK6fnvb445ix5tVn5
         86B91ksI4z7RjCZRk4/uth98szKa0/0JuZv5pyncmLV9ah3ynfgLrlwM/FWV+qnN3kwr
         8tO8v2Vr1BbgGWXZgZT++DWHH7aoCIPDcbFuKnyBnMUq6gfPbxvtCsXPRZJVW7jNjiuv
         0NE0yKF08/iVFpPxR2U5kyw5f44Et/tPtSzemMvrOxXi1Ez9Ea+L0TdienEpoYxgJjgZ
         xE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958905; x=1795563705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1Cjer+iNpU1iImlMMK+vYAvWTpXzGaSEtw1yB5pZVQ=;
        b=SnfazVGNTSSONtNW8ovawLmXRBNKln1UJylHg6QwkxP5k0b8MK8fKae+9IqQzaohiU
         HU4jM8LUttEfdFUKuyhFNId3i2huGBZvtaUBDOLy9emacqQ2qzGrNtnDkbbfsG11pvIc
         slIiCeXLN/jf+9oPifjOcn4fFn5CsML4FEL/5rGTD4L2ISnm/CuJkY3EL+IhL7nVqIGW
         xSKLhWpy8Mt6S30n6Nz14IYtZGy8ZWFY3Q3EFvbWukSMSm9l4PLCsm957tV9+jkktSr3
         7FKtUW+wnLP436ZqjXjydAgPaJWUiwyfzTm9EHDTi/3MsE4D5mbHdLjDmm+cbIesgEaz
         r81A==
X-Forwarded-Encrypted: i=1; AL+hErEREIlcuDxUC2cuBY53bt2/WDfeouhPUFbf9W+jYAGD+rZi3Zm3HCKLnb9NpKRW+5Bs9ifID8AWubf5LJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eXLGrqGPHFRvCWWGd7h4o3QOqCNlyVCleoSAA52BfLhy7aF7r
	V4flIfjibHVSDzdzJ+/Q1flgorO8W+1RcCkne/6c+bVwsCUSVlKCQKIu
X-Gm-Gg: AYBFou02KxhYD7mDTAEcLoOH5H/o/FK0UxZLNVAALcz70D5+b+DDFRpPKHE9Jy6rh8O
	bNA/18fhFTIwEvunxae8tOKQuRQGYaCm4KBav+cPVsaIRbB5f9mgO6uDPFWX6fcREo9TMprLdAD
	/4stHxN+jaCjCs4BmImuUa2JTiRDJNF9qv5nv7WwZwhsYTRLYPAyJ8uMU8cjthrerg5YC5QGpL3
	Tw48JdzipI8Fi4jn7twYyRYcyn1uGelFT9mtp7KrgNO11sPw/f6OzqujJ4h0xBJwyEWX+LqaLct
	fJu7tAQrEL4b5fMztuzjCrquEuCbQIJ7ykQBCM4KSkOZUdj5TrdxvXQFTX6+GfOue4IbYfdYjPC
	1Oy+1BYsqaHmdiX3mGDEPBE5LMuwOotvGhdqspJR3SV+ZcuDs9lYwqwBv3h77SejUNCuJO2Btr8
	X3invk2nL3wP2l58yxFeNnoALKgY27f0cfdl4NBvyk2WKJeeCCQcGOGX6JfX/U16Lnb5YsIxLp1
	gZAHdq+TtNL3swRkKTQYdoFKOFYpiYHnlWf5m13CBzr21U96LmsJBlH/uCai2r6SNN2E1NWeGwj
	inBSEY8oZBG2dcN8igwQhdVGeSMGkNldTLbZa3ray3mUx1gemG+1Jm2CoBetl290M/rxAJY=
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1080809c88.39.1794958904954;
        Tue, 17 Nov 2026 15:41:44 -0800 (PST)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2095199c88.11.2026.11.17.15.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:41:44 -0800 (PST)
From: Henry Zhang <henryzhang62@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com
Cc: kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	henryzhang62@gmail.com
Subject: [PATCH] drm/vc4: dsi: Register the PHY clock provider with devm
Date: Tue, 17 Nov 2026 15:41:07 -0800
Message-ID: <20261117234107.1298575-1-henryzhang62@gmail.com>
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

vc4_dsi_init_phy_clocks() is called from the component bind. It
allocates the clock data with devm_kzalloc() and registers the clocks
with devm_clk_hw_register(), so both are released with the devres group
that the component framework opens for the bind, when the bind fails
later or the component is unbound. The OF clock provider that points at
that data is added with of_clk_add_hw_provider() and never removed:
after an unbind it stays registered with the freed data, and each new
bind adds another provider for the same node. A later lookup of one of
these clocks, such as <&dsi1 0>, would call of_clk_hw_onecell_get() on
freed memory.

Use devm_of_clk_add_hw_provider(), so that the provider is removed with
the same devres group, before the clocks and their data.

The analysis, this change and this description were prepared with the
help of an AI coding assistant (Claude Code).

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
Found by the Sashiko review of
<20261117205902.1293962-1-henryzhang62@gmail.com>; independent of that
patch.

Testing:

- On this base (drm-misc-next 467ac0b56aeb): arm64, DRM_VC4=m, W=1, no
  new warnings.

- On a Raspberry Pi 4 with a downstream 6.18.34 kernel and an
  out-of-tree modular DSI panel driver, with kprobes on the provider
  functions, reloading the panel driver (which unbinds and binds vc4):
  - without the change, each bind adds a provider for the DSI node and
    nothing removes it;
  - with the change, each unbind removes it (from devres_release_group()
    in component_unbind()), each bind adds one, and the DSI PHY clocks
    are back after each bind;
  - a bind that fails after the provider is added (with the old DRM
    device held open, on a kernel that also has a backport of "drm/vc4:
    dsi: Allocate the encoder per DRM device", where the bind fails in
    drm_bridge_attach()) removes it again (devres_release_group() in
    component_bind_all()), and binding again after the old DRM device is
    closed works.
  No warnings. In these tests no clock lookup went to the DSI node, so a
  lookup on a stale provider was not reproduced.

 drivers/gpu/drm/vc4/vc4_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index ec008f766..ed99cec9f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1592,9 +1592,8 @@ vc4_dsi_init_phy_clocks(struct vc4_dsi *dsi)
 		dsi->clk_onecell->hws[i] = &fix->hw;
 	}
 
-	return of_clk_add_hw_provider(dev->of_node,
-				      of_clk_hw_onecell_get,
-				      dsi->clk_onecell);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   dsi->clk_onecell);
 }
 
 static void vc4_dsi_dma_mem_release(void *ptr)

base-commit: 467ac0b56aebc804360f276feffbc9032c265a6e
-- 
2.47.3

