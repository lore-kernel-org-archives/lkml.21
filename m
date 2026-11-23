Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394053;
	b=g7CuLfJ62q6br8TSyHaTAR8Zn+fRDh7I/FnRblVkgXxe9xkN/4qLKyQpTBxsDNxdUlta
	 FczX17KEG8kuB13DhP6RY4u2oerLNHP0BTK/M+1kUZTzzzyg9FVFy703w+qGlHP92XXid
	 H6qvMDCCNNJQdwqaLF9Ut8T4Kyb3R4apuUiX6C/5KnKwkwVvI7G24MgCYw53fvdTnyZB2
	 FqEFfaOthu8MlvUOUKzXds1mRL0DuY3S+hy8MdFbDmn1OfrxnSse+rzDp0uSa5m/drCrT
	 ugVXIwvs9tQEuNVdKbBt7SHzfODaE+RvuDL7flB0TA7CH+rMYf5rJSPN9dACmt2GVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
	b=WTw65zCSvbDr+xl0UJU/onT6WwIr0nQAe2f/RGw6JfzZXTUZhqYJP5GMYsYhZZDTcuA5
	 QQCsxyBS0IYJBJQDUlQel5gveZ06sEEn5ZmQVl/Mrk9Ibqvxoj6Esj2Y8i5/rRSMF9Jyw
	 ID0eOCKfTCwWwungNUMR1gNZTiAl+IPbqlWw9C9D8IqLAEL8wMdDitJQCbOqqflgc3aSd
	 yI5dC9TvtrG3rN1/sFvFKMuwd2qYCajBC7tZnWXJXMNsxSbT8uqdFV/X7EpepveypzDPV
	 Sm4GiTa1tGivXZYWE+mLVDulbRWgNsa2GN4dTYhcnj+4n5P441s2G3Ov9lrx2xbz4nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMotbwmo;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA86F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMotbwmo
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so22082805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394051; x=1795998851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
        b=iMotbwmoucrMKCJdQ6/o309j1Jw40JxSU6aZshmDWO+iadVDisK6gU0bHp51Gmo4V8
         3fIC+ghxhZr4ydlcMGJmo2YvCUd+dA8b0a/qUh7RE4RDaaYnQryjPWxQAb1g7eIwZrCL
         g5FBbU3y+cwL7xNaBi2TYbs7gZ75bPGjhudjl1xkRVCbI5LEB4LkNP0Dnmgbc0Om3CeY
         3i8OvVNsd/LM184DAHMBGnigHUxucvHQ9mv8yZdNYmFV2n0fcEJUrJeqI7NesEpNS3Bw
         kpAI7wUcwRD/q42wlIKJqyPjQpQ1vlYVRXccU2fPGxfODMxzRaopYeA+BTnm/ZyuTGK/
         cYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394051; x=1795998851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2zkbDuNdyLgS9VK0BRjp9YHIzBcoYoYpmcLinVfQTY=;
        b=zAVQhTuO0vzKCZEKym9nKhonnXvldd4JZZmbppSeK9IMqTFYkG+voYJEeFqSoZCQKS
         mogEmoiY+S4jzZ2gF/qx6cbFoLpaor5FN1JuJGKnGkVPMPWmk+3JRFA3S0hR6Dn4x2U0
         2acdnFIJkZ6DjOsLpjhh2fYE8wqlpfohW0NWzyvPW1iscmxDBFDlt7c25qM2RdGlMa64
         ErCF46S13sbxz43iOqQVKJeqM0ebla7tROa2NKsKDCjQOLiaKxNGkfv0XvnIsOOtxC6Y
         I7DN7OSvR0plSPPL+RAbgRjXLnlGTIbbD9HDQyljOD0VXm2vLj80ny9FsP9h/c9tYYWW
         CsLg==
X-Forwarded-Encrypted: i=1; AL+hErF5C5u3XUx8HOhXzMODCARMNpDK2PfANOXzZilRIlyZ2xvP8CBJNMymgcUoj9zUdYNR7/ESdVAVYazPFkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QMAWtQdjyigAFNLuY9dtodh4wY8+0xYkeMmEE3S0uiKDukRz2
	n4Hz6newVob+5IDQ/InIcY7yb4Rrpxa/CaAcGSNul3/Gt9G34om/gK5I
