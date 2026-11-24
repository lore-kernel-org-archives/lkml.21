Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560617;
	b=Ix5eZJ+MCpIdckt6+ywYUte48qfL5FB3Zj98D6R4FC1mK+2+yqkovmI2BEkXwfw40wlT
	 E6onA5Hew+JxvWqebCXr2ersqD3dydUClo9Qo+mrrlIQWuC3H8/2U8D/6SfpTO5WQUYx1
	 OsPqlUsKLJTgic5mLh0oOtpPp+Xn9me5OVr56gooZ/RYToE5epdth8F8UEiEx2nQXEck+
	 4Kg5JvzErHM/MxIGG7XnkiMPkvKSCWeV4R12iURm55MSTdQlYvVrQ8unBu+WbzpQoyweT
	 MxJIBTiWqMOPf/3XAFEpYVvjvDoKL24n/REJv7F1YCN1UQuxKXe+vrswgR9/DzjHBjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=;
	b=b0o+sqj9eH1mlXCFFzmLmEYUTp7NvDzsMzBiZoEkjGYLyDfNZ/JwwF4/USXz8x46FQ/W
	 ZxTZiPK6VVaUDT0zX9X7/iHXz7NxG534XQZNgCuy2LuIH16mvrWepBoz8EHWVasBrCAIs
	 K7ZKIcHdm07uAhkeWScBTIyEuVjKueHZligEeV30ODujamrptMN0D5jfKZ5DGqhdcCs/J
	 P3OfasWGyi+y050T+TUflVVAQGlBaVk+ZjxWx0PbNXQL16PUFFDIP9vBFyaPBqWNJZr00
	 RJQlCwoi5vKt7DpKKS+Yxr8/wfTI7mC+u3FPPjWp3zxhFIgR7qSjc6w/LMQvZdALASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=aashishsharma.net;
	spf=pass smtp.mailfrom=aashishsharma.net;
	dkim=pass header.d=aashishsharma.net header.i=@aashishsharma.net header.a=rsa-sha256 header.s=google header.b=aVUWoElJ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83420606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83420606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aashishsharma.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aashishsharma.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aashishsharma.net header.i=@aashishsharma.net header.a=rsa-sha256 header.s=google header.b=aVUWoElJ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso10879100eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aashishsharma.net; s=google; t=1795560615; x=1796165415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=;
        b=aVUWoElJj78v3+cYk+/3s+L00/mDHFKaIVKFnOb6pGQHIErfQzMApeLyGSqPDwtQkh
         SLPcrFLfGNmLIb9e7Tm1/7uCNefNK+TmZHTzBMgno0zgvrOS15VmpaPouj9AD1sWI/hE
         BiQbuf0rQtwz/ReL3PcsZk2e4QznLqEGq+j9HiXz6fdbT/93iYNLPTUNbV+gk5ZqggJk
         b2KfCJOX/ayBdJS1BHxi+JDqRi8HANVwb/pjuhfk/4Rv89fUVrdmUOlpkHaNWloMRZC2
         /4KDbWaAcoyJiewntWezo+W6RLS6FMbIyelj6cIzbH4GCGw6sQFtPfUOYCXL2VNjyAcb
         c/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560615; x=1796165415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=;
        b=EcyUaafJAkPrb5Kk1lagWC94n7bxmGDsygeQtvj178TigHBQJeoencx9CsyUzG28xd
         4GczP8eIeuaa2oxp6+JU/f70hai4OVD3GL4rSIV/r6PK7jdp95x4GqtKcGkfV+7wD8Hb
         EDXrETL2bY6BH2T7TnpWzYWFCnzYlnnn799Lz+XeSX0EYpvEjeS8zy+Y2AoZUgOXGgTs
         mjFL9jdRPp13Vd8r0Mh+Gy/5jfBdJ7o8OH3qYxN1ZmrK/jGrgNyVIY8DJ/mXyWvOtle7
         FGKAV06c2OUMswqS5IHZbU79IdecqeD01//tHA8Y4v4nFjbI/NhV8OGee/nmaCiazw5B
         NOXw==
