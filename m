Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047946;
	b=4SihlkvB0o8b+1qor44MLR8EofmHCcogGdn8eYzlpigUHx74jnkpBDp05f06Ugpzn8md
	 0C/4GZQzvAAZPX2LP0fAgQaCS5ASDU/iY9zSV+C1/9wCiwebgXY5BB8AaQSBkxdWGfCtt
	 WWRjuUaMNOIkoggKfeGShbmBpCV22QMinLo2ljJM97mA8GGgHyxsn7XG70uLOIRuShMUH
	 u7hBcNaGxR2U3ecV1JE9etDhxif6OeUPp+nb8ij/YxY9JQXn4XRgrIaD0ahExJ1RSdXaj
	 NoHtDQ7SXLcyHFawFd0oLV5oejD8VXggjdc/d+gkwHZMos/t+EWOCawwD5hlCSduPyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
	b=5VcVjLcMOGfGDSSHAO/M9biwbwZJlnf8G+sydrR/rSv6Ki6tcE2XbwgQFvWBxZr6Bssy
	 HnMC3nDVSDhq2YyUYZwe2kS4KeINSm9Rtxl4ZZ0TI0U2EG6AP2iusibAEWJ57hll8UjMA
	 Ymuj2LvhuDeMg/S3h+5vKeeaKlC2jik4B0NjtKsMmrgiCikyZkMVf2hsGvR8dYfkN/5r7
	 gOXj7YH6LVNNnD6DU1VgnV8Pu8wjP1wsw+wD+gW80IaB0U1K8qMRiQaxfucv9gUpFTwxq
	 iZOdl/zmTx6aEGoKgBVV2zI38oRNuUHGqQzroKMyuTGGwBvv8ywQTElSEfaW6i0OmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VUzzRT1P;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27574606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27574606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VUzzRT1P
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5587351d419so1230947b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795047944; x=1795652744; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
        b=VUzzRT1PmPN3kH/c5HD5qxg23YbKceVpVl7CPJfi+KdLeS+giLCoHmbo8TeKtLKScO
         4M+h/q27Mc1BJm+qXrZzLChZ7Jay16UY0fuOIPg0LSSY01/l6RPxGRyiO5Cf022TUr4f
         NqNygd6qVz76Q1ennc949Z/jfRVOM+uQc4kDStu6gb1KA1ibwjKEf5D6Xr9kxDP9hqM+
         84jm9VV38N9kQ5om6sreRHX4BiEQfYGGyUW8pxu/mj57il7NS2aTWOHjJo9YIv4yLiLi
         8ruKnViQKijKVdHUpz2Wp/g7k5CYbNIwKI93rKmrhMayqMFvwaNsAnxv9xRwBunbZQFZ
         aNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047944; x=1795652744;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yb3RT/dSHycHHUvHrQYfX0MzmZ7Zlc0xT6PVwRVG2IA=;
        b=TdtBkYyTWe2dt/vMaTGEQXXxnEGn+vjLnmTY0LtuxPErsh/8z9f+aG8Q6T0lylfzmO
         kX9+lZzTBMmbUXnHZUS+ijNQCi7TH8RxKX43jtQj/KdiJW6gsnNv+kGBbVgVMLe9UKM2
         YJpaJDbFYwBf2jH6AfdeSFuZOjES7tcQg0DON5L79Vc0f22nD4yyUbwozcIiddrcSPO0
         5XYuJ2O7IPVBWtc6H6rgWuuD64SVf8lOKfpSc57ClAhox9YPy1RDCvnQJF7GBhqUp509
         q4SvQDK0E8s7aBwOTW/lgsMKbgIfvHT+QAhKAeBS982sPryxpVp7w4iCgrTvSojXnv87
         dUAA==
X-Forwarded-Encrypted: i=1; AL+hErEyab2ovR5pU3OfBptugRvoUVo9qMUU0SGWdBfHEOcoRhoIJ/GwXEaW4aoxsKkAXsbSv86Yg15OHJn01R0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3ig8Uxa6ntKAouU6p9xINr3nuqL0tgdRjT1qDeP/Qa1HMtj+5
	BBQ5w917ImTYhk0q+wj3TlyBt+kO0ByLtoMdbW4/M18PSPK5oybMPM42Berwu2Hiqu1U0XNjPs7
	BLivb0A==
X-Received: from ioru16.prod.google.com ([2002:a5d:83d0:0:b0:9e2:9e82:a2e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:250c:b0:53a:8c5:d7de
 with SMTP id 5614622812f47-5773db2428bmr4568078b6e.1.1795047943693; Wed, 18
 Nov 2026 16:25:43 -0800 (PST)
Date: Wed, 18 Nov 2026 16:25:42 -0800
In-Reply-To: <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
Message-ID: <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 17, 2026, Fuad Tabba wrote:
> > But the overflow bug only applies to x86 (see below), so is this something
> > we should worry about at all?
> 
> The ring overflows on arm64 too (below). As for exit_reason, I asked
> Sean about the arm64 MMIO case on v1, and his answer was that a VMM
> that pre-faults between a KVM_EXIT_MMIO return and the next KVM_RUN
> "gets to deal with the fallout" [1]. I think the same goes for riscv's
> exits.
> 
> [...]
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> [...]
> > >  The dirty ring can get full.  When it happens, the KVM_RUN of the
> > > -vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL.
> > > +vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL, and
> > > +KVM_PRE_FAULT_MEMORY on the vcpu will process no more pages until the
> > > +ring has been harvested and reset.
> >
> > Maybe worth mentioning the exit_reason thing if we keep this arch-generic?
> 
> Sure, I'll document that userspace should complete a pending exit with
> KVM_RUN before it pre-faults on that vCPU.

If we're going to do a documentation update, I vote to keep it vague and scary,
otherwise readers might think the exception proves the rule.  I.e. if we say
that KVM_PRE_FAULT_MEMORY isn't supported, then userspace might think all other
ioctls are safe, which is most definitely not the case.  E.g. something like

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e95c9cda085d..45dc1e3c0b03 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6971,10 +6971,13 @@ to the byte array.

       The pending state of the operation is not preserved in state which is
       visible to userspace, thus userspace should ensure that the operation is
-      completed before performing a live migration.  Userspace can re-enter the
-      guest with an unmasked signal pending or with the immediate_exit field set
-      to complete pending operations without allowing any further instructions
-      to be executed.
+      completed before performing a live migration.  In general, userspace should
+      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
+      completing the original operation.
+
+      Userspace can re-enter the guest with an unmasked signal pending or with
+      the immediate_exit field set to complete pending operations without
+      allowing any further instructions to be executed.

 ::
