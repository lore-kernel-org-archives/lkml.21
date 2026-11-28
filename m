Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=OLanOAmwA2OSzz1fZE+kEJrjCUU9kzYsWMgzG9XorXrffQWEAfeT5iekDxXGgqFYi3Ip
	 JN1eIoVBAcGla8AkQWs2gWfQ9g3yZ7EkYsOG+TeKlD+TTJOi/s/dFiI/jB3P26hlQE5GQ
	 /oqZTCdh7DBN95W6fq5gEBBCiwL1WmpSyeztlkqsu0Pt8qdpD9o7yTomNTOpMx3ay0u7E
	 UPjIrK2+gZc75d2d8ygd3PSzLqQsoSGjwDWEPPGA0hJTjQzz7Hv3D8cpdhJVezdePkq6e
	 w6yaj2SRkKpNS4k7wKVUrWFPtWeDQstULvjG0gNEUF572JguKOTlArBmvuy6N7UhEww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=XpxyahFV3d+93JK8cVpIIpglKLBRlfOFBP2w8aaU0IA=;
	b=DAHQR+exXdh9L5gGPCjyE/3WmVQl4EyNf8JWCXkOEd7fQvQmgSGqlNHA5ZuU7DvHf8Lo
	 p8mGdtp935RAU04Bk5Pn7nt4MQMDCjF6m69ZvADqs1kP/vlIwxZV0km/BtVZSQIoL+Qn0
	 pM9awvLYALzMH6kVTL4D6OF4MByP2Zvs/DRcLErbHY5jJL/z1jD5Ga2QbAl6gu84Pjl+g
	 RR92r+81X8X8YOQAJpCZezlzZhzdl9HsO2IJIA7Afuyoaq8cT3wnyC9zeDgCfd5HyiqAw
	 B1RG+Z0q8CIElpapy4T/fWXrfYhcyF4wYx1eIBY2nD+tslpIgDwPuiW2R1IKWyP4SAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GmqspCzr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=unrvDRAm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF923606A323;
	Sat, 28 Nov 2026 17:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF923606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GmqspCzr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=unrvDRAm
ARC-Seal: i=1; a=rsa-sha256; t=1795886447; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WuyMtMzvDJW0S8h6Z1TfmXt5FoOOgXxGEt1tV3fvjQDlpB1it233aDI33fRsFEru8C
    cMwGJxylbhUrPD3lPu6uKtwbihYe4f/eTVD0t5v0tKKpts4dWEyy/y8JQ25XJk3nrdQ7
    526VpnWxEbRowdDzW5VfNFnEN9cPalvzw+pvDC5Cmt92ralff++xpren08FtFx8fZjhZ
    jIogB1s+SdlI/f+0CIKM8ASeaVGyapLzopv5qWTGwHrvw7iegxNLJHS2G9Qh0Ju9El04
    FfttaDCeT9fMKxAzP3kU714s36unKfQwYUF4dnTPwLKifi6hbS3tULLwLbBjrfaJqwQQ
    TpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XpxyahFV3d+93JK8cVpIIpglKLBRlfOFBP2w8aaU0IA=;
    b=D2/9DxmB5DtboUxnAgLIsYeqPOnyRVDoThopB5GQ7WNjNXTIhmBg2SQgkQWc8hsDnB
    TT52ro91LSB3LkdE6UKpLbMHL8l+g7DBJnysM5pMJmTx4m+iaZThbXIhStwgs2cHJYY8
    y0vUd/NmgBZ1LmwCBKC3HeKLZDdmNf6Am7fgtatdQoA33hPtBG1+JWZjdmr4HyCYmq9G
    tWFXk7c08pxyne4BND7BnksNntMHqhh1r1CGgjxWXpd21+DOz7/QTj1y0p1RyUFqE3p+
    F63nY4Ihp7xGNSqgZBfVFrpbffmGxTkMRMgDQrDUjI6imeL6ZX6mnRJdDtvrOgtVQBZy
    WdoQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XpxyahFV3d+93JK8cVpIIpglKLBRlfOFBP2w8aaU0IA=;
    b=GmqspCzrA8VoS6TPc9rccOAH7Y+4JBJ5M/VAQwp1Gc4MVLEb4dNi9V+wUdy/etzIb7
    oHEBNSXCIxychWQr+kylqxZ9dm6yAweXsxBU4zaDbMV110JigYZykxFujjH1//rtzfLq
    TFkAI55IYwDZzhWs+FOLliWRy6clgdfg1JecQiMzfB74TxdsywnWHs/NE0GUPQY2uoz+
    LmqCa7srHUsDJ3PlE5jS9XfwBPXe2QHaE7MiXSczkpamebMopF+xeYOlGo5GiHktmTqT
    +vzw5I4QIB4cmo7MRwYyHFiqlPpqHelMD4R0FkZfG3goY8wm29e4nKmXdwUEc4BgvHd+
    IpBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886447;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XpxyahFV3d+93JK8cVpIIpglKLBRlfOFBP2w8aaU0IA=;
    b=unrvDRAm39X+4yO3vAe/CARW2+wqjilDPX3fl4tmYkEm8SaFJD0j219qwv6MUEide3
    lFc5yYrz9Arb4d8RJzBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKlLut
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:47 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=2C=20Pengpeng=20Hou?= <pengpeng@iscas.ac.cn>, Takashi Iwai <tiwai@suse.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, David Heidelberg <david@ixit.cz>, Paul Boddie <paul@boddie.org.uk>, " Maciej W . Rozycki " <macro@orcam.me.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: [PATCH v3 1/8] MIPS: Kconfig: Allow user selection of BUILTIN_DTB with description
Date: Sat, 28 Nov 2026 18:20:38 +0100
Message-ID: <d25c6e6e7852a6ba3146811643641ee1bd31d1df.1795886445.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795886445.git.hns@goldelico.com>
References: <cover.1795886445.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

Make CONFIG_BUILTIN_DTB visible in Kconfig by adding a prompt and a
detailed help text.

Previously, BUILTIN_DTB was a silent option forcefully selected by
certain machine types (such as MACH_INGENIC) whenever appended DTB
support was disabled. This prevented modern setups from turning off the
built-in DTB fallback when the bootloader is fully capable of passing a
dynamic DTB.

By adding a prompt, users can now explicitly toggle this behavior. The
added help text clarifies the distinction between MIPS_NO_APPENDED_DTB
(which controls image appending) and BUILTIN_DTB (which controls the
compiled-in fallback data and code path via get_fdt()), as well as its
relationship to BUILTIN_DTB_NAME.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in v3:
    Simplify the help text without asserting a fixed DTB precedence.
    
    Help text and commit message generated by public Google AI.

 arch/mips/Kconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dac3ec5120a34..749d8cc7855aa 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2924,7 +2924,20 @@ config UHI_BOOT
 	bool
 
 config BUILTIN_DTB
-	bool
+	bool "Enable builtin DTB fallback support"
+	depends on USE_OF
+	help
+	  Enable support for a Device Tree Blob built into the kernel.
+	  The built-in DTB can be used when no suitable Device Tree is
+	  supplied by the boot firmware or by another supported mechanism.
+
+	  The DTB to embed is selected using BUILTIN_DTB_NAME. If no
+	  built-in DTB is needed, for example because the bootloader
+	  supplies one, this option can be disabled.
+
+	  This option is independent of the appended-DTB selection below.
+
+	  If unsure, say N.
 
 choice
 	prompt "Kernel appended dtb support"
-- 
2.56.0

