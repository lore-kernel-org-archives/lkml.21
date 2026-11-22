Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391940;
	b=bp2VjK0JLj2+xBNwEtPq8IjbyVTI5DS0usNmnoh739YyiRjHjH/JN1bjf2+7qxTgAoNf
	 yomjPGwIKflVr6bTRnrLgvjreWts6P6svhzIfb+oU8Tk+VcutKuTMgOU/9Ot0TKrr7fSS
	 pVwSYnX/G9dcIXUqh/1tbKYHFdJVINTyqrIl9rupvTJHuCiIQGN/9Upx8MnE2P7lFRJAc
	 KKCO+zyJRiBHEkD6SIokTvujFR5e24q9+2brEUvxP+tR6zKpXdN2AUPVbRXjphALCAI34
	 FXFiE6S0GpBL7Dch1PN5NPIVuPFvh81VUj4Z0uOr4RwrECK0fvTyJgEp8Vdv4aZLgCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
	b=ppwhMRx5M5x8VNZHAY5X7xa3fLc6pFUhylz13H7NwQ4iMfOrB2gTUWCKVXLKaIX+gU64
	 Symn40eX/iBD9JW1WI0UxQ04JKTDQ+lqzKMsrkWwlmihHL84xPwY6q0cRwaEY0WIXUQPp
	 /2AqQL85m4abTVlVTN2kQx8uKQEEUxJsTGV0cdcdHqAq0j86Sm56TVlOX2RcCPGRwxPkv
	 MV96JtoUB2rIuZF4impZYkZeBS4J/lrW31SCSkKBoYH8fTUh4J0CKrd7caeZP5rRJMcae
	 y1ct620MWjvXwRpHIDkR8TAwYr7pMu9mK37seA/SFitGT5HPy7QIFIrrrjO+SgB1tuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZdOZudJG;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1F606A697
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F1F606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZdOZudJG
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so4592841eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795391940; x=1795996740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=ZdOZudJGsaG07wVYy+jLZjTT31o+W1UIaqdreqlRabvxhwUDEmnG6ni0AER4h/id+5
         6hC339DdV34TQ8tqD9xG18wjwIxiNdlnKR68iBBe0JLGIlimD/n58YaJ+q2Xc/x54kNB
         nQjvw8ML/dKEDweBrGasUcqAEjPoJqFejZf3H7kBbMd6EWfOlGofEjvBzTVNty9nvJ4V
         DJ+aOlCJeXrS1AaTs43u6d5K3rf87PMmHwrCXUBOf2PXEY1YrzgtnUKD+y5bU+BFu+v4
         1eBGvTGR4Frwx1BcOQyNw7enaMa4sHkAujQVR+52cxxaxIipg1CUdbbkyVIrk+U+JW5L
         ysng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391940; x=1795996740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8uld7tmFhu1BHNbYnDkojgUSUIEcHmlm+27ijCZsTc=;
        b=2OXqZKGQRismLM/Y/RPY21t0nFxJgExsvkP9lNl6EYbHdPCkVr/cM8B384e9Vme3VT
         1sFZjBztNVSUY3AvtXSimzQxo+3T5ypCI7Wwn0K82yK5b5qQMi0bSYjEABRoxFqvHKSD
         NtfKs0rA+Wr6RFIY0kPHrCMZULFnsJg08UKF4ekLPbwm6RgdZpiAxf6UjWRamRcEGJOM
         9PmZyLG6aBtRP1CcDCfsItmv0wQ8sdCNc+o6LcPYo4WinRDSiMrwkYRqn0ribok8JVrf
         uzGMmsgR59mFQwSj8beUvfrE3LJMbC463psER6aIjTbe0AdKJOP/ZFXlbAC5+csfyDE8
         4Img==
X-Gm-Message-State: APuU4Z9U3xt6EYLZ3n76TmyWW1RoCtIK5U7+zdwxezBtyhwO6RH4cG+1
	M/SF8oP6/VQnqmKHKrzcOdmMo5vHBpxJV7qOuzKanMb3EvBjMkYIW48BHnPpIW/QuKDD8MSUtnq
	6cPQ9+6FTvecdJnvM+dUVVdqZCRnNuyKphT94GmGBeech4Gv7cn+0GG6kRAFs5Bus0xHPFLb9GC
	FT0aj6Pa0e9Bf1mgnHC2OSrMd4/SjkI3ttuEXfn4HWId7Eaw73dw==
X-Received: from dyclv5-n2.prod.google.com ([2002:a05:7301:6185:20b0:351:4a2a:1ece])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1505:b0:384:df31:6a07
 with SMTP id 5a478bee46e88-386a87efea0mr3258907eec.30.1795391939090; Sun, 22
 Nov 2026 15:58:59 -0800 (PST)
Date: Sun, 22 Nov 2026 15:57:50 -0800
In-Reply-To: <20261122235757.3456048-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122235757.3456048-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122235757.3456048-5-irogers@google.com>
Subject: [RFC PATCH v1 04/11] objtool/ibt: Ignore .eh_frame relocations during
 ENDBR validation
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, ardb@kernel.org, 
	linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	indu.bhagat@oracle.com, jremus@linux.ibm.com, wnliu@google.com, 
	dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When vmlinux.o is built with -fasynchronous-unwind-tables and
CONFIG_X86_KERNEL_IBT=y, .eh_frame FDE headers contain PC-relative
relocations referencing function start addresses across .text. Because
.eh_frame is read-only unwind metadata rather than executable code or
indirect branch targets, skip .eh_frame* sections during objtool's IBT
relocation validation alongside .orc_unwind_ip and DWARF .debug_*
sections.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15..e631b0da9bad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4644,6 +4644,7 @@ static int validate_ibt(struct objtool_file *file)
 		if ((!strncmp(sec->name, ".discard", 8) &&
 		     strcmp(sec->name, ".discard.ibt_endbr_noseal"))	||
 		    !strncmp(sec->name, ".debug", 6)			||
+		    !strncmp(sec->name, ".eh_frame", 9)			||
 		    !strcmp(sec->name, ".altinstructions")		||
 		    !strcmp(sec->name, ".ibt_endbr_seal")		||
 		    !strcmp(sec->name, ".kcfi_traps")			||
-- 
2.56.1.750.gf70dc682cf-goog

