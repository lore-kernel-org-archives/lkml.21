Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755788;
	b=GyB8NY+Fw2cvIWmQEfoJb2ty39A6g2SFE55/lxveJz/H9wPZUHIccBBFy2y1CGjlGwV4
	 LNMLG+vq9DqQJzE3tYSBFBsE3QDn54li76wFz/RGdye53BTH+7Z3EgDsAqo4gqQoj4asA
	 yexDl17iQIRoHt1LFPRLFRBoUamPKjDwwKAOe17E5qgpsJNmToBstfXQAaHVKXvSoPYhD
	 vxuAq8uMbr/TdGk7lCb3BSdPwpGR8rQnxvXP3Mn+eEiKiC0yAuCJC0dXJdSxF99rsXFEj
	 lz7pypqt7Vx211hWossmlIobnZUlJJR3whF5TN7xD42PNxLUkv5ReZmpiMoDN1QmSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
	b=LCh5NqP5RCcnSXabr35jgGpjRY5bx9OdY0S2dDcNjhLvgm9QNKNKjdFKBjnKCu5zCDh+
	 bMez01fVg2ZoweHsDBrp6PGl4aPYLjliGd2EhCsBcF128HLoic+NZiiSQVEai4JIr25Ka
	 /tlSxX1xBmmw87+yCOrjqfLW6Q+O5WPvs2pNQtyjUYZPJYFK8nTDc6s7TNOXdGPT0XGMv
	 hS3/+qhlqnqdR+4H8sP1jDHmZil7VX9MLoQ57bKSnshhF3UPeFVQMS0zUXZq7BRb93wiB
	 hYRbKR7AB++baLUo7Wim6CdFc60JWCLep/YLwJ1mZ7idVd+uwwmfgi6/5RMz6hZ6TOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWWHlhEx;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B8606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 530B8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWWHlhEx
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4fb5d96b3so117952627b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755786; x=1796360586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
        b=eWWHlhExsP4fyPUz5KBx90bIaCqwoHxs819k9PYtd/yWPOpwtwIAyUvj4UTNaTwCyS
         3HFGsvi6JOjFKYbvD/ZXsDsY3vUYLsIq3ACrDbvYXADsxdAK33XLfrrtfnhjSncrZgDO
         yuB3hebmmJimgbBV7TP8p5C0EA9FeZ11aaUE9Dcwz8MNK3obWd7wjy9Mt1t9MCXiTohS
         dDBq54jR4gG7/MsATpQ8bSNWPWLgKHEQ3AZ1OzIdj0GABXg5sjbsrhUnfETvJj98+p6T
         eat0kNkgMHGi30v57ncFvX1U23y33CzWN1JArCeIslIozU8n0ny+pS9bWWCx/K6fgnPg
         gldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755786; x=1796360586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEY/rNaVhtiW7IOr9SlwF/6Il1FCJcpjVwdhkOpxCE0=;
        b=AOzpkwBU0mi7pRqL2JyvR7YeywfJRW/6OcyaQE6UqPjeCAYLt54Nb4q74sKQTlLnB1
         6PTiqNwsq+IQxTl8vqOSDRguy2M/msZZUNWeYFKMtC4lJ0zTeLgsS6ZSHSKo70cDnqkf
         3N7K7We4Gi4vpaaVfSniFAQmLOgR397fwbATnjSaA2eYJjLQOYJBREn2q4Feww4Bvw5c
         KiibPp/i5GKFUhz9TY6Zgak4Z2DUE5Jmi15ydfcYNVSnWKRb1n17WR8GVCyV025xapWr
         GMluVNRQF4H3Nj4vikZnW2bk9qPVLzrsAMsemM2CdUvFjSrhzJHrzBfMNjX9Jig6dRvU
         aGhQ==
X-Forwarded-Encrypted: i=1; AL+hErHcvozPvl9LjZJKtpMzRjgBHHBoJ05WuKSflcqInNsvnMeGmj9hCraPTIddG2F63JQE++s9XS4oAkJKrdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/esreGmPbzpaiVH5BDDNvbL/SKVAtOKDswM39HP9u/0G9c1emv
	90FTSwsRHa92Sifp1YxBJVY/+leM6y5aD3gFVRqbb22pAd1W8RdU27+I
