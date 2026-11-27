Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765502;
	b=YizLxpeRFBuW8bN3uJP0GusGZCAcJj9nlKYEkEq0Vpe3AmXTpNXkkYJ6pymyFSu9+FkC
	 2XIVgn2V2z7oLSS+2OQB1CYVzEr6VvE4KMUIRa5rCQdmWyhpzuFiR6NjJ95/+x8TsDqFB
	 En/AZK7+ruqcZpmY/Vj4U9z5ZxzdC2VsE/A96Qjt/EPULAF20wNcMDnvu0Iko35hhJ/BV
	 oNsx7TwctiTra+OzHVrSOBdZo6RMD6hNg1Cyt+tGNHr5DeEExAMl8DMkKihtu97xlptjm
	 PiBeqkg8qagJeEuuYyENpgrnG5TWZ392tfUOxVnFRal1JkiR4Wgf0PsI0RmzfNzDehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765502;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TLKRd8QC/BYL1fg8i3fNARnXOmRuwMr6bd5jMLPGN9Y=;
	b=Dk6hhA6rRnVClhLaVm80rqGVZJJot6jZ2ZhdF2CClS2BBLZlrlrKhfphHK4iRUlYgrW0
	 zSx60XvZC7ADnqdABkNLZyPsNurMwcVfXkdvLogNf7ooKxIpzBmc+quP34JeY6+M2bi5Y
	 rKwx7VkhZQTZzmcFhO6r0G/B/Drve4XH6eWBF8pavfaLYuUGiUHD9vTZCTI2UOTZIpxmf
	 vkSn83yWJFUzdcIHkoZyYDx6lCXvvdkP5wLX/b8saRwMaDYm7M+dkalHRJKUUaznGNXXj
	 42pJm+1mAgOQkMUSMld0coc8l5mm+FKnWCZJCZDu/rl38qPIh4BV7KFvueRptFSsNWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tHzS949P;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FAE606A697
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FAE606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tHzS949P
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7/9aubeJ7ANPjxxvP5vIEXNZStyv5Yrfe+pB6O5E5RA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765500; v=1; x=1796370300;
 b=tHzS949PZslHjwPsfRnaCVI068Ai9AFQGLt7fduaz+hwvBtKMtyKCDTpL6ELL73yDcTJJ5dU
 yAt/dh2mdgFV1MDJeOeJpIgLeEY2lVXfv0DEtetzz8Uxg+iuk3R/aaCLzrSUtovhPTmbn4i6fM4
 +BYg0uPSVlLIZdPi8jt607jU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 363d26472d9a53f3;
	Fri, 27 Nov 2026 07:45:00 +0000
X-Mizu-Trace-ID: 363d26472d9a53f3
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
Subject: [PATCH v2 07/10] arm64: sysreg: Reject an enum value not written at its field's width
Date: Fri, 27 Nov 2026 07:44:23 +0000
Message-ID: <20261127074426.50739-8-fuad.tabba@linux.dev>
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

The generator emits each enum value as written and doesn't check it
against the width of its field, so a value wider than the field defines
a constant the field can't hold. The duplicate value check compares the
strings as written, so 0b01 and 0b001 in the same field pass as distinct
values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
too.

Require each value to be 0b followed by exactly as many binary digits as
its field has bits. Test it in the rule's action rather than by
tightening the pattern, so that a value such as 0b12 is reported with
its field's width, instead of falling to the generic "unhandled
statement" error.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1843d283192d2..cde526896ed96 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -367,6 +367,9 @@ $1 == "EndEnum" && block_current() == "Enum" {
 	val = $1
 	name = $2
 
+	if (val !~ /^0b[01]+$/ || length(val) - 2 != msb - lsb + 1)
+		fatal("Enum value " val " for " name " is not " (msb - lsb + 1) " binary digits")
+
 	if (val in seen_enum_vals)
 		fatal("Duplicate Enum value " val " for " name)
 	seen_enum_vals[val] = 1
-- 
2.47.3

