Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015182;
	b=TwlNxT+pzQy695fIlP2yjOK5fZ6mkXZ3JwBwmy8tFuxG8+zMN+FIKdqLliXkF0QFNz2W
	 H51SXqa9fqa22TxDl0s3YBfD+FPTbRqQsOYL1EbnA9LS8ctRjeFMeq3W91KyIjWut3n4k
	 qGomEALr3qT344MNxFssUrRhoK4xiYJmRr+S2VcJ+ZSrZ7GCCyTh+YFf9fQBr8ADIa0PD
	 eoD/wQYnMCu3QF79Mi4HZ2bzE2rO70kSQmXFRNP9whpyQqrNNJ5mcSEKstat0fxwDFhkU
	 /UFuMQ2M8pebi8rr1z+e/hgRmn4V45QAFbw7AxNmJaas0JBJ1epkyBhusZ6SfeCvdLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015182;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SujFBGnh6yTulhxhe+ai56SzIpUdalRGR1bKdRxm9dY=;
	b=f9uSKAO15aj4wAI7uUo8YCXhglsSmONfBaayJX7Qnbha5LOhi9Dz46Seyj0pcHVc8MUw
	 0u1wPA8ftKZR1ch5gQ8ZqoaiwinRqvvvmNbEsbynFuqU/U4hNedIuKx1xZfjCJNmgK52H
	 Dx52KUc3qyH6heERzESGpMSpHZD2D2pGoCcSz3L0MZ5nK+BRkPzlz/PDcq9a1Yu2oZydb
	 jsdD62WZx/9jaFm1Qpu70Nvb6Jt97FeMC/iwVHie7aGWYDy+j6tLrn+DOmSscHz9lp0qZ
	 8Z9WhFhAm5ZD9HZS9dBikfWkirrGsF3CSApx7XwGMLOoA5PFmuIH1kRT5zMSe0PAZ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTtqyQ+t;
	arc=none smtp.remote-ip=95.215.58.252
Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B355606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B355606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTtqyQ+t
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LaHx7qcqjbwEKcmj0Cj8QcEXuKFYCBuqRrKkPXxYHjQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015180; v=1; x=1795619980;
 b=nTtqyQ+tY34a17lqzHxa4NvK/WH2RL9iNEMV9574d37qvkRmAhpvU+1N5oZCWnzak9prDmLE
 NX+Z7ct8eSllzk/mRLA9CdW+nL5PeUvkQJI76iTOsGUAMOeNs+Ik0FynDAH9fGYjkR5xG9hmhY3
 5ab/P81YhtRlL3G6D1a36Xuk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e544babb2f80ab37;
	Wed, 18 Nov 2026 15:19:40 +0000
X-Mizu-Trace-ID: e544babb2f80ab37
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/13] KVM: arm64: Deprivilege the host under stop_machine()
Date: Wed, 18 Nov 2026 15:18:58 +0000
Message-ID: <20261118151904.4099560-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
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

pkvm_drop_host_privileges() installs the host stage 2 with
on_each_cpu(), and each CPU goes back to running the host as soon as its
own __pkvm_prot_finalize() returns. That doesn't work for the ITS
takeover that a subsequent patch adds here. The other CPUs must not post
ITS commands while the driver switches to its copy of the command queue,
and a takeover that fails has to leave every CPU privileged.

Finalise from a stop_machine() callback instead, so that the takeover
can run with the other CPUs stopped and before any CPU is finalised. An
error from any CPU is still returned to finalize_pkvm().

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..16dfb249b4961 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -11,6 +11,7 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/stop_machine.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -312,25 +313,19 @@ int pkvm_init_host_vm(struct kvm *kvm)
 	return 0;
 }
 
-static void __init _kvm_host_prot_finalize(void *arg)
+static int __init __pkvm_drop_host_privileges(void *arg)
 {
-	int *err = arg;
-
-	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
-		WRITE_ONCE(*err, -EINVAL);
+	return WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)) ? -EINVAL : 0;
 }
 
 static int __init pkvm_drop_host_privileges(void)
 {
-	int ret = 0;
-
 	/*
 	 * Flip the static key upfront as that may no longer be possible
 	 * once the host stage 2 is installed.
 	 */
 	static_branch_enable(&kvm_protected_mode_initialized);
-	on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
-	return ret;
+	return stop_machine(__pkvm_drop_host_privileges, NULL, cpu_online_mask);
 }
 
 static void __init pkvm_selftests(void)
-- 
2.47.3