X-Gm-Gg: AZFdTZdi8StGdLLXwfM0nFGJcnmGDUou4h8p/49f2E+VEMtr1tI6A1kHm6fmsk0jyNQ
	HYNAPxp6fycG/XTXL81CU1tb8Aux6oJFfhzVmcQx5PNCdXck8ZcDlOPhKhh2zpu3Zb/B0aAsrRN
	ftGo0Zja7hgwREVWNr1n1BYDJaU9R304p35DtDiGFsyzAEV7EdBA/dMJEmAzGB//JP4P8DYj1wD
	Enrsgx9CrQwSq6ciYlKwUpeR+D6uLUA49yJq8z9SAxyWyEQpWoHLac9azdOEqenqW+BZKQtSl3J
	1+jzs7/ju7ZEn2iPPuACtggdispuGN6c58EjxdlUhmK73L2p0tm8j42OhJXWVjs/flKsl2I0Fus
	OBMCjIkB52oFvRWTU2T0dX3MdH3EJ5zALe6jlnpjt4SZuT7dpcMr+cVRMcy36P5HJhxyJbmpRg6
	63F3ahLjD37Yn0sNDZfNAbC93PaP7FQ514LOMrkGwAfMWW+dR79uF1v21n0lGWTAtsNWECSEEDv
	Hr1TcogJn85VFMeTBGtf4qMY2zKiKb7KBJEq3iaR8wTnw3IA1to7JdkYZCKlBk6K+U7abBvIoGP
	c4H1P+QYDHgXAIrPpdW7Qr/HIF7ICp5hqtFzpUeVMHpSEA4b1KmgqkReOO+cGAHeEYpkBnZxlRw
	l46dIh7aBAlFM7JuFgl1jYUj80brT8sbAWFaOuEGkrg==
X-Received: by 2002:a05:690c:300d:b0:8a7:ef2a:ff9c with SMTP id 00721157ae682-8b5203207f5mr95882887b3.2.1795755786143;
        Thu, 26 Nov 2026 21:03:06 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033f617sm90308187b3.39.2026.11.26.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:03:05 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 27 Nov 2026 00:02:56 -0500
Subject: [PATCH 3/7] parisc: perf: add PA-8800/PA-8900 RDR and DR2 access
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-parisc-perf-pa8800-v1-3-4f3f077010ce@gmail.com>
References: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
In-Reply-To: <20261127-parisc-perf-pa8800-v1-0-4f3f077010ce@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5153; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=9WDbQFCFxqYajhAixGr/2e39yh0jySm3MlMhHLbplHQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5+f4b/lya612hUOYWtyD5hr26wo5HX6JrPGKvWroob
 FOuO/eh4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5Rn83IcIcnY8n/vm
 8s3cvOyWwpnW34+9LRNqGL0/gjGjoP1Yu+/szIML+Tmbn0VklpZoh1xqsj8n/dXN7PvDrxzY1yn
 8jEa7FqPAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The PA-8800 and PA-8900 (Mako) performance counters are in RDR15 on the
second of two RDR chains, which perf_asm.S cannot reach: its STDIAG and
SFDIAG forms only address chain 0. Chain 1 is shared by the two cores
of a processor, and a core must request it through diagnose register 2
before shifting it.

Add perf_get_dr2() and perf_set_dr2(), and perf_mako_rdr_read() and
perf_mako_rdr_write(), which shift 64 bits out of or into any RDR on
either chain. The access sequences, including which RDRs take a leading
sync and that RDR10 and RDR11 are written together with RDR26 and RDR27,
are the ones the C8000 PDC 2.13 firmware uses (tables at 0x1d6fc0 and
0x1d8000 in the PDC0213 image). Both functions jump into a table of
64-byte entries indexed by rdr + 32 * chain, because the RDR number is
encoded in the DIAG instruction.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/perf_asm.S | 163 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/parisc/kernel/perf_asm.S b/arch/parisc/kernel/perf_asm.S
index 8fceabb1a832..ad240706750e 100644
--- a/arch/parisc/kernel/perf_asm.S
+++ b/arch/parisc/kernel/perf_asm.S
@@ -32,6 +32,169 @@
 ;
 	.text
 
