Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=38h2AnNL7GzU5s0Xd2yrYgWMLzOnSW+lpNbrGRt0KUMLAxoqURRW6e1OtG3WUJgbZUdB
	 5iEN7t9BEYfFkNIvLJEP233pshUNV7j5PvXbco0B0aqC4AXZUQOCRB2NpI0Z7S8QdHRft
	 uMOEHUacMrGESkuvQqKbfHWrwtNu7l5GXf2467xAwjEkBbQm5ThoH95++mbW4Y05V8pt4
	 YRWDlboIqxMlor26Fd0kEdk20rav/kgl78R9WaFN3yRKnUooN4DAMZftcWj2Gv+pcdthZ
	 ynrdrhwGaVBN3UAIMltG6CzyqgMLmlnweiBfZn+RYM8lzhKcdTGBVoOUoYJ6OtY9jdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=9J0gjkAZa4R1AuMMT4RrhPwnCMnL2s8Sb/ZcxxNaf30=;
	b=xrlQDH8Z0VoHTRXIN1gHzne+xqwdh9BAaUHHyimkyWzdTFE/eSK5ClAcyG89i9++tNrL
	 T0Q97HCDwy8Y2JVxfTLEAW0iIJHvvJYPmpWKw+zABylGa1EUzWCYU40cz+Q4tUbeHpORb
	 85DD0WjDo4J7diSk0kATrbwskrT7P9mPnEekwnAeHekwTLl/QZmGHgRDia27wyEY3Lkvy
	 97VaxW37WYPsZXfFFVvqNJf+86CL3vcZbVyu1y4GZppAlcQiLasQdmhCHklTxsBNlk0SX
	 fCBIP3WreAjC38rpH2aSEfMDjEW1fZrAilUNmMcgh7tIyW8m/ATIkyFdJJezboAK9pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dQHpbP1a;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eX1sZzWs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.82
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117F606A326;
	Sat, 28 Nov 2026 17:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0117F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dQHpbP1a;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=eX1sZzWs
ARC-Seal: i=1; a=rsa-sha256; t=1795886449; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=irrcx3A09QQO7/79uwPuG4qh6Wmr7V59hj3D/mTSlrM5uo0MqDrY77ezLFXFYkZJyk
    QLot7pFJmPqFCxGUJW4t1/qOgNom/6QM4Rb9FNJ0vvqwXD/Q/6zppojWSmqz3TvySxtR
    OsVIS86PsC4fdzkKQcKQLcq/tzZ89sjtd7fZBEU6vdrnAbkpwT0nKg/bqLw7QQ/tifc/
    KjDnrSrFAsBVRWX+45DRhisYAzLQp8Otcl+MlL8dlby/LvMo/1pB/bUBGCCAlyODqfPi
    6LeV+VqQgs+29NsQF3ORLgXp8CXpRiczCx6M2BDrOT5K+uj/FLqp/H31fKn2Mz0BV6u+
    JkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9J0gjkAZa4R1AuMMT4RrhPwnCMnL2s8Sb/ZcxxNaf30=;
    b=rCzCZcIs8O1txsi7Z0ETaVhuLbllyPSDhtcqAGIglCilZVmDKcIFb+TFwmZT1MvDly
    sGPhDVbsDXBq97ukJsJbtCyI1ACKoM2oZXUQRQ9xJH5dlVEbP8dHMiJ0JAMWqXdQhhiw
    bP7EmihmKLpOrrNh+M8GFPTR3PTcVQQTpuC4QsY/PkoYuBIZliSSyh4hURR0p1vM876f
    04ulOnVjuWKEwETCrlWqTF+rXrM01sa8eXGdMtv9KHodc6BH8wnkYBi0lNV90NNLrpPH
    t1ld9yWVW+ynW9J1Fi4CI5lYmaozCL5DOdqrIA7pkQsN/nqCaO3cQGg43tMD+Bk7OOC+
    TucA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9J0gjkAZa4R1AuMMT4RrhPwnCMnL2s8Sb/ZcxxNaf30=;
    b=dQHpbP1ajcTxLInLtSWlHr4N7jx4eNwv2c5uv/D/vXA51xyycouzXk95GHzXbnTaur
    9INt/E7i7pEueJ/4he9RiJpwoNN5jY1MP1dXtQifdqWOH3SL9WSv1nFnOzMU5WD627fK
    iBoOt9rMUN7Q9eYWuqhltwm4esq6g1p44dBrxggclY2uo/+RcBe8wyWn18FHr/meIhGm
    KYypofATmi57Ot2lzQH3Z3oa6e9Evmfzxp3FgrTd/5RPa/6vk/58YPDZzD0NrqQJXuYL
    +dn9+WH78CZrjMtyUqzlVASlDVGBI6ZJtejP6takMfbXbSilsifMj+EMD9bvzU6W/OAJ
    1fSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886449;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9J0gjkAZa4R1AuMMT4RrhPwnCMnL2s8Sb/ZcxxNaf30=;
    b=eX1sZzWs9cvvvBMO3MqiKIROp1QpWGm2/wkxQkVjDNaQ+b4deCb7Lfvv0wnJ9pyVbG
    CXYjWb0V8K7byV8lfYDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKnLuy
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
Subject: [PATCH v3 6/8] MIPS: generic: Add MACH_INGENIC type and compatible for X1600 and X2600
Date: Sat, 28 Nov 2026 18:20:43 +0100
Message-ID: <81319f53d94567afe8377cbd4e084c3ba085f533.1795886445.git.hns@goldelico.com>
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

