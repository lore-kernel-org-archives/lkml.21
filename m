Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034071;
	b=Y3wjYdeVHOFMgcnJx8BrgS6N/EMyOqzMfaYz3/dkegfn6TIH3oorAL4wctDcFqwdQF/R
	 nuJOcG+sfTJ6VBYpHVxcYirtYUdkoI14DYravm8iusaHnf+mE5Ec3AkqADjZLlVKhI8me
	 LwLBm9pJka66XbeptJaHpHtE7SEZj18gmFxp7QkPZKbJ9ffb1tLRqnkxI5NwaNmmImZ9q
	 +VwoObqyGlY1GXapvDczsNXGToJM2D/PzeLgJ6dm3R0pNpkunIMkb8ZEMU0uYG2sc/xJZ
	 1+MI4vLx9qmuXnCmOt/HzbMiQ7CXj10Vg6SPKYR0PIkUm7EwrB4g5G6EwnygDU6gbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MOEGNvs3TdXS85toHwVdS+2TMPJCRWxIz1zBU+aPxY4=;
	b=MoIGmLQ6taMsbanI8vyWe16sOI89dNciAEHTZNV+iYvpnAOc/hfrW89Y5IBRBMDAbjSH
	 ApBXtl7sy+lgO6tSJPg6fuV6H1Pu+2ceV9BvavEK9HXBEdt8jnW2ct/Z4kGesFuzdQ97L
	 Wats+WCed2YePvhUmwgRG+dpNIkJDt0VmV722tFXf0p9uLfVhJ7jA/kDEKDrDl7UOTcKx
	 iObqxf2LnqERaaVBRZP7jjweVvV5n4vdcs+tYCwPlZrV907A37MGeQoi5Zr2DCV/KIIyu
	 a+Tb3UbhwcpsSjoidgIQ8k2+9HNRRSyyjy0s/zmRwv11Ausc67GbW7x1HB1HuSS/ePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxtS4yy6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B684C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IxtS4yy6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15688685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034069; x=1795638869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOEGNvs3TdXS85toHwVdS+2TMPJCRWxIz1zBU+aPxY4=;
        b=IxtS4yy6+aoAIygRLCgNJLbDon8fDixhbWFrRIhIjkMTqArs9AXk0VflyGhyCy5vSU
         uKtb/FNDsj5BLxziTAOjEO8VOB+i4TAhwWtp+yHNj1yqOMtY7qdqgf4P7JRp4V0v9uMH
         49Kx/j1HKrpc0guzi4VufWrwTwITxFHgewWn6LOBm0zRLiL4spzJ+LiGIjjAl4xdXCgw
         9vFj3VES/siuS4eTIYp+zajDNKL0mUzFFgTTahfgXHDyeA7XE0VjYOovgXg+7lvMw/Bo
         HmYJksbQRlEr8oWPj1PkT3ddzLD4NlWGvLLJ6tZBoayz8OZBhXK7KOL+tREc+shOazk6
         hkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034069; x=1795638869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOEGNvs3TdXS85toHwVdS+2TMPJCRWxIz1zBU+aPxY4=;
        b=ZXQnS4fNQFZ4fcktW7t5SPJxf8rZe8ker54QhegTy++5SmfusOBBIGsr+AMbc+JuQi
         pYrnHu2z1k3zQjECi3HgA2hgB8ZpSvHEe0k991E/rLOqyA2UU9+u0+roVAPRfCTBM97/
         EgmVDj6ZJluSY4/cz20sUmg7/cGtEeRrRRSm5IgVhPyWhoZySS3pzsKDV6gtANFhpnFJ
         lDYIt45WETOczCFKq5N6C2hUapB5MHD2u33bWlcO7PGieleuwLXDeXhOJgMwnsUcuNDg
         PYKw/pLoCO039chrkwaxSqdGkVovO6Yhy4oDeLedIr6mFV7Tlk6UO21OFrolJNSC73Xc
         nqeg==
