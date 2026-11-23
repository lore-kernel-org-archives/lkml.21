Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420374;
	b=3OtyTC3z3hufr/8VWE3F5AsisvxMLZqpp56STEZ4J7NneYxKQKPZ97NqW7WBlvbQZQjz
	 ZM6+uHuSWI25JAFGuBcZooyuAOmVL/9vb/nNMVjvVVzMgAAQGUebNZvroQbobHdD0H/NM
	 pzJ4DhZa7LSCN0CBhqTwXGnYAviOb45o1lMCksOOuYzZImELeUoqQnf/Y/fsm8DyiAbkD
	 Y21qw818HSew4PPQjeQch30RmccrF9PoN20Jw9sGjpHZUUAISkrbTgwd+UnjZeVXWvkbM
	 0n5oKDq/ekn0YfCKQrdoveqzWT0OWps+M9e7bXthujZeOKF6G7epSTaf6ImjjVeizLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420374;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=di44xioG08RUP4gXE2ElTIDh6GfKl412BWdsWE9aJYA=;
	b=frrhoz3lDmqAhIIZDI+T+zv4Z8IE3gF66yR5wWWZMKVajLMwOvEkuFkGHny6WaKCFUF/
	 Um69u4zo74qQrfgurx72CNGzf2s/e2raGkcQR9zijeyIIchOi2AtgtJXpEzR1Ek9GpGAr
	 rkWA7hvBDN0+jklp93YzO0V7OrrOy63GQ3FsYUpQBOYQuNG1y+WYqGAVx47IUbHI30RiH
	 V/qQ7fjuCknixbpsfUf3U0HDQ8gbxICrSG/JhB/ZYfmiGi7WUHTNK409JOX+Msm14MAMH
	 F3ZmYdJDbOfYGeUwYXwAmV1UA8JAdyq5EoE7qZHa26dqpjFPYAJiH/gi6MVPPIosmEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TQG77TDe;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B85606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B85606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TQG77TDe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zu5oi7kEEcP7zdUn9nCBnwXogB94Tzo4o9FQ/tfo7zM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420371; v=1; x=1796025171;
 b=TQG77TDeGSyyOMGVpx5X6dwMJQ7v6hpqthng+8N7in+nrlV5XuvMAZUcWqNS5NJwDqzn6NGc
 2wqsoGXsVXUwiyIjB+Kl2f+WnLXMvM5N1jiJ4HOzlpuIyY2HIvFCVyIgCT+zOBVnv1AFTXcju56
 4FtZn3iFcVn9Difsjb73UvAk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 17f36d90c584fd6d;
	Mon, 23 Nov 2026 07:52:51 +0000
X-Mizu-Trace-ID: 17f36d90c584fd6d
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
Subject: [PATCH 5/9] arm64: sysreg: Reject a Fields or Mapping line with an undefined target
Date: Mon, 23 Nov 2026 07:52:15 +0000
Message-ID: <20261123075219.369042-6-fuad.tabba@linux.dev>
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

A Sysreg block can use another block's layout. "Fields X" names a
SysregFields block and "Mapping X" another Sysreg. The generator emits
the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
doesn't check that X exists. A misspelt or missing X gives macros that
expand to undefined names, and the build fails only once something uses
them. MPAM1_EL12 had such a line.

Check every Fields and Mapping target once the whole file is read, since
a target may be defined after the register that names it (MPAM1_EL1
follows MPAM1_EL12). Either kind of block defines the masks, so the
check accepts either kind as the target of a Fields or a Mapping line.
Give fatal() an optional line number, so that the error is reported at
the Fields or Mapping line.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index c4fa27cd9beff..1843d283192d2 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -9,8 +9,8 @@ function block_current() {
 }
 
 # Log an error and terminate
-function fatal(msg) {
-	print "Error at " NR ": " msg > "/dev/stderr"
+function fatal(msg, line) {
+	print "Error at " (line ? line : NR) ": " msg > "/dev/stderr"
 
 	printf "Current block nesting:"
 
@@ -124,6 +124,11 @@ END {
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
+	# A Fields or Mapping target may be defined after its user.
+	for (line in refs)
+		if (!(refs[line] in defined_regs))
+			fatal("Undefined Fields or Mapping target " refs[line], line)
+
 	print "#endif /* __ASM_SYSREG_DEFS_H */"
 }
 
@@ -241,6 +246,8 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 	print "/* For " reg " fields see " $2 " */"
 	print ""
 
+	refs[NR] = $2
+
 	next_bit = -1
 	res0 = $2 "_RES0"
 	res1 = $2 "_RES1"
-- 
2.47.3

