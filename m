Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374691;
	b=tNVM9Wldf/qIarZNHUMtMsySk3D2zdjWm+epnLemIQ2h+xMhzDNdFfGYRJmK2R+OnuHg
	 PPs5eohCwCwqDYr0AUbCi8CSiXQxTKOtdc07gkbQa/9n/gKkJkAHKLlVjjtDhCQReZF+2
	 7ItL/c4IIgXcqaHcPzyK8TA/u0T0UWf9IBH06kLCRAY6mqJsI2thJxkK/ArYu/3LyUfUg
	 27weaO8TJIP6XAja/p0eB32cQkmQIquPNMTzC+KunAW0gU65GmJEvMKjNZrJrDW/LD0tr
	 yoyH4nHDbI8lWhRbMwOoykECOEODqkrVIYSVXeJyS4iNfkasksB9DBsgdwfkSqDZzyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BLMOrirVdVfgpFu7VbhfP1f6o8xzMhqagEEBKwlrCTE=;
	b=sddqRamZhQ+R8XGfnR/h7s1+lx0sihZJmzKi8fayuqy4SkRjx3ZBS3PMAvrM3m40Kdbt
	 OcyWEunNBJs9uBcZpgn8TyhfIjWbUUkAAf4cT+z6QO7X/zvWIswGmoh2kgSsEPg/o/jtX
	 dOsW50o2EmSeHOlxUjlwdLuEn+EHCelY9MTEQNHEZyVc0/3n93BcpH+QRZRI8BTHMLqsj
	 tKnoZ0iNUyqtHXKOAW+AuF0dIbarqqYXF2xld2KIkfcMHjcWrJ5Hi0+BsyRXnC5MLU1Uw
	 2Mu/mivzgmhbFt6yhIeg7m2fA3+Let3Ox8NaVR3H8ypes8VLbEkEb36XkCPeE4fgV1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ec/zu+/2";
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CA606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8CA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ec/zu+/2
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-92134c4592dso25094406d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795374690; x=1795979490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLMOrirVdVfgpFu7VbhfP1f6o8xzMhqagEEBKwlrCTE=;
        b=Ec/zu+/28aNR+Jmkmpfi972q3/iefgyRWgW9fea3gSMpxOh3slLP+/s+70+4fq3Ley
         aNGtw0FPJYguYbLCIR7S6iJG2EYyqdxlKSgaUpV3LaENN7Y7GXF+uS6jrl/CW0sloW9P
         f+/nf+GPZLak6au/beTmRykoa3MEnDyg8mNuht4PM3lfKFgHLXVNCPLNyphjUs6CmoPd
         VOmtk9hEXiUFgeT4ROM/n8mGbWdyx9DQ9wOsneLWNEpy6uQdK0Li7Zit6fttBNEx0dOT
         rbGGG2ql/AqiV/+HZBj0jWJFdqAjGpxAVkIw+hVdzamMoscUASLagqgs9qJqIiV/nvWv
         d2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374690; x=1795979490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLMOrirVdVfgpFu7VbhfP1f6o8xzMhqagEEBKwlrCTE=;
        b=dnRc32dN8ylRn3Rqoboa/X6iTuFOpBSPfoAOjvW9cJxZecXJZq0jcCgozfV4dHB5hf
         grAMORwawYAdqyY/CYgI0OCq3568Psw+jxr0LOPwTPJOpix/WHqsrwIRJy0bHTO8oyKy
         e+EEWnhMu+7DDCGvxfF4mXuw9FJq2E6+5EIv9TVG4Sv1x7kWPn6rd5OivtJ6I0Rp0OpH
         orlL/CrNkXQpp429lqBeZ0P2eutgEIDFkF4iCpzzcTbeybBlqczOjZ0O/Z2Trg7AXMmQ
         zRGuet3XEA5pDOsUTHRubI4DCCPAVMiP0FlsZlXUwJmLMq5hAHzJ9AizXXjq3Q9Ozzlp
         R6rg==
X-Forwarded-Encrypted: i=1; AL+hErHuMKczjeHSlyH1bwPE6DeU1Bnt3DNyrkoE/FlnciNXi2o2JfSCHhDjDtxdE74cKaKG7l4c+v2wBpQhOQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s4Xo8/OU40xuO1VBePzGV5KO0jetYatK6isdRC+aNS4iSeKfg
	sjoJ3/HxeQcDvJRa2fiddmEqteEajL/CvYqCvKq+Xyx6pci+JwRlGHcq
