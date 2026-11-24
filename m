Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494989;
	b=wufCEMdDvd7z1p8bkcpLClXOTd477T456XwcaJUQwvM4p07s6Pzb/WPSo2kDbaao6E0m
	 +aq9ntc5VEanw1twCn4dRVJAX1WYHUOae8eFN0zyOxUHlKOtO1XWMiEMnpo0iNCjNXDtN
	 9jF/PJymxgYOQaVyk4+s1WQCM7Y8ycFo5pJ96UE+g7D8117ysW/mvcj4s4tJAOEYy95JY
	 LGDEapduRR4VSLat1UVs4Za/gl9uZ80rdXYtsWTPWcG12cM6SN4e3NDM7uXLjgooZOBiQ
	 g26VvNy0IYfvImY6TUbRdIIGfaBzjivSno/b8PFIy4XHelCJzrLVCD1wfkk9tB8MCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494989;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Jr2PylojzwrT5dYqT245g/FbbD9XqR0v6wBWXpTeV08=;
	b=w7Lf711WkdrxqgZUcLHR5Rl/iZ2cJPxb6uHAK2XE/iR/CN5UwDhRdubbBMjg4a/bILcd
	 bzRxpJOgTvELytpJrL0sw71jcjVdrYs5Oc5Kpv2hXzQHTppmaXVbDA/X8K/2fiah7tiz9
	 agYC6XGbyDuZUfNb52MlzvUJX4aDDanLjUnJiEXBk3dUSYXN6x5lRRRQWHQYC+GpNSQhp
	 ndfvI0IdrNZMt0PNnJFNOMedgP6ByKC6FBgGGOKPHvskTcvkQGktIjZFTcjMt2lMdvTep
	 10ZDIpL1nkKWBdenvO08buLAhbE60kQ9OTYoYPrVf5l8aXWLA0kvLkgK70bStg8oRZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nKY3mTKA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=56JnJMMj;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BB606A31E;
	Tue, 24 Nov 2026 04:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nKY3mTKA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=56JnJMMj
Date: Tue, 24 Nov 2026 04:36:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795494987;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jr2PylojzwrT5dYqT245g/FbbD9XqR0v6wBWXpTeV08=;
	b=nKY3mTKAklE7JXlCDnmicaNifn94bmSNf62W75HV74ZZuLZh4MiOWesxaNXVSdQup6B+Z7
	Z6CpdgEqr6V2K27TKfC+cUKmWqgTDmoxjHU+xtwXAKtbCQEzzTlN9JfTrIKJC+OErQe4Z5
	t43tV1hzlfhBJjsCX1WRlYBbzrkUn4hrjxKkOqFTAFt44MfRt8V/WxqQ/HDHuGcFFlxqmX
	YCq1T7O+fk6adCLFYjV7/6TQ/yNf3SyXxxpMUSHXTSXGgkzGnYs40iVCz9nW9C/a0dd+Uj
	du+xnlHF5G8IXkgCYVgtbTkAaUW7QXspARuYujbU1iuWpW7eyx+KXvQpEgMeWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795494987;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jr2PylojzwrT5dYqT245g/FbbD9XqR0v6wBWXpTeV08=;
	b=56JnJMMjyPKAuLAl0m6F/Kv+h6EECWsGfaXxcj1Onimq+Nc1XwciIop/kw1V2oYqhb/taM
	DtbiPZBNIJMAHDBA==
From: "tip-bot2 for Shance Luo" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/CPU: Fix FPDSS on Hygon
Cc: Shance Luo <luoshance@hygon.cn>, "Borislav Petkov (AMD)" <bp@alien8.de>,
  <stable@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119075330.961-1-luoshance@hygon.cn>
References: <20261119075330.961-1-luoshance@hygon.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179549498501.92412.5064902066325113758.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     4c2abd86d10720ce4a2330c2ca01cca39bd727ab
Gitweb:        https://git.kernel.org/tip/4c2abd86d10720ce4a2330c2ca01cca39bd=
727ab
Author:        Shance Luo <luoshance@hygon.cn>
AuthorDate:    Thu, 19 Nov 2026 15:53:30 +08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 23 Nov 2026 20:18:05 -08:00

x86/CPU: Fix FPDSS on Hygon

Hygon family 0x18 CPUs are affected by the same floating-point divider issue
as AMD Zen1: the divider can leave partial results of previous operations
behind, which another attacker thread can sample.

Enable the mitigation.

Signed-off-by: Shance Luo <luoshance@hygon.cn>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/20261119075330.961-1-luoshance@hygon.cn
---
 arch/x86/kernel/cpu/hygon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index ec51c2b..0bccb93 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -228,6 +228,9 @@ static void init_hygon(struct cpuinfo_x86 *c)
=20
 	/* Hygon CPUs don't need fencing after x2APIC/TSC_DEADLINE MSR writes. */
 	clear_cpu_cap(c, X86_FEATURE_APIC_MSRS_FENCE);
+
+	pr_notice_once("Hygon FPDSS bug detected, enabling mitigation.\n");
+	msr_set_bit(MSR_AMD64_FP_CFG, MSR_AMD64_FP_CFG_ZEN1_DENORM_FIX_BIT);
 }
=20
 static void cpu_detect_tlb_hygon(struct cpuinfo_x86 *c)
