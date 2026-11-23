Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427053;
	b=UBRPGklqXLdZsQBT0hK9RKFuIPfOuD1nfZ20om3ojrpH0vi35RYPm2s+6cM6JLhEZPzp
	 4e9Z1WBsK3dZkGsAZoYhMmaxNhwCSD9vBZgA6v5IJ5uCtxKsW/egL/iSWz6LQ5WQreoeA
	 96tPWQ+e439+BvRmcdtKbcIeHa6EzzeB6qyF/FokZKyT5RzYJnZFE15Y+FCgS932xYj1U
	 +NfbE9cdsZRLphjoJihInr8DsPUvdsI0ce2BK85AVr9dVgANFyT7dHtS7aFUJzwnR/yZ+
	 ZoLrAwlM3qJbC+Oi6pghZMGGZZslm78E0HPC4Hs3K+KtrzIZ7uXtk8uAymhxxbeM+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427053;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=uEMhOk53hvpyd4izqyXjg5uyPHsXn31xcuJDUU0t9nk=;
	b=mT2WfyeRRFKWdQ4taidOEsxOeHrbfuDR+1aU7vJ/HieNWZCW+o2pBOuW4E8wQz5EauwC
	 9FYuUfe4eeBoBZZhkqta+ie25YdZrcQdPnuO/aSXrbLL0nTK496qX2Zc8MNdXU7tH0+1I
	 Fu5vp9J2EFD8tlcFOi0vX93t8q1fo1m4vMA8fsElEla969YGAugq2IAVgskyaXoutSXbK
	 ya8+bSRw3XOTFnsHuIgpObcudAK+myUrVPr9eSFerPoLM8v1vuF4F9hoNmZt4zEMDu5x5
	 frvQFDcPv3iSK5VAman84Ix3daSG32pvNzgSgennxqJwqLofSxGANCshJUrSgN9v+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rHhTYo0H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hbt5dRiT;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC7606A680;
	Mon, 23 Nov 2026 09:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AC7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rHhTYo0H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Hbt5dRiT
Date: Mon, 23 Nov 2026 09:44:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427050;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEMhOk53hvpyd4izqyXjg5uyPHsXn31xcuJDUU0t9nk=;
	b=rHhTYo0HHqtbu3ZRCfia6RvN1IlAZ3ecUadK5d/vp4l54DWcUq/U4y0yEd624yVOxo7FJl
	GpPzyLfLW7ehcunYGukVjGJN1lo73iUSFt+WKdV6rAXh8/uQCnaughpbtEbtW1mh7QJFpB
	Vgpsz8F4eRq2PeCJ8dGWWOT7glNoR0Bki24pI+VxnFIKrSsw3BOi9tvLT+N1AYOf0KIyKA
	MCofbU1SnrovFfOLejD8/k8dXMZsi+gQHOrF4w0htbdH7Mcjq0VW0H9UFCofN8yHBBI9be
	AEgOVAHK19gRtkGgehUgJAVRzmG8u2YVMGLBJdwApAdd4OnDUelt9215ZrYpHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427050;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEMhOk53hvpyd4izqyXjg5uyPHsXn31xcuJDUU0t9nk=;
	b=Hbt5dRiTirBBLyeIdLoGY0lbZY7WcuCJ62Lgz1J75cYuyRysm1XcsQSvmkf1rowj3FmVZ+
	B1ko2kGD4WyFKMBw==
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
Message-ID: <179542704888.92412.1951427132186986536.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     af1a4ab4bf3bcb969ad5ee9e7fca1d23703adf32
Gitweb:        https://git.kernel.org/tip/af1a4ab4bf3bcb969ad5ee9e7fca1d23703=
adf32
Author:        Bart Van Assche <bvanassche@acm.org>
AuthorDate:    Wed, 18 Nov 2026 15:09:57 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:38:52 +01:00

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
