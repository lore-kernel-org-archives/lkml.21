Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420356;
	b=Qk1BFUWUdT1+jL0B2zaT0phBObjwUPzEQaT9OeUO8ioQbRpeBq0n2or7B7mlRbw5QaIv
	 0PZZ6ysA93TvRAX/rCMoDUAwjmAiiayxdXYXrBnNd2ACN/Mo83Do0388GeY1x+lv2T2St
	 gJwGq1LARfbZiqmWrUCmZKGrzHzfmM5p/cMbvyiZkqPb4AUoX1GoRHxKU03aykE9nuRRS
	 PQOaFfHrom3g/E/eHxStx0zp8u6XNzEk9H+qDCt92HK5X5j0bUehHco1eTiIXK7OyMzEh
	 x05CP1DwiJ+NxkHO9yQPaa2FbtISQSI2MSSWmymuIAhB0NVCrL6qL+Dx4yVsvjUyI+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420356;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3nDpLZt0Hs5OH5kFHB3f7/OYmF7wFFbjKAlxawdFe74=;
	b=P5uZlcGqQAr+L87H/LdG9MpzwiHaMWqWe4IJd9tovznYtowyP7662IIEGKMgXEgtEhxS
	 u4AsNuO29o5wFbYdik9klk0kp1z2zRKhpKil25yz5CgZEdfsk4ret8moD1Gt4SS1nxdDY
	 ZGUnjWVl9AXICte7VjUEsrSsRSFuB/wwU+jGDRLKg8DTrLZbr8WJDPxUWvRH6DzutQ/VD
	 dK28X34dAp9rHm4XnY2HoQigNMStWiC/G77IbZ+pwJLo5MNvLN8zvEipXlhIavr/3PoZ6
	 BhZP2NeH46TXRKS1TsJU2Dj1VJG2KCiFq1rehKFIt0ZZShBP/oJfxDSjP/t57MCb7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ubb1k2qp;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC25606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ubb1k2qp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rQou9DwptRL140fMbBjIWfFbsdtKmSPSbIJAMhXyGSo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420354; v=1; x=1796025154;
 b=Ubb1k2qph+HARyWmnvn3g/4oNX3dMnxcfjsw1lJcKDlp2vHROce4o1NHAM3K0wGfYMz9EpN4
 YIFVP2HnUiGQgtIwNHWeYqyyehK8ttePG6e0MIlnzy6v7a1xeT2JEG+Bm3G1Xe8CO0oAqrq0cEj
 INhYwNnAJ54Pr0p4ZZ0s6BBk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 487a0c2e7dd4d38f;
	Mon, 23 Nov 2026 07:52:33 +0000
X-Mizu-Trace-ID: 487a0c2e7dd4d38f
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
Subject: [PATCH 4/9] arm64: sysreg: Don't run the end-of-file checks after an error
Date: Mon, 23 Nov 2026 07:52:14 +0000
Message-ID: <20261123075219.369042-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
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

