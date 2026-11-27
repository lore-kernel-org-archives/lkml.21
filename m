Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765484;
	b=ymzAqI/mFCPmW7Nvq1jDoR8rO7cBs2h5F4EVKFk+dNIczp2mR9ahYWgz+eTNCwICbbzC
	 JlPmUlxS15XROZqx+nP2wftxrhx36qq02YmekyI0w+S6fdRGdF5UPhknp7jK4hHLBGKAA
	 bNW7EGX9aEcapKaYguGzjUe5E328kcYX82MkK5WxKlz2/3Zk8mQqci+wRKW+puqNHerQJ
	 wpIuIDnDbTxAptGgsLK8afufRlI1z77mdjjdjxK2K5qX51LWSVzNX34YqtghWTXo9GBh5
	 zQqa6GvKpKPruWqlhYIdJo/1EEaIZbRdSL/pRLZMtnEy9TRkxOY943XHtA48z7sEZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765484;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=32F+dteGpI4OSC7Oxea+gbzCBa3IpwvHXw14v4GKoqg=;
	b=neHhX/EHVxSjJb1+7xikSHgtfEUu6/2qiUzg1E/ylUHREECoxXrR2gTjDmZIJs8PVMH6
	 22WM0TDrahBBDXBcNLP1XDvqqKcTjbXWRzPiZ9YyyO5A+dKvJrEH5DEyJJT5oJY3gCkRN
	 ECuQ/OyEuKbl0fniNz5FHunB65sTVACeTN+cATyq8mjB0HOT34PYTGl/Q1f8Cq5sCuwzv
	 HQ4GC8unXT7UjS4ikIxjNoGUdFJMJW1AmyaI7Yy/rj8zmKdfbPUdH6V1mevKG+IDLldFk
	 Ct/NvtoDkSu21g7SMeJyj7eSRJZCtgIoK1GYBpGJgQd6QpyKu3JZHv+Z7J6I4WkLP+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smmb1TdP;
	arc=none smtp.remote-ip=91.218.175.139
Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8AA606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smmb1TdP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k+kNS9/yC5H3dUfVUZLdt6GwIbmdmFem0AL769/L13M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765481; v=1; x=1796370281;
 b=smmb1TdPoZBHG+Rxs+wEUarNd/4GBEorRh8Gl6zJE0TZ9g98jDTdg/fRsgQEHzuK7PDrLcfp
 zZpadWz+FeA2K4gdq1qlfsYuLMdp7cBwhdSBSl1sZJ1863dbmuEARb8Ex74ZHGVL3jBjq0hCa6y
 Hja/itUcflgwF/HVbOe0og7g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bf1ec0af72a262ed;
	Fri, 27 Nov 2026 07:44:41 +0000
X-Mizu-Trace-ID: bf1ec0af72a262ed
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 04/10] arm64: sysreg: Don't run the end-of-file checks after an error
Date: Fri, 27 Nov 2026 07:44:20 +0000
Message-ID: <20261127074426.50739-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
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

fatal() ends the run with exit, but awk still runs the END rule after
it, and END checks the file as though it had been read to the end. An
error inside a block leaves that block open, so the error is followed by
a second, bogus one about a missing terminator.

Skip the END checks once fatal() has run.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 8ce4981273dd3..c4fa27cd9beff 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -19,6 +19,7 @@ function fatal(msg) {
 	}
 	printf "\n"
 
+	__fatal = 1
 	exit 1
 }
 
@@ -116,6 +117,10 @@ BEGIN {
 }
 
 END {
+	# fatal() exits before the whole file is read, and exit still runs END.
+	if (__fatal)
+		exit 1
+
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
-- 
2.47.3

