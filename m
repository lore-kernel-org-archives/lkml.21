Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043427;
	b=OCd9Q09ocHsod3o/yLhGCXjDha/4Zvd/6Qyv199/xTdxmzkaJGqpmcuZpBizMyQ5hKJH
	 wVmKZWOH8FAZr3FNbAzSGtEHReJbK7inl121uropFkqGPTe2cIMbENk99rzQcYGbJsJXR
	 otzfccZKcbGMXi0zKrU1EcVOafywynvuJ9K15uBm/NluHRGq6oUIDeDeb0g+wwl/yrx4Z
	 2AYwDM7+ZKfDsiz2Ve1yRd1IkDiH9Y095uz+qJAfMmPOx4ekxZErK9+jR6MJdMfpZROvE
	 ZvJD3Nysdx7eULeXrWbeZbipuosHMsKNY4aHLtLmOIzOxzlupxHyHe3A0kyViIly1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=/fxbF+PK33We/nqwfb6zVihRSS1+ilsrlJXflD9aiRc=;
	b=JZIzIPUswIGliEL5zAOvkSzDtLAtb8pI56PtLKb6N6Vzmr/hZsjD4JgVGXXJbRZlyWBy
	 F7EaIiXXPMUkkVoU+xLIKVPHFBo9Uzp+wH5GRI5sdKYzuQgMUD0rIVnzcBuXI+TNIgbRg
	 Lj3Zo9NfhVQqjbPeHT64A3e7kGhi2AZav6/Uj4LjxSrAUvFJGmHQ45HfEiAEFH+uxU0sz
	 YrA7OA/DCGhEl0tK7LuUiLdRG+9EN0v+jVlguT8DQtKLrV8Oo6kZBaAgl5YS1gVU2/Bdn
	 O+gQJNBDV/LyPT3ufDyNTyIVGFWK+bKa8PCHOiTW78LHoVmOrFQ5yJeFC4JGSVBxgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=wtiaVqG+;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF348606A96A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF348606A96A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=wtiaVqG+
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jVHPt1Nptz1XMlX5;
	Wed, 18 Nov 2026 23:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1795043423; x=1797635424; bh=/fxbF
	+PK33We/nqwfb6zVihRSS1+ilsrlJXflD9aiRc=; b=wtiaVqG+W027y0VvQCIMQ
	3k6MbniyXVqw/KenBpqZkssJQrNGX+jzywwnOIlh4lx3w38TIcfHKA60tPumZnFx
	/khbdq+CoQmR1L9v/2V7nSBCxj7fMwohQVjFOrVSZKs+BvjlnHe4uBeeva5a0u05
	Y3xXp+k5pCMbmf13nx3ORmlvimjENIjKm/lcG6g5IVyXOI3FE6VYFDx6TH22bqZk
	8FtbZaPAbBN2NTvAlvMVcJS8m21awtUhd/ATzbupc0Lua37xIE6heeE1kIGBoLMz
	KZNbIDIAqXxrCOxDxKvgLJjEmszMZZdKn0N7W4uQRewRFG3PQ3P0ErR98ERMOUpZ
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2z2uE3igC5if; Wed, 18 Nov 2026 23:10:23 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jVHPq0Ncrz1XLQ9s;
	Wed, 18 Nov 2026 23:10:23 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 1/3] bit_spinlock: Fix the __bitlock() definition
Date: Wed, 18 Nov 2026 15:09:57 -0800
Message-ID: <38cdec9322fa710f84c018e0b318894c6234c411.1795043161.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <cover.1795043161.git.bvanassche@acm.org>
References: <cover.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Surround the bitnum argument and the entire __bitlock() macro expansion
with parentheses because bitnum could be an expression that includes an
operator with a lower precedence than the addition operator (e.g. the
exclusive-or operator) and to prevent operator precedence issues in
callers.

Acked-by: Marco Elver <elver@google.com>
Fixes: eb7d96a13bf4 ("bit_spinlock: Support Clang's context analysis")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/bit_spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index 7869a6e59b6a..c31d4f4d09ee 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -17,7 +17,7 @@
  * static analysis can use.
  */
 context_lock_struct(__context_bitlock) { };
-#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (a=
ddr))
+#define __bitlock(bitnum, addr) ((struct __context_bitlock *)((bitnum) +=
 (addr)))
=20
 /*
  *  bit-based spin_lock()
