Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984028;
	b=Jbw4cbUEXjPR5yt1Rm9X2HaYI2rv3ryAFL3fN4zIdKd6ilSDzvVQ0UW0PJ8BADUHiq/j
	 8Ty94UrR/Nqp2S6hTfSJ2vrRgmGcsPVnPRPUUzCdSlbcWmdOfOhn8r8gi0S6VRx83bwpN
	 N1Nk/50uuM33MW6FjdyP2xqRfUlbpdcK/ogpnnzCRPnt8xvvmX69Rvc7ZuSi6NfUQX5ym
	 6QJ6l478ivYng/X3uT60SDpjf+iZjP5+vbemGbuhL+QF+xVws/RyEUsMm8cSSKVQu59Bl
	 jsoit9ATtxN00WKdWQ0sJIJMbmptYgtc998qwRo/kES9D2aSnHEtdQYKozHp+h6aaTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984028;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
	b=S4e1tZ4bLQQxQ0oEoiLDXqcYleBnSh3ZLmNiecmB92cPH4vg86VMGJfiY/ra8BnQgnvE
	 Q9YQxfErFJm3qj8bLtAddjIuSDcxDwdOaBNnGiqeZvmJccycF0dsJOQTsODAyTIgIuQPd
	 ZYrlpByO1eKhEBAvRiyqZxqEb6RfvQBh6fwPcaASbrx9XPSLp1fi93rZqdOWvO11pJnAM
	 4ogBO3GtDPblkD5X3jHoS+Rt7BTfXW2ncoUt+XBL6Z1IpPnxfhRvFjpMKZBsdcTrWdbk5
	 nUNNP4GvwSDasvohW905wyHmaKMIsJRbKyO3KvAPhET9THs2wE8aL4qSlzgWOBuLtDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KtxbOEnw;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F27606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F27606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KtxbOEnw
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1049011a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984027; x=1795588827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
        b=avfdn7Sdikl+1EG8Tlk89qXSI4Elv9gXPdOg0+4KzvJI6qc26D4H7NQbn8Y+GBzV9C
         8qM236Vl70IkitApa6/ToeZI/tbPQDUEmvyRyzZmyvDvwR1fY+fLrOJGSDSNTmUPrJVP
         bCepZN0W3n56DquX5MGe9r3CCpzt7x7WX2rMfjSMHHjBMGp6bFn/eEkWEEQItTUPA8AU
         JJqchKzksC9r+QMTNjnP8mWoJxyYRZIRYMBl24mVTUPuDiF6JTc12QLSeNguPJBlPKOs
         V/wphTbgSRMRUjCCwhPRbND/fRMpvReN1jTeWi0Z/DUON81/EFROS3yPqPznZxRmn4kB
         ZO/g==
X-Forwarded-Encrypted: i=1; AL+hErG9TvcTa17eqTtR+KJaPH047ZcaeEJuyrG7NofOH21d41EDa4KnLjLhqolQ/vS3ZAkSanBo3eBrjf8rXgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qglEzDkAleRH2kc2glTFhuDcYJYQ4CAfETcLGuaoau8MPUnuF
	pzdGxD2YCSEDRULsUKpIDwaXerVckKcL631pGDVjCFy/KHagXjcWim/9GchjHkpJFXT+CrBYVwC
	Ha0N8fh5js0hFxJ1dhZwG3DkxMiWIHf3qc0rQUE0PWlGPtubk/v1lbjMPN2RtV5lOTomXuLq9mV
	tRvMqSn4gjOV1eTtxCASRetx8ALaMRpuLZBO0c+zkIOMmJpcm5HJt8qs0gRLZEor/x+7u0cOU6C
	3UhElDHyYd4mvUf
