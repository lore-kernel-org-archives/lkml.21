Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216675;
	b=Fj43aHAWyMbQnHKiWHd+N23Znrn0MSTErpyLKsGofAs4snSJSAAjoJ9TKOmDYBG6rlNP
	 sOdW139twRCY3PGXarqKDtstpkk/eh0oD7AT7plrPx0EPoaEj4PZTu+BfbzbCkyl3AiUy
	 nu0aePs437T7r9VQwTjq1wW/PUJA5k3PehO1Pkvo1SBr5TOUUH/sVzJ2toNHvu3OPJP95
	 DEfYq94sXFGDk4AFhYDoCuQm/QIs7oSCjXF9L7eDiyIzsSx7qcrXAUTWVURP7hVCEnToY
	 dpeRTw6OHCwqqf9UGYtAYXAqJHCucXhlh3WR4RNhGYrWgknwUecIoNnTbZ/BwsnWBzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=;
	b=JJj+IfP/uw80swm0q2TzWd5hz4s7N6c4I1IFpFClPJ4iZR8Iq5YG1HWFS+zccjQwOShl
	 jkKl+L8AsXq+HcT/Z0SANeWJ/mvcXtrJeIJr7N5/lJbR/TkHkElc8dvPnbhcnTeQ0nktz
	 lJbLOkU/BDvVDs93Zs0/lIPipEbEPA1IwoyMjRkIo28CNQB9pci8c00QPSvLSxQGReWCw
	 gsDSRmgU1ccbQsNjlR4gIbKurVAcqrsR1P0TgrS0853krHQ8qFPgHC5g6KhxRMGebPJcs
	 RzJLKD4X4Gf1b/pPxz0XV8ORnuyoCi778c3x0T2mQ+HexyWOMfpqfyWeHB0ZoL91orQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MhmMipq9;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D022606A695
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D022606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MhmMipq9
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86313f7f4faso1629868a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795216674; x=1795821474; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=;
        b=MhmMipq9RgPptx/lndDmkQMVJ8aYvft29vz4F2CxWYa76ZsbvX+XLz+/hlu1nA8CFc
         hPAprRZ8mok+/IaSEZoIGIj33oWy1JQE+F4Z/VDkuIkpM95ZZCYalzy02a4GHouPw876
         iUEcF8OYiun4XKyx4z64IimBjdqXDtQMx4cVC+qGBEqD6Cw78Ncv/SZXcJYuHmYhRssn
         KYr2JaahL4vaDTYlwyMiwF3F891zf1CulgkwbJpdQztDKKFx8v9yHhNMlIb5Irf0sLIT
         SqjDZ90eKkT2gkUMqiThhqdfv2eKSOkqPEaD26EwEuLHwPJq1QS/1VYxmh6whHJZPj3p
         Y38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216674; x=1795821474;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=;
        b=vx55KlPM64Thf+QYH8IwUucBW4Fcd+HplNdbZ+M9PoGfKajPaZ1DQhJFcvhdGHRXIs
         1lAH1pv7MhcewBBpZonSTM51KCsF5cMjysKRrIu3LNppKMaDXJ5pSQp/wFMsaOxocu8k
         N8pNDqBiBKb4oWm0Rzj8Ob+V9kR8+vng6B5O7k7lk0oCN+7x5ys6MUzWHfJjw3rF8KXp
         Qr4aLDcHGXNIGICOs6zGubiDNYNs9TB5819Np8Xe/eimxb5mSXK6NdLshm5Xns3g0aHf
         3tJAyA60oa0g6NgcDQFlxUEPjaZjsf8A9ol28XSqFD9OzUZlU+bhvfJ1Fba+ktwjT8ey
         Atww==
X-Forwarded-Encrypted: i=1; AL+hErHah+6hGIi9kR11+mK2c4BcRMKUPAUKoEs2F/1djiFBp3QciO0etDsjb1BZ6tQtjArPPUQmq6JhT4NGdvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H3LZfgx+hktXd6IhMnZaf1E6a1Zhvhq21bLWHmG37HUXiI4iR
	plArWtP3NI56eX9pLWTfJC2zqRE8D/VY0uN4kfrOLE8tUuQgInTEgURjEAc7wB1TdEAbUS9nu7K
	8TfYkmD53xHsuf045SdccD/CdPA==
X-Received: from ilb26-n2.prod.google.com ([2002:a05:6e02:531a:20b0:53d:d5c4:1e46])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c12b:b0:572:86c8:6b4c with SMTP id 5614622812f47-57a07d19c74mr5405322b6e.6.1795216674015;
 Fri, 20 Nov 2026 15:17:54 -0800 (PST)
Date: Fri, 20 Nov 2026 23:17:53 +0000
In-Reply-To: <iyfa5sagkdapb4plle575uhbxbmjdcxvbe35nnlxkqzfqnztqd@mmweqvqmil6x>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185105.626343-1-coltonlewis@google.com> <iyfa5sagkdapb4plle575uhbxbmjdcxvbe35nnlxkqzfqnztqd@mmweqvqmil6x>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120231753.1170879-1-coltonlewis@google.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix guest stage-2 mapping leak on
 sub-block unmap
From: Colton Lewis <coltonlewis@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 06:35:12 +0000, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > result, every sub-block invalidation followed by a re-fault leaks a
>
> Doesn't the block tracking node get leaked regardless of whether a
> re-fault happens?

Yes, the stale entry is left behind on the first TLBI. Re-faulting is
just what lets L1 accumulate additional entries.

> For this third paragraph can you improve it by stating how the problem
> is fixed upfront? The first two paragraphs describe the problem, then
> you started to talk about stage2_unmap_walker all of a sudden (which I'm
> not sure how much it helps), and the fix itself is not emphasised. The
> combination makes it pretty difficult to get what the patch is doing.

Agreed, the commit message was unclear. In v2 I will drop the
kvm_remove_guest_s2_mappings() approach in favor of ignoring TLBI
IPAS2E1 when the guest-supplied TTL is smaller than the mapped granule
(as Marc suggested), and rewrite the commit messages to be shorter and
clearer.

> > In addition, suppress exact-match duplicate insertions in
> > kvm_record_guest_s2_mapping() when concurrent faults or -EAGAIN retries
> > record an identical (nested, canonical) range on the same shadow MMU.
>
> I believe this is better split into its own patch, it's doing another
> thing.

Makes sense. I will split it into a separate patch in v2.

> > Fixes: 5491980c1a41 ("KVM: arm64: nv: Track guest stage-2 mapping removal")
> > Fixes: c2778d14cd2f ("KVM: arm64: nv: Track guest stage-2 mapping creation")
>
> Since there isn't a real bug in the original implementation do we need
> these tags?

Good point. I will drop the Fixes tag on the duplicate-avoidance patch
and point the TTL patch at the commit that added FEAT_TTL handling
instead.

> > +	scoped_guard(spinlock, &kvm->arch.guest_s2_tracking_lock) {
> > +		if (!guest_s2_mapping_exists(mmu, mapping)) {
> > +			interval_tree_insert(&mapping->nested,
> > +					     &mmu->guest_s2_mappings);
> > +			interval_tree_insert(&mapping->canonical,
> > +					     &kvm->arch.mmu.guest_s2_mappings);
> > +			mapping = NULL;
> > +		}
> > +	}
> > +
> > +	kfree(mapping);
>
> In my understanding kfree() can be called while holding locks, so we
> don't need the extra level of indentation.

Yes, kfree() is safe under the spinlock. I will keep guard(spinlock)
and call kfree() directly there.
