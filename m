Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371864;
	b=bLYp0tcAULrdHWM6Uy/ZUBUSvr1Snh+cnPAsQwTQsvjl/FNSTXMa1s/S6ov9WK29ih7F
	 yQsL4D04OQ45L0QrZ67NPnUGJTIO7QnGAQuCUbCRQ4Tpa8G5jGhpyyprx/PYghVun1Hkj
	 802XAMZ9FHHkhu1ne4vCFbx/myYcxsqAQ+iALZIOqGIk0grigKIPJzAysJCv0yUf31U/R
	 OC9xWIGY1imdJv1pGoDUe1Pe/ToM3ubnsmVXX5eLU7USuUTWZw+/F4PUIjMqef2FJVEOo
	 /lk5rKnHJKOs4PzzEXoinbRjyGjdZFCLVT/v9jiCU5vzUjB/jEA81cSx0mOSnYUugcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371864;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=3Cfvn8MwvsJ6IYbSBjRAuULHLw/EUrLYwitYQBymANo=;
	b=Qie/OKeG/qm/k8g0H1CiuIkowFDTJrdipC0IXPKXbNm2OLyaTmFacr0VQPLv0bB4ETNS
	 gUMCWT9yJqgPMt2mhsJENvhRiLy8VO9qrBac15sJMiPxHcaZUHL+q7qcnjTRlQW1NEclV
	 rSGg0s0Um323q+M+EnAeQ7J3bnBkT2EyvhePCKXQnoXgcZaG+9yG0r70TcIIG8cSk3VjD
	 jTZaF4hb8j0/Bqq4qxmgDM4BjoZK1q5OGamvbrcgmrQNyL3PUEUImlDtzwy4WmUujJaAy
	 QtinROfG2Zj/zSbbWz9XI9nZ8V0/v/Eh09sOo4/vg6JwfLpCbgPoDWirlmC6vSLMqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wn7V06mL;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB0606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CB0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Wn7V06mL
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jXcsp0bcCzMlLn;
	Sun, 22 Nov 2026 19:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795371854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Cfvn8MwvsJ6IYbSBjRAuULHLw/EUrLYwitYQBymANo=;
	b=Wn7V06mLYTAqiuUHFtTalSdqdUBHbQA7sdkrhJuVwrK5Mk5kUd8QXVFhkLcqH3ITDwqPdD
	oLII0QxhiLLNKPJBzTQj/tePMCK1ur6660xrpK3qqjP2N8I4yrjiRehc4GlGJcTLTAHB6c
	AdrkFsjNFBP/ZiTYOT6R4fmFGJwbpAXNATgD4KqYJYBlXR+4HYdsGtOt+YC+mTzs7eHlNa
	6Gf7jqpvQU4LWeyW6UMnbRoTp1T6TxrhRQ5LLtpPEtAR89YMtHNaJTGghblgkt7hTd2N03
	s+m54ovRkjyNAab90adlv3LYBqRcTcfSOjXknrsjlDjHea9nIdiP2ainUGmKFQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: fix kernel-doc warning
Date: Sun, 22 Nov 2026 19:23:46 +0100
Message-ID: <20261122182346.1479340-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-ID: 7f7fe48fad2a4e8fdcc
X-MBO-RS-META: cwf5dhx8jd1i8xu6ugmr6eqfnzsixakf

Add 'struct' to kernel-doc to fix:
  $ ./scripts/kernel-doc --none arch/powerpc/include/asm/hvcserver.h
  Warning: arch/powerpc/include/asm/hvcserver.h:30 cannot understand function prototype: 'struct hvcs_partner_info'

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 arch/powerpc/include/asm/hvcserver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hvcserver.h b/arch/powerpc/include/asm/hvcserver.h
index 2b20403e9f..b26340c43b 100644
--- a/arch/powerpc/include/asm/hvcserver.h
+++ b/arch/powerpc/include/asm/hvcserver.h
@@ -16,7 +16,7 @@
 #define HVCS_CLC_LENGTH	79
 
 /**
- * hvcs_partner_info - an element in a list of partner info
+ * struct hvcs_partner_info - an element in a list of partner info
  * @node: list_head denoting this partner_info struct's position in the list of
  *	partner info.
  * @unit_address: The partner unit address of this entry.
-- 
2.56.0

