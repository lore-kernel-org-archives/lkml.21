Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886464;
	b=scY32tO7M0Fc2FCyrmNCUw5ecOCShY6TQN95AMvZE0TQw98NsXm8BS22aovJ8cjnsPIj
	 W51WLSFvsveaE1roZA/dDYSuSPrM26rI+gHXkA/Zrf1FSAT2fxOF21ITb6N2giJPHk7UP
	 +0Yr1cCxxYg33lY9ws68WlgaK1oTRGP96Mltapf4xLsC4XENGQ7MKKUWitToliWGpdrVN
	 OLJ8Jzl4rlmbHz1NgDVTOee1/6SEf2yWNSupc6nLrLrRctmCIbgd4yZWWUa88MqsE7eqg
	 YbCpfA35yXghmhgBQ/P8TBjWHYDLkyZtXQfZXEEqaZqXja3TyY4/3bO7Ch88mWRDlnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886464;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=iOI9VIN6SZ6Mg15PlTF46qnjDAVh89BHch+sy/feVvg=;
	b=dd6aH2Gnyacem10VLl2KtMTCL0+zpvR9gwSJk35+r8SmqipHT4CTV48F/bbLHjvVSYCG
	 2IM/h8gE8/McfVDnKJb1vA7Y/HS3RIILLltKSjCygMLFkrPeKgkhimhtjmt9GzqA1Rg7b
	 fpDZIQM62b15aLgyHBQPUKZKSgq+Nsaxaqqn81hPhMUCRGAYJq4JSMAbcTmSgLcoyVUVI
	 ELisDQ0SqLDKbXCKaTRLVM5sI/eH+BUaOMNkqwh4+EifTrQP5ClfArXUtTym95JwFKeon
	 GrNxuUMvmnDT8Ql8X3BHYxjeyp+DDsFu5Y2nisMXoLc1FA00eIvPyJhA28xUseWaQCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZnhIOQNo;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=TAzNVBby;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDD606A324;
	Sat, 28 Nov 2026 17:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2EDD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZnhIOQNo;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=TAzNVBby
ARC-Seal: i=1; a=rsa-sha256; t=1795886448; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tS2E0O2i4krX1TMH+O+VxfrhIVh3S9Kw8qnsbK1XTJB1xF2R45Wy8BD8HjeWYbB6V5
    RiTVLgQrCZRaPoHxNOxQtmQ5YhpYpDaJGpezfEd7m9mpsIV2SyqDJiHUd7BIP+oxO+cf
    CWddEXDX/ORV1oxJd5VNULISN3rOu7P/ZKRrHXfsbJgX343lGBkxl6VHWCS9qNIzOBb/
    GzWQxHk6dSuwIvA7K91BTKIbUoVbxSC9N/+iekeVnb0skPnvx39DLZIS2WFqzYG9WGSn
    3VcEGa2T6IL44kpvDD3vIaF8yuGRSQtT320KFHloIvPtfNyBuPrHoWXmlyLZNwW9WnNF
    u8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iOI9VIN6SZ6Mg15PlTF46qnjDAVh89BHch+sy/feVvg=;
    b=L4Xq2wuQt6PXUPCE/AL2SOP/BSkESOrLVp/xTCYllyVVPreZH/bIauW9o7wMkEwDER
    Kj5vIDQH5nD1Ff7FIpv3Yh536JasZcpff7HIsA86DheonpgjZ4Duf4MbxLlALYQEDMhz
    RkqRKJXCvn0JbUUDXWSUXqHItsEXRM2ew4/2KjKH3Rz10Lysi8zshn377LCNNqXEdQBo
    X/H6PJlJmhfPE4wUCzLwK+9wIGzykFiXh38EwccATYZ1JSCbgCUqx+RxylyuElE4wqZ/
    Q3p50KA4TBJokhsEF5hRhxKCRv/ATVddl2AZkxDV2N3JJrwnXdT7r/2bHNQ2xoJzCRq0
    /ZVQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iOI9VIN6SZ6Mg15PlTF46qnjDAVh89BHch+sy/feVvg=;
    b=ZnhIOQNoAOP5NJn5oO2mnIR6ntZEngs+M7ELMngbx/F5ypq0DVHZvyQIXGnuMNATVi
    jB56lQBqPFH8Qd09/SLzC+TNVHFoSSEYpFl8Utr+twZSRCgMqEJo6FvoURVY+UYIDEX/
    yRjGayj6DhUczeJ3EMbKXcRmTN7ZsAO5WvD/c54EEqS7ygoTJNAxGjmaw44StdsvF4RF
    aH8x5bsHVt+lLJ+MLMHABJjH2M2SnhPdt55rVuL0WGQgt4Gpz6V2hC5PgnOgsj2sQGtN
    yaJWi/jtLYEFQnU276jReDUGasBk2CRAfeMpy8PEsRaZm8okCMNS+aSCAqjt8ZkxkXHF
    iI8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795886448;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iOI9VIN6SZ6Mg15PlTF46qnjDAVh89BHch+sy/feVvg=;
    b=TAzNVBbyqW+di9iTHI4X7rFySaP0/INc30HSn6MEjg2naUQzTF538feNeorTvtHpC2
    SA3nACLstUTeVJuZDsAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQ3ZpZn8iNpUqkTkKmhC9364Jszk5ZnVOZOaxS"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22ASHKlLuu
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
Subject: [PATCH v3 2/8] MIPS: Ingenic: Configure CONFIG_BUILTIN_DTB=y for Ingenic based devices
Date: Sat, 28 Nov 2026 18:20:39 +0100
Message-ID: <b1fe5ef18320dc9b3c4447a1442eff5c57a51076.1795886445.git.hns@goldelico.com>
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

Explicitly enable BUILTIN_DTB in the existing Ingenic board defconfigs
to preserve their built-in DTB support when MACH_INGENIC stops
selecting BUILTIN_DTB implicitly.

Leave gcw0_defconfig unchanged because it explicitly selects
MIPS_RAW_APPENDED_DTB and therefore does not implicitly enable
BUILTIN_DTB.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in v3:
    - Leave GCW0 unchanged to preserve its existing raw appended DTB
      configuration.

 arch/mips/configs/ci20_defconfig       | 1 +
 arch/mips/configs/cu1000-neo_defconfig | 1 +
 arch/mips/configs/cu1830-neo_defconfig | 1 +
 arch/mips/configs/qi_lb60_defconfig    | 1 +
 arch/mips/configs/rs90_defconfig       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417ee..b45a6c7b54ea8 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -23,6 +23,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index ed2a620e4f86a..a505de6e9e367 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1000_CU1000_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index 9b4aeeef58ceb..1fa7a49543063 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1830_CU1830_NEO=y
 CONFIG_HIGHMEM=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
 CONFIG_MODULES=y
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index a1bb0792f6eb1..18fe70487817c 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -9,6 +9,7 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_QI_LB60=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 8382d535e6dc1..0c57d829d1720 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -22,6 +22,7 @@ CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_RS90=y
 CONFIG_PAGE_SIZE_16KB=y
 CONFIG_HZ_100=y
+CONFIG_BUILTIN_DTB=y
 # CONFIG_SECCOMP is not set
 CONFIG_MIPS_CMDLINE_DTB_EXTEND=y
 # CONFIG_SUSPEND is not set
-- 
2.56.0

