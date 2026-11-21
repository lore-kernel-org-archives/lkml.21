Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289622;
	b=bbhnYxxQeECNwc5AyEHz0xHbrKIwm7fSBNLmkTMoauugTu2IyuQLF7govBfXBZhW43RW
	 kR2V1MTdCAiOL6L5enGEpzYH785cRU79ZazMgnhm31K4vNxdNl8QQBiVBuUhHLE4hDFzy
	 7vio4YGvCpsF5KhI8qWcbczkqWk7WsMWGKt/IHZmkkbwpvNUQqVEZpm9olVW2XgW+HIis
	 oZC5q7yziJjmcvc5CVHASwsHpRU9/ECu6VOJ5oCNTqhAOpRwCZznJPYHApmUtwstViidg
	 2oTl+JzSC85llFGKCK5HXbfAYXCkZPYxAPLiUiM0vP+kmCdCy6rPS1pEuZKG5wtZraA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289622;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2o0NRUXa36p7/7MQArim177sfK4nNzNGivQ0/WA95tg=;
	b=Kjjlpl+h3k4r9LR0TUYsrKh8rhNtA3V81B1NG43RBZqq8zPv/hoh6yih+rFB4/oG94PK
	 sWMK01GBqe3F18224qI+XA0bXeDe2dtNYfWHeJuSHz0stuhXJvaM5Tgbw929d2daJT2P0
	 FC9MrCl13uEFlMsgfgPJGyv4FYdaQ/LlGJ+DVPrDvEZG3j0yXhI7/5vYWLBVhVYHOpBGS
	 QLa69uKvprAuDwwKrmTWqurjvdEuJhGQ+oWeEZvu7uPke+NvzHRZs5HVCFlVVLytXhF6T
	 7LWzPRgx8/LRKN/D1J4s90IL8Gtm+iJxMTGNW1bR0ufTnGf0SVW6ec/EtqsbtoPH+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQmzipse;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417B606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQmzipse
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6391F000CA;
	Sat, 21 Nov 2026 19:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289621;
	bh=2o0NRUXa36p7/7MQArim177sfK4nNzNGivQ0/WA95tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UQmzipsePseTWut0uT3WFbSjHZqAoCWV3rqXWl+mS89SVxcbpdnCgVzBLWEQL6iJV
	 vGlaWPcXg1Ycb5IKoEBHiZu0Fv6OE8Fq+aS0WQB3KQkU0OutdkcmB2kEQIlf0OkFP6
	 uApAMCC63JcJEgRHYXbjyowr9zIqdKQjnMM3W12cjsY17a/S2KxUlbB9w3srgTCarN
	 tXkhMrc79lzNAtQfnPsAAq4+hrqVhFuAtRU60TkmMEDLOpAp8dGPNQnMDn6ymhseYX
	 CMhIuFtsMEhdFHucAcQ5tVN7n+yBxnedsu2Gu6ld0zjMBrva20VPYwIHrX5TioiVWK
	 Vg3tPbErwMqHg==
From: SJ Park <sj@kernel.org>
To: 
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/4] MAINTAINERS: change DAMON SCM tree to mm/damon.git
Date: Sat, 21 Nov 2026 11:33:26 -0800
Message-ID: <20261121193331.108587-2-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121193331.108587-1-sj@kernel.org>
References: <20261121193331.108587-1-sj@kernel.org>
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

Right after 7.5-rc1, DAMON will onboard the mm-next transition.  The
major change is that it will use mm/damon.git [2] as its SCM tree.
Update the DAMON subsystem SCM tree section on the MAINTAINERS file for
that.  Together, rename the section to have 'MEMORY MANAGEMENT - '
prefix, to be consistent with other mm components.  Because the name is
changed, move the section on the file to be alphabetically sorted.

[1] https://lore.kernel.org/bed81e01-7303-4957-bd7d-38e3a094e96f@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/mm/damon.git/

Signed-off-by: SJ Park <sj@kernel.org>
---
 MAINTAINERS | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fd9991739547..5c06967640fd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7366,25 +7366,6 @@ S:	Maintained
 W:	https://docs.dasharo.com/
 F:	drivers/platform/x86/dasharo-acpi.c
 
-DAMON
-M:	SJ Park <sj@kernel.org>
-L:	damon@lists.linux.dev
-L:	linux-mm@kvack.org
-S:	Maintained
-W:	https://damonitor.github.io
-P:	Documentation/mm/damon/maintainer-profile.rst
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
-T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
-F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
-F:	Documentation/admin-guide/mm/damon/
-F:	Documentation/mm/damon/
-F:	include/linux/damon.h
-F:	include/trace/events/damon.h
-F:	mm/damon/
-F:	samples/damon/
-F:	tools/testing/selftests/damon/
-
 DAVICOM FAST ETHERNET (DMFE) NETWORK DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
@@ -17563,6 +17544,23 @@ F:	mm/vmstat.c
 F:	scripts/gdb/linux/mm.py
 N:	include\/linux\/page[-_][a-zA-Z]*
 
+MEMORY MANAGEMENT - DAMON
+M:	SJ Park <sj@kernel.org>
+L:	damon@lists.linux.dev
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	https://damonitor.github.io
+P:	Documentation/mm/damon/maintainer-profile.rst
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/damon.git for-next
+F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
+F:	Documentation/admin-guide/mm/damon/
+F:	Documentation/mm/damon/
+F:	include/linux/damon.h
+F:	include/trace/events/damon.h
+F:	mm/damon/
+F:	samples/damon/
+F:	tools/testing/selftests/damon/
+
 MEMORY MANAGEMENT - EXECMEM
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
-- 
2.47.3
