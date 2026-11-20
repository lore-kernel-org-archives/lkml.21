Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209904;
	b=Ldw38CFJyT2l+lXGV+dfdUoWtQmVivQzEE/19caEFod0rLo20BgWQgtP+ycQmKU4DVUd
	 Vh2FbxiT5VrUI1fGheE5KL57SHC6zF2KVVdtiwY/j6/jJRQMh7hD+osKpIRgW/QfDiiC9
	 5Mfi+vU2BlXyRGrGfiZLWjcWABKC1HEtrNE7dpeC+eZhBa/cJhaHbdCarL8PluIklqTm8
	 PyR8NW+NdLDo/OeteLXQchepWKPcnMFiGgANmfV4eLPP6eDSNXR7W/PqrINuiZBz88eTw
	 0XTKfIrnqSZIQz3oRgTtVFS79iEe0HVcGcFAM5ejR8Z+VZ8etqTOpIcGUd8Tz1WpcAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
	b=Vz9D6ozUV5wIAWorHAxeI0Yukt71HCrFC/Uke3jMzHNeLRcjkQS2olQSAA0+SYMawjhJ
	 HJIToJEC2ITtUy4r9Y+lz3+Zkt6BxbHIlGVxNMZEYWNhswrqJmXGHxwVNNHoN6ApDwE+i
	 +BLpDOHoHetJ99OYsOcXhxJCE0KWONoCsZ1Cq63NiCGWkXpPxGUiiWOy5OwEAhOyGgEmi
	 2ItbiNEqml459MovnEsbULl8gu6jmVH0Z4kZepIR7pMwt3ndcxkBuw5baVjFi1xtwpiSP
	 ldjdozVQ1N516h5xw9BIgl3tS6MAMQgO0Deo/tN2g1NVh5naHAPPOBdX2xgDsBCa9nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="E/40exfq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D7606A6B9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5D7606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E/40exfq
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9906870a9baso731276241.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209893; cv=none;
        d=google.com; s=arc-20260327;
        b=fIx3GMjuzflIcyj1kISNj2ZFVHwOI/B/F9oQgqY8nw8dLTw+K7+9RL/S0+tAsFnUkr
         fxt8xJoaZVjhcJ6C0qQDl7MKAR2e8/q/o5uKePFfe1XiJl6LS6K7YXKHzZAB41Dy5sSO
         SbG93lP/J7xaeEkj9Rw2yo5YuK+uS7A2kFpSWlvhq5zz+ER7z2EewCk9l+sSZh2NKiMr
         2Jg77mzSGY/Rqebx6eFxO+QhrXnY5MLl2OtExU9HGyFz3U/WuG3SJprB49eW+e3xQbzv
         GlSgbIM2bdeIp5xHW3Rz3cG+vu7DRkSnDDu/0+NrubWuv7soolsX0EDZTLjI2LMyX/vT
         bupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        fh=fvFcrCoVpSBW0Fpg2zjM3Ps11AJmcG/+g586zv5jBdc=;
        b=LcMJK01+2oWwpXcp0KZD3f9Q8WjGRDUH21LPOIDfCeDHMViNNkycqkjj5zFjWH9oZt
         HuJKtQ7jyd8RgU9xQvKnfrW3N75bmCacD8sa90r4lpWNQNgQpe/n+c2ILJaLij5LhK27
         2YhPn4nAZ48R6P7BmnzVpfl+ENEjZr9Y+AONvqOlSfBV7pVAN9DslOtcJ9YmL0qY1jmK
         0icRvMOwK++1A7zavRw0yyleG9V85p/URsbJy/pF2ATBRI+KNe8BN+NOrXTeODV65cI6
         y8mnh8w0DH4E6TEZVQjgP/q97kI/I8nDl/GZWzV25k1PnBx7r2RKh47gfv+IpQkveiBk
         SdGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795209893; x=1795814693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        b=E/40exfqtM+dThAPB+qlxLIEYF/AnZPRFWd69sTeq2lJPxrBNUTo4c7rAMf/88sbrN
         2iTp5bZeyfHqIoUL3+dh091zwJqekWGZQfKRNS8APaO61TMZ8lWZn73rFe3cEprFMTuJ
         ko5lkrBW2jQf1Ulqmq5ZyS99zm5berzXY/i6q9+2I1GBpvtlntnQdbIpKYlIa6E2PSAZ
         6cjcXHoG4Bf3MLgnFTzl8HkWXW+c9Tt2PniOHS+qkE97/f/mBtMPIx1DClV/6F0Gy9Hr
         aKd5TBXFk/UlY/cxPRKThJIX7IO8pOWeLrumn2vnZL+FwmttEEEVskWDD2FOfwEDDZXb
         1nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209893; x=1795814693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        b=NY11zd3GNL/Mv3OSzCLaRMf2kg6I/QXFZjQLAjOFxio3DKxbWAmxrHJYPwaPNMO1XT
         1PKF9C8YEI65HnxXdTgroApr8TBIIyLr74xDmtGsYOBQCT47k9TqUrXAWoJ7RK59Sdlw
         9qqsttXnFa+md14LjZ+ubXvsLjA383OXzGOUrLPfeR6jUx1pWEUpsjKvi9l0ute5qZGO
         cwj8/kTqPdgPg7zrLYknbXnKz1wmmQz/yNQvEElwQPwyXYwFjrqqeeHb5GEApoJfBlEI
         e6T3+J5iSXJI4GuO/SySFlXpHqBGhOAe21PRvKa/4lp0bGqgPd8Xe4xJ0u8tfZGsk2HG
         2tIg==
