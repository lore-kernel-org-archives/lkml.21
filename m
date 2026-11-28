Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886467;
	b=k1Mw31SVhsvzhT9UuyNt/0Fk/rNfLx4ifhmSdz2aqb5av/2naD1r1EnW3bHZsT4gvKNp
	 AKRYgYkOKF5syVJOMBk2bkzg2YvNKl6YafMeBmr0ol2Az4lX0RIrwlkH4trApsRIWCILk
	 vFH6RkG/zhtD4OKmTq5CXb9Q7CEsFVCrFX1rwO48OApKdCkJdr2w7ityRnwvcZo8xw/zp
	 lbUCn+DTvo9taVa6b4hIVo2u18mpYTbHxmSx1B6XrFg6WYEmZhQAKShDGKqOkk2bzy+43
	 dtE/kPDlmgOYCk+7JzkuBDf0I2axOsaNVbd5wGryD+GeOgO1FrC1Zl7NatYFx1GZpLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886467;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=9a/9lEXB8qJ8st84FfwbkbL1zZvDhFs8libsmZjA1Xs=;
	b=4du7EzsvP3SHCm4C2Fid3VkIz6XFsfQlE+axdHQ8dXU7Klnev0rwqgSNR+FDCmBzgLz+
	 YHjEYogWeEZaKxaMFmyKh3vQWN5LzQlab/1GgirsZmuc32rEHX0Xy0st3dc5eYMj/9ZdE
	 fONTtEbnA2puXagyGXe8GJn3DSB1w1110/QsLJCvxw2MMnriGGKYzjx2I2vfwNDogWOMA
	 n7Wzg71EjGvObaalofyowePDt5pyDssFNGcXp5abuN6CHeo3r6kv+jW4W9bGQsyH4ef61
	 D/5VENczY7K//ds5CDMEBKyWesfxatS7/yQ2b4xLtOINLlrYHbWc7p5foF+z9yZtZVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=I5f1ImR7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Cb7xCygr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.175
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249E606A69A;
	Sat, 28 Nov 2026 17:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C249E606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=I5f1ImR7;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Cb7xCygr
ARC-Seal: i=1; a=rsa-sha256; t=1795886450; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pQinAzTMcIKz3yAYBdBq8TwTrKYiP42JHz+MKYyPa+ySGNzQNLAPSoq4w3sHRNZggf
    Xr2NiWXosRN2roBZACUnAZNaLgyiejDAmfJSc0Ejyouw9iH1LUii1dPIVcoQRPHig+ti
    JjVZo1O7Sp3bNgT+BEgJ+e2pMj5BErAB16kgdO3hrvF8a+MBvGzG4w8vRqs8nBlELvzL
    MZ/3d+wQCKP81uINmMCLfFawNxNDMr/9XePL8TgjH8ANrvDWUaMIb5wTQ3NDcXXsCU2v
    PLw9pNeWdfAtosmkDmQqLuDMZ6PrcvJU+aEfqliiXviE7qeALf+xZwQkXXiAGu8Yt5gN
    m2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9a/9lEXB8qJ8st84FfwbkbL1zZvDhFs8libsmZjA1Xs=;
    b=ktlqgcpQEwAIUJFPZmIZbx0mTMbf+xa6LqHDO2Y37fTQPwGMaZMTqi4CtvxCU+TGkx
    tBOMGvz9aGgT7OQ2TbOusMJOk9hN11f22qaOfBHM89VDOF3Qylhtmy1G2abwP5wkcrvJ
    qShfWB/iQh8i+HMIIjjPdO0pea3YbbTsaw6koaGxSu5Qtzq93/pPVo516eP5jbn+Vvzs
    RhQMbCA5DUODRPpVLdpNIoc189ES5IhJsULa8dFo1vMuFK8x2SyC8tMFcU2/RN5LJZ8e
    B38ejsZoPLCBwQ2XZr9p5MSKirWWKymeYNLKxMTyGU4xfewDUlMUqT+xQiSmdscQr62/
    ClXw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9a/9lEXB8qJ8st84FfwbkbL1zZvDhFs8libsmZjA1Xs=;
    b=I5f1ImR7HWZ+9cfz3BHPUVfNh929ppms5RsvuPkTTYRSGJtZ6F3Qi1/oQiQ/ntnPEJ
    z6lzfCA73hIelKixaP7aiMXFz0zeD4J6YxTuwlGxZrAP14V8cLuBdRqW2z2oYI10xygT
    GmNVMzRuq0R3ceXcFn1WuQuGqnhFIZyr0vCoaqDCI7SU7/Yy3KZ2aQerhFNvNX/g3NjD
    Q3QjRYsy1jvpWQCJwVdO9q4WUw/A4l1Kb0ZBimniC452U2VBMupmuBCqK2OMt9aoJD/r
    NuYqHD+MAJLDY7XHyx5D9NiiUHZclTw6j5uRyobwpu/KrhXETidZ7aEUcUnaqBB30pMT
    q4CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886450;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9a/9lEXB8qJ8st84FfwbkbL1zZvDhFs8libsmZjA1Xs=;
    b=Cb7xCygrq1Rn64gKm3lmjKOxl9pnnodYm1pBqJLamiySTaQ2T3zGzNEf+4k2nVDjeN
    hfH1EQ7AWdf8mXS0PTAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKnLuz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:49 +0100 (CET)
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
Subject: [PATCH v3 7/8] MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
Date: Sat, 28 Nov 2026 18:20:44 +0100
Message-ID: <23dd02b96c717f3f3b00f3c2469dcab29bec148a.1795886445.git.hns@goldelico.com>
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

