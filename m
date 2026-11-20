Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195801;
	b=IDkKXnUP3iOCZPtHKa7Ee0UdIfeUiEzy531HjiYp2SzuAgpR2yTV0yPq5lJFvzHaRT2u
	 DbBLXJA10BrP9Q5hSU70HUoT2iE02E/s7zEirBRsnLajH+8opmGn+pb8XrHfZ1ZaPjMbu
	 behUn5C/cuVZUe0tpYNuhqGXbXr6CTGATHU09pB4KJqo0UnvKjFdeU8KCbHBRa4x2qdJ2
	 xm466pZng6MmFtWk9SC3ORomO9iVETVj8I268LE2osAOzYw0qwC9+R3PTFdOy0TvGd2gu
	 C1lCACI+ipG3vHYqsZuPrOf6kJy4igiUTWjsjC1motGscdOj7r8CnjXGL1W1auCLdTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195801;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UufVZfwgbCp92kFZnwng07BVnO7E58HSMy79wKEDlQs=;
	b=TBrYBOTyEvl7k/qWNmLK/t5MVcpPofaHkWg9hwcnUZCVsBXOVw9eYbbsX2qDCbrL2KiE
	 RXavhp7vVE/+tVvxPh/E+yB7PV9hOwaRJY+tu0e4MZtaeoThi5gO95jS1019qQet1TG+3
	 YT7udrym7aJzS+uke6TyTG498TDgnqb+fsmf5irVC7xaAB3RRpyANgUsaIDeDTZTgtxJu
	 9E2uNwc5oJZI6pw36uVgD1aCAbqcWDcBb15pQv720/aHD6Z7lbmTRWxbGWu+VKDxT4Dx6
	 AGkfPeD4QMHwSaEiANNDxQcNkfqhxteh7dbXKzWtJgjKZDgVILIoZPwdeLzWnwD4w/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XaH2XKGU;
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB56860A3803
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB56860A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XaH2XKGU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nCbmDgNV7wby3LpZePh1npWx21ru0gynBSaNnpEAK/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795195798; v=1; x=1795800598;
 b=XaH2XKGUfbfslLCrh/VW4GNjswwMdzZlfBaS8casedBelYBruue+ZxhTqBTPvwoSZv++t6lK
 5rx/0kd1PqeAjf0MhoIQw0XuV5DL3y2yKeWUS3lTW5aq/PNznVmUC8riS/ub0sMpvztwsuqWX7u
 AsJSfGUn9FWlMu8DixMobTwE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id cd7cd70153efb88e;
	Fri, 20 Nov 2026 17:29:58 +0000
X-Mizu-Trace-ID: cd7cd70153efb88e
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH 2/2] powerpc/64: Set r3 to physical CPU ID before kexec_wait on !SMP
Date: Fri, 20 Nov 2026 17:29:49 +0000
Message-ID: <20261120172949.3494131-3-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120172949.3494131-1-bradley.morgan@linux.dev>
References: <20261120172949.3494131-1-bradley.morgan@linux.dev>
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

In generic_secondary_common_init(), secondary processors on
non SMP kernels branch directly to kexec_wait without copying
their physical CPU ID from r24 into r3.

kexec_wait() assumes r3 contains the physical CPU ID and
passes it along to __secondary_hold at 0x60 once the next
kernel starts. This is bad because secondary processors end up
acknowledging the next kernel with garbage, which can hang
the boot or report the wrong CPU number.

To fix this, copy r24 into r3 before branching to kexec_wait,
matching what the PACA lookup failure path already does.

Fixes: 768d18ad6d5e ("powerpc: Don't search for paca in freed memory")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/powerpc/kernel/head_64.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 0077ce148a5a6..6219f474d00bd 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -401,6 +401,7 @@ generic_secondary_common_init:
 	 * which logical id maps to our physical one.
 	 */
 #ifndef CONFIG_SMP
+	mr	r3,r24
 	b	kexec_wait		/* wait for next kernel if !SMP	 */
 #else
 	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
-- 
2.53.0

