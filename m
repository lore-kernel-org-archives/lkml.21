Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296182;
	b=oqh6wAlUXW4mkFxDPrJW1AvGqt7hnbiOUFelqu+6WU8NYWj0y5IsONtLkLMjRIQt3hjR
	 6Kliw5W9nhp1R4J0p9IVf3V4jXeqgb7/a+ENJZNRLFozBLJ+MWxcNMd0jwotxkCzafs0H
	 duN5slPMM7fVpjyOOj7kuqeQHYm7zlwU4lC0lhnHELNDematTJyTJeBDQvqqcAKdw6bR5
	 MbrcTR9hSwd+yyu/SzMCYrnoTXRSA2MjMaG5xaDRDG5aD1pGteQdQJMriirCNjKMg2eVN
	 no3bsQ+W5lwWC2r9FoK2iZktJDeRjZX4MGL3KrfrH0zLetF0Fok1KxdprSseleqjtVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296182;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Gz+3NvBC2zk/8nbalMo2YjaUp+0+kpkuvM4R9/vQNqU=;
	b=LbvTnFPD9veHrb7KIeBQt59A7mfmvNSIBCBKpNDiyuvRB8zGfl2vcpK3XMLyqCiWVSll
	 xc241BJJ/Jytpq+Q94APdx7JYCiXeSWd+Q3GvmzG+Luv3t/6gU3qD4bbjnCIuczmhDalZ
	 QBz0p/e/Us54vcC6I/CjNsUqqBH3eUzamCeQu0xIiACKLKgZUDW6pZgIIn8RldesZ/+Lu
	 7jNV3L0Qs3hsiwNWgU95dlCmBRBxEHEXmuIj9U7X8/4cX452nrlQsFvesHD1iBn5Iv6Xo
	 f8hmpoGsIt83YiatLlnUOlGtvZrYs2qSymS0AwTXS3TSnLq0w1oPEmAjzafia1W7Atg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKpZOJvk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1E606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKpZOJvk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296182;
	b=iv5Hp2f0M/XKHAD2QNawWV7hc43Ns/S9/fgbjJGkIFyxLcgE6R8YG4lKQTweUDBPnEeK
	 Ne8qfoyaVbS9CJXRREoz301TrWQl3DGAE68IzYJ35nI0E7kEYLCPgbXhsCjwhcRMWNgxx
	 nw6365pow1RrMhmkP6BCnLbARxPNoQyiTHnOx80b+iLbvXAAtKhhOmJZt1wElRn5J7W6P
	 VVRzBOeHEuTy2BuWV/sRgAXylRUrLo6mUZDZhft/TqPqxJp3WYJPfx6eLlaugj6BvgGlD
	 R0BW3tdnQEnT6BdIH7NY+pkQOVT4zdBRUKXk7vFPKA2begzHEJdR0sUrpSmFB6TR9dA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296182;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Gz+3NvBC2zk/8nbalMo2YjaUp+0+kpkuvM4R9/vQNqU=;
	b=J//mJmg9ROYdCBnlFVflV8cIrmw1+fvthYA2XvBvNiXlhSBZUWR0xYI8md3H6YJy6kVY
	 mCKOJw3HPyQLL4CceS0B6iEaKgZjWC6azm+iixLU26WnZRjr+9Z7Dui5MX8uYQhEANTsT
	 tT14SDv3gsJKcQAV4H058WidFXuDO5bpXVag7tXXeBdb/Ek1Bh26v2JnJMZJbS49DePPm
	 G6aq/8WGcQHTwHLEKakxBMLoIM0J9N4/f+xyGYSSQy4TWl2iv8oBkwGcBTBN3kyQdclie
	 KllUcyrkGkFZhHgMh/ROtbsd3IKT0SN5jUbVYURY8tzHNrAwad/cIXuEQXjquYHwN6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 796ED1F000C4;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296182;
	bh=Gz+3NvBC2zk/8nbalMo2YjaUp+0+kpkuvM4R9/vQNqU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DKpZOJvksbTEh4zEP7Hm7SG/9BI+JOEaw9PQq35j42q/1VR2pQwSksDASLsL0KTqg
	 9ot/4mTckB4kOnmQaOMtV0frN7ZmmibGgNMl4VdShN1plBmY9IDyUQBBaRT5vEbDmV
	 eN/jzi0FsXJnV8z3seCTlH4SFl0sGcZUPGqr7VIrYFNQXU2oAyHxLwcnW0ka9zr1cG
	 idIQph8RR12bP+1ZiBetmYIvwVOwo/nidH3gYdEBBX7fmtw3ePzQDizasRoaORTUN8
	 +X5VJw70NPCW1CSCWHNRAubF7QXu4jMa2obv/VT0fNmcogEqI1dj4wwtgaChVmdDbZ
	 LXoWtGwmo1dzQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CFDA54BDCA;
	Sat, 21 Nov 2026 21:23:00 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Subject: [PATCH v3 0/6] drm/print,dyndbg: __drm_debug __read_mostly, uint
 shrink, build fixes
