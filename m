Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=R5B8JumBkh1FwkhmsAOGrVRyovju1gkYWmgFFmzFa6NbzjEyoG076pqNUydXYHkEbzca
	 tmJ0R3EnrdlLPDwNebW2Fz2hegLAYeVv/I4DShRwB6/06cjDGqqGD5j6itDlTxgxXK2jW
	 kMH6Rzg3ZH7zx4zxRZgoMnDBsu84c0E6NW7abINSLQs1KqEi2ZuGrBB664dAVB3gEvsM+
	 VPhTXCNT38yd+c8BCjcnMzgMgMpALZYUIRLkJQ7eV9LFzKRNFP6NLv7TLZI2039OXm5/n
	 EYtpm5UxIlSMvcxVSRs6Hx+e3J9igeS/bxDfboikDV+LcwXmhslixc/+lH46STmQ72Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=M9EsjaqiVQsCLF/2cwIHX0amkg/FIrAWokXG6bGJL3Q=;
	b=Vx/aBTfyUQJ+e7fkf6p5da6ovQLtM4IDxNksSP9tPYXMzdRurkGjvXUdMM+Hz+PhcZeX
	 cln9HCU2TUyXxnWkLmMDenGDL4s4LOCeCPptrq1efqbUcbbyI/qMuMyKx9Svjy0ECRpwH
	 ebzrtl5HCyHkxo+yWva2cbscXLmdJq9MUe99P7LEcuaymhKBEZicdRChnySk0qVJs1U9i
	 xH0nhqe3TiErj65GDVQfDxP8iiGzRbvfrrSCv8LIMDQ/eh82U9aKzzpyRrrBNBf4RqU5N
	 Jup9q9j5YmUrFT3TU4jDXdWGs20vrSTxE6Thi+0VOWnxdbwv+GmSa4ySiESwNRiP0AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jYx7eQLs;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YIRhby7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7A606A321;
	Sat, 28 Nov 2026 17:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jYx7eQLs;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=YIRhby7t
ARC-Seal: i=1; a=rsa-sha256; t=1795886448; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UyDYj/CvBd3eca3vGqB7X9J6U4LTjO8Pq7fitVTKboMlo8ISEwAfYPT5g1kPy0uzo3
    yvdMrZrDs/CbR9ULTxtxrowlr88akPUxugMH5La74s7JahKqboq7GPTLkifJxK5yP+Ta
    rhloXgcS/TvbCUI4Zad8mcgjwZFDlZGEWznPLFqQJQL+repEvLxHX3q3mymAU9WBF8St
    Zqx0MTHOHumyGbiqsfrLqYWBYtJpy82AMIG2zBx8qXskT7ZBy7Qn0t3ToQ3NN6gi3LW5
    C+8CSF2c3NX6Q8PcPcdzaJ6hwwLQjSC5T66QE/VhP/kiWaQYCO3jSZW3pkF7oMtqwrZh
    fCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=M9EsjaqiVQsCLF/2cwIHX0amkg/FIrAWokXG6bGJL3Q=;
    b=h2bEFpR0Llw6IIZLwHr0kP62QrBH2k8mJczs31BJM/0OuhZ+KDNTlRbyiaXFdZs/ky
    IZd07HEYO0IJJN3OHJoH5rgx0+oqm8mUOQT3TCza31hzPrvDWzyVUkajCpsTq1o5ris3
    t3FNX/bdI0vsQ0fAccwMny0HEfYgG2ktNLFgi2NDZksX/DMnNJ8RTUBWMidQ1aC3wgft
    BqrpQpqLXlsnGidsEEddw9h3lyywLdtV3F0p518RBz6T9KAN8ttEbuLAbw5zmVh1OjQD
    RQJHPsxPLsC3ccHXTWkPabr/8Q21eFDPHQSOX7y+NubeOlf/NCeUitiiHbaHgYaVd2Kt
    Iy0g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=M9EsjaqiVQsCLF/2cwIHX0amkg/FIrAWokXG6bGJL3Q=;
    b=jYx7eQLsg5tcP5tQ7p32FB6ncXQFN1kYiAF589e8/cRGVCge0jHE0O4AzRlgJfYoG2
    BuPe8PhCc6Mm6HCitZC8+BjXXjpQEAqTzip7VLVSydl8FfEJImpz0S0Ge68+M9UJy1yY
    53fKbsjlKJDy4z6wZN9LPuZz3HBc8MboZyGC++qGbA+srZSGN62pwEKRJ0391Vp1Jkpl
    lCawrtQmyxsSfQETPfMKzQ2La7+q8TXxLQUa+qpg50oGCl67wEPcwTfJq2X/0sZF6igk
    aQDeZ8sI2GhfB3cKakJn0tmu7EN5RYs2Tqm4CNU+35L1n/MHog4u+bq1nR9GbA7jo1le
    /PIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=M9EsjaqiVQsCLF/2cwIHX0amkg/FIrAWokXG6bGJL3Q=;
    b=YIRhby7tMvoQ7E5qEW85t8quXc+7lnsIcvdOZrmyAwkvamOukeem97YQ6/RzQ7MEW9
    v28tkLwJphWEKJRpoyDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKmLuv
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
	stable@vger.kernel.org
Subject: [PATCH v3 3/8] MIPS: Ingenic: Do not force BUILTIN_DTB in Kconfig
Date: Sat, 28 Nov 2026 18:20:40 +0100
Message-ID: <0dc01e3a7a5de5f566be2ef6cbff1860af489913.1795886445.git.hns@goldelico.com>
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

Remove the unconditional selection of BUILTIN_DTB for MACH_INGENIC
when MIPS_NO_APPENDED_DTB is enabled.

The current Kconfig logic selects BUILTIN_DTB when
MIPS_NO_APPENDED_DTB is set, although this configuration is intended
to prevent the kernel from appending a DTB to the kernel image.

While the kernel gives precedence to a DTB supplied by the boot loader,
selecting BUILTIN_DTB still triggers additional build steps and may
add unnecessary code to the resulting uImage.

Note that BUILTIN_DTB controls the build process, not necessarily
whether a DTB is actually embedded in the kernel image. For example,
CONFIG_BUILTIN_DTB=y with CONFIG_BUILTIN_DTB_NAME="" still triggers
the generation of .builtin-dtbs.S, but does not embed a DTB.

The goal is to allow a configuration in which no .builtin-dtbs.S
is generated and no DTB is appended to or built into the zImage/uImage
so that the boot loader can provide an individual DTB for a generic
kernel.

This change depends on the preceding patches making BUILTIN_DTB
user-selectable and enabling it explicitly in the existing Ingenic
board defconfigs. Backport those changes together with this fix.

Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in v3:
    - fix Fixes: tags and add Cc:
    
    Review: Paul Cercueil pointed out that the two Fixes: trailers
    should be reduced to the verified introducing commit.

 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 749d8cc7855aa..156cf9b9ffe98 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -127,7 +127,6 @@ config MACH_INGENIC
 	select GPIOLIB
 	select COMMON_CLK
 	select GENERIC_IRQ_CHIP
-	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
 	select USE_OF
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
-- 
2.56.0