Expand MACH_INGENIC_GENERIC to select all existing and newly added
machine variants (including JZ4750/55/60/75, X1600, X2000,
and X2600).

Introduce individual Kconfig blocks for the following SoCs:
- MACH_X1600: Selects MIPS32_R2 and HIGHMEM.
- MACH_X2000 / MACH_X2600: Selects MIPS32_R5, SMP support, broadcast
  clockevents, O32 FP64 support, and weak ordering optimizations.

Also enable SMP support and broadcast clockevents (when SMP is
enabled) for the existing dual-core JZ4780.

Some X2000 Kconfig settings were adapted from definitions in the
Ingenic-community Linux v6.1.y tree, including changes published by
Reimu NotMoe. These definitions were reviewed and extended for
current upstream Ingenic platform support.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in v3:
    - Remove MACH_X1500 and MACH_X2100 selections, which are not defined
      in this series. Replace the unverified co-development attribution
      with a source-history reference to the Ingenic-community tree.
    - Keep FP64 and eretnc handling outside the scope of this revision.
    
    (More) support for X2000 and X2600 is in the queue.
    It is easier to group this here.
    
    Review: Paul Cercueil identified the undefined MACH_X1500 and
    MACH_X2100 selections, suggested reconsidering
    MIPS_O32_FP64_SUPPORT placement, and questioned the attribution
    of the source Kconfig definitions. Hunter Laux reported a
    separate X2600 eretnc boot issue; this series does not change
    the generic MIPS exception-return implementation.

 arch/mips/ingenic/Kconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index f595b339a4b84..ca9d40fe874f8 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -5,10 +5,17 @@ config MACH_INGENIC_GENERIC
 	select MACH_INGENIC
 	select MACH_JZ4740
 	select MACH_JZ4725B
+	select MACH_JZ4750
+	select MACH_JZ4755
+	select MACH_JZ4760
 	select MACH_JZ4770
+	select MACH_JZ4775
 	select MACH_JZ4780
 	select MACH_X1000
+	select MACH_X1600
 	select MACH_X1830
+	select MACH_X2000
+	select MACH_X2600
 
 choice
 	prompt "Machine type"
@@ -62,8 +69,10 @@ config MACH_JZ4770
 config MACH_JZ4780
 	bool
 	select MIPS_CPU_SCACHE
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
 
 config MACH_X1000
 	bool
@@ -71,8 +80,35 @@ config MACH_X1000
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
 
+config MACH_X1600
+	bool
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_HIGHMEM
+
 config MACH_X1830
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X2000
+	bool
+	select MIPS_CPU_SCACHE
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select SYS_HAS_CPU_MIPS32_R5
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select MIPS_O32_FP64_SUPPORT
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
+
+config MACH_X2600
+	bool
+	select MIPS_CPU_SCACHE
+	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
+	select SYS_HAS_CPU_MIPS32_R5
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_SMP
+	select MIPS_O32_FP64_SUPPORT
+	select WEAK_ORDERING
+	select WEAK_REORDERING_BEYOND_LLSC
-- 
2.56.0

