Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645089;
	b=NKg9ALy5EU59YOvMxQppvAUJE5IWCpw9iHyv84LuL2uHrH91S01rD47WRoMy/qlLlIYm
	 aW1JjVRgo46eGCG50qE3FMfRn+8RXGPDHrz9EbK71LOaIYxX11ANSDCWks7axco4ZqSGd
	 7I2o8UX54utvO97R5NgQSGE86yEZArL1rG/Bwb/yIg7j05omwanaxytcdy6A/r6I4oJWZ
	 s51GoM9884jry3aZFsoVT28nn0DmRAM74tlNPPQVwfIBXFim0dAeW6N1PlhnFMzjhFMin
	 EYsXE6kAyGSu9FnL3XI/NifXaoXh6x9zv3/PgVOuX7JQjGwTC0SvctPpeEX2WWG5vIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
	b=brEUDjFv9oGfuwdFTIsbQ3bw4B5MAkz3owar9Fvj4Wu7ZYB2+te5a6SKYopDuVq0mIvh
	 +MdWVU0DkNXDYZnsJrg6OirbnCPSMCl7UDHfjZUFhRIBYe4773QmIJ4zuR2BLhRA96ICY
	 K1gXnSySwyX9cleOMOQfYdOn11EHzdTvUHoMpNKmmnBc2JbE9sFNgIRLdFYmX9X+t/5q/
	 u//izFj4m1nKF8sk9k8kSiSAc7EacugkTVViY7UT+TywoV4pgQ2CDmrl9gBMy6b2sJjWR
	 aS8oEI1Wf4/assLyQJRrJXnf5u7eYr8m6DC+NW8K03pyTiCI/yEste2AXNRP/OM+iGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AMl3LmEl;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E44606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E44606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AMl3LmEl
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so8706738eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645088; x=1796249888; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
        b=AMl3LmElISr+LcIz46AFAnss8cb5DZ+M4PVBk5vufPv5cJqsteeok6akvjVJPUk4Mp
         Qg6nMTIkt66NNDgOYy9aLNV8fwp+ErLybISErUmO4zlfN5vRH9nXBsCquStnL0TgSUhr
         7kcWTI2UXv61Fmg7j4pFt5Lw6aec8eBx4Tm5Sz9tVjr6dY1yfaOxm7k1L1Z9UgCofifp
         jh02+RleFHbeaRYFfyVa1tnxAEAtC818fzum60SNbFY+n2ipacyeu4/naD+JlFX0u62J
         qMDx68VuOsHyk7+aBzS/6YzhVJ5rWLrrOCvQ2+Bc9i+1/mc8ObbgVYGG9OEYxuO/rUXI
         8xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645088; x=1796249888;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
        b=eIbgT5nmhqyD3ZSFm8qd10RRx5JTJSh0xuIGHAFMXIjQuWcT1SCA6z66ogp+zjAXOt
         d+XMCgTnCAnKYeV9G39DqG1f2GwX0XdkX3nwyYPdimEiG+e/9u9zOPQOnCIc7WnPlLJg
         cP/6oaVOuDqs4HgWQI4XIBL0NHKvKnBkq+F6uVmrk6T5BM/4vRRZbQI+RHfVcUL5UeHm
         2blfT1bkOZqQwQbYzrBFzqps+53La/2PlMOlbIK3MgSSN8V/I0OZyjMcEd7LrOzkGs2J
         2pD9drS0VVuRP7Q4/WCmotOwjQ2iW5mWU1LagEKRYYTisuaJL5q0fICEd2MIZEnbiLt+
         prew==
X-Forwarded-Encrypted: i=1; AL+hErGHzvYPlYSATM7tvBTFhY8KlTDwixRwjay7MnrESLzGe8tufk6zLsaZb80wGZmFHLIuUOL328dCwgw3G78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q1uAuL0+KjCDrnyvUmFqnuflL4g8pn/ecy+nYjhBmQPmnuaoQ
	fk6YT3EB+6bLKylmQcYbQezX/TihHcyKjerV5c/JILO3+hU7EETqE9ZIZR+CKaOcaFPAu3GZB5p
	RVQ==
X-Received: from dyblf45.prod.google.com ([2002:a05:7301:a2d:b0:375:861c:512e])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:259a:b0:36e:800a:71fe
 with SMTP id 5a478bee46e88-3856c4b844cmr19042043eec.1.1795645087865; Wed, 25
 Nov 2026 14:18:07 -0800 (PST)
Date: Wed, 25 Nov 2026 22:17:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221730.1421806-1-elkin@google.com>
Subject: [PATCH 0/2] afs: fix NULL alist dereference and address bitmask shifts
From: Elkin Cruz <elkin@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  afs: Guard NULL alist on restart in afs_select_vlserver()
  afs: Use bitops for fileserver address bitmasks

 fs/afs/rotate.c    |  7 ++++---
 fs/afs/vl_rotate.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