Add support for the Ingenic/Lumissil X1600 and X2600 SoC by introducing
new machine types.

Update the system type string mapping and add the "ingenic,x1600" and
"ingenic,x2600" compatible strings to the DT match table in the generic
Ingenic board support.

Extend the existing Ingenic power-management initialization to
recognize CPU_XBURST2 as well as CPU_XBURST, preserving the previous
initialization path after the CPU type is distinguished.

Note that we do not separate between e.g. X1600, X1600E, X1600H since
they differ only in built-in memory size which can be handled by the
boot loader.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Note that there is no bindings document for any of the compatible values
    so we don't add them.
    
    Review: Paul Cercueil noted that the SoC compatible bindings are
    incomplete, but accepted leaving their cleanup to separate work.

 arch/mips/generic/board-ingenic.c | 8 +++++++-
 arch/mips/include/asm/bootinfo.h  | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 1f4906875e7bc..5840293913977 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -24,6 +24,8 @@
 static __init char *ingenic_get_system_type(unsigned long machtype)
 {
 	switch (machtype) {
+	case MACH_INGENIC_X2600:
+		return "X2600";
 	case MACH_INGENIC_X2100:
 		return "X2100";
 	case MACH_INGENIC_X2000H:
@@ -34,6 +36,8 @@ static __init char *ingenic_get_system_type(unsigned long machtype)
 		return "X2000";
 	case MACH_INGENIC_X1830:
 		return "X1830";
+	case MACH_INGENIC_X1600:
+		return "X1600";
 	case MACH_INGENIC_X1000E:
 		return "X1000E";
 	case MACH_INGENIC_X1000:
@@ -146,11 +150,13 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
 	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
 	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
+	{ .compatible = "ingenic,x1600", .data = (void *)MACH_INGENIC_X1600 },
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
 	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
 	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
 	{ .compatible = "ingenic,x2000h", .data = (void *)MACH_INGENIC_X2000H },
 	{ .compatible = "ingenic,x2100", .data = (void *)MACH_INGENIC_X2100 },
+	{ .compatible = "ingenic,x2600", .data = (void *)MACH_INGENIC_X2600 },
 	{}
 };
 
@@ -188,7 +194,7 @@ static const struct platform_suspend_ops ingenic_pm_ops = {
 
 static int __init ingenic_pm_init(void)
 {
-	if (boot_cpu_type() == CPU_XBURST) {
+	if (boot_cpu_type() == CPU_XBURST || boot_cpu_type() == CPU_XBURST2) {
 		if (IS_ENABLED(CONFIG_PM_SLEEP))
 			suspend_set_ops(&ingenic_pm_ops);
 		_machine_halt = ingenic_halt;
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 2128ba9033911..f6ae983577f6f 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -81,11 +81,13 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
 	MACH_INGENIC_X1000E,
+	MACH_INGENIC_X1600,
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
 	MACH_INGENIC_X2000E,
 	MACH_INGENIC_X2000H,
 	MACH_INGENIC_X2100,
+	MACH_INGENIC_X2600,
 };
 
 extern char *system_type;
-- 
2.56.0

