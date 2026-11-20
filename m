Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178266;
	b=G5PZ4mM7QPp52dG+VSmR+gN2W+VB7U4sH+/mKNM7RlSbPs/9XI+sJAnfKyGjzZKhUv61
	 z0Crrom8W91RIV6p73WDH3qR4h58fujLOQguebqgYN9xEJxdlVwWE9c+XRh8dNevoJXTX
	 RPtr1WfpdOBteBU65qPYot57VPZuis84luSQqjk2ig09ti7K+IS4PU8K7cMTgSkm+AKJ2
	 kA4+vWtXNbROFHVkf61fKRFUqkJofr29xoWC+B1YwrFQ/ktEMzmh14gapPaJIKanez/ir
	 a96tIA2rC5KPpI8wKkdyrlgcS0kRj4pykYDoskT7efVi+O5u1zairG07wGgd32yRpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YIwDvTsoMbycD6a5DXs0DiVLhqVOlC/XPJ2Lhc+16Ao=;
	b=aSbXjxQ+lgdeO4lhf106zIKCiv4zL17hKKr6Ehu1E8oVObPW3I+w1dlkLK2ikiK5A7mH
	 0O73GDxtvtwl82uiS+owr1TSLM4uQMOe/CQTlCIcVLMpm475qavzg/7ASalCaUZjh1hNS
	 XO2jorUo5gIIa/96NrqVrCtlL1EXbUFXlm02c3lJmO9ATyv6HFGLiqRdlvhoVSNuKfq/t
	 fI6EtAXC+0HUDY0QGgHTJggoi2vm9Gw/xjoEo9Ea5O99bwNFAztMH4AKwrfqxx6OqqRI9
	 srzWdKdJwupOV1tB2X8dwndWVu/Q3UyBUjxqrt44f5xeZUaEySeFTnsTCp3/MXwcufg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=qnXrqMS2;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A461E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=qnXrqMS2
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC8323F637
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795178263;
	bh=YIwDvTsoMbycD6a5DXs0DiVLhqVOlC/XPJ2Lhc+16Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=qnXrqMS2f5bcGNsaT5CXs1JyXcWunE5TV/4RQeZ7H1bFYHLWzkzcp8LjSRTcCCbQp
	 R+O0yqS1S+FkolhA0nBspBBAvYXQ5JsDPHlGER6ikt3mVeqF1LQ792+Q1hz8/PIrho
	 KAzWQizpuI84YTlQZ4ddeJDAHk/BQRADGB3I7ezAjn+mN2phURv+CaV6hrUB3p0RjT
	 UAGhhw1byiwEdr3F7TQdbpXBsOftJCUyepu/b2DwRxlxTgSTu/xN47+B4w3YGiN0kC
	 XqaSUUrYa//tg1Hi6VQni8WRVpS6mTgWdeQaG5xXBIK+HXLL5SqUSWP2oENObGu3kz
	 5P64xaLcTCnpp+/+kxRC++p457v5yryMUbfEVMCGglzw3skh+8EBy1eluLFrBgdPuA
	 CCDry/eyTiBhXBmZCkHexwC5xOHCgGqsXuB/Jc0eIIxpWohXSAdNJdBo5jymOgx4yp
	 CzRLNeTxUkwRipwgzIMcat9VG+zvmNV7huuvI2ESt86QHedfMCPb8Prj0LGZ11FJax
	 sICrjowR80mW2Ct/1ZZ51bBQIpnaIVxYPXBJDAGVwL3KOLLMNZlKgcSnFTOvSx32lQ
	 8smkAEHF9/5E6TVPDTHl91lu1opIKbOhB2pDLjVkqUyRn5ilxOvhQ5bwFJ3KPbGuLz
	 BR3gfLP62IUhsVwNFPnEZYHw=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1299166eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178262; x=1795783062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIwDvTsoMbycD6a5DXs0DiVLhqVOlC/XPJ2Lhc+16Ao=;
        b=bvvqg4AP4hwZG5bqEf1gxbJi1a9DRkcgLZRqfdBKAwATGQiSocxKp/BqEfGn8I9tHg
         Lu1Jw+TpRR904AgadFQ5+Lu8Us4SvjOEiX7taq8Q7Tlb9SHeHZXL1DsVdQLJYQ58YogU
         zUOoolvvKLE1R6fle4NudkeFK52rdu8sdVtlcWW6sbiSbw6+Uxz064Fyl3k2+fGDUM+Q
         8nlASNgX5hveFnGftrn99aygLLQiXh1UvQPlE0fSZyF/fkHqypXAk6GlIvhcQB5b4Tc5
         AxPE1+hYg/nZAt+NfGjG1n3ejeo+8KU9mNxriCqqXXPDA58EMefiQpsOcvqusoUZGMNM
         Qn+Q==