X-Forwarded-Encrypted: i=1; AL+hErFiWLAKusm5BZKroWxI0+ybwAIx2bo/POvCLjrmG5S9eJXhcH1B8EF48OEnR8oxmuTWCChMbaEhllAschU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88g4qeCmG3FqehMXT5QuIUMGL/pCBFRSJ7Ye38cy1DOQr5UFyj
	qebizQFnJ2Q2xNkIxIjM6QILCTnmtNjWCsCDx5xjG2qQqkOr1ZxWra6XvSP2a4/7YNkyrCzC22q
	/lYHVO0g4/k5vMvuo2VjNe2FajAj3JznN36VQSVpA
X-Gm-Gg: AZFdTZeW3iLOGHAOjDxttnNheKFtVMrg2UszQtuH/EDttEpVXJKVAvkskrvcA2QGswq
	Do2AueHk4/6+MGxpVA46L4M9X3apDbxRzUpmgIPcoVuJuzpCjRtgXHU9hPcoDdxjkrze3/zyhWz
	R9lGMmhZ0vzoF/dsDeUDRWuvlxme+pMOKh1us9FXGHMG0DG+kXlHIskww4vIQMEeCBMYNYgTL2w
	DU7UDid9Ipg0hIbyl1Cly73SNb5JydMadF8ilqc+37NrfOnudRYUhKiSQ6g+8kST1tRQIloPFdq
	+a6BoKrlY99xEHQAkoQAlnzC6pc+SBJvPnJPV94H1ASl9KhiDAY8bIkB/zh5emWEBzfxIAMg7XT
	GIUP9r2y9ktVbfvmtOznHoivbJbHcKSuKoYa3
X-Received: by 2002:a05:6102:374c:b0:7d2:8dd6:e2c2 with SMTP id
 ada2fe7eead31-7d73963c573mr2445359137.29.1795209892946; Fri, 20 Nov 2026
 13:24:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 20 Nov 2026 13:24:42 -0800
X-Gm-Features: Aa3M54q00e7eFLXrWdso2Zy4lofaH4uwGilO3mLmdcGkjW-Fq6HTshHMHcZHXiQ
Message-ID: <CADBMgpx9TZ6P5KVWc=emKbT5zfv6psB-woLW6dnwh2XcwPDg5g@mail.gmail.com>
Subject: Re: [PATCH v4 20/22] objtool/klp: Introduce objtool for arm64
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Miroslav Benes <mbenes@suse.cz>, 
	Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Sat, Aug 8, 2026 at 4:21=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Add basic support for arm64 on objtool.  Only "objtool klp" subcommands