X-Gm-Gg: AZFdTZfM/v+jm17Zfkw6AIvXe7dtbYdUkES6JCr87LZILKhZAqZ9KbWiFIjMg9562mi
	uw8mChC8hf/VkVN74L5NL662v7fIL4KAs5gEdOfLKB/RvxEk6wmgehFWtT6kflydo2KWh369/Lu
	qkLzNQIOsW9/ajwSRC9wgycHuvMLnB2SXKKJt1CY04/IHTV4H11GxkwfWFns9UMqcEuJtBXH8V2
	1jyEqqRoyPzOQDIAv43VgCuPR1+pYvXWsGZ8FBbypdUPUeyx7SFVDEs651O4i9VPRK0ydq7aBIu
	Ozeb5q3gYpSmeA+Vs63MD/lWs9aJZTzYxlXWM+lpxxbVawYlcJ+fcR0Cl7t22J7H4vJcDz1GHUh
	q8Sy/SvjA2yFFsIHewaBTp6lh7SBlhaMh9dKXA7FdcUPWzPQ8rqLiavBbrjYRbZ3SBlPgLs+Jb+
	AzRg0U7afPTmcN8wSggHY3CapEAhtqecBLQAXhG//Ar33gelgVoXHHkGLb8fFxwG+DTDztCxnR/
	D+eqiGiXrjUnzBvjqMxKIXU98n4oE96VCs9t6fTjkluaMMlJHzpIiRRnTylCQ4gAnUlZ5CeLIU/
	dhru5G0pkzfzEIA9ffd7TuWdkyzEU9eh+QfY544MMta1ekLvU2m6k/NxlP9mUm2gc8wKfb3yAEy
	6ZR2UsZMAeVVWCMiVCX8MCW920/muj6eY9vU4z57+dTx2zlzYZsIRYfrk888fHhw0oYSIw4jCEA
	6sKoDmKVsRujNFVaaNlKB4B4Kh5BovyB6RMX3suxwAC60OHp8=
X-Received: by 2002:a05:6214:dc7:b0:921:38d7:3aee with SMTP id 6a1803df08f44-92138d73c1cmr153157236d6.28.1795374690225;
        Sun, 22 Nov 2026 11:11:30 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c8ee:a73:9097:862f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm85852186d6.21.2026.11.22.11.11.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:11:29 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Bernard Metzler <bernard.metzler@linux.dev>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rdma-rc] RDMA/siw: Honor the sg_offset in siw_map_mr_sg()
Date: Sun, 22 Nov 2026 14:11:28 -0500
Message-ID: <20261122191128.65369-1-astellman@stellman-greene.com>
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

siw_map_mr_sg() builds the first PBL entry from sg_dma_address() and
sg_dma_len() of the first scatterlist entry and ignores *sg_off.
ib_sg_to_pages() includes *sg_off in mr->iova, which siw stores as
mem->va, so siw_pbl_get_buffer() resolves an address in the MR to a
location *sg_off bytes before it. rdma_rw_ctx_init() passes its
sg_offset to ib_map_mr_sg(), and isert can pass a nonzero offset.

A test module registered a one page buffer on siw with ib_map_mr_sg()
and sg_offset 0x200, which gave mr->iova at page offset 0x200 and
mr->length 3584. A user space client then wrote 16 bytes with an RDMA
WRITE at mr->iova. The bytes landed at page offset 0x000 of the buffer
instead of 0x200. With sg_offset 0 they landed at page offset 0x000,
as expected.

Start the first PBL entry *sg_off bytes into the first scatterlist
entry, and reject an offset past the end of that entry, as
ib_sg_to_pages() does. With this change the bytes land at page offset
0x200.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

Fixes: 303ae1cdfdf7 ("rdma/siw: application interface")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
Tested in QEMU on v7.4-rc3 with KASAN, with an in-kernel test module
and a librdmacm client over siw. A reproducer is available on request.

 drivers/infiniband/sw/siw/siw_verbs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/siw/siw_verbs.c b/drivers/infiniband/sw/siw/siw_verbs.c
index 80ef4cb95fc..c5f67c8e7ce 100644
--- a/drivers/infiniband/sw/siw/siw_verbs.c
+++ b/drivers/infiniband/sw/siw/siw_verbs.c
@@ -1505,8 +1505,15 @@ int siw_map_mr_sg(struct ib_mr *base_mr, struct scatterlist *sl, int num_sle,
 			return -EINVAL;
 		}
 		if (i == 0) {
-			pble->addr = sg_dma_address(slp);
-			pble->size = sg_dma_len(slp);
+			unsigned int off = sg_off ? *sg_off : 0;
+
+			/* The MR starts *sg_off bytes into the first entry */
+			if (off > sg_dma_len(slp)) {
+				siw_dbg_mem(mem, "sg_off %u beyond first SGE\n", off);
+				return -EINVAL;
+			}
+			pble->addr = sg_dma_address(slp) + off;
+			pble->size = sg_dma_len(slp) - off;
 			pble->pbl_off = 0;
 			pbl_size = pble->size;
 			pbl->num_buf = 1;
-- 
2.43.0

