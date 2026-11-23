Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401612;
	b=h3Fo1iC+rnEntyEgK1SR6sreypbqhuJE6u29rjpyfLLRQFCzrwUgrFvTEdKhVE739CKa
	 CiV5tU0GWQy5IUIu5pxsV2LntMta3OG6kVxWsAnBrl6WziFgLiQYNTmz7u54CXFvR1wki
	 NuwC11uMV27PrBOJTXjYKagudcg2GbSHEeuGWD4FLsS9ia/q0YX3kBJ4RvIvq4D5tpTPl
	 L+EjYso/1S43JGy8+x22tEpLHRQKs83dsY1DJPDcu3jCrC3U4s71m9M3046GdcSY4Siqh
	 AbdSI8UU2hqOd8fgpMoR2PFvblvQEIvViGNhS/pF42KLFwuZhCDfl8CE7sIAFJMCQxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hzraDdDmqQRSuiOTFkFi214VeIL7IKeSTeSMhbaq8o=;
	b=XamcE7pAxtDwXZHX43VMX8x5EsB08Qdvkr2YaTSmsv7D7W3cGkp7bteMMvh6rUxKgYxz
	 CO6yRP1btrxQNlzW63vKfOK5YlBvHV/5aG2sHwzOtaYgp3Ou7sQXS/GBn98IeMXVHyon2
	 B2NwuJMkLygMX5zjME9UxbkLcqEazrA+WQVMi0zQXQCzjoGLV4XklVkka2zbjSgHj+ib5
	 s01jpdKhNhGjH3jDEvJvy1rXrnav1Bq8i6RkriY+VVi1nxbF0lvSBsmhuL+EazZA0JpW6
	 6+OkGRDXMmTvR+KSaCWFxxaAfD1CZmzdmMuwzjH+jiulkdMHklrCJa/f3j3BaC5igEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JKYJIE/+";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3755606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3755606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKYJIE/+
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso3062089a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795401611; x=1796006411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hzraDdDmqQRSuiOTFkFi214VeIL7IKeSTeSMhbaq8o=;
        b=JKYJIE/+x14O34Aos83XZ6MOH4oZRFlm2FYsS4WajtVtmPEvQfvmBdwZw9Kzs1Ad0J
         js2ly+aTqDtY2xrFtMxfWc6MFZ6mdnwGpqzgT6gEB0mGtOmC9Zyzg+uwNqz4FNIB/KD+
         lDf+da0Qwl2VP68VhvGIRCzAHwLLbvue4mpcBnc0q2S8VnQ89DvOUNeIeqtpJ1BJZfKz
         O34JkaMuNNquCAz1KZPE31I4bsb8/RhuCl3reTb81ljmoO0WixrBq62g07YhfyBSuA+x
         SfH8oaHHdTfhceXgtz+TDBL9sUxWi7Pk11QKL/1wXqNxPKes3RTaVTQCEyHePKk7XKV6
         JG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401611; x=1796006411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hzraDdDmqQRSuiOTFkFi214VeIL7IKeSTeSMhbaq8o=;
        b=lLcKSuwyiTAPXaw3fH0xLNPBOqde1vF0o+uuFc8H+EiHD9ZsLDN5bh1wGP9F05RW8d
         yA+SeyRru3enA5Xy4wql08SySTuJIt2WoPeYsrxIGncgKbk+vAVv/vXVz9UIN7FZD8zr
         DXMb0khdi1eO17ru2JTgG3JDxNYlWF3dUQSoCdCoPZcuPTI/1Kg9kPZ+MGp1NCGTmY4k
         sM3sx2KXaH9VP37QzOj/JEAIQjMXd13fq2B7R0bDQAiK46Rx4X9fylXemp46HRj/mpKp
         FyC+edT9imy/hr+HZyw1YSNwMvfLjgvws08QlXfrQdrzF7RVqBMotP4UzDnsc2pioQT2
         7O4w==