> are currently supported.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/arm64/Kconfig                            |   2 +
>  tools/objtool/Makefile                        |   4 +
>  tools/objtool/arch/arm64/Build                |   2 +
>  tools/objtool/arch/arm64/decode.c             | 177 ++++++++++++++++++
>  .../arch/arm64/include/arch/cfi_regs.h        |  11 ++
>  tools/objtool/arch/arm64/include/arch/elf.h   |  15 ++
>  .../objtool/arch/arm64/include/arch/special.h |  21 +++
>  tools/objtool/arch/arm64/special.c            |  30 +++
>  8 files changed, 262 insertions(+)
>  create mode 100644 tools/objtool/arch/arm64/Build
>  create mode 100644 tools/objtool/arch/arm64/decode.c
>  create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
>  create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
>  create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
>  create mode 100644 tools/objtool/arch/arm64/special.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 11e733b6a3cf3..06b30924509ac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -209,9 +209,11 @@ config ARM64
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS
>         select HAVE_IOREMAP_PROT
>         select HAVE_IRQ_TIME_ACCOUNTING
> +       select HAVE_KLP_BUILD
>         select HAVE_LIVEPATCH
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
> +       select HAVE_OBJTOOL
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
>         select HAVE_PERF_REGS
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index a4484fd22a96d..94aabeee97367 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -11,6 +11,10 @@ ifeq ($(SRCARCH),loongarch)
>         BUILD_ORC          :=3D y
>  endif
>
> +ifeq ($(SRCARCH),arm64)
> +       ARCH_HAS_KLP :=3D y
> +endif
> +
>  ifeq ($(ARCH_HAS_KLP),y)
>         HAVE_XXHASH =3D $(shell printf "$(pound)include <xxhash.h>\nXXH3_=
state_t *state;int main() {}" | \
>                       $(HOSTCC) $(HOSTCFLAGS) -xc - -o /dev/null -lxxhash=
 2> /dev/null && echo y || echo n)
