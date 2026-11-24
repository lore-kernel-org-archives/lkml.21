Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536102;
	b=H4bgjFI1X0tGrirN8uM9bkv9thMoSTP+pstaAYrQeY/CCDeT+pJQwTKa23NSFfh84AOe
	 dmk3hb6KZ+iMXHSqLDV2i5x/DQAQk1G1CVzFcom2kD81N96PTw9VBb1zYQiHmMPIN5aQk
	 Gqv6qS/fK4gjPro6GKdoO8/KhaEbXIvjGgowTKkYtLvNgEP/B5UL/RiEO1rQTXbbS2VPM
	 nGFASWNBZc5PcK1M7AzMJkTmQoQVpvDX7vG2UWeq6DzU3Cwb9s6fo/kSIfnb2kXembhuo
	 wOoFPKXc/ta6gwLYCDPv/Zib6NMeKOgZ82W7FZsu4tnyGV4wV/Lcya8/R0ziGrX8qUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536102;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2o0NRUXa36p7/7MQArim177sfK4nNzNGivQ0/WA95tg=;
	b=nMbMYG/N7B2yzgP/oRcNDa3iQEkJPmhpiMLBJDf6H40JAaHOa9gdKEXPJFp1bpCzzgvk
	 PPXBd8QEfBTsJs3LWHniTQuGgWX72KpbCZqzsq5g4xqPZiN1zMyEX5EUkAMBKtreCCGJP
	 JGmv0YvBPdwmhiSrFXml8lYlXlQrMDncFxmxrUIp53DBLv0V3IIHEXtPA4C9YDWGpnTvs
	 ZuUta9V0AP9j+XRxUBLZaBg/Ep74dkZRe8sOBwZ4igpTsM5lShNIiTT/h+L6G1Suv5/Bv
	 bWaBOlNaXk3Nx5Ydj5/yB2dqplHWzLN/tnk/hrplg9kf8pF+AvsvZbeD3poeIfsroJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e67q5T6s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D95B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e67q5T6s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277771F000C6;
	Tue, 24 Nov 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536101;
	bh=2o0NRUXa36p7/7MQArim177sfK4nNzNGivQ0/WA95tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e67q5T6sXlmIKNvmkTj+iv7SayIcavBdBOSm0bMZ3+cnPnEHb1nAsZN+GG+XUSNbF
	 QLQbgol/FkA1BAMWaWgCRYv5Igv12yYrz2wu3YTapX2LyxjxWbJCy9qLOwKcM9QxRd
	 IGLNZiIum07AWZ+cP2ZE6M0WJdMXstyX7LXw4kJPY3Vzcp69Tls78MToHYYkYwwltt
	 KSDf93Pc4IRLm6Uz++apEFcZOCEAYmtIAVzsxiWU6rgsh70OtusdEbwGu2EH8tRGZo
	 HXHG+Czpem+0gOAovbqJYUNpEiVuFLcgQZM9YyCSWx+noWtJkvllnAzmL5M2XVRltX
	 N4AvaImetUnnA==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-new 1/4] MAINTAINERS: change DAMON SCM tree to mm/damon.git
Date: Tue, 24 Nov 2026 08:01:19 -0800
Message-ID: <20261124160124.93482-2-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124160124.93482-1-sj@kernel.org>
References: <20261124160124.93482-1-sj@kernel.org>
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
