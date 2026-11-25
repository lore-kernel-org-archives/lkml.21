Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625742;
	b=OH20suq602EVoablsw/O0qBuiNA1ctrFVCBHs6KEXtxPbRYSXmlrwSl/SgekvhQYU8QJ
	 T3u/yJl/px5J9XehNXqRytTrahWsITr4HilnXouJnL6rO/xtpMQWrNLNx1pS5Udq68MeL
	 lOCBElu88QjOjZN4gNvA71iE30NZ0xaXT1Thr81/oLjEBkjpUOodQzwrw4pMA3dlH0/BP
	 VhbFSoXj5LtA0DWveisL9Y2zU7FVOMT0unGakyu15VrRTzIRCfDk4QF7HzvvAH5rEyETs
	 rP6yFbDJIWnglssC83+KZxdP6e14uklvrHuf685fWIRBc4SU8Swti5wPTE9CnpsuxvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pkxcxKR069c/gfGfQDp+qtlmbdThFQJF5L+T9sK2POg=;
	b=PfgX2eRjLJBS/VfLSdNlo+8VFgQ5piNvsJB2z9uQljyL7kRMZjtn8g3yWWNhhWvznYXp
	 twxIWetnfV97jO28a7vvK68KsYyMnBhbDSDN+1NRlg0RhCEK8xNMzUUZlhnkoOu72vOKB
	 o/rlz9XJxG7EzLs/j2DbDjfbF2jo7plr7EDv6sfTbMOk55oiCBsIVk158gEQypSDbKEtF
	 eA/OjYM05B5u6vbQGXs8iHiRA9Awc+bqPBMAf8VNB+G+BoaI9Sd4NAwZ0rv+oODY8y57Y
	 lxZm1O7ZDnXfMQS89EsMaVZofxMpsgrjTi+ph4kM+kBuiaNMJ8dGlVpvfxOA/iC7olw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgIXVQ40;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DBB606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DBB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PgIXVQ40
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4eab91bcaso33307837b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625741; x=1796230541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkxcxKR069c/gfGfQDp+qtlmbdThFQJF5L+T9sK2POg=;
        b=PgIXVQ40h/s/WLQyjLua0u1dRf2bLHYx+rAVHaVUJx1jzRhSY6MWUWNrHk0ZCJbVRJ
         smBdQg0h1ijpc0EHVPk9jKxspq3Woa3XFSR7JuCVJ2NCu6UzeaFEdJX5RracdAKGJ/pB
         4+tuoeyePlYfBEk2MH+K3t13iADlOfdRYXceRx8hHqZ/4ee+XWevzC38mdUofvDWch/M
         rexncnWtJnsxSSp1/U2byrQ/49sM1XqvNV4am/Nda1t1da4Nmyrbj20q8WI5T4vSd2A6
         hUudZLXeEX7G1oaOD0TW8/xLnFQyE/a+jyrdaMFv8W0eRaKj5kEdKpcKokNoWritKWgt
         KP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625741; x=1796230541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkxcxKR069c/gfGfQDp+qtlmbdThFQJF5L+T9sK2POg=;
        b=159tVprOntV3M75dFWTvAX/l/f61qICUJ8wHUcItZ0n3Wi+Cotb6X7wpXbOL54syPr
         tEZgfrTPMSKYGAwY8j8VDF6sZx+AoSmfX+FfnqqCFimwJRCT1MKBzkb9F4Rgihopd+tS
         F9ezbyLK7SajczYJMB9eS6s1/IcwGZKYABg6l0jltgmj2W+w3FhjkolLJK6slVhT3CdH
         g1to1OVhBs9DQBsWYNga8QJ3fRLBp3rJVa2GHitkgZL7RHK+elTKT7ieZWjhn/csLUG+
         vS9Hs9+yUty9a/APcQ9cdhm74rx9diG08MhBtzoh/TN25mkEHop3Rn9qydI8qonE6Qdu
         TLYg==
