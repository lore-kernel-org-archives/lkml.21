Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034266;
	b=N2wZ3+ZxCOt7uBfC0NmPbdF/gTpGHYbGb8i29QKG9swQlNmwAHSYTQ+Q6rTl1cXELfpI
	 HbTSNTQkh8zXDTibGZejKAoF94A8qSitouPIQFDEFb3xARn6OW0TWsCJyjsA2iNp1yU+i
	 8Dv5K++7oi3D77076ZIANGEsbbQiDRxFmgA+Huk/g6RRFEaUgiB1CjVCjoNpG74q+fXWU
	 QJFIBy5Rb2dwXnNwBwPteTALsvalCEisBhww/8KdzIaMxwgy/I9/8MK+rPG/zEHVFuI3H
	 Xh11G+tjlutCPZLVjdMkjG5U2/uw7zE70vKZbdZp7ErVe0crd1e7zPsXjNyVoNAOMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NP9MdhxeGHGArR9vL9Mt1yif1925+jhMGTONFGDTnqM=;
	b=dcQ0fUHcNLSSR456C6X0Z7WVBnYPrYjTWCM4SEDvZAj1VZXJ6/UrsN1fY+QT2ruVdgT7
	 rwzJwppvsZph81Jod4as1OUYWJwxEn8aIcZIRrrHTROBG9tMLL+ATYNOxYLAQc0b6018f
	 lU8Il+OROok4PbPHpcYs5NPFJdOiC4Ck+/egoE76T5JwE/Gi/zvevcgQBLuh0Q+2WeFJ4
	 jsbai29D7jijNGp/gnrSHX8e6Kgyzf+rvgzf6gwLbssT4lPRpvy4aex8EVVb6+YcbWnFR
	 vmrbjqLBjY8hyqHU8NZUkC4qmadpOCrf8qzM3BwOFD47jNy6bPYrW3WSAkgrfDySvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O3fAVGZW;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O3fAVGZW
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so1107936b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034265; x=1795639065; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NP9MdhxeGHGArR9vL9Mt1yif1925+jhMGTONFGDTnqM=;
        b=O3fAVGZW5GSWcR94MlQk7II4ZeROs0Moys3uH7ZZUPkp+c3jhUSfRUXQHymuefy/KX
         Gw1cXCpUckYqQV1CsaqIOvN3PFMFeoeIgMfQvCOO63fpBkNV395jgBxrfdPAU/iivg+q
         Io2Bk9MQ2rXK1n2st05Ku7993imfqvyDPJD95xfOqZ5sGu1p6DrBj/nBYj2DGWp0uUaf
         iTYjbGQ7KwGgj8nJy37lxyAaVEQ3tV7o3OE8ndxsqiSWJIbID1Ml1oYRC+1nTadxa0uZ
         rJFWzK7KZat1dSverTONkN3+enXSLcvIDY83YUabTsdrbRUpIgRdt3+Ag37vZ9HSw0Wo
         8iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034265; x=1795639065;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NP9MdhxeGHGArR9vL9Mt1yif1925+jhMGTONFGDTnqM=;
        b=uWcgsXRtPWK5sxm6gqQM01oMmJoxVxddk6g+XCqYVRVRCM1y0EfLSTe8T+egeLXt1C
         78DAfeqZbdpDVe9XGUNRnXNDYRN0Lm6W3a0nRdFIqAkUuWBgx1GPlvE15vveukosyTed
         Q3wecZ44s2DyEEFPSwoheF0fQGDJibao9Xg8iscTS/JuTJ5C+Kga5mI3zP1h0ynxFZj2
         bClHN/WSqQSJOeeoNVjPeZtMxNAaadM6TXA7kOZZRhov4XBNdDEVkDHPcZGC8uErQFuC
         oKtaGUekDAVh+lSl5yA0phzvwzLsYhCBu/FSIgkV7IKIykUaKM01d/HHMkRCiyt73uQC
         bcHg==
X-Forwarded-Encrypted: i=1; AL+hErEI7He2uB/aHFBLVt+595eKkajrWwXmAw0+YBExin08CFDPME/9rBqGQgR6s0SYn2ODo/d/CJNi96Y5DyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92d3UNcx5D5pAdDRvEVlcx3ujBd+vf9N/OjqG3vfbsRFry+lr0
	LMPKsV8hM8ikH25W6YMsJ6JgUl/D+amNVE5F0wpWbVd5bNXnnyDuGAFaVYLHD/kAAV0a0WjK8Vd
	irEgvPw==
X-Received: from pfx48.prod.google.com ([2002:a05:6a00:a470:b0:8a0:8283:82bb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e26:b0:8a0:7140:7fbb
 with SMTP id d2e1a72fcca58-8c5d558e278mr3054253b3a.51.1795034264755; Wed, 18
 Nov 2026 12:37:44 -0800 (PST)
Date: Wed, 18 Nov 2026 12:37:43 -0800
In-Reply-To: <20261118203408.98649-1-streetster@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118203408.98649-1-streetster@gmail.com>
Message-ID: <av4Mlz7fOP-EeFA5@seanjc-mac.roam.internal>
Subject: Re: [PATCH] KVM: x86/mmu: Defer TDP MMU RCU callback barrier
From: Sean Christopherson <seanjc@google.com>
To: Mark Street <streetster@gmail.com>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, seiden@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 18, 2026, Mark Street wrote:
> TDP MMU pages are freed from RCU callbacks, which return their headers to MMU
> slab caches. Waiting for an rcu_barrier() during every VM teardown makes each
> VM wait for all pending RCU callbacks, including callbacks queued by
> unrelated VMs.

Wrap your changelogs.

> Move the barrier to kvm_mmu_vendor_module_exit(), immediately before the MMU
> caches are destroyed.

This was *just* posted.

https://lore.kernel.org/all/20261118-feat-kvm-tdp-mmu-rcu-barrier-v1-1-24106947c616@linux.dev

> Set the owner of KVM stats and per-VM debugfs files to the vendor module so
> open files pin the module and prevent its exit while those files are active.

What does this have to do with anything?  AFAICT, this is a completely unrelated
bug fix.
