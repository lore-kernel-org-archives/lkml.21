Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587374;
	b=s/32xZjd+tCefXSJAPn/UNO0PVnEJGrtElrJUeDjdqqsjoLF5Mq9sTqCOP4k7VV0tPC1
	 gqtW7IumLbr7uFb+wQlxeabl1jvTn/K4aVAwdlnx8970fQbsa3m2xMjJkuIIF1eSMrsHh
	 k+sB9wo6SPZDz+kL2GWNgXnB1PLrBmf9VhXrDpE6N6QM76NfdkAVAGQbssa4KiGfudqdd
	 43fVN4ufI2fdF3lgfn9LkXkXAhrTqHizhlAyt0p9PtXzLo5AXQZFpv+xYhLA4zo5lkoF/
	 2ZoUAuB7nb/5VyKUgQVpxM8+cyxC48p1o+oJklZhaMGhmsTAFL0QZcCxM4rID6nbW4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
	b=gG8y1OiGYx7Vw/T5M5Uf7mcGtJ91vukm34VWDt71D7c697dmqcFa2gpIdtFPha6+DS6I
	 bTudEH9yRI3PvaP3RWWD10YUFNAHQyJP5c0kVKc9lAEeE25uajcEK1QMWV1pZJXlyxQ8n
	 5NFAn0VwOOmuEKR10jbUMmh9j7wUQLP73LXQVN9HiPqPZzJDffLkNqx+hT/HHt2yfi1VW
	 VFB1aRHuo18w1g7n0hROHmwIsFkCWsBcPptG+dVUmZqUi+0b9apyq+VWLLb2nBvwCH2Cw
	 KD8onl/3KD3OdAapC2CYX28+P7lBvnHOpdu7Woj5tbDcf7Fa5G1E2BQygBtq9LaNLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdYEq6j;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259260A2614
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2259260A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLdYEq6j
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso6021406eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587373; x=1796192173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=iLdYEq6jPFG1k6lRURVTYgkpU0tn2xfKdgxbC9QNFC6g3K7bQcnhf9FCdYqi9Xo5uo
         SBN5Gv4/P2cgIp08qAw8QZoMsboROqKfZkGHPwrTxb0h0vSuGg6jqfV7Pdsi5ps2gvAH
         OdOhZYiJQTNxO6ZwFaUem9SrQ3LA7rcXlYT8RxQANhUprqB2xFBi/FVwPlL4f59N8akj
         B398DOc9rQ7NbwrKpH2N76vv0eAPJUQve1bVdW9SfzaT6L7W8lPsXM/WaRPCqvSfTtUy
         Gbw8nVhHeASvK7e1vBllLSDnJplJRmM16lY1l5+ob+71ZDXfeVq7x0A0bpDEjTwFslrT
         ATvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587373; x=1796192173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=uhbzTMG3tnk8urvxdPNDkX/idxZ+2+7CwK/eiIPn01tpCW5MzyjwX9geoumADou8dy
         ZwAIHeJqP9e9ZIPu77SSyMQEjEnnW/NXnPGK/AjLwIgmkQoyoCNgXMa//06FlLFY4Rmv
         T0akTEFem3vYihQ11sYeyzXT+w4L6LEHpbNOrxbDdynpC/HRLwwBd1zFuC8fBRjMl0cb
         gHviDwPCWXXSd3hqH9NAK7ZttNAz1rQBC4V0wYMAqqBEv9o6PpTvdCgF1H/kOMSaUPHW
         TT0TbJ7INcA0achChyMinZGHP0+lY5aegiT8ryKcecAK8yRnfqJx3QHC7yUzllvX0e+R
         i4pQ==
X-Gm-Message-State: APuU4Z8sKPBZzDi8I+LpYDyCsYvNG5bf0Pls/+BY/wWyc3Mp7AEkGhyv
	hvkXneyZGnBonJP+dFKqC45fJzmUm2oVon9C9zu6W1zRGXHQR9WAi3FY2/aj5jjWp0SvPzYef2y
	ICaPzHoHpjUa4YdZCZdcIcakvocBsu/CSWHPnuE6F9EgBm0u8dKXMU6gmhAP1oBug1AkMlCRO3w
	NVXRU+4ed7vuN+znzHxk4Rk9Zk2PtLVOgTZxKRPShIX0Wyw04MWw==
X-Received: from dybou2.prod.google.com ([2002:a05:7300:e5c2:b0:384:c70c:3c65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d809:20b0:386:b070:6f1c
 with SMTP id 5a478bee46e88-386b0707151mr8742111eec.21.1795587372849; Tue, 24
 Nov 2026 22:16:12 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:01 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-9-irogers@google.com>
Subject: [RFC PATCH v2 08/30] vmlinux.lds.h: Allow architectures to emit
 custom RO_DATA sections
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an optional ARCH_RODATA_SECTIONS hook inside RO_DATA() so
architectures using runtime .eh_frame / .eh_frame_hdr kernel unwinding
can place unwind tables inside write-protected RO_DATA without leaving
them in unmapped rodata/data gap pages.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/vmlinux.lds.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3eb732942d69..1bde7a2a19d0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -472,6 +472,10 @@
 #endif
 #endif
 
+#ifndef ARCH_RODATA_SECTIONS
+#define ARCH_RODATA_SECTIONS
+#endif
+
 /*
  * Read only Data
  */
@@ -554,6 +558,7 @@
 	RO_EXCEPTION_TABLE						\
 	NOTES								\
 	BTF								\
+	ARCH_RODATA_SECTIONS						\
 									\
 	. = ALIGN((align));						\
 	__end_rodata = .;
-- 
2.56.1.831.g720f3f5937-goog