X-Forwarded-Encrypted: i=1; AL+hErEJi4iSLC0hU4Leg29eIubAKRDI9Q9CDyvrDfx+rFhIaul87oFxnUef51ajCPC4Rdz2LkaqF9nq/VfhFPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XnSAZgu7LLqJDUwNyk7/FIDG8thK5v+w5JEv83fqgIYv6qN+W
	m7JdmVQqn+stGOvRP2ZCUshHwRAhBAHgHxBItmz5ZLgj85Abh8HPc8+B8x7hIHIoUma/5tvEW1j
	tUVOc4/QvfrGhXgyAZIkNPdjWSl46lmXbj1A8TNFBFqWfmu6edXkbUVShKzvAGCIYuWkZ29vxpl
	a1EM53LQ==
X-Gm-Gg: AZFdTZcS4K7uyeZ/BPoHNT7YDsKFK4qQTaqDg28bLdmGvfW05mSs1W6njVUmoHgKpcZ
	eWB4u92UqzhSKfezn1sL8YoUERgW/YcOu6CA5K7nNy3A1hCyJ5aLwf5fk22q09Al7Ks3tOxco4g
	hzTVIuuZpVSpLIFCLf/h5xR56cvTboM8Z4d5Iit2fBWJGlhJ4mg52oprR/CyRd83GGUM4ShDmDs
	gArzsnstIicCncaX14781kRqgeXF/129NdPtciyJiEMjQPPzeaxEPIeNgwg1j+T52To6fDWdU4q
	1LCY861140jp+NYEFEe2FtPI4DCBLR7forGfNEdO/6Mb+ssaBagx1hae+Lw0hoi6+65XGWrlOBl
	yjxpdDncOYx7cRqOFbAZvL5V/glFfCcCRKZ3YlWaqXGxewfR24FPVk5ssZVI=
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr2798261eec.11.1795178262225;
        Fri, 20 Nov 2026 04:37:42 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr2798232eec.11.1795178261794;
        Fri, 20 Nov 2026 04:37:41 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm7994093eec.23.2026.11.20.04.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:37:41 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: herbert@gondor.apana.org.au,
	sahil.malhotra@nxp.com
Cc: davem@davemloft.net,
	horia.geanta@nxp.com,
	pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com,
	jeffbarnes@linux.microsoft.com,
	stephane.debusne@cynove.com,
	iuliana.prodan@nxp.com,
	martin.kepplinger-novakovic@ginzinger.com,
	lukas@wunner.de,
	sahil.malhotra@oss.nxp.com,
	changwei.zou@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] crypto: caam - Fix RSA error-path unmap and unaligned dst buffers
Date: Fri, 20 Nov 2026 23:37:30 +1100
Message-ID: <20261120123732.1200685-1-changwei.zou@canonical.com>
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

This series fixes two issues in the rsa-caam driver.

Patch 1 fixes wrong unmap operations where rsa_pub_unmap() was called
regardless of the key type.

Patch 2 adds a bounce buffer to handle unaligned RSA destination
buffers on DMA-incoherent hardware such as i.MX8, fixing intermittent
-EKEYREJECTED errors when loading signed kernel modules.

AI assistance disclosure (per Documentation/process/generated-content.rst):
the OpenCode agent (claude-sonnet-4.6) was used to help analyse the code
paths, draft parts of the changes and the changelogs.

