Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765482;
	b=HzDyhIuHIf6gP1nBWT0uLrWnYL4GpJutxIFM7Pu46mv9IgCZ5JFkZaWJAziLpY0sWZ7n
	 uy686+OKaxsrc5xfvOmycWu6KKeUYPryg0w0fMXnh3jaMUeXm8Hx7JqxjgdUN4j2oggiI
	 1VrTVhnIvyYJjH6i54UxogER9ubyLnlfSQWOlGPsFTK8jBtK2xoJx4kTpGlREBi1fGqjd
	 k89C8yR9RZ9omjP/vKC1N3JHiDvBx6WlYTDw3yZIhfGAa4vRmhfnaCIDRyP6BwWR/pIdW
	 t/3zAlCRYisS+d+liIQtF0GNlAqMOc8d2cwdeacUfJWkRFTGx7jKPcd8Y/5GWIFZTSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wD0+PxnMuLm+M4cynxJmtK3MHUa9fIPsTXYebXefS1Q=;
	b=IRF7TAk6n8htz1fHJPYTjBWeaSBYi4Mu7Rg/uP5ksLITq1NfqEo3PimtfF9RQX/EHYWt
	 R42UMT1QUh+PXExRJyDJuuv293Xf2q9bO+hh2Mht+qR1mYKeV99OEBc8PhDVeY3T5Lf9d
	 wna7CyD4mNiWWRvwA4kXYVZkuLljlxehlbkITAFDUCG5QfXvZnFadyEUiSjlEjuRWP0S3
	 QfzEwaXMj4i7rde41bNnsOsysfHCWIRaRXdVD8wJiHgOCLyqo8Tdx1yFTv0RyIMszyvv9
	 LwdPPZnUo7BKSn7DoxAHcb+Om8UthvkO74VKC3i3G1WzhMaET9fmThx0LFw1U98yBLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJr78QnG;
	arc=none smtp.remote-ip=91.218.175.135
Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C003606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C003606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJr78QnG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pwxQp22NV+Zlu+S0Fd1cIALq98HnRL9je8Varj/Rr2w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765480; v=1; x=1796370280;
 b=uJr78QnGRFLJU/1dS8rGJXhm1Ge4o2o5F2l7mNrowTpkB6fUwA4UJ6IJSKnYg3EhwtcJlQop
 UFWLymw9KLXqHr1s2wP7WdHh8Zry8mY+UAm76smExl8hucniPyJlXchtRJHscbpH7QL37p4OjqD
 3oMHan9gHJqLsJ1wK68REnTA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2237a9663b6448c9;
	Fri, 27 Nov 2026 07:44:39 +0000
X-Mizu-Trace-ID: 2237a9663b6448c9
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
Subject: [PATCH v2 03/10] arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
Date: Fri, 27 Nov 2026 07:44:19 +0000
Message-ID: <20261127074426.50739-4-fuad.tabba@linux.dev>
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

The generator rejects two Sysreg blocks, or two SysregFields blocks,
with the same name, but tracks the two kinds separately. Both kinds name
their macros for the block, so a Sysreg FOO and a SysregFields FOO that
each have a field A both define FOO_A, as well as FOO_RES0 and the other
masks, and the compiler warns only where the definitions differ.

Track both kinds of name in defined_regs, so that a block is rejected
when either kind already has its name, and leave the kind out of the
error.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index b299342463631..8ce4981273dd3 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -137,9 +137,9 @@ $1 == "SysregFields" && block_current() == "Root" {
 	res1 = "UL(0)"
 	unkn = "UL(0)"
 
-	if (reg in defined_fields)
-		fatal("Duplicate SysregFields definition for " reg)
-	defined_fields[reg] = 1
+	if (reg in defined_regs)
+		fatal("Duplicate definition for " reg)
+	defined_regs[reg] = 1
 
 	next_bit = 63
 
@@ -181,7 +181,7 @@ $1 == "Sysreg" && block_current() == "Root" {
 	unkn = "UL(0)"
 
 	if (reg in defined_regs)
-		fatal("Duplicate Sysreg definition for " reg)
+		fatal("Duplicate definition for " reg)
 	defined_regs[reg] = 1
 
 	define_reg("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
-- 
2.47.3