X-Forwarded-Encrypted: i=1; AL+hErG0IhBLhDpKq7FJOvnSRLpFICgNVJXO1jK4fhqoZ9dc0jAazSZZ87f01z4sHLTeDwmQ6vHRf93YCwX2jyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1P6Rx/LO6ByUu6kQyPlQQnTr0pI5xPc5GWL7iQNa8mYRDZ9+f
	fpN/47X4ktFEhV/nRn9TBE009x0bYJSeY4JFc9Sxtrp3JX45rfy2eWfz
X-Gm-Gg: AYBFou1VhqCbNDn/rh6AE4ztcxDcQRxhsYnkXJXt1r5wL03Q+9Uy+Eom+2zNNVOe3Zs
	bzEL06sJUVO7hSOJIEkxVVdiFkMfuZ8MbtSRlQz+D5hiMdFhyRQfQGSNwZxqufIZq73OIxtupd3
	/SXyiJXXvwgepYoQoXTSr2OvD9YLzxd6kPiPDDVr3drIfMTbKRo+Ax6zs4LgCsFK3Vp5nApyhre
	/iAXYYSnlZNXogrdMdSXVApiuvIIJQzfe1tjSrx/gqM8foaTZi/PWhjXglsx+Wh+gCqQ4BT4k6M
	gOL+NfFYuPVjaX8Lm4ugQ3xL4l8kIG+265IA9dL0Kw0fH22xCMHltMDv+wZJgJWsoOFcVFWg/+m
	kLnTM9dPY5fesaiME7NDAGXI+db9q7xonD6gxj607NE9NBFNM5rE32cFTNPK/lCqBCXEIDDcTDX
	0pwTtuIyH4fpUnbN6POoKjesqxis+ButXTwb6BUyeTuXPxMm0CHCWOT0DV6g/7MH9ZV7Vqztjzq
	8/qwofdT/lpr2pMs+ezUGESXcyG06GxUc7GXL8Wla/HrvuKEUBNrReJJESUv6amvnZw7k3XbJG3
	Z0TxNCC+qiLNDdytJN59k/axoFajhbo5Ct3pcnmHy1B/YqBapOBGvHdlQyyx6gj/Tz4gzCwGwnr
	YEDYWQrlhz01zR70h
X-Received: by 2002:a05:600c:34cb:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb7da4c5d3mr80504445e9.34.1795034068992;
        Wed, 18 Nov 2026 12:34:28 -0800 (PST)