Changes in v8:
- Patch 2: Add Fixes: 8c419778ab57 ("crypto: caam - add support for RSA
  algorithm").

Changes in v7:
- Rebase onto the current tree; v6 no longer applied after the upstream
  caam_rsa_set_priv_key_form() changes (a91d9346a70b, 828c3b265b6d). No
  code changes.
- Drop the non-standard "Assisted-by:" trailer from both patches; it is
  not a recognised trailer (and fails checkpatch), and the AI assistance
  is disclosed in this cover letter instead.
- Pick up Reviewed-by from Sahil Malhotra on both patches.

Changes in v6:
- Patch 1: Factor the priv_form switch into rsa_priv_unmap(), shared by
  rsa_priv_f_done() and rsa_pdb_unmap(), removing the duplicated switch.
- Patch 2: Hoist req_ctx to function scope in set_rsa_priv_f{1,2,3}_pdb(),
  removing the duplicate block-local declarations in the src/dst branches.

Changes in v5:
- Patch 1: Factor the public/FORM1/FORM2/FORM3 error-path unmap dispatch
  into rsa_pdb_unmap(), so akcipher_do_one_req() and akcipher_enqueue_req()
  no longer open-code it twice (Sahil).
- Patch 2: Do not overwrite the caller's req->dst. Use req_ctx->fixup_dst
  for the DMA side (mirroring fixup_src) and drop the orig_dst/restore
  logic (Sahil). Expand the commit message to identify the caller that
  hands in the misaligned dst (rsassa_pkcs1_verify() /
  crypto_akcipher_sync_prep()) and why the DMA API does not bounce it.

Changes in v4:
- Patch 2: Describe the bounce scatterlist with the aligned allocation
  size (ALIGN(dst_len, dma_get_cache_alignment())) instead of the
  possibly-unaligned dst_len. Otherwise, on
  CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC systems, dma_map_sg() evaluates
  sg->length and can treat the already aligned bounce buffer as
  unaligned, bouncing it again via swiotlb or failing with -ENOMEM.

Changes in v3:
- Patch 1: Dispatch the error-path unmap on the operation (the completion
  callback rsa_pub_done vs rsa_priv_f_done) instead of key->d, so the
  unmap always matches the map.
- Patch 2: Bound the bounce-buffer copy-back to the RSA output size
  (key->n_sz) instead of the full dst_len, so the trailing capacity of
  the caller's destination buffer is left untouched; add Tested-by from
  Stephane Debusne.

Changes in v2:
- Patch 1: Add Fixes: tag; pick up Reviewed-by from Sahil Malhotra.
- Patch 2: Move the !bounce_buf check out of do_rsa_bounce_buf() into
  the caller rsa_bounce_buf_done() so the helper is only entered when a
  bounce buffer actually exists; add Reported-by/Closes and Tested-by
  from Martin Kepplinger-Novakovic.

Link to v7:
https://lore.kernel.org/linux-crypto/20261120110525.1170175-1-changwei.zou@canonical.com/

Link to v6:
https://lore.kernel.org/linux-crypto/20261114060032.872141-1-changwei.zou@canonical.com/

Link to v5:
https://lore.kernel.org/linux-crypto/20261113113650.63038-1-changwei.zou@canonical.com/

Link to v4:
https://lore.kernel.org/linux-crypto/20261111230221.40297-1-changwei.zou@canonical.com/

Link to v3:
https://lore.kernel.org/linux-crypto/20261020025426.955531-1-changwei.zou@canonical.com/

Link to v2:
https://lore.kernel.org/linux-crypto/20261004210200.290119-1-changwei.zou@canonical.com/

Link to v1:
https://lore.kernel.org/linux-crypto/20260821045555.806471-1-changwei.zou@canonical.com/

Changwei Zou (2):
  crypto: caam - Fix wrong unmap operations
  crypto: caam - Use bounce buffer for unaligned RSA destination buffers

 drivers/crypto/caam/caampkc.c | 177 ++++++++++++++++++++++++++--------
 drivers/crypto/caam/caampkc.h |   7 ++
 2 files changed, 142 insertions(+), 42 deletions(-)

-- 
2.43.0