> diff --git a/tools/objtool/arch/arm64/Build b/tools/objtool/arch/arm64/Bu=
ild
> new file mode 100644
> index 0000000000000..d24d5636a5b84
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/Build
> @@ -0,0 +1,2 @@
> +objtool-y +=3D decode.o
> +objtool-y +=3D special.o
> diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64=
/decode.c
> new file mode 100644
> index 0000000000000..47658c76e1af0
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/decode.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <objtool/check.h>
> +#include <objtool/disas.h>
> +#include <objtool/elf.h>
> +#include <objtool/arch.h>
> +#include <objtool/warn.h>
> +#include <objtool/builtin.h>
> +
> +const char *arch_reg_name[CFI_NUM_REGS] =3D {};
> +
> +int arch_ftrace_match(const char *name)
> +{
> +       return 0;
> +}
> +
> +s64 arch_insn_adjusted_addend(struct instruction *insn, struct reloc *re=
loc)
> +{
> +       return reloc_addend(reloc);
> +}
> +
> +bool arch_callee_saved_reg(unsigned char reg)
> +{
> +       return false;
> +}
> +
> +int arch_decode_hint_reg(u8 sp_reg, int *base)
> +{
> +       exit(-1);
> +}
> +
> +const char *arch_nop_insn(int len)
> +{
> +       exit(-1);
> +}
> +
> +const char *arch_ret_insn(int len)
> +{
> +       exit(-1);
> +}
> +
> +int arch_decode_instruction(struct objtool_file *file, const struct sect=
ion *sec,
> +                           unsigned long offset, unsigned int maxlen,
> +                           struct instruction *insn)
> +{
> +       u32 ins;
> +
> +       if (maxlen < 4) {
> +               ERROR_INSN(insn, "can't decode instruction");
> +               return -1;
> +       }
> +
> +       /* arm64 instructions are always LE, thus no bswap_if_needed() */
> +       ins =3D le32toh(*(u32 *)(sec->data->d_buf + offset));
> +
> +       /*
> +        * These are the bare minimum needed for static branch detection =
and
> +        * checksum calculations.
> +        */
> +       if (ins =3D=3D 0xd503201f) {
> +               /* NOP: static branch */
> +               insn->type =3D INSN_NOP;
> +       } else if ((ins & 0xfc000000) =3D=3D 0x14000000) {
> +               /* B: static branch, intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_UNCONDITIONAL;
> +               insn->immediate =3D sign_extend64(ins & 0x03ffffff, 25);
> +       } else if ((ins & 0xfc000000) =3D=3D 0x94000000) {
> +               /* BL: intra-TU call */
> +               insn->type =3D INSN_CALL;
> +               insn->immediate =3D sign_extend64(ins & 0x03ffffff, 25);
> +       } else if ((ins & 0xff000000) =3D=3D 0x54000000) {
> +               /* B.cond: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x7ffff, 1=
8);
> +       } else if ((ins & 0x7e000000) =3D=3D 0x34000000) {
> +               /* CBZ/CBNZ: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x7ffff, 1=
8);
> +       } else if ((ins & 0x7e000000) =3D=3D 0x36000000) {
> +               /* TBZ/TBNZ: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x3fff, 13=
);
> +       } else {
> +               insn->type =3D INSN_OTHER;
> +       }
> +
> +       insn->len =3D 4;
> +       return 0;
> +}
> +
> +size_t arch_jump_opcode_bytes(struct objtool_file *file, struct instruct=
ion *insn,
> +                             unsigned char *buf)
> +{
> +       u32 ins;
> +
> +       ins =3D le32toh(*(u32 *)(insn->sec->data->d_buf + insn->offset));
> +
> +       switch (insn->type) {
> +       case INSN_JUMP_UNCONDITIONAL:
> +       case INSN_CALL:
> +               ins &=3D ~0x03ffffff;
> +               break;
> +       case INSN_JUMP_CONDITIONAL:
> +               if ((ins & 0xff000000) =3D=3D 0x54000000)
> +                       ins &=3D ~0x00ffffe0;                /* B.cond */
> +               else if ((ins & 0x7e000000) =3D=3D 0x34000000)
> +                       ins &=3D ~0x00ffffe0;                /* CBZ/CBNZ =
*/
> +               else
> +                       ins &=3D ~0x0007ffe0;                /* TBZ/TBNZ =
*/
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       ins =3D htole32(ins);
> +       memcpy(buf, &ins, 4);
> +       return 4;
> +}
> +
> +u64 arch_adjusted_addend(struct reloc *reloc)
> +{
> +       return reloc_addend(reloc);
> +}
> +
> +unsigned long arch_jump_destination(struct instruction *insn)
> +{
> +       return insn->offset + (insn->immediate << 2);
> +}
> +
> +bool arch_pc_relative_reloc(struct reloc *reloc)
> +{
> +       switch (reloc_type(reloc)) {
> +       case R_AARCH64_PREL64:
> +       case R_AARCH64_PREL32:
> +       case R_AARCH64_PREL16:
> +       case R_AARCH64_LD_PREL_LO19:
> +       case R_AARCH64_ADR_PREL_LO21:
> +       case R_AARCH64_ADR_PREL_PG_HI21:
> +       case R_AARCH64_ADR_PREL_PG_HI21_NC:
> +       case R_AARCH64_JUMP26:
> +       case R_AARCH64_CALL26:
> +       case R_AARCH64_CONDBR19:
> +       case R_AARCH64_TSTBR14:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
> +void arch_initial_func_cfi_state(struct cfi_init_state *state)
> +{
> +       state->cfa.base =3D CFI_UNDEFINED;
> +}
> +
> +unsigned int arch_reloc_size(struct reloc *reloc)
> +{
> +       switch (reloc_type(reloc)) {
> +       case R_AARCH64_ABS64:
> +       case R_AARCH64_PREL64:
> +               return 8;
> +       case R_AARCH64_PREL16:
> +               return 2;
> +       default:
> +               return 4;
> +       }
> +}
> +
> +#ifdef DISAS
> +int arch_disas_info_init(struct disassemble_info *dinfo)
> +{
> +       return disas_info_init(dinfo, bfd_arch_aarch64,
> +                              bfd_mach_arm_unknown, bfd_mach_aarch64,
> +                              NULL);
> +}
> +#endif /* DISAS */
> diff --git a/tools/objtool/arch/arm64/include/arch/cfi_regs.h b/tools/obj=
tool/arch/arm64/include/arch/cfi_regs.h
> new file mode 100644
> index 0000000000000..49c81cbb6646d
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/cfi_regs.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_CFI_REGS_H
> +#define _OBJTOOL_ARCH_CFI_REGS_H
> +
> +/* These aren't actually used for arm64 */
> +#define CFI_BP 0
> +#define CFI_SP 0
> +#define CFI_RA 0
> +#define CFI_NUM_REGS 2
> +
> +#endif /* _OBJTOOL_ARCH_CFI_REGS_H */
> diff --git a/tools/objtool/arch/arm64/include/arch/elf.h b/tools/objtool/=
arch/arm64/include/arch/elf.h
> new file mode 100644
> index 0000000000000..418b90885c501
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/elf.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_ELF_H
> +#define _OBJTOOL_ARCH_ELF_H
> +
> +#define R_NONE         R_AARCH64_NONE
> +#define R_ABS64                R_AARCH64_ABS64
> +#define R_ABS32                R_AARCH64_ABS32
> +#define R_DATA32       R_AARCH64_PREL32
> +#define R_DATA64       R_AARCH64_PREL64
> +#define R_TEXT32       R_AARCH64_PREL32
> +#define R_TEXT64       R_AARCH64_PREL64
> +
> +#define ARCH_HAS_INLINE_ALTS 1
> +
> +#endif /* _OBJTOOL_ARCH_ELF_H */
> diff --git a/tools/objtool/arch/arm64/include/arch/special.h b/tools/objt=
ool/arch/arm64/include/arch/special.h
> new file mode 100644
> index 0000000000000..8ae804a83ea49
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/special.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_SPECIAL_H
> +#define _OBJTOOL_ARCH_SPECIAL_H
> +
> +#define EX_ENTRY_SIZE 12
> +#define EX_ORIG_OFFSET 0
> +#define EX_NEW_OFFSET 4
> +
> +#define JUMP_ENTRY_SIZE 16
> +#define JUMP_ORIG_OFFSET 0
> +#define JUMP_NEW_OFFSET 4
> +#define JUMP_KEY_OFFSET 8
> +
> +#define ALT_ENTRY_SIZE 12
> +#define ALT_ORIG_OFFSET 0
> +#define ALT_NEW_OFFSET 4
> +#define ALT_FEATURE_OFFSET 8
> +#define ALT_ORIG_LEN_OFFSET 10
> +#define ALT_NEW_LEN_OFFSET 11
> +
> +#endif /* _OBJTOOL_ARCH_SPECIAL_H */
> diff --git a/tools/objtool/arch/arm64/special.c b/tools/objtool/arch/arm6=
4/special.c
> new file mode 100644
> index 0000000000000..5a6424a59e1c5
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/special.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <objtool/special.h>
> +
> +/*
> + * On arm64 a zero-length replacement means the alternative has a callba=
ck,
> + * whose address is stored in the replacement offset.  It must be preser=
ved.
> + */
> +bool arch_alt_ignore_new_reloc(struct section *sec, unsigned long offset=
)
> +{
> +       return false;
> +}
> +
> +bool arch_support_alt_relocation(struct special_alt *special_alt,
> +                                struct instruction *insn,
> +                                struct reloc *reloc)
> +{
> +       return true;
> +}
> +
> +struct reloc *arch_find_switch_table(struct objtool_file *file,
> +                                    struct instruction *insn,
> +                                    unsigned long *table_size)
> +{
> +       return NULL;
> +}
> +
> +const char *arch_cpu_feature_name(int feature_number)
> +{
> +       return NULL;
> +}
> --
> 2.54.0
>
>

Flagging an issue I'm seeing, in case you haven't encountered it yet:
applying this patch to v7.4-rc3 (with the new objtool klp unit tests)
I'm getting a failure building with LLVM:

$ make -C tools/objtool ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- LLV=
M=3D1 tests
make: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
make[1]: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/lib/subcmd'
make[1]: Leaving directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/lib/subcmd'
make[1]: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
make[1]: Leaving directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
TAP version 13
# preflight
#   objtool   /usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tool=
s/objtool/objtool
(klp: yes)
#   compiler  Debian clang version 21.1.8 (3)
#   arch      arm64  (host x86, cross)
#   tmpdir    /tmp  (each test builds in a fresh directory here)
# not run: 6 tests in x86/ (this run is arm64)
1..46
                                                            not ok -
test-abs-and-addressable: abs_and_addressable.c does not build: 1
error generated.
...

I haven't been able to dig into it too closely, but my AI tool is
suggesting adding -mcmodel=3Dlarge for llvm, or putting '.set abs_sym,
0x1234' in a separate object and using partial_link.

Thanks,
Dyaln
