Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857711;
	b=G0U9YXlAI0yf3ho+Z3xrgoH4x1I2H+cZEOA3Gz9SXwMDg808qtlty5Kj5r0ZUk5/dr0b
	 AHoFSaBKooUQ695DCNlngDf2oRr7RmzK7EGAKiYG76suA+sQ7V0SQ5IINL3CKZNHrURkW
	 efvnqKUmozes5GlrikgE32whKkqj8NtpGX/Oz77HFZRentfud68BuAmQnKlpGKFGMMIHh
	 7+ghAIj1PVmIFgR82bEQiNfGpi9P/TRforv22y6/N3aCd1h0ARr9GSuaBejBRaX3LO6g4
	 F7SezXVSReHUEqyUrlReKjirEQkzWvUwjf3ME7SJeXmHTs5zpSyF8BlRrr9K6K0s6mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=3oezv2c2NxkYBuJOQKRHFZurgThAtx7ut9Mj3a1tfIA=;
	b=dJaFttW5Po9FBgzdtYXzd6PddbLAVlsPbq30I9kvN99IVidBr/GZ0WWufqe0F4k3/1Ag
	 GChHtz2V8imrlYXofsRKbaY3bH8Pn2bZmXpJKiNlVOW8fV2c+iLSPbMOgsgwyccg6Gnwg
	 N6L6WcLGSZ+mW4cB0MRIRHKm4mbMSB1y7eE8F6W/MLXhCKbd4csMQcphooK//va4T5bqu
	 OCYZU4RpXZpeLCGn57JTHjp6i8bL9ZQet46tz5K1/kjzozrZYLjeKrK1FhturIPCaP/qI
	 eI3FTg8xsIpNvUbpF9VjHQMCuVJOHCbeRUOnrpTO3pvxsTp9t8ifOk8i5SRfFysq4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ioZlZYzj;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ioZlZYzj
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b30cbfa628so64615377b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795857710; x=1796462510; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3oezv2c2NxkYBuJOQKRHFZurgThAtx7ut9Mj3a1tfIA=;
        b=ioZlZYzjNALt1b75YAfBXdRD1HN7tMLxkpMjRWfUVVH/wIepBdFybcX9alu5fGnTun
         fNa6B4UBA9/pX6nfeejyZ99kodCwkvwf2ErvjLJ6w1Y06wxOb5kjPDcv9N+iWmjFqnZc
         oMAwVs2fAxA8p/h9QarWBxmCJUlTKAPRmP3I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795857710; x=1796462510;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3oezv2c2NxkYBuJOQKRHFZurgThAtx7ut9Mj3a1tfIA=;
        b=jg8hm/DaIenFF69BikHuZFrnXtK321rK/W2Zi7E5cfgu+Z3f7g2CRUcNHr15zAuS7Q
         M9c1twbE/Vv1yzSKziV8i7DGbDcbQm6H9FMWm6eOQYyIwl0jxfQIRVMvY59nthyZvhnG
         lcT46+WrcX8etU3z3KrLfZgsZY0b5DGE5NvcvXqJPasidCNbCBSa0vD9pPsOA/oq2tdl
         YyavdqNgLwQuWVs6C92yb5g9EXe9vpvOHCrl9a/uBnoZm3cDVZ8q0jHiTFHGCIqUTuwt
         kl5Q3U38FLutgMHF/OqYaCBiu0FI483/Mk+dWf5y6lci7EphsHoztg3kN/BwZLZOre3y
         ffnQ==
X-Forwarded-Encrypted: i=1; AL+hErGy0qGXPeilN+DZZlXxHpKSoUP8HAI9BBPrjMNQ5+8nUbyoHXW13hR/eAh365xyM7zKiZ8e7dd5YemT2gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QPbjSaraxV3zayhjSZJfiACruCHG3o+jOvB69g6apemYjk8fw
	9EXgfGhinMSy4x464VqNFh7SGqFy9EprN4ApO/q095Cvd8Lmw+JISiNkTPekkRb99Hg=