X-Gm-Gg: AZFdTZePJiLWgFz/TGybzt2QerrmNImpQb7HGbrKYUoo145SMr5D4u6wResgvd4sS+i
	Duh5pxSwiBARP3heDk84BPYtjSs9H97DK9rvNv7K2nNsSh0tQD6TZid1BSgkkhuI6HH8UPQaQ5S
	7y9ooHBFLbrwpuZLKHnFdww159gjmvKwW9r/rxaaoexIIvxO8LYbY+VorP9w4Z2mktRMW7qlBPA
	LRSAHZ5ubTrVSw7Pqgc1tl1Q+zuFH5zL6C20te96odGK5z1K0XIds8MiDnrI+tSxd+0xqvC1Vai
	RUnzgdHDxdM7nr+dWIdz3jxkvvZp9HwjaY0R3Ma0SvlkFt7oM2uwjJ8rmE4Fe2zFrFbz74zUeTi
	NT541jFjslpCRBLENiAbttyaavX98gfg5AtoWDHI8RWuyG0z/fWvSSNSzSs24S6XHsorr/5MwaF
	OtbEcixlaxEecrgqVqVokN4934Q8mGjTrC/K3tiv6iFU/e1u1V/Ib6BoTyHYtNo4crVtb5s9QoC
	thGuI5Ks9RgujCi0+y2oACcpl+APx/MeOz6bWCgl7gcvQMSziA1su5nOV11nJ/Sl3YcSdAj+xPv
	244RLS6X28cIxppgZwjtI7c8PgEo91om1DwPXqVPTQSsljr0D+7fcUPw9f4hhGwGFMAKNp7KSZd
	ceJKBsTztfBPPFe6m5+8A0Bq+vZR09WsAgC4OLJy8hsmwaAeHbd8gJebNJbaBCVSqHGfrN2VJh6
	IG394k155i
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr227020335e9.19.1795394051194;
        Sun, 22 Nov 2026 16:34:11 -0800 (PST)
Received: from fre3dom.speedport.ip (p200300e37f1deb6597bc525ce8f19e94.dip0.t-ipconnect.de. [2003:e3:7f1d:eb65:97bc:525c:e8f1:9e94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm111751525e9.3.2026.11.22.16.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:34:10 -0800 (PST)
From: Javid Rzayev <javid.rzyv@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Javid Rzayev <javid.rzyv@gmail.com>
Subject: [PATCH] KVM: selftests: Use __vmread() for the optional HOST_IA32_PERF_GLOBAL_CTRL field
Date: Mon, 23 Nov 2026 01:33:50 +0100
Message-ID: <20261123003350.198278-1-javid.rzyv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The HOST_IA32_PERF_GLOBAL_CTRL VMCS field exists only if the CPU supports
the "load IA32_PERF_GLOBAL_CTRL" VM-exit control, which is not always the
case.  E.g. when running on an Intel VM in Google Cloud with nested
virtualization enabled and no vPMU, VMREAD of this field fails.

init_vmcs_guest_state() copies the field into GUEST_IA32_PERF_GLOBAL_CTRL.
The write already uses __vmwrite() because the field is optional, but the
read uses vmread(), which asserts on failure since commit 4e824a04d4fa
("KVM: selftests: Always assert that vmreadz() succeeds").  As a result,
nested VMX tests (e.g. state_test, smm_test, nested_close_kvm_test) fail
with:

  vmread[0x2c04] hit VM-Fail

Read the field with __vmread() and copy it only if the read succeeds.

Fixes: 4e824a04d4fa ("KVM: selftests: Always assert that vmreadz() succeeds")
Signed-off-by: Javid Rzayev <javid.rzyv@gmail.com>
---
Tested on a Google Cloud n2-standard-128 VM (Intel, nested
virtualization enabled, no vPMU) running next-20261120:

  before: 15 nested VMX tests fail with "vmread[0x2c04] hit VM-Fail"
  after:  all of them pass

mmu_stress_test hits the 120s kselftest timeout both before and after
the patch; that is unrelated (the test scales with the host size).

 tools/testing/selftests/kvm/lib/x86/vmx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 5a06746eb..4b3e439ee 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -348,6 +348,8 @@ static inline void init_vmcs_host_state(void)
  */
 static inline void init_vmcs_guest_state(void *rip, void *rsp)
 {
+	u64 val;
+
 	vmwrite(GUEST_ES_SELECTOR, vmread(HOST_ES_SELECTOR));
 	vmwrite(GUEST_CS_SELECTOR, vmread(HOST_CS_SELECTOR));
 	vmwrite(GUEST_SS_SELECTOR, vmread(HOST_SS_SELECTOR));
@@ -363,8 +365,8 @@ static inline void init_vmcs_guest_state(void *rip, void *rsp)
 	vmwrite(GUEST_IA32_DEBUGCTL, 0);
 	__vmwrite(GUEST_IA32_PAT, vmread(HOST_IA32_PAT));
 	__vmwrite(GUEST_IA32_EFER, vmread(HOST_IA32_EFER));
-	__vmwrite(GUEST_IA32_PERF_GLOBAL_CTRL,
-		  vmread(HOST_IA32_PERF_GLOBAL_CTRL));
+	if (!__vmread(HOST_IA32_PERF_GLOBAL_CTRL, &val))
+		__vmwrite(GUEST_IA32_PERF_GLOBAL_CTRL, val);
 
 	vmwrite(GUEST_ES_LIMIT, -1);
 	vmwrite(GUEST_CS_LIMIT, -1);
-- 
2.47.3

