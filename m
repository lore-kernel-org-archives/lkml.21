Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201955;
	b=AZaEIZ0ipC7Vkrex8EylawMAw9wlXAQ/psmxQ5YT+NfelECfZrXfvmuSW+U26WJDqxtt
	 SMxMB8WiDuuw/i2IKHJjN/MJ6vgYyNrdgqD/Tx8YXNYRVrH6xC9PqoljNbeuiODrMxJeN
	 cjcNGFoo3ZByZKjFa8ryjkCQ6o3RTyrppuzCseo1pV/JUhP7YUvk+U0siR7H0rB+jh9g5
	 CPp/i8aHiQ4t9QtGtQezCQGpIM4Q+ylzECwpqXjcn/Uy7Zb1cBI4+mysodeJFh2poyn3J
	 qaVzS7xYtde90k2UFhUtCW6YqqaXMTWTE+4aMKc6YkDAVBNXVwIOtaIbxrBheKO3TlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=;
	b=r632s2x4z4W16aOVLCmGy+PUhzFWuwvC14UJDEt4aH2TGWdckdPVDGS4i1sfunDKEk5p
	 6NDhS+rc6Cs7PYvT/sIgiHhBDFUrBxNDvjD77rRUUqy+MOlgNv3FPEPU5t2pO76LZH68x
	 zTBnR/E/rZ9uZEpC6ObG6RWbz7anrvIHehVR7qFiVPYP3MOUD9sWgBg2n9AgZdF2Zp2nb
	 2HNzgMDHz+oCoq4Fo0MXwBP6CjjRlgCrq13MkAhz3uA3eJ5SjC55ASEze1mL1WvZ+Wkrb
	 nF9k7s4P/dtqk6O7MsJ/JNmPYDkBW0laK0kKK8Y6ie6PjzhX4crQRbZ9FK1FGz0bmuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chch5Rh4;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6460A2622
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD6460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chch5Rh4
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04f61282dso3815885ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201950; x=1795806750; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=;
        b=chch5Rh4a7kUH4KADEYFCxLpq6LGSWwyRwktZS/9AKa/ysC/zzbwdvyhNG60RGwVS+
         hYgfnG30lMghWXqEF0SJqAJ2OXocm+A7LNr2YVyig6TWUO9/3ZXRexTorLyvNa5nPeTe
         yvnYr9/mwV3/57hfhvZlrDVzmDHz6mhc8eXCzsUUwsqg+PrHCr/YLHF1UJMK82OiM/mO
         j88tBzjtct8eIuXZV+0KGzx3N9xxWTNIU1Xy2Bb4HjwBGN4mgwv3AjS5yTiQwm3devma
         +zfQcKzyLqWOdwq+SRYkv+scz1h/4ySRBgrJEd8fg5F42HEhWtSSWPJRdka2gM6L7Kde
         v8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201950; x=1795806750;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=;
        b=CiMeSh4Ksde+zIZfggaytZRucmkivBmBc5gg9OjPCOHBfISI6lY3lNMo2rRTpJPSO9
         kb2LDncS93p7s3lRlQcLlqvkCPDLDtPGc2w18EdKEExDsztmEoWAZC3kChhLDz9JHuef
         /Jw0VGrIKx27bh7lYQHCCkyCLPWCR8swNDEQ/7W1aFRHphQqH13eSGIhjvq8c2Q9SfxV
         V/SzsqhKFTUfCgwfmBZZ9+IAcD8z9hw3Gq9VvFVgwRhtAoY8nGnxGLFApQ2u53mz8lDz
         n1dub1bz845sKIwC4r/Iajku8PLcNLTGi66nHGNgCuytnrIcI7PJQOwAQhF1zKFty8wp
         hrOA==
X-Forwarded-Encrypted: i=1; AL+hErFh4EEKaJ2BLDnBiSuhVRWDHSpgsYKht4Fr7xF89xLGO3Vpbo8zyN1ySf/2IEAovhMCK2xK1exiyaAkTvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vH07tsu/dvDXoAjmGN2iqpMAK13n95reWmCbzH/zsr+A1KSaE
	FjsMBTg60wzJzoHEtGjLtS7g4t43S7decRPMJdelmbvAxeTQhEpIEaKn
X-Gm-Gg: AZFdTZd0lWUCR0SI4MtyG/WEVBXaxdbvsswtu2cFVGb6nuS3FaMHmP7uDflV/niI4Hn
	KcgI8j0J/mrQFd4Ea34d/ZLIBAkPXijAT4xy1OvYQ3Gnd/3UP2C3+2veDmAkiafAPd8uEw8SI9m
	WPp8ix3j0ATswWb3TVa57IcWfYqGD1c9/D5zJ9rAJqBGjQbq5jR+wNvABcVxEqiGkrP6z+gwnov
	iKFDwymYFvWXA1r43MXPeQwlRY515jWf6B/PRnK4LTzUHKUHBr225unKDUlbElMywynyypdxA/V
	N9iu1r8J8t81FehBAh7X7hQdtEHVdzIJLaB+vQL1e3dkJIqdnzuMFNDeLaqz/c2jBjsnXxnByb9
	3NPyn1MmAcTaoPLkLLMCx/f6i27ysr+HWJ+eSU+7o6ILMfKm2c9I0mg2fZ2hgFQTgSWO5ZUXbj9
	/dSdeOdVy5JB7QizWH7MveUnZpEZZPHS+ubUjVkYfMwriiO0CExnesf/7wkpOAzhGsWmgSQZJLA
	87G5RltQuB6nOtIMki841GiWR+Mo8MfwuzbvaiJmU+bnRSC9b+TQTIIFw9xyiXIpnFTS9B0XcvB
	VWUPY0x4nZqq7MDo6L85VR+LqzQeKXylnAqa8inloRFX8bG0IXIMHNUJCbIqnFE4ACLzZ0+mxom
	awi1Qi4Ymw6/1nsMqBmlFbx7zZoR3IVnbVTM=
