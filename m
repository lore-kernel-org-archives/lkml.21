Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621168;
	b=brViwBRWzkyo7tK8RCIPCudF2ErM9LP5lZHd1u4iP5oezmcMuLA+j1O3V6LRCdqj+7F+
	 FsvXD3iafqI38a2PJ15BfeINJw0V6a3EmAjTWg1V9iamIUWog4iQL9WulgyjOHOzvh9h0
	 sgs1TgN6r6wVzku5rURoIJNYOABonlSDlpD81QukdFvogMkPH/0mAS3ZBd1HBuZswZkXi
	 yHIjZpNDdpmSv3AIxWLHk01i50Q9RTL2JAbXZdOyvdh1nmYedB7xmCB/SiTIUpCVXTtLF
	 tSyMHCvxT1LyHYec+qBEnJRvcl9to1GFhjuQ/5IqjWr4+F0S37lLL3ZxQmnNL65lhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621168;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k3lgUkbhF48x9uWXDW9CSm5otQP2vPMMqrsbaam6pJk=;
	b=z6sgPIV5Uxz2l3dyorkLmYMbNWrZNL15defmFzuaNPzdMcw8wxtCq1vjT99BGEBv2Dt3
	 qADURkPEc6UWRd4Qz2LG8dEW8ZzIkz6td9ZVMaoPWeHEWJ3xpjxB+R/5kL7MQAJd1cf/J
	 OxjG6akyEGt7EX7+cvqfeHbzL3rihFem96ohI5k2yeJtPrDNuDU/Pu34MEbRb1Rb0KtC/
	 nCPW0rvJ+/BzFWsKkcrNfMDKUlou4xkJ1+efIqDVmDtBr6KXEqva3MucG/D9FqwqoiSLl
	 jWHbCkKCtiZv340W4JCf7YOjdicGFExdYlRWKIwbUt2pCMj35jZzy1LBEMEmlR4pDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gy2It9DC;
	arc=none smtp.remote-ip=91.218.175.110
Received: from mta0.migadu.com (out-110.mta0.migadu.com [91.218.175.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8531606A697
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8531606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gy2It9DC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IZNUpS1OAqWftHWv01wPPqIUYNpQ1VNp0oAA/VL5VMQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621165; v=1; x=1796225965;
 b=Gy2It9DClKQWo8n+IIMff39GHjaO5XGBYXV/jpSFZRrGhm6Ngo4zulUq1stBLWzaW6o4ert9
 iGYWyhUx79ej+IGopgjxsd590VtpXZ5puU83lQog5v/O9cW7wuTptN5QWDrsUQh4k7lp84lXWrK
 VWPK4OghDtIgd9ssUD5kefJU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7efd5e36bdff3cdc;
	Wed, 25 Nov 2026 15:39:25 +0000
X-Mizu-Trace-ID: 7efd5e36bdff3cdc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/20] KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
Date: Wed, 25 Nov 2026 15:38:55 +0000
Message-ID: <20261125153911.106793-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
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

With pKVM, EL2 saves FP and SVE state through the hyp vCPU, whose kvm
is the hyp VM's and whose sve_state is already a hyp address.
kern_hyp_va() returns both unchanged.

Remove the calls in fpsimd_sve_sync() and __hyp_sve_save_guest(), and
the one in kvm_hyp_save_fpsimd_host(), which only pKVM reaches. The
ones in __hyp_sve_restore_guest() and kvm_hyp_handle_fpsimd() stay, as
nVHE without pKVM reaches them with the host's pointers.

No functional change intended.

Tested-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e0c55644224cb..ee85a8bc4d798 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -594,7 +594,7 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 		fpsimd_save_state(&hctxt->fp_regs);
 	}
 
-	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
+	if (kvm_has_fpmr(vcpu->kvm))
 		ctxt_sys_reg(hctxt, FPMR) = read_sysreg_s(SYS_FPMR);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9958ca6d7b0a2..57c3f7a2d4b14 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -482,7 +482,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 * on the VL, so use a consistent (i.e., the maximum) guest VL.
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
-	sve_save_state(kern_hyp_va(vcpu->arch.sve_state), true);
+	sve_save_state(vcpu->arch.sve_state, true);
 	fpsimd_save_common(&vcpu->arch.ctxt.fp_regs);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 }
@@ -531,7 +531,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	else
 		fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
 
-	has_fpmr = kvm_has_fpmr(kern_hyp_va(vcpu->kvm));
+	has_fpmr = kvm_has_fpmr(vcpu->kvm);
 	if (has_fpmr)
 		__vcpu_assign_sys_reg(vcpu, FPMR, read_sysreg_s(SYS_FPMR));
 
-- 
2.47.3

