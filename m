Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886466;
	b=TQGYivNMQxqwMhEvCGqu9GxIDB0Bzr7oNmyBfKIcbR0E9cPkwJTK9QC851azbTaxTrTT
	 p7Qo0GuQFwcnA4C72QEeC3xCTGZ+bNMpcULKD6mjXDQJT+gjfOfd1X621wMBRW9qHXb49
	 Zj8foBPWOpK7b54dGPxCF9ULL3i/oRGedGZRtDWzMeb4RBm0cBYtFHv84MNbYX0lawdzV
	 Bc/DGav7vP8xnnj4/JF9seBf1JeJkX8SEgabDUznRmEPKoqdU1PERVYXMTPPQepnHjJ0B
	 7skKQ+zWptCTasFqIIVeQLE/+4dJgv78cpiwFpnPcUo6A/dQe1v9XzmqLj6Xg8i4cbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886466;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=QujXA3VkDy3Fqs1gFULLqnU+Q6hbhZfV/qX9Jx1Dsug=;
	b=hJSlybwkVDUgmROoeYzoYvcNQByXYPgGHjza74/Cv3qePMCoT8+Q79u/9KKEnTmYC/0g
	 dquLxMS5T9lGyVRyU6DvHiWNwOYZHO3r2h2JWTePlVJnc86Jz+xodsTiegHUD2aXn3cDt
	 xxcbqDk1g4w117Z6s6/4Lfkzi0XzWHg3/5cQaDAcjv9FpZXsinIEub/vHqbg0ylF1weId
	 VgVi+fnE8TXkzdyXB3qgyMde6L28cqGv6Qp5Fao0zpDG/oFPvblsyATIRB5mwgPqV2D7Z
	 m39kdMypKSPcb9sUMDvAdrhBo6sYId9YwPObGS8AqoULCl7VW0YnJwVxtkYKZjE0xww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QxBw6068;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0pa1TbpD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.103
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381F606A69B;
	Sat, 28 Nov 2026 17:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C381F606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QxBw6068;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0pa1TbpD
ARC-Seal: i=1; a=rsa-sha256; t=1795886450; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qhO+WVfgXXiGUp7kfbUnVOX4o1w6u13nXvqZFLNYaJvpaLRPyyR26hAF0aHgUZK/6j
    D8chZSAzcs0XPZq6ubnU0924fEcsKnw0Ziz9hJFIn3kNtMTET55RleR6nMH+w/51h/8H
    ky+8IyyWZwiBYjTFzs+8cC/kJkDknGTRMrqIuG20VDm4oFxRJU9hjwQLCjZ8JHIiZ4Xb
    F+tNsEEne8HvzlaWGZxVej+Aqh0xAiPwEfWQVxpS66hDi3OJupqzmpYaKbaPuFV6J1fb
    yCg/dY2gn8Se8uWnPKbnbNoH6kLSPqJGqMpDn8bXqJ+T7qP9jvC4lfwFqvvSWSE3a9yF
    OnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QujXA3VkDy3Fqs1gFULLqnU+Q6hbhZfV/qX9Jx1Dsug=;
    b=R7mGNxZ8l01Lp5TqkpAeWF3ze6kPepoxERjEjlch+LDEQfL//apqthCbu+WnHSk1jD
    AqJAIbMls3P8Usl/e4H1Tu2gU2S1pTwboY4EQGmFgU0uJCSdpXvcz5Dbx3mjXhmqdpZj
    tkEO8t2CIHcDVfK/EqHDU/tnEVchdb3VSn9sitSlmu+82PRiw0zifHF4jbzJjepXQhjY
    cSIHnacvrUQfYLEItqJ6687uu9SwMi7CiqMVyYI7L5luP1aesSC+171RrVC5zaqYPC3k
    qVFaF8OpveyqBPPRqwbc7J38ysHgDUG713ElWBEhbLPM15cjmEXzq86HWDziSEXf3U7x
    kd6Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QujXA3VkDy3Fqs1gFULLqnU+Q6hbhZfV/qX9Jx1Dsug=;
    b=QxBw6068g9NzKWUMIBq+rvwFUaNmoRm9BOFyiyCMOO37Srrsd7oPzYqk9jZm2MtC8Y
    ddc5lQCUPp/awIFX5eY/uLqLoV6ES8kcxV9kErfvvDZ718rJTJoFkxIqBTXLBBs38Kmp
    rB1VS3aWzzYzQ5PZQBZGeU5GozH4x6Elcla0dL6/B2xkitHFJSsv5V/rH8vgtoHoLq5Z
    ppmvIzzwzto35c262TWmPDcilC23SWknzxk755v0mRbN93gPJmh9J6Gh/GogkTuS9rWI
    yS9HRLkSNJss7InOJNVCLGMDuelGTAh0EhCoNIMBicGHCpiaByddZCI+1+TXf+pFi2Cd
    iC/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QujXA3VkDy3Fqs1gFULLqnU+Q6hbhZfV/qX9Jx1Dsug=;
    b=0pa1TbpD0jDSd3mPFAwr/9jCLQ2MWv1VSXgzCCseIgPX1Z6F6IRznGnDMSXN+jnziL
    CU8P2UjLnMmxAUvliNCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKoLv0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:50 +0100 (CET)
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
Subject: [PATCH v3 8/8] MIPS: Ingenic: Expand Kconfig by MACH_JZ4730
Date: Sat, 28 Nov 2026 18:20:45 +0100
Message-ID: <fb77b09fe64aab86a81aa139e3dfe30d955cc07f.1795886445.git.hns@goldelico.com>
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

