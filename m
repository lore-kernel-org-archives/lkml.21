Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596063;
	b=VFrUDXaT+sMGXcKQ6Jajn2RU2OZJ4KYccxnk2Fuy76Lom/giHUVZuv4Rrfaq76p3vAOe
	 rnk/+tTmzpqVqbYYEtTEebsIV5t1qsz+mVhmajn7ekgeR9zRXhGg6MFhocS+jclTr6ndX
	 67AlNT3zqByG+oYFDa953AHFcHTFDo5tU2l2cBvWMuWV9lyXju3T+Y78s8OgPRp2TJjOO
	 +P7ynhVj1dWEN2YK4Wbfr9WU/nX/vMx+WlqVRJJIDhx7rmYSvUzXRiZRbKTRWc/U55AJ2
	 f24hdrHrNIREXGS5DWvLPEsxFOQam/Fkx64xm2tTvoyAq2l2aXkd45/4Y4HeTEEigKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596063;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=mGbFcrsUnGLRAn6YkltUGDZi/jGEqKdVAHQR9isn1hM=;
	b=RNo4Y8Z/NDariWYsa4z8FeVNDK34ubA7Gv0vEs1qcezeokHiUeY5C+6apezaN3rzxjEw
	 oBv2AtUzuUquMMNefnrRBHSdClw6YRCQ7BJVI2icFV/s0txKyvZ76rL8coXmPfguVZVWn
	 MFQU/dDCRFM5IOmuujMunt8uZ0yqMppi4LdAncVagQuR6xyHXfoRnIhH/EAXc/xF/evNM
	 A7Oehr/nC6Z9N7vULW5/eh+F31C5pcDM0eHktfAjMEqAXL1RN2gV5vfaLnbiJbkNr6pOt
	 rqPt/H2f89JffQCTN+2VNDrNfw4R8pl0SvJZGZK6m+be+mI6RsNhf38LK7zZz8tqswA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IZrNfC3T;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="SeBDYJj/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105F606A31E;
	Wed, 25 Nov 2026 08:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4105F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IZrNfC3T;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SeBDYJj/
Date: Wed, 25 Nov 2026 08:40:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596055;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGbFcrsUnGLRAn6YkltUGDZi/jGEqKdVAHQR9isn1hM=;
	b=IZrNfC3TMs4EI8PJd9s+ETSFYaJb4UHw4rFLvEAMOurJ8obkvbWgkkro+pD7tsMSbX9iSY
	W5feaa2TuACiyyUBrP4lr/Q+M+uBENUqHosHKDvWhkgHreJ61nSyH+/2VsipvcndULYmJI
	oUdOu8hvCkXWLHYXRueh30h9+ixVR4iJq9Uj08F5eBmK2Zsm3JV59KW6Osso6ti3MXSw42
	Z/zUp7vkVY+Zuq1r3Usfonrg3ETDNUGUEg78/H7iaIn4iAX9E6Kzw/iq+BFtubZRLsZIP5
	5q6Prd6pg16k+HC/ZfZar5hkWMEVaDFw/yguMFT3J0BdHu0ZJgxMEPj8qjpUOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596055;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGbFcrsUnGLRAn6YkltUGDZi/jGEqKdVAHQR9isn1hM=;
	b=SeBDYJj/ZiCjFewHrGibPZEf4wY+1wGddXJXPZye3HKbBIE2PKRQCAOYx6XaQHRNBWCBX1
	IJ0mGKDOTvdsehAg==
From: "tip-bot2 for Leizhen Zhang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/LoongArch: Move the cfi->regs access
 after the NULL check
Cc: Leizhen Zhang <lzsx618@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110000255.1720945-3-lzsx618@gmail.com>
References: <20261110000255.1720945-3-lzsx618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559605358.92412.4470310379900516317.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     c06e6818861dd242022c5acfa039bea994365aae
Gitweb:        https://git.kernel.org/tip/c06e6818861dd242022c5acfa039bea9943=
65aae
Author:        Leizhen Zhang <lzsx618@gmail.com>
AuthorDate:    Mon, 09 Nov 2026 18:02:54 -06:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:24:39 -08:00

objtool/LoongArch: Move the cfi->regs access after the NULL check

init_orc_entry() takes &cfi->regs[CFI_FP] and &cfi->regs[CFI_RA] before
it checks whether cfi is NULL, although a NULL cfi is an expected case
(unreachable nops/traps and STACK_FRAME_NON_STANDARD functions, as the
comment right below says).

Forming a member address through a NULL pointer is undefined behaviour,
and it lets the compiler assume cfi !=3D NULL and drop the check that
follows.  The x86 copy of this function has the same problem, and UBSan
reports it there on every defconfig build.

Take the addresses only after the NULL check.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 3c7266cd7bc5 ("objtool/LoongArch: Enable orc to be built")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Link: https://patch.msgid.link/20261110000255.1720945-3-lzsx618@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/arch/loongarch/orc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/loongarch/orc.c b/tools/objtool/arch/loongarc=
h/orc.c
index ffd3a3c..960b59d 100644
--- a/tools/objtool/arch/loongarch/orc.c
+++ b/tools/objtool/arch/loongarch/orc.c
@@ -8,8 +8,7 @@
=20
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct inst=
ruction *insn)
 {
-	struct cfi_reg *fp =3D &cfi->regs[CFI_FP];
-	struct cfi_reg *ra =3D &cfi->regs[CFI_RA];
+	struct cfi_reg *fp, *ra;
=20
 	memset(orc, 0, sizeof(*orc));
=20
@@ -23,6 +22,9 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state =
*cfi, struct instruct
 		return 0;
 	}
=20
+	fp =3D &cfi->regs[CFI_FP];
+	ra =3D &cfi->regs[CFI_RA];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type =3D ORC_TYPE_UNDEFINED;
