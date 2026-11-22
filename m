Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387757;
	b=oI8RWZBw5byazF45yhxa4ZI3Sg8MhiIx3Ir4mxiKQoPC6M1ppQvnpPdSpO9/idq6LR2u
	 EHCnDVnMfwK9CFOT7YttYhcq3H/7fVo9XdSp/bXUfl7MgwKvy72V/jEw269fymGOD6aI3
	 J75cdVOXSFrGZfJdHlCFS+nUvZg0u0t9/zUiVLenomfDIZ8DMmALiOjC2ALo297UsJ9JF
	 lVhQ325XIWC220fLfk72PUHuU704DrwUBg5tuZGUOYRnJOGgI+Qs3QEx59ahHYuXpH8qX
	 eUFIsTXuemRwhgtPs0/8A6ieWJYj8eV8fcuQmfjh3vNZo0F0jBvTti2NA+96xJok1hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387757;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=xmKrGiUQhAij/2USY/ihN10ec8kyYW2ecY2KVwVgj3k=;
	b=LlPSmqe1NoFORtdg28NIxd326+RSknw1ZecqlfBD3Xqw5yIlUhq/Ps3MHKGJFeHKGIKB
	 NfGAyxR22CKL8vuICAZ8dlH/3e+YXuiYBU60krD+/hXJyzwErNLto3GuirLu6d5ZCeCZ/
	 b85AZZTmhW5VdL3RVOEEMer23nnNOdjzGqRxfiu+d2d60mCNiQjXgo1eZCcLc14bBiAsw
	 cwnalBNkc4c1vuw/Ou3E5YgCv5DxFRHNxs55dTSr7W6+L07BonJ07LzvXATIhY6IX9a+L
	 Tg0/BXO402Zx6cFg2i4FxjESrcUAJ+pRFcCylG/8Xyql2DxOrGmjbswHWjiOyj9pC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DClD+MXW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MaHVm6rS;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E654606A33C;
	Sun, 22 Nov 2026 22:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E654606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DClD+MXW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MaHVm6rS
Date: Sun, 22 Nov 2026 22:49:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795387748;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmKrGiUQhAij/2USY/ihN10ec8kyYW2ecY2KVwVgj3k=;
	b=DClD+MXWceRlS4nioCgad0ZzAu2PvQ1JDgq/2jdCoKc2iv3CtQBE3vlreoRJylnePRi42a
	lxgAnFKZffjGebi75otSLdHumc54TLcPgFPOYJsF/Mi3B5IEyqZv/M44+0LOOL4GUGonfx
	WMqTD8cLQsAWvOsnY66Gv8SE7Vlcj4GOIIjfRRZoCww6FlU4moSg9MmJXBhdVBflhDD/z9
	yyD9LNtTYAVVxl76DNe5mIXNHfSMYma+1An/DT5OVDRRojBSl6Z8EnirQcU++hiWyQs7D9
	hcfExw2A+l4f8kwQmu5+3fn9Wv0GR/+IGWuJ0iBP6V6bvNckv7DSaXk0t3Id0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795387748;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmKrGiUQhAij/2USY/ihN10ec8kyYW2ecY2KVwVgj3k=;
	b=MaHVm6rSBs2tON4Ntirmgtd9eggyy7cBuqoR/6fwftD+cEegsZYGxBOQU9TQhNhz+EXnQZ
	wJ44RA4LxKi440Dg==
From: "tip-bot2 for Bart Van Assche" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/urgent] bit_spinlock: Fix the __bitlock() macro definition
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Marco Elver <elver@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <38cdec9322fa710f84c018e0b318894c6234c411.1795043161.git.bvanassche@acm.org>
References:
 <38cdec9322fa710f84c018e0b318894c6234c411.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179538774700.92412.9964965073064559135.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     389327330cfe23adce88b55ee78c0d21fed9957e
Gitweb:        https://git.kernel.org/tip/389327330cfe23adce88b55ee78c0d21fed=
9957e
Author:        Bart Van Assche <bvanassche@acm.org>
AuthorDate:    Wed, 18 Nov 2026 15:09:57 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Sun, 22 Nov 2026 15:59:42 +01:00

bit_spinlock: Fix the __bitlock() macro definition

Surround the 'bitnum' argument and the entire __bitlock() macro expansion
with parentheses because 'bitnum' could be an expression that includes an
operator with a lower precedence than the addition operator (e.g. the
exclusive-or operator) and to prevent operator precedence issues in
callers.

Fixes: eb7d96a13bf4 ("bit_spinlock: Support Clang's context analysis")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Marco Elver <elver@google.com>
Link: https://patch.msgid.link/38cdec9322fa710f84c018e0b318894c6234c411.17950=
43161.git.bvanassche@acm.org
---
 include/linux/bit_spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index 7869a6e..c31d4f4 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -17,7 +17,7 @@
  * static analysis can use.
  */
 context_lock_struct(__context_bitlock) { };
-#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (addr))
+#define __bitlock(bitnum, addr) ((struct __context_bitlock *)((bitnum) + (ad=
dr)))
=20
 /*
  *  bit-based spin_lock()