+;
+; Read diagnose register 2
+;
+ENTRY(perf_get_dr2)
+	.proc
+	.callinfo  frame=0,NO_CALLS
+	.entry
+	MFDIAG_2	(28)
+	bve	(%r2)
+	nop
+	.exit
+	.procend
+ENDPROC(perf_get_dr2)
+
+;
+; Write diagnose register 2
+;
+ENTRY(perf_set_dr2)
+	.proc
+	.callinfo  frame=0,NO_CALLS
+	.entry
+	bve	(%r2)
+	MTDIAG_2	(26)
+	.exit
+	.procend
+ENDPROC(perf_set_dr2)
+
+;***********************************************************************
+;*
+;* PA-8800/PA-8900 (Mako) RDR access
+;*
+;* Mako has two RDR chains, selected by bit 0x10000 of the STDIAG and
+;* SFDIAG instructions. Chain 0 is private to each core and chain 1 is
+;* shared by the two cores of a processor. The sequences below are the
+;* ones the C8000 PDC 2.13 firmware uses (tables at 0x1d6fc0 and 0x1d8000
+;* in the PDC0213 image), one 64-byte entry per RDR, indexed by
+;* rdr + 32 * chain. The caller must hold the DR2 chain 1 handshake for
+;* chain 1 accesses.
+;*
+;***********************************************************************
+
+#define MAKO_STDIAG(dr, ch)	.word 0x14000AA0 + (dr)*0x200000 + (ch)*0x10000
+#define MAKO_SFDIAG(dr, ch)	.word 0x14000BA0 + (dr)*0x200000 + (ch)*0x10000
+
+	.macro	mako_sfdiag_ent rdr, ch
+	MAKO_SFDIAG(\rdr, \ch)
+	ssm	0,%r0
+	MFDIAG_1	(28)
+	ssm	0,%r0
+	b,n	perf_mako_rdr_read_leave
+	.rept	11
+	nop
+	.endr
+	.endm
+
+	.macro	mako_stdiag_ent rdr, ch
+	.if (\ch == 0 && (\rdr == 3 || (\rdr >= 7 && \rdr <= 9))) || \
+	    (\ch == 1 && (\rdr == 4 || \rdr == 10 || \rdr == 11))
+	ssm	0,%r0			; no leading sync for these
+	nop
+	nop
+	nop
+	MAKO_STDIAG(\rdr, \ch)
+	.elseif \ch == 0 && (\rdr == 10 || \rdr == 11)
+	sync				; RDR10/11 are written with RDR26/27
+	ssm	0,%r0
+	nop
+	MAKO_STDIAG(\rdr, 0)
+	MAKO_STDIAG(\rdr + 16, 0)
+	.elseif \ch == 0 && (\rdr == 26 || \rdr == 27)
+	sync
+	ssm	0,%r0
+	nop
+	MAKO_STDIAG(\rdr, 0)
+	MAKO_STDIAG(\rdr - 16, 0)
+	.else
+	sync
+	ssm	0,%r0
+	nop
+	nop
+	MAKO_STDIAG(\rdr, \ch)
+	.endif
+	ssm	0,%r0
+	b,n	perf_mako_rdr_write_leave
+	.rept	9
+	nop
+	.endr
+	.endm
+
+;
+; uint64_t perf_mako_rdr_read(unsigned long index)
+;
+; Shift the next 64 bits out of RDR (index & 31) on chain (index >> 5)
+; and return them.
+;
+	.align	64
+ENTRY(perf_mako_rdr_read)
+	.proc
+	.callinfo frame=0,NO_CALLS
+	.entry
+	depdi,z		1,DR2_SLOW_RET,1,%r29
+	MFDIAG_2	(24)
+	or		%r24,%r29,%r29
+	MTDIAG_2	(29)			; set DR2_SLOW_RET
+	extrd,u		arg0,63,6,%r1
+	shladd		%r1,3,%r0,%r1		; 64 bytes per entry
+	.rept	8
+	nop
+	.endr
+	blr		%r1,%r0
+	nop
+
+	; 64-byte aligned here
+	.irp	ch, 0, 1
+	.irp	rdr, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+	mako_sfdiag_ent	\rdr, \ch
+	.endr
+	.endr
+
+perf_mako_rdr_read_leave:
+	bve		(%r2)
+	.exit
+	MTDIAG_2	(24)			; restore DR2
+	.procend
+ENDPROC(perf_mako_rdr_read)
+
+;
+; void perf_mako_rdr_write(unsigned long index, uint64_t value)
+;
+; Shift value into RDR (index & 31) on chain (index >> 5).
+;
+	.align	64
+ENTRY(perf_mako_rdr_write)
+	.proc
+	.callinfo frame=0,NO_CALLS
+	.entry
+	depdi,z		1,DR2_SLOW_RET,1,%r24
+	MFDIAG_2	(23)
+	or		%r24,%r23,%r24
+	MTDIAG_2	(24)			; set DR2_SLOW_RET
+	MTDIAG_1	(25)			; data to the staging register
+	extrd,u		arg0,63,6,%r1
+	shladd		%r1,3,%r0,%r1		; 64 bytes per entry
+	.rept	7
+	nop
+	.endr
+	blr		%r1,%r0
+	nop
+
+	; 64-byte aligned here
+	.irp	ch, 0, 1
+	.irp	rdr, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+	mako_stdiag_ent	\rdr, \ch
+	.endr
+	.endr
+
+perf_mako_rdr_write_leave:
+	bve		(%r2)
+	.exit
+	MTDIAG_2	(23)			; restore DR2
+	.procend
+ENDPROC(perf_mako_rdr_write)
+
 ENTRY(perf_intrigue_enable_perf_counters)
 	.proc
 	.callinfo  frame=0,NO_CALLS

-- 
2.56.1

