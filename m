Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439115;
	b=oR/XHhelZFM2FYid1GSwEUr71T4C+S07m1m9aSYBOcMp5RGlWFCP1RDgsXTdT+Vpd87O
	 VA6whCinBgfe9IIXB15wmr+LXqemyBjTTuqEQasPc6V3FJigcdSr/VnDjlw5pWrMnTgl+
	 cS7ZsUauv9bJ6Qlt9uDccgs3B+cvYs3UPosFfp4kLr14cLfgncR91GwjIB/drL4cE/n+u
	 9YE1pbw5tN6eErTogSAKLGciEd5SmUN8O67/LjiB/aweO5J/awJoVOWrx8hdvputKUWQh
	 RwrsmM6MY+VA/rkMDPKf+WaSnMmSUxEsv29nSnhAQlMdibqL/G419ufHJVxKxmzny4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439115;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=03p8gBbwhN0/a1fezsMSRz0eiTfq9c/8Q3jeu/5CZkI=;
	b=hDm4h8b+hQvyjEod/hueGgUaddLxMeqcx5ipTi5MgNh6hmX8HY6XAtTF2dY8bzruAZxL
	 6olSeiSZ1RacrmPCWvpIAqjuZSwTpMa7YpULy54SjzcRZIwIOq6BTJGLrwGQxuo85hcnv
	 W1un0Ps+1qXLp21z2Ht4IVJpzF9I4vr5TtIQxnytS6vDp5AM0wEyrFILm8Lkuhk78anBJ
	 XL4zlhY5WpfFDKj2oZW0Banfd92Fe14MvJch6C4iHePCcYQxpTSPHDSTZLlmv4Pb3aRd/
	 14iTs8rT7+pu0/fo4GWN8cAxfqDKRbYEdKPkqcoPxX13BcoGgkzJ+anfQA5ZbI58rvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+sgLxGr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA04606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n+sgLxGr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5931F000E0;
	Mon, 23 Nov 2026 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439115;
	bh=03p8gBbwhN0/a1fezsMSRz0eiTfq9c/8Q3jeu/5CZkI=;
	h=From:To:Cc:Subject:Date;
	b=n+sgLxGrJanpQVxingJTfafcfka71+Qt6nGUufSLEbqSb8C5hi48hikcgRmCcSd3R
	 2kmX2JgAD1IGTwpsTWrPfBv6v4IpXO05T5zqSnAS/pZQOabGGJkZS9ZiI3i0qKqVs5
	 OG1b3WshJW1LJRFvij2gwPuRrC5hNDjs/Wn8iCL13dEhLSjMW6SPIOv8QM/SkKOuWz
	 4JyDkcf9S4Qx6LEb/ZpQSXuvzixR9rKeOC1ilXXmzEoWXWp8yhDqI5JRf1f11stOVQ
	 nx8INvW5yPVLHf8Ydp3Upb0cXzEvVOdEgUAK7lsfHS51kFANZaOI7IoMDmcTMItyaF
	 hepOP/5C7Ff7g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Chris Down <chris@chrisdown.name>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 0/2] memfd_luo: keep memfd frozen until finish
Date: Mon, 23 Nov 2026 13:05:06 +0000
Message-ID: <20261123130509.4032642-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Hi,

This series keeps a retrieved memfd frozen until finish. The main
motivation is to let dependents like iommufd have a chance to acquire a
reference. It also fits conceptually: finish is the point when the file
should be back to "normal".

Patch 1 allows keeping private_data from retrieve to finish. This is
needed by memfd to keep hold of folios_ser, which it uses to give up its
pins.

Patch 2 does the main change.

The series is based on
https://lore.kernel.org/kexec/20261123130115.4021199-1-pratyush@kernel.org/T/#u

Changes in v3:
- Patch 2: Document in the Restrictions section that fallocate() fails
  in all modes while the memfd is frozen, and that adding F_SEAL_WRITE
  fails with -EBUSY until finish.
- Collect tags.

Changes in v2:
- Replace the stale reference to the 'data' field in the struct
liveupdate_file_op_args kerneldoc with 'file', 'serialized_data' and
'private_data'. (Pasha)
- Collect Reviewed-by tags from Pasha.
- Rebase on the latest liveupdate/next.

v1: https://lore.kernel.org/all/20261103181916.2462825-1-pratyush@kernel.org/
v2: https://lore.kernel.org/kexec/20261103172251.2348370-1-pratyush@kernel.org/

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (2):
  liveupdate: luo_file: allow keeping private_data from retrieve until
    finish
  mm/memfd_luo: keep memfd frozen until finish

 include/linux/liveupdate.h   | 11 +++--
 kernel/liveupdate/luo_file.c | 11 +++--
 mm/memfd_luo.c               | 91 ++++++++++++++++++++++++++++--------
 3 files changed, 87 insertions(+), 26 deletions(-)


base-commit: 4209b08181c75ea02164832cd8f47526de28d40c
prerequisite-patch-id: e225259e2b7bb6664d8efdf9ca0bdfae24616fee
-- 
2.56.1.750.gf70dc682cf-goog