X-Forwarded-Encrypted: i=1; AL+hErE8DPz26cbe4WQhweD6ZGTWoNlnUa+z5Lr2Kk3I06N/jcP3lGWtLkg/hqHyk/0bDLgov7MgKmJZAY6oo4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YAdYcz+vFqLpYro7qviCxak1jNnroVyEpFPpFGKNZJYGa3Dhu
	cd7rsAIrQsgZYD8DYWc820NYn9Xrm3pENsN7s2/NfhMuCIUojMsfq7pIEietgInrnHs=
X-Gm-Gg: AZFdTZeDN+SCmV15rMr+oj+J0xDljv0d94AkYuGmmKYoT+yxFqno4VEn2ic6ewLlTrP
	1lN0PyV4KVihITEfRspBvxvNY/7c4O5MiC7n+QsXM1X+iwDwILqCj6gm7KsiRqKR3wklIo5jpjF
	R2Bn09LzCerOqQF9Afde7coZyxpbwfC9uLK1ntciZU0Pm+0gJfGTazQx99sd675vaX9c61U6kOk
	+vRwF4+kadqLu7pU8ijE4YwmhgUCEJqdYAcUuhnuGLQbxL7Yv6hMbu3uMo0XiwkgVrl0csJODrN
	wITM0Xf4RXO2lyzUUATr48oqw9ecG+i3rNAgkUljfIWgXZOZ8s4iOLcFMe3ylOEGYNbdLxR7P57
	raOjK3G1zOBJw3FNw9WQ07H4Sno3K6iuC+vI8xztIHZE+diu/mweRTeE0iawqYYke2d4jpaEgYg
	SBjH/q0yQt7EDa6e0a0NVn9p/aFcJeGpjwnjBYUKuhmhc7gvI12so6Jh8KOxX01vmYjwAt4CuCZ
	XyhJ9AwW2IPC96j7ZDyTMymnFPtl5ymVclR1dN7ARvpl2PLwS6SHaOg8N6IRIrICU5YYrQ+8q3z
	EdDjBL8WvdcW5WiSCXm7qlPvdV9vUd8YlP5mgeg21hmKHpiFV8aPW+mmTOcWIM9FGxtVpGk0GP9
	7KiNNmgJnr/TNwurpX2bSz/Efcb9Rh4pDa9/yp3w=
X-Received: by 2002:a05:7301:4284:b0:382:1aea:c21d with SMTP id 5a478bee46e88-3857191bcf7mr17176831eec.41.1795560615370;
        Tue, 24 Nov 2026 14:50:15 -0800 (PST)
Received: from shraash.sjc.corp.google.com ([2a00:79e0:2ebe:8:be5d:9202:acae:6527])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm58294406eec.11.2026.11.24.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:50:14 -0800 (PST)
From: Aashish Sharma <aashish@aashishsharma.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ricardo Koller <ricarkol@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aashish Sharma <aashish@aashishsharma.net>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Do not free split_page_cache in kvm_arch_flush_shadow_all()
Date: Tue, 24 Nov 2026 14:49:59 -0800
Message-ID: <20261124224959.685002-1-aashish@aashishsharma.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
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

kvm_arch_flush_shadow_all() is called from the MMU notifier ->release()
callback, which can run concurrently from __mmu_notifier_release() and
mmu_notifier_unregister(), as well as concurrently with VM ioctls
accessing split_page_cache under kvm->slots_lock. Calling
kvm_uninit_stage2_mmu() there invokes kvm_mmu_free_memory_cache()
without locking, which is not thread-safe and can double-free
split_page_cache.

Call kvm_free_stage2_pgd(&kvm->arch.mmu) directly instead.
kvm_arch_destroy_vm() already calls kvm_uninit_stage2_mmu() once after
mmu_notifier_unregister() completes and all VM references are gone
(see commit a3ca3bfd01b7 ("KVM: arm64: Destroy stage-2 page-table in
kvm_arch_destroy_vm()")).

Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
Cc: <stable@vger.kernel.org> # 6.6.x: a3ca3bfd01b7: KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()
Cc: <stable@vger.kernel.org> # 6.6.x
Signed-off-by: Aashish Sharma <aashish@aashishsharma.net>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..2440ad9fed87 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1472,7 +1472,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
 			kvm_free_stage2_pgd(mmu);
 	}
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
 }
 
 /*

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.831.g720f3f5937-goog

