Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596062;
	b=4ua+r+nKiTtVoEVyhsgiXJ4C+33STcT9yIb37eVWpz8VrjJZMQEqMU3wR06bWkSSfBx4
	 5lSbDND3qWExdRNmxpijGV1ME7Pv5fkMHppdBfnO/2p8vyfuJZ9f1OmAkKQFsvR7ISUHa
	 lzvp90P/tn5NiJvntAF8GXOBJcFhGIlUX34Sl5KSGCOG7Q8kMvoPvoLUotu9/ICuy04h+
	 INucFd8hnL57ZHOzuEPz8DRNcIS0h0ZEiCar+XThDDUgC2Pp1oFHI9yDXRugLJ2hc+a1e
	 eiEU6OlpjI570slOJ9zMDKghClb6F8LF+FrTM2Fen++NZjcRKg+FuGuXsj2M6p7T6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596062;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=qU/Fa1HpdETAz28g/xMNZdZgsBwV88yrONW3Cm0WlKg=;
	b=sYXb96qeb59r3S82sx/7fb8PkKgVfFRxGF8ZzpDdp1TkJvxom+NvYrTDCAKYG3Y2NQWs
	 1kn69rl1nneo62XIgFrXHn4q+LOiwTH04w7M/1SerLEA5RnV8lXCxNrnkCdBApwq+CIJ2
	 bhmY6J4JwVpwK3d5jGG6s3xlphp8oMWqw4FnL49UAjJm8HSda4PLkbdaEoSZdh5lXUD/y
	 qqWttCW91E92LVh6DqQPQeEWdjKlsGbwVLTa2BwuuIL8pYJC3/gKT/AamtDd8M83sJNjp
	 MYTSUEiIPxX++5JGEUkhVhLJDNfysiSq4N2ey4vJyFuO/x+ZdsA1Ci4/beu01mM6bcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XUTEQENq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=706HhdiL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41077606A321;
	Wed, 25 Nov 2026 08:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41077606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XUTEQENq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=706HhdiL
Date: Wed, 25 Nov 2026 08:40:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596056;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU/Fa1HpdETAz28g/xMNZdZgsBwV88yrONW3Cm0WlKg=;
	b=XUTEQENqNn6XWCU71I3imtZgqd5TJkeFY+zBL9+zEnB3PQn+frklRLCDR8rPL2UbNHgpUl
	/s5Vfej0kGT6b6QsFPMiuxiZ74epPe2aCnWnJ5drt7p++dqaXEhP9LpoU+GHQHqKjQyHUE
	Qa1EOXs6n75kNcmHhcv6O/TH4YUm+vEi1sJs7OPfeBRjBCT24tryLGXygxwVydgqcNkzGJ
	uIWsmIw0tWdO5fvPE3Kzq2/a+OoGZ1DBEUFt+AlPWwdr5gEF2CaEFNuwYt2mjhSeE0BgGe
	XlqOfSDPWsrg9umtvnQTCEKcYOabOKB4iJrLLh3nqYyL5bSfarM3tbZCscXRGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596056;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU/Fa1HpdETAz28g/xMNZdZgsBwV88yrONW3Cm0WlKg=;
	b=706HhdiL8Gd0T9jRc4Rrf9ucOk2gWUKYwfvxgnZzLE1jE/LrFDgFCkXw+DhhyfQG08dJtL
	P3yca8XmWC+YpJBg==
From: "tip-bot2 for Leizhen Zhang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/x86: Move the cfi->regs access after the
 NULL check
Cc: Leizhen Zhang <lzsx618@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110000255.1720945-2-lzsx618@gmail.com>
References: <20261110000255.1720945-2-lzsx618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559605521.92412.17639575786709423534.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     a28b5c2b2a2f6fa30e06d7515c644e519e5cbd77
Gitweb:        https://git.kernel.org/tip/a28b5c2b2a2f6fa30e06d7515c644e519e5=
cbd77
Author:        Leizhen Zhang <lzsx618@gmail.com>
AuthorDate:    Mon, 09 Nov 2026 18:02:53 -06:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:24:39 -08:00

objtool/x86: Move the cfi->regs access after the NULL check

init_orc_entry() takes &cfi->regs[CFI_BP] before it checks whether cfi
is NULL, and a NULL cfi is an expected case: the comment right below
says it happens for unreachable nops/traps and for
STACK_FRAME_NON_STANDARD functions.

Forming a member address through a NULL pointer is undefined behaviour,
and since the dereference comes first the compiler is free to assume
cfi !=3D NULL and drop the check that follows.  An x86_64 defconfig build
of v7.4-rc2 with objtool built with -fsanitize=3Dundefined hits it in
every objtool run, on vmlinux.o and on each module, all through
orc_create():

  arch/x86/orc.c:11:18: runtime error: member access within null pointer of t=
ype 'struct cfi_state'
    #0 init_orc_entry arch/x86/orc.c:11
    #1 orc_create tools/objtool/orc_gen.c:72
    #2 check tools/objtool/check.c:4939

Take the address only after the NULL check.  Running objtool with and
without this patch on the same defconfig vmlinux.o gives byte-identical
output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 8b946cc38e06 ("objtool: Introduce CFI hash")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Link: https://patch.msgid.link/20261110000255.1720945-2-lzsx618@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/arch/x86/orc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/x86/orc.c b/tools/objtool/arch/x86/orc.c
index eff078e..b688afc 100644
--- a/tools/objtool/arch/x86/orc.c
+++ b/tools/objtool/arch/x86/orc.c
@@ -8,7 +8,7 @@
=20
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct inst=
ruction *insn)
 {
-	struct cfi_reg *bp =3D &cfi->regs[CFI_BP];
+	struct cfi_reg *bp;
=20
 	memset(orc, 0, sizeof(*orc));
=20
@@ -22,6 +22,8 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state =
*cfi, struct instruct
 		return 0;
 	}
=20
+	bp =3D &cfi->regs[CFI_BP];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type =3D ORC_TYPE_UNDEFINED;
