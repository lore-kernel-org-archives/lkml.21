Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230175;
	b=4UfyG566HCes56CQ55SWcIEp1tlFS4hYmXtVttCNp0vBtSKA9piYXtzFFvlB04E500Xy
	 ddaegM4OVhUQlKl+sx+74ObKHVNjrtr+U/JU4K6IAFU7jYAzXXLzSIYL+tHkY7iSzh43U
	 HROjaQS6ZQOCUMKWkOX1HDYAjUvz8e0h42249zJngxmP2i9CozZ2G9jOOhEzWnWItUvyZ
	 /erJxpbLnNrv0u9TLfa187y3goCbkSJdY6tUrtx/cRaL++1yCcGb2sBL/KKlxfXlpaDQl
	 YdzsA+C2ihTHEpEoHWO9V+CXeeoB7UPswK0Lw6yw//aMn6hADxPRLdNHFwdcs1UXvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Guzi9+/70idztYEfgK/lQL3nqGfBTC47et0quiLCDzQ=;
	b=ZICb5XHlu+XDebtjC+8hMxIMCrcESE0VEZbIqFXknY17YrcvWA7AaiFkxgXvkS/3m1YM
	 bMEtNvdboGvrArNZCIFPH/l8iboGK2nHQWBX55xDqgGAyL7sXT7JNXfj/ns3yQsB5D/Mq
	 rZBVYsfuOcxfzt/NjdZlIdJfqBduF+9xUWs5eqXuR+RafFe+PtL56qgyCe9BZKo/S2bZU
	 dE3WytIZq9RoTRoAHUnfqPQLLSgrC9bYVWHtAJBlCI3ZrMGqzHepJepkK9qDIAJRElThH
	 i5xbl+LJrrMxnFKVv3IlAkXv2FXtISpHcedKXTHDs1wH9U1fDIQpZKk01/BTDGLOStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJIJDjx3;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D9606A690
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735D9606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJIJDjx3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38587f3de36so1820188eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795230173; x=1795834973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Guzi9+/70idztYEfgK/lQL3nqGfBTC47et0quiLCDzQ=;
        b=CJIJDjx3kZoG6v12b9/kGtLLfJx8jvCKioGC/vXB7PRhYXgm5cR/a+pMFhTHxCnCOm
         5pm1EO4R6Bx1HhWyUYWr3Ri5AGNhQM78wJAP8/6KFnqCmluogkVN+GfXtVbvXZm0jfiw
         axxNmh8qz+AqIk0TLJwAOEVf8+NP3NSGWrvwZMdXKm0cftz9zUBhl03xyCcRBDIV14Dg
         RQv1rYtwCylcHLWWqTYcIAUhnHBjznQTZc4q2BhQe5pfs3iT4ykZSSIKewyrIN5q37PJ
         +ExrxJ4n3KvWjAe5PqTqbpQCyzmVXaNjYWjwhwwxOth+5xy7nyhOARQg0Q4mMkSVVEeO
         bloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795230173; x=1795834973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Guzi9+/70idztYEfgK/lQL3nqGfBTC47et0quiLCDzQ=;
        b=D5TkVlL2tqDantGrctlsWIoA1v/sXy2/5Gs8bBKe4ckKtUiwAztcwNjvBdpPZyFHc+
         MAN/ura74xn5goa77dAa1ikZfyY36w1pyJv4OEnYkCmb42tUSqdgbSyKSspNoJJImNkI
         5YR/mAVgl4ZqUoX4O5v/t8Sj92uu2APSipKwTOQVqEp5qsaMflMy99iukMMdRMscOqjE
         8+xwMwQnIE4CULOtjgcvuGy1TUOUAaPwURTfJVC1wb+B5gTIkTE+PLCB1GUw1CF0uqIn
         r5z65/NKZ3qImkODRMH4Hn9u0tQoMRUeq4sxuG0qvIpusME+CGB6qsYZCuJ5q55ysKG0
         PRDg==
X-Forwarded-Encrypted: i=1; AL+hErFZfA4WhTIo92J9hqBUJVhiVsC9CQPG0zV3/lNablzqxSJkA9jHnRYsaYtfrLmmh+8rNHZk/CDg4hzCz0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5gqGlvrYK2TKLNc11PK3WV93OuWlNch0JkUkAwJVMDcNL85UT
	L+JvSi/6cwTYrnpbEmrBWpGEL6nfVGhiiVaRh6as15u/YVFnQg6SADjD
X-Gm-Gg: AZFdTZdHkBbKDCq0XAXa/m/zUM6jDODWISirG9xXFaFhSFRv/l8WwMoO9InR9ktkOmR
	u+E2RaSLzEPWU1POUPyK+kyuf8Uynm+WLXN8qNTkCeUh6PC5+foCARI3SOrAvZSc4R/BZb1Hi2i
	dTYZIdD6LLQDf3nr+h3x/frMQ7vNSl/waP7+VeXaSbeKicxA1KwlQ/q7WIT2AKQGdmSgO9PKbbd
	U/XtCUR+t+UvxdYus9v5LUm4lZzf4IYJEiLUGF/G5XcBO8NrbwxIpYfUGGgvuBI1CK3mwT+/I2j
	0VKXn+88IRODwLjXZQtTRNnDTwBBdpY8X+Tl2IbsYfIm6+D1QIkCrq4ejOMxjwCQBerNWf4uk5i
	XlS5pfRakus+GUaws7PdUzZs7degdXZHp1AiZBArOspG/OGRBTDagjvyuapfSFKZqyh8yGajIEZ
	8/uknQDA0DMlE9ZC3Vv2lidyWjm51s1EbYI5oHLcKk8BhVO5Tqtu18DI7i/vZ/ysJeT5UjZyS/l
	xsQitqHkwOTG3/WK/LrAN4IXQLOVGwogAgTEqaMb64rZYSIHg4rEA1WKClli0y0DGLEayc+r7F8
	gkfnPPgwahNUDtpW11nJ
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr5162511eec.34.1795230173484;
        Fri, 20 Nov 2026 19:02:53 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm11651970eec.0.2026.11.20.19.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:02:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Candice Li <candice.li@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/amdgpu: Document parse_psp_v1_bin_descriptor
Date: Sat, 21 Nov 2026 03:02:50 +0000
Message-ID: <20261121030250.1674303-1-takano32@gmail.com>
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

The kernel-doc comment of parse_psp_v1_bin_descriptor says what the
function does but names neither of its two parameters and does not
describe its return value, so kernel-doc reports:

  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4440 function parameter 'desc' not described in 'parse_psp_v1_bin_descriptor'
  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:4440 function parameter 'hdr' not described in 'parse_psp_v1_bin_descriptor'

Describe both parameters and the return value.  kernel-doc prints each of
these warnings twice, so the file goes from four warning lines to none, and
from six to none with -Wall.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
kernel-doc on the file with and without the change.

Fixes: 581ada8f9bf3 ("drm/amdgpu: factor PSP v1.0 firmware bin descriptor parsing")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608210800.S15sl61g-lkp@intel.com/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 82a2684dbd2e..3fd93cb1e634 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -4435,6 +4435,9 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 /**
  * parse_psp_v1_bin_descriptor - Populate struct psp_bin_desc from a
  * v1.0 PSP firmware header (standalone images such as ASD or TOC).
+ * @desc: the descriptor to populate
+ * @hdr: the firmware header to read
+ * Return: 0 on success, -EINVAL if either argument is NULL.
  */
 static int parse_psp_v1_bin_descriptor(struct psp_bin_desc *desc,
 					const struct psp_firmware_header_v1_0 *hdr)

base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

