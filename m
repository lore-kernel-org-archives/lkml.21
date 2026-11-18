Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984020;
	b=pNuDj3obyfPvrw1Otj6WFnpscU6nOyoxtgQw7ttzYW8fbmRbdN6mth34F+OpeNAQno2U
	 NR06RVrbIL5K51hQfi2jmyxJgNbpq6g3PZkE+mCRwpVTsPEXdzMmr+FeuOv1BSGxiQrOU
	 lIEJgmrox8cJaW2KmbN03TvLq3K15PLmW6UmrC1432xxZlqRPs2zKiFKJ4BkLs9rbmrSg
	 9A8g0D1JaKYY8ifOfXnRS2BImb9hnYXmXu2CRvHow7RxKCjkFeKZtdLxs10dYdiV5Z/oc
	 WsSsQPFOqFKQn/6l8UZGlEKstFDAFe8dOlSdyTa9Suvta2pFn5SKk+Ry28eFt1Ipp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984020;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
	b=wL+ZTy/FSQ80eaboyBia/Zn9XytW6PPyJS6B5U35idr2COZ1kbzHhyQ3Hby273SvFfc7
	 1eMd58DnFbe9PK1jQNpEsV3qvjB0lCqdhi3PufiEQPL1R1vkWIQ2hjR7XqunPIwTch3KC
	 XfvQSHqmWqF/HxYi8G2kMkoGP4YSuZIhXHjCNst3RM6WwUQxD4Z8HhMktGqcBmIbKxfO2
	 4+HVUVUoZ+/Qh0+oiJSV+c68WZB8RsBZojJv9dqX/nx6Dq4DDz45oPtS+a1YtH6ST6naX
	 IxyyKj5WF0iS/iBDsB87chh6TI64QXMp1T8crTLL71ThYjyqzpRaeiTOa1Qf+7IE1tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VztWVw93;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B7B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VztWVw93
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so409296a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984019; x=1795588819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
        b=nFIod0I6vVB927Rw+3B/MuBaDXO7WBdqx47hjGuOHwXyMmulfBjfSnJgwDklwa+dj6
         zk959spRRqCmR7vPNec3bL6i92fklnossu0FClNUJ2euARPcgZoLIUWBb9AUX6FKAcwh
         ToXfsFM224Loq0uSbLAfx2/KVEoJFcWpXjoON4RUX+ZrYCNRnaXujKO2sOiwksTjCrFi
         EhG2BFzWvcbPIljwEZChmStwsHpK/ovEM1OubF4M2WykOUF4zqvoEEeqNDb//r3B9zNR
         9YPwJSo5ApWs0frDyTo2Fe7Mc5gjz+PUyPJ+YoUhXg92gW4zjE8F6WjZps6f59JqfF68
         /7ag==
X-Forwarded-Encrypted: i=1; AL+hErFzMB1ztZt4nkaWUA3I072xJk12EuZdumEEUem0r6WoyqPjLR/ORNfPW4JgP+tzsMOcRk+F5lUjkm0z1Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NEhgkrf0ySZboNQ0+Ro2xNEMdshXt1fekzufCa7bbl1/s5Cx3
	qwY7NY3mhZuoog0HX2L0qInXPEQ5zoxI8+Kf9wXZcFTz2DpCUO6cAN/N/Euz63JXrSTm6D6giva
	ygQA5sSRNlpo5H1bbWDm7saIlFk6Y1yG0qX+U608Pov6FHhRsBqAqLQxf6kF6ekclYPMd15H2Fm
	05tUQnJWShby7DcmuxELPJv/UZGctZNCTr7WCY+Jo4OPhCYBO/QuYm0Km1RF6Fe/9wpK3InqfKZ
	nbEz4x+IU8VjRMj
X-Gm-Gg: AZFdTZfGH5FEKLEhclFRFBQF1bSBBMF52jp3I8Zz+s+uVvkuNuUiR7z9F7R8zX20ZE9
	F03HyWGJ8h02f7kqv+gt5zsADOFU3ljEVfRMVct1Vhz9xgbJ9QY24nWJO2H1tL4PaD/Lkjsf0XR
	hUu1mpcy4AQNbuIR9zMAshRce21ccPN+hioJZMquyYY2Z5ZcxEm0+ZhxHMszrYXAOtYaGUy1UQn
	qfl86rhZ7L9Flf8grkO7efbxlnmb4EHDZdDNAN6XFZOW3e0Q/DjH8iMTABCDr2vDu479I6dEfvv
	h9Hlu86GT5NWreaBKmInD/XkSdB8VXS9KCdQSNmZ+OopvxW8eFa02dYx+E3qQRT0oywex1wh5I6
	GYpPHh6Ehi0BpS70IgKgPtk3nc8B5+5PZrxz9bLv+ZNJJiyKc8vC/krJ9FJXxW4DyKkFJLR/20i
	srNv52IigqWMdwwy47nigY4AtYBzypf27a