X-Forwarded-Encrypted: i=1; AL+hErFXbKGVnSu3sf8WfNPvSO22hWoPfJzZauOpuvz7XiPNoKtyi39aQMDUQQuOMwxsjdgxMXHNX0u3N//EWBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z84kxu8xxrbXxyqHKRkcTPdt31BBoDq3jEZ5mBT5HeIBnr68CEt
	7cy9LElPXkHF/fPKMtYK4UCuFoazd9n1nS2ewn3dV8YeCnvNMgjUA4v2
X-Gm-Gg: AZFdTZeYwjdenIPq63vQbXq09KCiDy71Cau3YpzjKDc7GPnBrMClDQQsOCjz9xG7bcV
	QWG5+0UdNibSvw95bvbXHE+48eoPcPdQexLKF/mlKyXpR5y2vW1V3H/u9BLXprhg8QRyyPvkFxi
	SdhK2g/5AOzep+/SO17mRnUE5/EK4+z3upevKSD2Id1RFs2IZlVeGD+s56qHmPYuHiyM+W78rtf
	pUbAw6O8EHlZzDETu+go92HDz3bBYiSp5HITnKKnt77nt8RxPlmq7zD3PF1RiBuI3HRwKXAYWvW
	46bLVgWLMq9w+s3ubftM0fQWurTfYPOAhPFx/kboQHOGDKXXH6rEA4cyvHyXP9/WWD0+hV01x9G
	L86WK6Ep5cZwJyWvy1vK3wAQoOt11L9TL0uQh2fSMLLMIkSPwpb09puQRQCHzAs/PVoFv2TZNJe
	mlE24gJ+bKOFUVVTKTs1Qy0f5XPOZBldEcI6OPP5dJC3CzG+WgLRj9PcgSG6PvML5ZYicapXHp9
	Aq3jysc1w/znyde2h043b4sU37OGJyoQ+39V0GYXyMvd5JVZbU0kN+v/30ZbMRncUz3aO5W34r+
	VlEmbwZwPNRpFbqt3ajUHvAoBfhJVXd32/lE5U+mAdtMv71eSoUvU9/8vDlgS0a1oqBO1auzqhz
	X65h4ClIwkjVOeSrF67Qs94Y=
X-Received: by 2002:a17:90a:e710:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3b41c96151cmr6657246a91.38.1795401611080;
        Sun, 22 Nov 2026 18:40:11 -0800 (PST)
Received: from localhost.localdomain ([240e:46c:1b00:720:54e4:b505:2937:4e95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7f4899sm5917286a91.4.2026.11.22.18.40.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 18:40:10 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: jpoimboe@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2] livepatch: clear internal flags at init
Date: Mon, 23 Nov 2026 10:40:00 +0800
Message-ID: <20261123024000.15130-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
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

func->nop and obj->dynamic are internal flags. However, a patch module can
set them in its static initializer and nothing validates that. The release
path uses them to decide whether kfree() has to be called, so with such a
patch the kernel ends up calling kfree() on memory it does not own.

Explicitly clear these flags during init to avoid that.

Suggested-by: Miroslav Benes <mbenes@suse.cz>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/livepatch/core.c | 2 ++
 1 file changed, 2 insertions(+)

---

v1->v2: clear these flag at init and simply the commit log (Miroslav)

v1: https://lore.kernel.org/live-patching/20261116130402.76743-1-laoar.shao@gmail.com/

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 517fe427ff92..98a81ec203dc 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -952,6 +952,7 @@ static void klp_init_func_early(struct klp_object *obj,
 	kobject_get(&obj->kobj);
 	list_add_tail(&func->node, &obj->func_list);
 	func->obj = obj;
+	func->nop = false;
 }
 
 static void klp_init_object_early(struct klp_patch *patch,
@@ -962,6 +963,7 @@ static void klp_init_object_early(struct klp_patch *patch,
 	kobject_get(&patch->kobj);
 	list_add_tail(&obj->node, &patch->obj_list);
 	obj->patch = patch;
+	obj->dynamic = false;
 }
 
 static void klp_init_patch_early(struct klp_patch *patch)
-- 
2.52.0

