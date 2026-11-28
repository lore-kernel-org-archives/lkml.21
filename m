Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=D5k7S+JCcZCZ+9fbGig/qMNiPlDYEsLyN1AGx7RMOgAi3KcLmeQfgcep1bbwlSBQ8UTj
	 /4SZ/Be62dlNWKamcVIQl37LXDn8Tn/7k4f2pxtM8pMy0OOovyeK45WCj+0BkK3gopS6V
	 dNiP3RbuXEteiTUXxTVgq4ZGHDcHUiSzCEQCA7strJvk3UEYf9Jp28QbLbhmgpzLTAvOb
	 y1y1xFSe+CjwpM+fInBKjMi82JKxgBs3lwrDQabppphXCHWFrZt4T6/NWNtETu2cFbU69
	 KdG6oRmgUMHzVdDpfqulhscHmjKsASHeYkRE8ycWGWvac5u51fUjwICNJOJAuW5puPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P1JTs215gU/ZSDVcp/yyWiA6quEVJHQB/+I3aXuvfJc=;
	b=5DI6H3KV+oURnjc4meWuCkqyKz4UiKZYGgu6nsAYTqN/cJ8Z9l80OKSZEd7RftluYggH
	 rcPVn8taM8DgkZdlxQM0GLVAzasKUIAPyDvG58iQ8g0P22GdxaDRDCdpkCkL3R5MiWw1a
	 r7RQxN9/cnLImZ8JYbSU4ZeNn9/0Va6RJ8q6prkQBfN6KE6eElnhWFD8KaOngu0agw1x6
	 Jd8iIRruVAgFWK8sZ9DvqG0Vd3XKeK7/Gv7oGEHMROsqH66Ei8w7XzUuhzJYh6/1HPpsg
	 s53SCym8b5nhx2ZFYA6hYmz3WEI32FK1Hvxxu9cr+i1pWXfe2hIMZIbsB4RmsuqGB3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZiLmkGb1;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pVfClYQG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.169
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC5606A325;
	Sat, 28 Nov 2026 17:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDC5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZiLmkGb1;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pVfClYQG
ARC-Seal: i=1; a=rsa-sha256; t=1795886449; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qGPVqp3MgquorrqPvsqHACZ3DdH88xXY/Z+rjjnyUvwIpjitCVIIhWnI+mvnLJ8lok
    DRjbA40wesjEh6KGjjgYjRDNCg4r4Ziku+7SxaqxDZzU0qJQ7b+8FsVB8/QMVXlXoAHG
    3p3E++sfEfcIxVEzPcpYmFNeA25Q6Aor0n2g/Nhwge6F/+At/uXjOFPckRCLS2J/Km6l
    +b4+XxkigSmE7evpyuyfjlyDsiYonKS0g2nuc9sScvAucLTZv9GUuGgdxDkhrZo3WOUF
    7XlpdSWUp24yfIV8+gIg0vo4wEA3GKYEoKcRBAG8Z8CnCCkxZcbEB/i+W5JeTTWRIEB5
    B/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=P1JTs215gU/ZSDVcp/yyWiA6quEVJHQB/+I3aXuvfJc=;
    b=KZqxcTlj+mZo16Fv+/sTdsiZGuxsbVQ47UUGO283P/k+q5m+U67G1APzM5A4xJ9P3O
    DcNBj5XfgFkJP5mr73us1MfI4pTWrWhM9WOiwwHPFf+z/ybn4dDFbaoHfAvgo9wFy7E/
    Hm8QRoFBGrI8MfTzfWIULulxcax8DPJYqvZRdFRAhLyMVgVeQI7Ul0kv9d30H6vSpr1l
    jqvAVRcPwSljNazl7z51hkx/okmJeBnXnZJgEFl7W09hR1YbcGPhwkQEBjHiYuO6saSr
    /zniaF8zZB2iL6X8dAnOeZ3EcW1qqNXFnR06o8Wz8zxj3OMGOGHRTJ4nOTvRtqrrLLXv
    lSKg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=P1JTs215gU/ZSDVcp/yyWiA6quEVJHQB/+I3aXuvfJc=;
    b=ZiLmkGb1zhKpNzgsoa4NqgDK9XGXBhExfGvwTrvV/k6uewcmwZQa+NZaZZuVT+7VZC
    sweMmGE9gMa93DmEQEMW2pVm+kp51hUWlcQjeAyu5PKCnBJfPLgLCJ/tbrqIbCORZ6Dh
    n/ZFLTcErlmDol5L9vB6iI1tjf1uEl/Me/4ShFpeOjnT3fKhmrwy0DDSJwPYL8ICYih9
    aDthbamciCJkz2qv8xcfr/GQUjZJSSThdM8PgU1llt6Wo5CCJRSQ0gDi9gbD5J7Z1okU
    h893/qZYiKT8GngOPKx0bQdMyvf0xMumgvCHVYzFI+HfCzFLEmnIUS79ldF9uT6k7Tdt
    fV4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=P1JTs215gU/ZSDVcp/yyWiA6quEVJHQB/+I3aXuvfJc=;
    b=pVfClYQG7ND23koKFlwQit+coiOAc4iTmTzyz7KEpiws1DRGzkEJiNsm7e6vnYAam0
    /RRvWXIJ0pyka9t5gcCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKmLuw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Nov 2026 18:20:48 +0100 (CET)
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
	letux-kernel@openphoenux.org,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>
Subject: [PATCH v3 4/8] MIPS: Ingenic: Add a new CPU_XBURST2 type
Date: Sat, 28 Nov 2026 18:20:41 +0100
Message-ID: <30f3d9cfdc0f9fd3e61e43e0ef6dbed530ee7182.1795886445.git.hns@goldelico.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Add a new CPU_XBURST2 type for the MIPS32r5 compatible XBurst®2 CPU.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    This patch solves a build error in
    
    "MIPS: Ingenic: Update Ingenic XBurst implementation IDs"
    
    reported by kernel test robot.
    
    Review: The kernel test robot reported the build failure which
    motivated the separate CPU_XBURST2 type patch.

 arch/mips/include/asm/cpu-type.h | 1 +
 arch/mips/include/asm/cpu.h      | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index fd37a44a2f199..25a181fd0eb7a 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -56,6 +56,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R5
 	case CPU_M5150:
 	case CPU_P5600:
+	case CPU_XBURST2:
 #endif
 
 #if defined(CONFIG_SYS_HAS_CPU_MIPS32_R2) || \
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f1..add26f08e8029 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -312,8 +312,8 @@ enum cpu_type_enum {
 	 */
 	CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
-	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON32, CPU_M14KC,
-	CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
+	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_XBURST2, CPU_LOONGSON32,
+	CPU_M14KC, CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
 	CPU_M5150, CPU_I6400, CPU_P6600, CPU_M6250,
 
 	/*
-- 
2.56.0