X-Gm-Gg: AZFdTZd+k8GyTxJL66jhJ4yZlcfCxxDWm4UaZs6OwqjH9g7swc8I0S1ilebNpD+yb6i
	42YRUNaf61MkEe/B7nqkRyJk3DbGnQ/229ZRYxluDrgL+TJyzxTphJCLbqGolZt5pSS1hwfnk3g
	EZe8OGmer+jggU4aORnKt2rejliTbugLu1PVLO2QfX7x0EBzOwa7nuLVB2liVThg8PZa6myUDtO
	lqjSxyw4OBzi69omxH9irGd3TjnY8Z1IqXxG34M+WI3PREFcdJCsR0kaiY0O5Td1HELabi2fI1/
	WaXjBH4vPwdazNdElPe/HVym9dmQ3hGXJT7nwchiykBFmvQdnL6hGVl7pU055wTUF7eOK7SgsAq
	ErDBbWCqG5raf+FZjPCB3AX31kD4sMofHqkv5acEX0o+oIOdoYeZp/czSE3VtMTWGlZHr9vR3Yn
	RxO81xP1ypj5uf4TjPWSDAl5MK4tLQqRLaqGk=
X-Received: by 2002:a17:90b:17d1:b0:3b0:9310:b255 with SMTP id 98e67ed59e1d1-3b3d0857e7dmr1174777a91.36.1794984027088;
        Tue, 17 Nov 2026 22:40:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d14463c6sm1181398a91.6.2026.11.17.22.40.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:40:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d53d0bd3dso8572511cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794984026; x=1795588826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGXSzPoaoRZhYGRZwzYW9Xi8SgZA3sFH/3kCEUuvBxU=;
        b=KtxbOEnw7xAcgyuJtGONIAv3m+QeKJSp1Cif7M5jHJ1mDvMAYA6E5LD6xT3HXdzHCG
         7tFCSTyQkp1VUeQlgzk2Ad5y3QE6uk8FywdYFF8+sOc6bAp4S8BloB6LOuzhXmG3Hy8e
         GEIDZjdbg8zFbcIj84RMwj8iaTB2SX1eXzL+k=
X-Forwarded-Encrypted: i=1; AL+hErFnslffBj+UmWgZwzw+RYSX63Jd050lbZnvpWx+q68xwekk3xHS2qPzYewWgUrLVJ3ec+Gqek+XSOnMDIE=@vger.kernel.org
X-Received: by 2002:a05:622a:4185:b0:545:de78:a6ef with SMTP id d75a77b69052e-55d5a747c5amr22156221cf.38.1794984025912;
        Tue, 17 Nov 2026 22:40:25 -0800 (PST)
X-Received: by 2002:a05:622a:4185:b0:545:de78:a6ef with SMTP id d75a77b69052e-55d5a747c5amr22155911cf.38.1794984025512;
        Tue, 17 Nov 2026 22:40:25 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d61cf3b56sm2078141cf.13.2026.11.17.22.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:40:24 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 3/3] x86/cpufeatures: Remove unused VMware hypercall feature bits
Date: Wed, 18 Nov 2026 01:40:13 -0500
Message-ID: <bcc9b471c176d5b162e6935b2c0c7f96c65ac8a6.1794206170.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794206170.git.zack.rusin@broadcom.com>
References: <cover.1794206170.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The static-call conversion removed the alternative instruction templates
that used X86_FEATURE_VMCALL and X86_FEATURE_VMW_VMMCALL. Their remaining
users only force the bits during VMware setup; no code tests either bit.

Remove the forced capabilities and mark both positions free in the kernel
header. Neither feature has a cpuinfo name, so this changes no
userspace-visible flag.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/cpufeatures.h | 4 ++--
 arch/x86/kernel/cpu/vmware.c       | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..b7633930020f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -233,8 +233,8 @@
 #define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
 #define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
-#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
-#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
+// free: was #define X86_FEATURE_VMCALL ( 8*32+18) /* Hypervisor supports VMCALL */
+// free: was #define X86_FEATURE_VMW_VMMCALL ( 8*32+19) /* VMware prefers VMMCALL */
 // free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c104681d0945..39f0bdbd1eab 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -505,10 +505,6 @@ static void __init vmware_set_capabilities(void)
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 	if (vmware_tsc_khz)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMCALL);
-	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
 }
 
 static void __init vmware_init_hypercall(void)