Received: from aura.rhinoceros-company.ts.net ([185.238.221.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8326a9c7sm14810965e9.13.2026.11.18.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:34:28 -0800 (PST)
From: Mark Street <streetster@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	Mark Street <streetster@gmail.com>
Subject: [PATCH] KVM: x86/mmu: Defer TDP MMU RCU callback barrier
Date: Wed, 18 Nov 2026 20:34:08 +0000
Message-ID: <20261118203408.98649-1-streetster@gmail.com>
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

TDP MMU pages are freed from RCU callbacks, which return their headers to MMU slab caches. Waiting for an rcu_barrier() during every VM teardown makes each VM wait for all pending RCU callbacks, including callbacks queued by unrelated VMs.

Move the barrier to kvm_mmu_vendor_module_exit(), immediately before the MMU caches are destroyed. Set the owner of KVM stats and per-VM debugfs files to the vendor module so open files pin the module and prevent its exit while those files are active.

This keeps the caches alive until queued callbacks finish while removing the callback drain from individual VM teardown.

Signed-off-by: Mark Street <streetster@gmail.com>
---
 arch/x86/kvm/debugfs.c     |  7 ++++++-
 arch/x86/kvm/mmu/mmu.c     |  2 ++
 arch/x86/kvm/mmu/tdp_mmu.c |  7 -------
 include/linux/kvm_host.h   |  1 +
 virt/kvm/kvm_main.c        | 16 ++++++++++++----
 5 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
index 9dde80022fb..c3de3030782 100644
--- a/arch/x86/kvm/debugfs.c
+++ b/arch/x86/kvm/debugfs.c
@@ -181,7 +181,7 @@ static int kvm_mmu_rmaps_stat_release(struct inode *inode, struct file *file)
 	return single_release(inode, file);
 }
 
-static const struct file_operations mmu_rmaps_stat_fops = {
+static struct file_operations mmu_rmaps_stat_fops = {
 	.owner		= THIS_MODULE,
 	.open		= kvm_mmu_rmaps_stat_open,
 	.read		= seq_read,
@@ -189,6 +189,11 @@ static const struct file_operations mmu_rmaps_stat_fops = {
 	.release	= kvm_mmu_rmaps_stat_release,
 };
 
+void kvm_arch_init_debugfs(struct module *module)
+{
+	mmu_rmaps_stat_fops.owner = module;
+}
+
 void kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 	debugfs_create_file("mmu_rmaps_stat", 0644, kvm->debugfs_dentry, kvm,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f89e9f8a6cc..b53fd9e3968 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7936,6 +7936,8 @@ void kvm_mmu_destroy(struct kvm_vcpu *vcpu)
 
 void kvm_mmu_vendor_module_exit(void)
 {
+	/* Drain TDP callbacks before destroying the cache they free pages into. */
+	rcu_barrier();
 	mmu_destroy_caches();
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 44dad106fad..7bfb84a1a2f 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -44,13 +44,6 @@ void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
 	KVM_MMU_WARN_ON(atomic64_read(&kvm->arch.tdp_mmu_pages));
 #endif
 	WARN_ON(!list_empty(&kvm->arch.tdp_mmu_roots));
-
-	/*
-	 * Ensure that all the outstanding RCU callbacks to free shadow pages
-	 * can run before the VM is torn down.  Putting the last reference to
-	 * zapped roots will create new callbacks.
-	 */
-	rcu_barrier();
 }
 
 static void __tdp_mmu_free_sp(struct kvm_mmu_page *sp)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910..1476f590de7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1700,6 +1700,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu);
 void kvm_arch_pre_destroy_vm(struct kvm *kvm);
 void kvm_arch_create_vm_debugfs(struct kvm *kvm);
+void kvm_arch_init_debugfs(struct module *module);
 
 #ifndef __KVM_HAVE_ARCH_VM_ALLOC
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f14..b5affbb8625 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -126,7 +126,7 @@ static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
 
 static struct dentry *kvm_debugfs_dir;
 
-static const struct file_operations stat_fops_per_vm;
+static struct file_operations stat_fops_per_vm;
 
 static long kvm_vcpu_ioctl(struct file *file, unsigned int ioctl,
 			   unsigned long arg);
@@ -1103,6 +1103,10 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 {
 }
 
+void __weak kvm_arch_init_debugfs(struct module *module)
+{
+}
+
 /* Called only on cleanup and destruction paths when there are no users. */
 static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
 							     enum kvm_bus idx)
@@ -4395,7 +4399,7 @@ static int kvm_vcpu_stats_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static const struct file_operations kvm_vcpu_stats_fops = {
+static struct file_operations kvm_vcpu_stats_fops = {
 	.owner = THIS_MODULE,
 	.read = kvm_vcpu_stats_read,
 	.release = kvm_vcpu_stats_release,
@@ -5218,7 +5222,7 @@ static int kvm_vm_stats_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static const struct file_operations kvm_vm_stats_fops = {
+static struct file_operations kvm_vm_stats_fops = {
 	.owner = THIS_MODULE,
 	.read = kvm_vm_stats_read,
 	.release = kvm_vm_stats_release,
@@ -6322,7 +6326,7 @@ static int kvm_stat_data_open(struct inode *inode, struct file *file)
 				kvm_stat_data_clear, "%llu\n");
 }
 
-static const struct file_operations stat_fops_per_vm = {
+static struct file_operations stat_fops_per_vm = {
 	.owner = THIS_MODULE,
 	.open = kvm_stat_data_open,
 	.release = kvm_debugfs_release,
@@ -6633,6 +6637,10 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	kvm_vm_fops.owner = module;
 	kvm_vcpu_fops.owner = module;
 	kvm_device_fops.owner = module;
+	kvm_arch_init_debugfs(module);
+	kvm_vm_stats_fops.owner = module;
+	kvm_vcpu_stats_fops.owner = module;
+	stat_fops_per_vm.owner = module;
 
 	kvm_preempt_ops.sched_in = kvm_sched_in;
 	kvm_preempt_ops.sched_out = kvm_sched_out;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