Date: Sat, 21 Nov 2026 14:22:53 -0700
Message-Id: <20261121-rd-mostly-v3-0-89e74b23b491@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/03MQQqDMBBA0auEWTslmdZoXfUepYs0GTWgTUkkV
 MS7F4UWtx/+WyBx9JygEQtEzj758IJGnAsBtjevjtE7aASQJC2vVGJ0OIY0DTNqQ62V1unWaSg
 EvCO3/rNb90choPdpCnHe6ay2+lP0QckKJVL9rFylLuzI3rrR+OFkwwibkul/KkXyeBJKrGtZa
 nYsydTHc13XLwnwPercAAAA
X-Change-ID: 20260925-rd-mostly-6a2fc0cd6fd6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=3008;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Zau8dBhEANl7tYMwKgNve822IH1DfMTFcsXZxbLchlw=;
 b=+5W/OGApBUn9TFxMzwW4M3u5InVhsVQ/obNCS6z+Qr1EgJELGNrrlfdhyhiRCjYpbMyWnod0y
 l/s988xi8iMBQjKmnJzA4ROSuqromCFp4nPJpw3woRYXjvSIhxb6Nlh
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

This series improves __drm_debug placement/sizing and fixes two build
issues exposed when CONFIG_DRM_USE_DYNAMIC_DEBUG=y is enabled:        

1. Mark __drm_debug as __read_mostly to move it out of the cacheline
it currently shares with frequently written locks and structures.  In
a 12-vkcube test, its read rate is ~83 kHz.
    
2. Fix spelling error in drivers/gpu/drm/Makefile, ie change "CFLAGS-"
to "subdir-ccflags-".

This adds -DDYNAMIC_DEBUG_MODULE to compilations in both drm and its
subdirs, as needed with CONFIG_DYNAMIC_DEBUG_CORE=y but without
CONFIG_DYNAMIC_DEBUG=y.

3. Drop the unused `category` local in __drm_printfn_dbg() when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y expands __drm_debug_enabled() to true.

4. Shrink __drm_debug and struct ddebug_class_param.bits from unsigned
long back to (original) unsigned int, updating lib/dynamic_debug.c and        
lib/test_dynamic_debug.c callers accordingly.               

NOTES:

drm and dyndbg are coupled on __drm_debug's size and type, so changing
the size requires coordination between DRM and dyndbg.  The coupling
allows dyndbg to still use the var to keep 'state', and allows drm to
continue using it in the few cases where drm_*dbg doesnt quite fit.

Because DRM_USE_DYNAMIC_DEBUG still depends on BROKEN, patches 2-4
were build-tested with that dependency locally removed. That un-BROKEN
patch is intentionally excluded here, as modular DRM probe-time
drm.debug support (and external users like drivers/accel/) still
need the separate/pending classmap fixup series.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- dont need both ccflags-y and subdir-ccflags-y, latter covers former.
- Link to v2: https://lore.kernel.org/r/20261120-rd-mostly-v2-0-88056ede02a8@gmail.com

Changes in v2:
- Add subdir-ccflags- propagation in drivers/gpu/drm/Makefile (patch 2).
- Add unused `category` warning fix under CONFIG_DRM_USE_DYNAMIC_DEBUG=y
(patch 3). 
- Add __drm_debug and ddebug_class_param.bits shrink to unsigned int
(patch 4).
- Link to v1: https://lore.kernel.org/r/20260926-rd-mostly-v1-0-28b7d714ed2c@gmail.com

---
Jim Cromie (6):
      drm/print: Mark __drm_debug as __read_mostly
      drm: Fix incorrect CFLAGS-y spelling inside Makefile
      fixup-makefile
      drm: fix config dependent unused variable warning.
      drm/print,dyndbg: restore __drm_debug to uint from ulong
      drm-dyndbg: drop BROKEN on DRM_USE_DYNAMIC_DEBUG for testing (DONT_APPLY)

 drivers/gpu/drm/Kconfig.debug | 1 -
 drivers/gpu/drm/Makefile      | 3 ++-
 drivers/gpu/drm/drm_print.c   | 7 +++----
 include/drm/drm_print.h       | 2 +-
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 8 +++++---
 lib/test_dynamic_debug.c      | 2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260925-rd-mostly-6a2fc0cd6fd6

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