X-Gm-Gg: AZFdTZfaVfAnRnKceL+dZ5JAVHEGwi3uh3Vyr1kzNZogJhUeS+fKxCOnLXXR3NOQBQt
	f69XsP7Z0uX29jn746SVt9rCgNiXArpP91s+S/l3nKXW0I6GQ+rivLmDdwyZaeBb1ahH/dKoX0Z
	aOqEz0WZ605unGqmV6Z4TJfgCebfhcNTGYCteNngm+1k4NGsm6nyZBffBDgcon6Ghb+2ohdknN/
	weoC40y4mBES2AE3MoLza4Cf4LxagyJsIUg3zh7kz7gt/1QvL3Ocd8MRfzoRpew2Do44rOzzOxf
	kSbJpxr5LqXqa27rOi/nPYPzttLq+ptO3PfeFPuxyBFvBwn2F4qAhrjCqCdjkbXh/KEpwaMTRAi
	b/kSBnW31FDgXv0VTCt8ijkuP2qhNclOMN2X/XItdD3bzuTJCvwah2pH+umkaW2isEA1uJmHf+Q
	ePQhsRiuA7E+bK4m60wpypCO/EmNAamRdm2wP9WpC3xrBA9iMRUFoUKBkOWis15neG0YJHKNCOI
	smnBQkS0/FD4K0OUdRKeYComN0dx3MTwy/Aj9gwhkOBK8JNlAzXTcN1SaWS3iGu1Gh/0QWuh2tJ
	59YPXJcz4xtptsH6oe9mVuW1AvtpzMVlPptF6Uae5aDXJdj0A1n0C80yHUAdfP0crEOAuTsSmvC
	OOUSsgUqrxJau3DO1atvX2Yf18QX7wWN/gyNaEfaP11jQrV/87BW+30yRoSRvJF+rdQYFF89+xK
	au4jW0c6qg2NxpU1mL+z+DQGBfnThro0fTUNaW2+K2tejy1sq3EuwIcRhp5ak9N1VjHw8+xk6RW
	m1GnZyy8sVTSGvVt+Fa2FQ=
X-Received: by 2002:a05:690c:63c6:b0:8b0:ecb2:8861 with SMTP id 00721157ae682-8b52051cd01mr122748457b3.63.1795857710306;
        Sat, 28 Nov 2026 01:21:50 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52032d09esm102449777b3.35.2026.11.28.01.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:21:48 -0800 (PST)
Date: Sat, 28 Nov 2026 01:21:46 -0800
Message-ID: <cover.1795835884.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/2] kho: fixes for kho_init() failures
To: rppt@kernel.org,
    pasha.tatashin@soleen.com,
    pratyush@kernel.org
Cc: graf@amazon.com,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

When kho_init() fails on a KHO boot, its error path frees the bootmem
areas that were inherited from the previous kernel, even though the
running kernel was loaded into them and is still using them. The new
kernel then oopses in kho_init() and panics.

The easiest way to get there turned out to be debugfs=off. With
CONFIG_KEXEC_HANDOVER_DEBUGFS=y, kho_init() fails when it can't create
its debugfs entries, so a KHO kexec into a kernel with debugfs disabled
is enough to hit the panic. That's a bug in its own right, because it
means KHO and LUO can't be used at all on a kernel that has debugfs
disabled, although nothing in KHO needs debugfs any more.

This series stops the error path from freeing bootmem areas that it
didn't reserve, and stops kho_init() from failing when debugfs is
disabled.

v2:

- Use is_kho_boot() instead of checking fdt (Mike)
- Say who reserves the bootmem areas on each kind of boot (Mike)
- Describe how to trigger it and add the oops (Mike)
- Add a patch so that kho_init() doesn't fail when debugfs is disabled
- Rebase onto liveupdate/fixes

v1: https://lore.kernel.org/r/au_vQhHAcJbkryXN@chrisdown.name

Chris Down (2):
  kho: don't release incoming bootmem areas when kho_init() fails
  kho: don't fail kho_init() when debugfs is disabled

 kernel/liveupdate/kexec_handover.c          | 19 ++++++++-----------
 kernel/liveupdate/kexec_handover_debugfs.c  | 19 +++++++++++--------
 kernel/liveupdate/kexec_handover_internal.h |  8 ++++----
 3 files changed, 23 insertions(+), 23 deletions(-)


base-commit: fa1c0f103fd68558613d3df76e222463c6e4fc37
-- 
2.56.1