X-Gm-Message-State: APuU4Z+8loIx0oG/v8QjM7dNFuN9ZoLs1uPI3f0tJuDPJfrf5Ep2oYT+
	iI2FPbNn1H4n0vDcMgnR+iuERFOOMoZrI+XPRDsZ9epFUvuy3j4vyVtaOKqRBPQ=
X-Gm-Gg: AZFdTZdmo+sb87xwY04NmZfd0md5vbZAIPFtKT8mN4SPvb434v2gj1mHx2iU3d/sqL+
	Fl1oKUG9InxOYhRYAbSI3UdPOriMNOYuEYDEu8sbxAqECx23urHuvekIvgrGKLRKgB1Vhx93365
	pY78iZlWZ21X50uPMhD6o0XHi4mgtibvBO5AsaMgbU65lboVKsPGaYJsJnM2kUZRiilAlJIxGWo
	wVeA5w1XeiW2/EZ/XFsAsLK1tndFTkwiuLmPBjHxTICeEUUOqEbt9B0MjPDVwPi/Kvysti/8GeL
	FkLvIWZHi6YZVVP6dBpjuTXRkjuM4cuTMOmb1WT9vfNkx9ul+zsCXlkDr61Zb2mZ2KScdAIS5iA
	QOnrRvzTbdFAXn5Chaz/wK1TBNs1DtlnYLW1y8+R9b1QmPHTDjUV88zrfFX0A6UI10pAYGoZylz
	T243NxAD2AsxQiHxnw0eVeGopgUsNvKFlWP374OzGiGd4DeTqEk3VxWiu5GJViyB+GjM7H2tgcL
	Y1wKytpUuT1mDLfEZ9BSSZRhxUYpW3xwmoCTaUEcmUmriidlaON46OizZx41j/4h1uHDXz8u8z3
	eO3+KU1XyxDSdaLOcn7lfkJpxIUbresc1qk=
X-Received: by 2002:a05:690c:2a90:b0:8b3:5969:f265 with SMTP id 00721157ae682-8b5204b0833mr66282217b3.41.1795625740609;
        Wed, 25 Nov 2026 08:55:40 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:40 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] MAINTAINERS: Move GPU BUDDY ALLOCATOR entry to sorted position
Date: Wed, 25 Nov 2026 10:55:34 -0600
Message-ID: <20261125165536.792563-8-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The GPU BUDDY ALLOCATOR entry is out of alphabetical order. Move it
between GPIO UAPI and GRETH 10/100/1G Ethernet MAC device driver.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c48179f973b06..9217708367ddd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9374,22 +9374,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
-GPU BUDDY ALLOCATOR
-M:	Matthew Auld <matthew.auld@intel.com>
-M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-R:	Joel Fernandes <joelagnelf@nvidia.com>
-L:	dri-devel@lists.freedesktop.org
-S:	Maintained
-T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/buddy.c
-F:	drivers/gpu/drm/drm_buddy.c
-F:	drivers/gpu/tests/gpu_buddy_test.c
-F:	include/drm/drm_buddy.h
-F:	include/linux/gpu_buddy.h
-F:	rust/helpers/gpu.c
-F:	rust/kernel/gpu.rs
-F:	rust/kernel/gpu/
-
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.fornazier@gmail.com>
 M:	Vignesh Raman <vignesh.raman@collabora.com>
@@ -11543,6 +11527,22 @@ F:	drivers/gpio/gpiolib-cdev.c
 F:	include/uapi/linux/gpio.h
 F:	tools/gpio/
 
+GPU BUDDY ALLOCATOR
+M:	Matthew Auld <matthew.auld@intel.com>
+M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
+R:	Joel Fernandes <joelagnelf@nvidia.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/buddy.c
+F:	drivers/gpu/drm/drm_buddy.c
+F:	drivers/gpu/tests/gpu_buddy_test.c
+F:	include/drm/drm_buddy.h
+F:	include/linux/gpu_buddy.h
+F:	rust/helpers/gpu.c
+F:	rust/kernel/gpu.rs
+F:	rust/kernel/gpu/
+
 GRETH 10/100/1G Ethernet MAC device driver
 M:	Andreas Larsson <andreas@gaisler.com>
 L:	netdev@vger.kernel.org
-- 
2.47.3