The jz4730 is a single core SoC by Ingenic with peripherals
like LCD controller, NAND controller, Timers, PWM, GPIOs

This SoC is used in the Skytone Alpha 400 Netbook:
https://en.wikipedia.org/wiki/Skytone_Alpha-400

Without this flag, the ingenic-pinctrl driver can not be
configured to support this SoC.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    (More) support for jz4730 making use of the new MACH_JZ4730 config
    flag is in the upstreaming queue. The chip is used in the Alpha 400
    netbooks.
    
    Changes in v3:
    - Assign CPU_XBURST2 to the existing XBurst II CPU probe case.
    - Hardware readings of Config1.C2 on JZ4780, X1600, X2000 and X2600
      all returned zero. Without reliable documentation connecting this bit
      to MXU variants, no new MXU capability assumptions are introduced.
    
    Changes in v2:
    - removed the PRID_IMP_XBURST2_R2 definition and hints for an x2100 as
      there is no public reference
    - merged into single commit changing the PRID definitions and code
    - reviewed details and rewrote commit message
    
    Open Issue:
    Olivier Louvignes <olivier@mgcrea.io> pointed out that he has
    simply reused the definition of the X1830 for the X1600. This
    sets c->writecombine differently (_CACHE_CACHABLE_WA) from
    _CACHE_UNCACHED_ACCELERATED as we do here.
    Both settings appear to work but it needs expert comment which
    is the right/better one.
    
    Review: Olivier Louvignes discussed the PRID microarchitecture
    interpretation and the alternative X1600 writecombine setting.
    Paul Cercueil requested checking the X1600 MXU capabilities and
    noted the missing CPU DT binding. Hunter Laux suggested reading
    CP0 Config1.C2; the hardware measurements and their limitations
    are documented above.
    
    Additional v3 review against v7.4-rc4:
    - Preserve idle, non-coherent DMA and TLB handling for CPU_XBURST2.
    - Keep the XBurst I secondary cache geometry workarounds unchanged.

 arch/mips/ingenic/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index ca9d40fe874f8..30e8e37cbbd86 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -3,6 +3,7 @@
 config MACH_INGENIC_GENERIC
 	bool
 	select MACH_INGENIC
+	select MACH_JZ4730
 	select MACH_JZ4740
 	select MACH_JZ4725B
 	select MACH_JZ4750
@@ -56,6 +57,10 @@ config MACH_JZ4725B
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
 
+config MACH_JZ4730
+	bool
+	select SYS_HAS_CPU_MIPS32_R1
+
 config MACH_JZ4740
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
-- 
2.56.0

