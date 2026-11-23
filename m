Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438293;
	b=Hk0vvXpPm3tm93VMqgANtO7I7uPLO0celYVsmPeWSZNVzauvzqLCdN4VbZdOLL/nS9dV
	 9IE/aY4fHqbiH0w6Rt7PR28h9v4N4m2dAsTXJcunbNljA2RVrpklPWMc3qo5Se2AQCQCN
	 0Tt8QyVY8nLAlYtXSXqrywms/SF6m0YB5Bm42yYqnq13kBw+0ASx7w2XAWohDAJbvvFJb
	 Frz3Vyo83B80nMRqb/DmEDKQiaYOuz/RqiQHP2A6+vwT9oBtYUph9wmyLWTwEQ7/noUro
	 EupT9LdC6zu9U+43MMhAj7erDJp1PyZedu/f59JABbRaGwPepq2hMSbHguEDGcYPsow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9jX0RW6LaoLCUoJWieDzex2x/0egSw3B2iYNY4JlEL4=;
	b=PZSgZneKNWaW1avpVQMh2E5JvrBJV6p14BHXDERHGJLRCd3sjR4LcmskVOoavj1a5BrB
	 khiv8GGtOIF7wX1171r8YhtecFGLO9thkAEvtNNNOio7u8u3x3O4RXqZtRt3ZSz+pU9/6
	 A8qpHd1evXloKPYM+4fWGETXkRd//IQn73vyk2ZQhrEfEHjmil+ddBrYboUBZDTWL/eVW
	 PHB0+wpS2iECYZfBPzudcX6MpzK1/metBLXWuKoy+OS2beAGHnkL00gJi000K9AUbI5pP
	 PXVz76q4y9v1+sLbDLqyHrVUJCeQh1pYyCDO647NQp01mJRgTRbm7NO/ygrVigzbhqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6VTcj3V;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43CD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6VTcj3V
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a07078200fso1599471b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438292; x=1796043092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jX0RW6LaoLCUoJWieDzex2x/0egSw3B2iYNY4JlEL4=;
        b=d6VTcj3VPhbe/Bp/iuiT6bbw5v5i+m9rleAG8nZ2PJSHGwmidNc6ba493zMejMWoYM
         P27a3RA1r1q5DsOXd9a9YcYXbEVwjSAdPXyghycMwUxdCFSPi0OqeWVU9QDfrTzhAqQo
         K3hKa/dXh+Pb7k5R6e93PC99lkPB46rUh8iinK9PqPRUmHYQb0E68yNlF473t1UXecBQ
         MYUYNld6f3sH9jmjVv9vu4X51ZhYFyj+irkKdSzBLRI0oDt6upnDvWFRXQE6eDu4b1E8
         z64nF1TcXJ2M5LvBLskZZDNUpx0Kv3YV+qaql8vkfOiFUuZeqDEt8CaXgeT1BAOUllUw
         83kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438292; x=1796043092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jX0RW6LaoLCUoJWieDzex2x/0egSw3B2iYNY4JlEL4=;
        b=Ido9Z22nOxrEhDDRvUMQLIGQjFsJxF8Jg4/2xDb0SHXPmr5nSc9QU5YpR7XzyEuOEn
         0lVzVsrcRxRMXYCRmLJGh1DM4ktLEpzNTfXtBPauHyn8aLf8/nLAxbOxUU2KvhSOagqD
         CeHbEsC/z8rxrYdxi3TUjS1kd8rt6lT4fMqiOYGWIeQXZcI0RluKUMJp7XWro36iAD4V
         zTfKAZR2XGGOIHp57i05jTdKT7W9Q2YBxz5w/ASTaqeueuE+JB2L+exHHJoFsgTrDWcC
         vc9dHtrtmw8jOxZ2yerpTn5mN/yqpVr8EM5RfHI125MUKNs7++QIDTSkYxPYaLPri5CJ
         6b3Q==