X-Received: by 2002:a17:903:41c2:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2f03f1bff81mr46388825ad.38.1795201949460;
        Fri, 20 Nov 2026 11:12:29 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1058fesm18914595ad.48.2026.11.20.11.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:12:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:12:28 +0000
Message-Id: <DN09ZA2KX6CC.UVO7HNJWT0EO@gmail.com>
To: "Ramin Moussavi" <ramin.moussavi@yacoub.de>, "Russell King"
 <linux@armlinux.org.uk>, "Puranjay Mohan" <puranjay@kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] bpf, arm32: build constants inline instead
 of using a literal pool
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261120140147.166934-1-ramin.moussavi@yacoub.de>
References: <20261111121621.665533-1-ramin.moussavi@yacoub.de> <20261120140147.166934-1-ramin.moussavi@yacoub.de>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 06:01 AM Ramin Moussavi <ramin.moussavi@yacoub.de> wrote:
> Commit 0b59d8806a31 ("ARM: net: delegate filter to kernel interpreter
> when imm_offset() return value can't fit into 12bits.") handles that by
> setting FLAG_IMM_OVERFLOW and dropping the whole program to the
> interpreter, and already noted that multiple pools "would better be done
> as a feature instead of fix".

Not always. imm is u16 in imm_offset():

	imm = offset - (8 + ctx->idx * 4);

	if (imm & ~0xfff) {

Take a classic filter that starts with 'div #3'.
Put 64 KB of code without hard constants after it:

  offset - (8 + ctx->idx * 4)   0x10008
  imm                           0x8, the check passes
  ldr ip, [pc, #8]              loads an insn, not jit_udiv32
  blx ip                        jumps to the value of that insn

So the patch fixes a crash too.
Pls say that in the log and add a Fixes tag for 0b59d8806a31.

> ARMv7 and later are unaffected, the MOVW/MOVT path is unchanged.

Only when the kernel is built without v6.
The v6 line wins in arch/arm/Makefile:

	cpp-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7
	cpp-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6

imx_v6_v7_defconfig and omap2plus_defconfig enable both.
With the JIT on, an i.MX6 runs the new code. Pls fix the log.

> +	for (shift = 0; shift < 32; shift += 8) {
> +		u32 part = val & (0xffU << shift);
> +
> +		if (!part)
> +			continue;
> +		if (first)
> +			emit(ARM_MOV_I(rd, imm8m(part)), ctx);
> +		else
> +			emit(ARM_ORR_I(rd, rd, imm8m(part)), ctx);
> +		first = false;
> +	}
> +	if (first)
> +		emit(ARM_MOV_I(rd, 0), ctx);

The log says that arm64 does the same. Not for small negative values.
arm64 emits one MOVN. Here they get the longest sequence.
For 'r2 += -264' val is 0xfffffef8 and ~val is 0x107, not an imm8m:

  version      insns for 0xfffffef8
  -----------  ---------------------------------
  today        ldr r8, [pc, #off]
  patch        mov, orr, orr, orr
  diff below   mvn r8, #0x7; bic r8, r8, #0x100

The last 'if (first)' is dead code.
emit_mov_i() is the only caller and imm8m(0) is 0.

Here is emit_mov_i_no8m() on top of your patch. I didn't compile it:

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 58d066a..28a2c5e 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -411,30 +411,30 @@ static inline void emit_mov_i_no8m(const u8 rd, u32 val, struct jit_ctx *ctx)
 {
 #if __LINUX_ARM_ARCH__ < 7
 	/*
-	 * A single MVN if the inverted value is an imm8m, else one
-	 * MOV/ORR per non-zero byte -- a byte is always an imm8m.
+	 * A single MVN if the inverted value is an imm8m. Else MOV + ORR set
+	 * the bytes of val, or MVN + BIC clear the bytes of ~val.
 	 */
+	u32 op = ARM_MOV_I(rd, 0), next = ARM_ORR_I(rd, rd, 0);
 	int imm12 = imm8m(~val);
 	unsigned int shift;
-	bool first = true;
 
 	if (imm12 >= 0) {
 		emit(ARM_MVN_I(rd, imm12), ctx);
 		return;
 	}
+	if (val >= 0xffff0000) {
+		op = ARM_MVN_I(rd, 0);
+		next = ARM_BIC_I(rd, rd, 0);
+		val = ~val;
+	}
 	for (shift = 0; shift < 32; shift += 8) {
 		u32 part = val & (0xffU << shift);
 
 		if (!part)
 			continue;
-		if (first)
-			emit(ARM_MOV_I(rd, imm8m(part)), ctx);
-		else
-			emit(ARM_ORR_I(rd, rd, imm8m(part)), ctx);
-		first = false;
+		emit(op | imm8m(part), ctx);
+		op = next;
 	}
-	if (first)
-		emit(ARM_MOV_I(rd, 0), ctx);
 #else
 	emit(ARM_MOVW(rd, val & 0xffff), ctx);
 	if (val > 0xffff)

pw-bot: cr
