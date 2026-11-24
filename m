Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551737;
	b=I593RAqrmOq72cqfsq5kA87XAYaaLefkiG9ayN5mGfo5AE3DB7Ffsjacs95ic+455lgc
	 453gDwKbo72XvyluCcwDcbuQa5HOpxW4TUzz+MA9++Ee0vOPhMqm3yRqSNr0XZwhZlXjv
	 2VUbZKbXNZuR7wNoiEcarw67b6y8S/soShU2v7MelNoieJCyxV63cRfR9oYyVLKuctARv
	 kzaDFI4MRcV/9BPLtI3L2WzlvrCvV6zhj226EjGdH3afpnLVqwICoZuJ64HWi6yfzF8FO
	 lMTZizPMexJfZL9cTQ7NUX2fTkk83Ih2nnlRNAsyG1o0GPFuF83SsTS8RQKzW9Rwrng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=;
	b=ZyCWueQ7+idr4/ZptQd0BvwJUZyhgyZ1kc4SQsSSxafQ8YjDBUUOqU/lYeEBr8D41+6z
	 Z4F7o4SALSo9Oo5Ue5d2L51ZoYXTuFg9ik4HwTkCNhZIJc9/IEgv+sB49nFDr8Yr5lJ83
	 92O43B+UnqwQ8yBm6vSziJU252P3IMSPlMmIj2Yi0KlwzWxdgUZi28YdkEXAp66NEx3an
	 5rpg7udKP1FCNztQswrw2gf/wr5mmuMHNnC56dp+Jw5gBc0LbJt3ka43A7Fsj+zqXLIYp
	 JjHsnBegCtMx6HoQsGEvnwJz23DMDsYfbQGNm54VheD+GmUW2evruvBW4PxbYin6zjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NOnmOw+n;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NOnmOw+n
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-540537f959fso5331611b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795551736; x=1796156536; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=;
        b=NOnmOw+nVRIN9hiqE0Y5pZ7cCrhcN2J1I+E4P7h0lmgkex0uGCPx/5PkRpOYlB9F9X
         y5MJ/mDK63tgXQvAmngXTX6BzVkyI/6H3AyP0wpbgY4YGtxUBTldW1nWz+nCA+VO5GZD
         9mGZmVqstIxuGc8F6QI+ja3vAwmCHy8M67axodiKRB6yUtd/BrFZc4FVFQz02GXj1WnQ
         guG/DyQvJgrVVMMvodYvqnSvUGp45Hd0aKNp/Osn8BTEjuyISDrTcGPrbVc9+QLXDCw3
         wofxSkGBQCqWQkgVfJzlQWwE+kkbRl7Ajur2QOU8qLgG/4/PKm/MEbpX3mAFL0y3BlOn
         KVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551736; x=1796156536;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=;
        b=s9bqSYjKuLxeV5TMKuLx9p2y7LFBKFTnab1fC/KWBwKPt4Htx05hym8cU1zMmgKQqF
         7s3u7FHMB/D1fp6zB9qwDXCE2v5zrofGXm8SRtCnjkaXDwhukLk0tFn1/EflIc3HPqq8
         2yIP227Hyk/UwN1s2u3VaaYkcdmKkbSULDwC2p6CG/8xlDzldGosJbwfYuc2aLCKTwtF
         LZkho1trp9Ie3tFQ+sNVIdRKiTMHSEUcVUMsdq/1MseowPjELEUZAAH2kdDGptfVSy+s
         m990UUQl0GIRbJF9cX1B6LbVnnZCF9Vs344hmKO0UYtgAnMgvAtmYUUnOmoktzNfvo3Y
         nhWg==
X-Forwarded-Encrypted: i=1; AL+hErG6aC/HxSrbDKUYyRFbM0yb3gBcHz6uyGvhcZTxq4fqfu474aBetXxB9Dhj7qQRKQIo+ZcVFr2b88VvUNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qHBBkp6ldl62yKREF9eIwQGq0Ap61d67GENnug7/urt7wwbTx
	DXnDxAyTQJQcJgTPSv9p8aI4HB35uf50Yux37icWeyk4L2zcAkz6ZLmGFwLV0+Fa6m87t+KMBbR
	0Xi8ATYTJCzqgp7Is9nb5z7JJXQ==
X-Received: from ilmw6.prod.google.com ([2002:a92:d606:0:b0:53d:20f2:6884])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr18109738b6e.16.1795551735576;
 Tue, 24 Nov 2026 12:22:15 -0800 (PST)
Date: Tue, 24 Nov 2026 20:22:15 +0000
In-Reply-To: <867bi2z87n.wl-maz@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
 <20261123232647.3733149-2-coltonlewis@google.com> <867bi2z87n.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124202215.3731849-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in compute_tlb_inval_range()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 13:10:04 +0000, Marc Zyngier <maz@kernel.org> wrote:
> What's the advantage doing all this dance over the patch proposed at
> [1]?
>
> 	M.
>
> [1] https://lore.kernel.org/all/20261123182312.4842-1-maz@kernel.org/

[1] only catches TTL hints smaller than host PAGE_SIZE. It does not
catch a hint that is >= PAGE_SIZE but smaller than the mapped block,
such as a 4kB L3 hint on a 2MB block on a 4kB host.

I can rebase on top of [1] so it goes to stable on its own. Following
the same pattern, compute_tlb_inval_range() can check
mmu->guest_s2_mappings at addr for an entry larger than max_size and
clear it to 0 to use the maximum-extent fallback, dropping the extra
page-table walk and KVM_NV_GUEST_MAP_SZ check. Would that work for v3?