X-Received: by 2002:a17:90b:1dcb:b0:3b3:af8e:ea98 with SMTP id 98e67ed59e1d1-3b3d07d3d1cmr1538095a91.37.1794984019537;
        Tue, 17 Nov 2026 22:40:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm3367117a91.7.2026.11.17.22.40.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:40:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso9778461cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794984018; x=1795588818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
        b=VztWVw93TzE5FZPngYY2lR/djU+aBLHel8A/trWy8lZCz5DYUjvakuDehrXl/+OtG3
         pgo4Ae8INRlZsYeRNGkwkRQ5EX+ltXxQmKPI8rAFjOwF1TTvhQCM5ZBPYBeHQfDdhilN
         /gEiZ0I9JEIeGNLR3kXa6f35LEpCuJIJ6H1UA=
X-Forwarded-Encrypted: i=1; AL+hErFWR3/MKuavjJtoKRhaef47EjfHs0REPgrLln4VexkXVdlrAYhiP9nX8f0vO16p2jrNtCKJSBrr7RBbHN8=@vger.kernel.org
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr24847271cf.77.1794984017830;
        Tue, 17 Nov 2026 22:40:17 -0800 (PST)
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr24847041cf.77.1794984017277;
        Tue, 17 Nov 2026 22:40:17 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d61cf3b56sm2078141cf.13.2026.11.17.22.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:40:16 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 0/3] x86/vmware: Clean up the hypercall code
Date: Wed, 18 Nov 2026 01:40:10 -0500
Message-ID: <cover.1794206170.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Move VMware hypercall assembly out of vmware.h and select the
low-bandwidth backend with a static call, following Linus's request:
https://lore.kernel.org/all/CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com/

Patch 1 moves the high-bandwidth helpers out of line and removes the
redundant vmwgfx caller annotations. Patch 2 uses input and result
structures for the four low-bandwidth backends, selects the backend
during VMware platform setup, and removes the early dispatcher. Patch 3
retires the unused VMware feature bits.

The caller API is unchanged. The I/O-port backdoor remains the initial
target for early DMI probing. Modules use the exported high-bandwidth
helpers and static-call trampoline; the static-call key stays private.

This series replaces patch 1 of Alexey's v2:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
Its panic logging patches and steal-time fix were reposted separately:
https://lore.kernel.org/r/cover.1794201807.git.zack.rusin@broadcom.com
https://lore.kernel.org/r/cover.1792471114.git.zack.rusin@broadcom.com

It is based on v7.4-rc2, which includes the i386 high-bandwidth fix
this series builds on: e0e022004bbe ("x86/vmware: Fix i386
high-bandwidth hypercall arguments").

Please route this through tip. As the vmwgfx maintainer, I agree that
its small annotation removal should go through tip with the assembly
move. DRM maintainers and dri-devel are copied. I'll make sure there are
no conflicts in that code while the trees merge.

And yes, this code is a bit like me, meaning it gets on everyone's nerves
and likely looks awkward in shorts, so we're just trying to make the best
out of what a politician would call a less-than-ideal situation.

Changes since v3:
- Forward TDX guests from the backdoor backend to the TDX backend,
  restoring the pre-series ULONG_MAX return on other hypervisors such
  as KVM instead of attempting port I/O (reported by Sashiko).
- Correct patch 2's description of the duplicated assembly.
- Rebase onto v7.4-rc2.

Changes since v2:
- Replace the ten-argument backend interface with input/result structures.
- Move the high-bandwidth assembly out of the header as well.
- Preserve all low-bandwidth outputs and the backend-specific %dx flags.
- Export the callable trampoline without exporting its key.
- Correct the ABI documentation and retire unused feature bits.
- Keep the backportable i386 fix in its separate posting.

v3:
https://lore.kernel.org/r/cover.1793685318.git.zack.rusin@broadcom.com

Alexey Makhalov (1):
  x86/vmware: Route low-bandwidth hypercalls through a static call

Zack Rusin (2):
  x86/vmware: Move high-bandwidth hypercalls out of line
  x86/cpufeatures: Remove unused VMware hypercall feature bits

 arch/x86/include/asm/cpufeatures.h  |   4 +-
 arch/x86/include/asm/vmware.h       | 371 +++++++++++-----------------
 arch/x86/kernel/cpu/vmware.c        | 307 ++++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |   3 -
 4 files changed, 359 insertions(+), 326 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
