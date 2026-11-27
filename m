Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772322;
	b=2OgUqJRAkeL+EGF8OLXtSLsUOJv+8LF35llAzx3XU7HeguSBA9h1SM1b1bkmLiamc9TW
	 ymamv7Ty7eIJohKAP1DmUFIAnzkBRXIk2IMzJZWXh9fNR+hTxdc9nseN5zU5Cw085XaaN
	 L00LmHGuYfT0gQtNE5lbv57a5rTAEZe/goyyE9CR9sVjaOQ7awnZSofG46c21dApRFgzo
	 EUeql4sbOuF+Wef9WSYM/xzGdIg8SqQEZ8aSbypzgfCzCRjc0PFRsUz0p8CeA4dfalWQu
	 aF2AGCFDoXLE6lUMB0jRzeK4tLYBufSxdgcT9YuqIoNb/poMof3CAe7ZiVvHSCXDfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772322;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=XfBQ+fUejpA+HrnQOeeAv8i0VEmtkwzfaeeqbbKYTzo=;
	b=fjfm/3P8uUwqODfWQgjVUqKGm68Fdfl+y1u4rtSgAsW3wMZvPvMUsMlFOtqXcleeFsgo
	 MdGcVlPnZ+Cf+SMEKPxeKOEbw5nAnE2eLPJ9+FF6/W7apyXqre641d0GkpiGexwcY2my9
	 UXAlI7IR8Jj/xT6C+xp8qy0U6hUJRGExjTd4b7XpWSP+B7mf3RK4X/fFg6pS9SE5YNLse
	 32urwchxvSV7XwiuFNoi66qdDNrE5lnxMvYg6+Rocq/FGldKgvLlpzz+o1AkmjskP46a6
	 gB7U7OH0Q7rfP6PEpdv+ov1ro8StJOStqC9aDcz+MiDVuHFnc1x7LKYQzqvVxf6JNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zvx5Vplq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=12zoR52C;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83CB606A31E;
	Fri, 27 Nov 2026 09:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zvx5Vplq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=12zoR52C
Date: Fri, 27 Nov 2026 09:38:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795772319;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfBQ+fUejpA+HrnQOeeAv8i0VEmtkwzfaeeqbbKYTzo=;
	b=zvx5Vplq8NuQzd1yrtvRDP8jlHXxJnnBEUMhEgVvcUwKucVVVEWIPStc8T459ZqvTA3N0q
	X9Ocg3wvXMHQezT6OwzEF4FS9MHtrN9b3lMUEAoVUouoc3jouhdk7eB5enTSBJtrrNfcCT
	CuYuoj4KiExvpmjTRyP7q1Vz1HELNzK7eZ9udLoM5Qy6q68kvK7/UP4i+F/hi3xnZbqxJp
	N3LqsH2moWf5bvXp9BdR9EdDtIi7Lrh2o0hW7OVjEv6hALPG+cuUkfXRrJAmdMWAtg89xT
	3cyxq2oFlPC/+v9epyDEx/qHQMwM7uxE7MCsf9H12MlO/bWgI99dq1CYF8302w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795772319;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfBQ+fUejpA+HrnQOeeAv8i0VEmtkwzfaeeqbbKYTzo=;
	b=12zoR52CKUOqIZ/DvhwbvB5gKdDHB7FzqNIQX86ec+gexe757Bwwx1EhKj0cf2eNvEoefv
	mJTuHT+YTSFMKzBw==
From: "tip-bot2 for Jiwoo Kim" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Don't allow extended register
 sampling for BTS events
Cc: Jiwoo Kim <arpe1618@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261114062249.1301-1-arpe1618@gmail.com>
References: <20261114062249.1301-1-arpe1618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179577231760.92412.7331214295515633546.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     d630454310b39d33be6757d7784418cf44ab0601
Gitweb:        https://git.kernel.org/tip/d630454310b39d33be6757d7784418cf44a=
b0601
Author:        Jiwoo Kim <arpe1618@gmail.com>
AuthorDate:    Sat, 14 Nov 2026 15:22:49 +09:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 27 Nov 2026 10:35:05 +01:00

perf/x86/intel: Don't allow extended register sampling for BTS events

x86_pmu_hw_config() accepts extended (XMM) register sampling in
REGS_USER for events without precise_ip, and the same goes for the SIMD
register fields. The BTS event is such an event, and
intel_pmu_bts_config() does not reject it.

For a sample taken in the PMI handler, x86_pmu_update_perf_regs() copies
the user registers into the per-CPU x86_user_regs, which is a struct
x86_perf_regs. That is what perf_reg_value() and perf_simd_reg_value()
expect: they use container_of() on the sampled struct pt_regs to reach
the fields that follow it.

intel_pmu_drain_bts_buffer() does not call x86_pmu_update_perf_regs().
It passes zeroed on-stack registers to perf_prepare_sample(), so the
generic perf_sample_regs_user() takes the user registers from
perf_get_regs_user(). That returns task_pt_regs(current), or on x86_64,
when the buffer is drained from the PMI handler, a copy in the per-CPU
nmi_user_regs, and neither is embedded in a struct x86_perf_regs. For a
BTS event that requests these registers in REGS_USER, perf_reg_value()
and perf_simd_reg_value() therefore read past the end of the struct
pt_regs they are given, and use the words found there as pointers.
REGS_INTR is not affected: BTS events must set exclude_kernel, and
perf_sample_regs_intr() then reports no registers, as the zeroed ones
are not user mode.

BTS samples are built from the BTS buffer when it is drained, not from
the registers of an interrupted context, so there is nothing meaningful
to report in these registers for them. Reject extended and SIMD
register sampling for BTS events in intel_pmu_bts_config(), as was the
case before these registers could be sampled for events without
precise_ip.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: edd9aec51213 ("perf/x86: Enable XMM register sampling for REGS_USER ca=
se")
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20261114062249.1301-1-arpe1618@gmail.com
---
 arch/x86/events/intel/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 0a34d67..88a60d3 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4778,6 +4778,16 @@ static int intel_pmu_bts_config(struct perf_event *eve=
nt)
 		if (attr->precise_ip)
 			return -EOPNOTSUPP;
=20
+		/*
+		 * BTS samples are built from the BTS buffer when it is drained,
+		 * not from the registers of an interrupted context, and
+		 * intel_pmu_drain_bts_buffer() does not provide the registers in
+		 * the struct x86_perf_regs layout that extended register sampling
+		 * relies on.
+		 */
+		if (event_has_extended_regs(event) || event_has_simd_regs(event))
+			return -EOPNOTSUPP;
+
 		/* disallow bts if conflicting events are present */
 		if (x86_add_exclusive(x86_lbr_exclusive_lbr))
 			return -EBUSY;
