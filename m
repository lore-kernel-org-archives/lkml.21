Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464498;
	b=UPKYeuCtBsMlYkIk87jSxwkZqCztPzmOJaGdUcJnmiphDKikZ9/RQMfUGcdFcbVBn325
	 +WiO2zSo6rdzqyel2DQaYFrRYux51DHpDijahpyLTeDNBG0U3Jki68ia/gdhtVqRYKXby
	 mQ5lFKy1sdGqmfPXxT9OWIq5VM3ick3PfRUNuEJ+tgUp6idWe6zQdUOMpMW54vR1OSB6U
	 1FRht42AdsKLHiYf1PHWJPWNMGbCaRKPEWQr/PoZxN2YL/GjmEejdVuG4Zgv1K+zflODq
	 oHaO62uKGqZZU9h7PoX+XLeseYusgpQJtdVFm5Nuhz3bAxK+7N85Ag4ba/wla90HOGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464498;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=+Vi8Uo03fcHCO6cbzt4Mec26MkR6iEWVyQcc5YT5w1Q=;
	b=MHXdHX+l6x3yIz/Dz9oMZT4ifXJHbDLfsdv8SXksC6PEuTwURLTbmDVr+gXNW7UU5UF8
	 BelFQNvJcVOv0xdfl6dTemRG0uisXYSoQXwD49e+awIwic38TmT4HbDwbKA/qPvvquVKd
	 YVm+Aud7XFnZqwR6aeBPSRLjAvHQuUd9Tzrapw9qDQ3Ys0JAykD34eCrULxbzqe/xRpat
	 RMU/di/GpVM3gMT29fAMVeGUa5ZcKxG5ubTfTdjru1z0kF9YXWAhsm+p0NyqRHuZRkx4G
	 0JXgnHQ11Pv6qit8V9tDf+Uk46iT59qX3KltfMi4ItnHtoYNYtwATNyVyG7b6OPrb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=KpK1nzPk;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6D606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=KpK1nzPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Vi8Uo03fcHCO6cbzt4Mec26MkR6iEWVyQcc5YT5w1Q=; t=1795464498; x=1796328498; 
	b=KpK1nzPkVMG9eQ6nnvxgWvWX3yKPXd+/3LPmzPKvrz2IcHIrQKrVkJXzZ2GvrEbnMz701w69ST/
	p1/oNV/IMRblW+t6jiTesWJkZyrdKAWIXD1/s936eLb0jbLLosgSchKCXRD+fg7Xo9KfG6iJO8RN4
	VAC/azqHe+dCveip5VpQrftzTIAllfP0sW8ivHdt+Vhn0C+f86oEcCmhjfB8wmzcwRRHhaaGi7TWk
	2t9UlxzPFZ8RzEhQJXqD9cBblEb4xK42Rn/nm17tT+mb0S2VWMJh+Z7gNaa0lO5Sq3arHUGYirIPg
	gQqIeRBuWzAv/+ZgVyazZPJQw364nbmaJsqA==;
Received: from [49.207.211.146] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xVaKf-006jgv-EY;
	Mon, 23 Nov 2026 15:08:09 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Tue, 24 Nov 2026 01:37:53 +0530
Subject: [PATCH 1/2] MAINTAINERS: Add missing files to KEXEC and KHO
 subsystems
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
Message-Id: <20261124-fix-kexec-kdump-maintainers-v1-1-79c6a6144de4@csail.mit.edu>
References: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
In-Reply-To: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
X-Mailer: b4 0.13.0

Several files related to kexec and Kexec HandOver are missing from their
subsystem entries in MAINTAINERS. Hence, scripts/get_maintainers.pl does
not currently recommend the kexec maintainers or the mailing list for
changes to OF helpers, IRQ shutdown helper, purgatory header and kexec
selftests.

Fix it by adding these files under the appropriate KEXEC or KHO entries
while preserving the existing Device Tree, IRQ, selftest and live-update
coverage for these files.

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 012a21e4afcc..bb4d9c20db06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14775,10 +14775,14 @@ M:	Pratyush Yadav <pratyush@kernel.org>
 L:	kexec@lists.infradead.org
 W:	http://kernel.org/pub/linux/utils/kernel/kexec/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	drivers/of/kexec.c
 F:	include/linux/kexec.h
+F:	include/linux/purgatory.h
 F:	include/uapi/linux/kexec.h
 F:	kernel/Kconfig.kexec
+F:	kernel/irq/kexec.c
 F:	kernel/kexec*
+F:	tools/testing/selftests/kexec/
 
 KEXEC HANDOVER (KHO)
 M:	Mike Rapoport <rppt@kernel.org>
@@ -14791,11 +14795,14 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
 F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
+F:	drivers/of/kexec.c
 F:	include/asm-generic/kexec_handover.h
 F:	include/linux/kexec_handover.h
 F:	include/linux/kho/
 F:	include/linux/kho_block.h
+F:	include/linux/kho_radix_tree.h
 F:	kernel/liveupdate/kexec_handover*
+F:	kernel/liveupdate/kho_block.c
 F:	lib/test_kho.c
 F:	tools/testing/selftests/kho/
 

-- 
2.43.0