X-Forwarded-Encrypted: i=1; AL+hErHB+4zyEmUURTAsxh3L10Xajhaa9KwlGqIyAjqOr1wQpZTvM1SIZVYoCm80n68RHuewqLc6tg30KJ/Bew0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ZI4l7KecZfx7LFL+x7cMjCShKqYuUwaqxMUl4tEIukQ2OBXx
	CqwtQeSGUuc/LMWlrBeqhNaByrS7stNLWIMTPZFfBc/a5ts3kZL4/mNv
X-Gm-Gg: AZFdTZcVHVIMX8UiPaVfxKBILcs8/+pnvBu8wdCYG+RhRyDlWP55eEBybOeFET2LCz9
	/xQCkapH2dpmiMOAKH8J0sVPc5B7O2TP6gOcAgveeIaO6JNu26jlg5aHtriqSyUWVYopiX+ixEj
	Ar1xAyQil2UmXPXZY/1d8Au7jGabLbD217c5gVmx1B0zfCgGk1au8h0whYviaLOG1wV/+G8EAH7
	FOOcGWKs8MeL52GVSnwLJJX+93ne9U0IThOkERiy6gOMO3qTFkcSLAF+m1mINJ+Soz0IqCMkXGT
	Cq6EddG5WU9ixHDW+bF24f0rvWUy/E8dGbanI0d8UiHIEjLYR54rmyI81mtaiqXeKK3kG6mZHL5
	pxc+gX9bbJ+iaCUskGt8hZeRFBg7w/Tulb67044GcuoOSTL6jnBWdndvw2PyjF+uG80IH+haQDw
	8d2nnTzaFodcdeVyWs0nbZj2/ybbToGhfUbIhrJTtOz+ZT+rm5+S61rsU5PFAVVozsROiET2po2
	8mlxuNnbvlhb4u1IlPwOG6haDGOIHPq0/Y+M6CuSqAcba9GC4B4k/G19HRMX7DB4iKxcmUOa61g
	+pXNKReTNkbOhtl163jM
X-Received: by 2002:a05:6a21:328e:b0:3eb:a7ca:4d78 with SMTP id adf61e73a8af0-4014a276af7mr11920730637.8.1795438292088;
        Mon, 23 Nov 2026 04:51:32 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm5587126b3a.33.2026.11.23.04.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:51:31 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Honglei Huang <honghuan@amd.com>,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/pagemap_util: Drop the kernel-doc for a member that does not exist
Date: Mon, 23 Nov 2026 12:51:27 +0000
Message-ID: <20261123125127.4114196-1-takano32@gmail.com>
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

kernel-doc reports, with or without -Wall:

  Warning: include/drm/drm_pagemap_util.h:45 Excess struct member 'peer'
  description in 'drm_pagemap_owner_list' (did you mean one of: 'peers')

The struct holds one list member, @peers, documented on the member itself.
The @peer line was added with the struct and refers to no member, so drop
it.

After:

  $ scripts/kernel-doc -Wall -none include/drm/drm_pagemap_util.h
  (no output)

The warning is not cosmetic in a -Werror build: kernel-doc exits with
status 3 on the file before this change, so a headercheck run with
CONFIG_WERROR=y fails on it.

The other DRM pagemap and gpusvm headers are clean with -Wall as well.

The change and this changelog were written with Hermes Agent
(deepseek-v4.1-flash); I reviewed the change and ran kernel-doc -Wall on
the file before and after.  No build was run, as only a comment changes.

Fixes: e44f47a9bf51 ("drm/pagemap_util: Add a utility to assign an owner to a set of interconnected gpus")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/drm/drm_pagemap_util.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
index 19169b42b891..34fa879505d2 100644
--- a/include/drm/drm_pagemap_util.h
+++ b/include/drm/drm_pagemap_util.h
@@ -32,7 +32,6 @@ struct drm_pagemap_peer {
 
 /**
  * struct drm_pagemap_owner_list - Keeping track of peers and owners
- * @peer: List of peers.
  *
  * The owner list defines the scope where we identify peers having fast interconnects
  * and a common owner. Typically a driver has a single global owner list to

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.53.0

