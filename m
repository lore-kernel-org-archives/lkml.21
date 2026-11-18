Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003173;
	b=geDMRtq/0DxipYRAvxiJalAIoNmYPlVujTXW/GbUC2/YmZnoqbUzdN4cMM1yXeUt2gJg
	 ASvelws7sgfDjEz+Y6R1qvptyLPZEdnVPMp82FbHOiRc4TGRZgPTtFZZeJ7WieRSMsVbr
	 8ZGsqQe22sEaGnHysiV6iVMcxi9kdOGjAMaTzdr/EoUEaX4mw+hVtMtuOBPU1qO4mkM30
	 jLggq/j4Z0kf5UYi8PcRraEiijDthFb3VHtWPpZd4LnFeBqY56buSHgUYdE/1o0SyMlec
	 cijKq22K4WVaSJWJRKHWF1ovbOjOdiD4UK5t+1+CnkMn4Xr3wjWhNwbgvoVu1FA04HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003173;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bH6ZQZME+UP8h4wG+aB33LFx7GanxI9Syn/JAZf9Ig0=;
	b=kkjaxgVE0k45bXMzd3i/h0K+DimreAUDbHIArM5/hQYmh1BbQbAJNRxJRTQ9aV2Pc8eV
	 4xUir38MrOdUw0SgxLjaFRDo84DkZ8b+KIAYHO/Wftz7tVq4pztnJt0vCzvLXT501nzjV
	 ltDR+A5Ki6uIP6cDaq8syX6defBca8INOhHHZWHQYezEnVIjf9lcXe2Xobe2+8mW80Dfd
	 mnCpz6i0BxAgjE64+oY4/2E5fjBeaKyw4uXYBiMKxzrV5R5Qopc3OqtHVLzqS3CNp/e5B
	 x5VOidWz+NWD6ushpbcEha1Ia5SlLsZSLX1mqQbrmh1vZC0VaSNsuH0vGeyWMo36Mbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKFIY6XU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2060A2635
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKFIY6XU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7EE1F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003172;
	bh=bH6ZQZME+UP8h4wG+aB33LFx7GanxI9Syn/JAZf9Ig0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bKFIY6XU2YYUsOecjd3tLHcjepljyJH467mRnE0AJXl4hfJOSVjobJrGSgpow+jue
	 5wXKoLqG+z3KP5jhahdtxYzbbgqk8vXHP814+fQiIbhsw1KQiMjnL0tqV+lf/la5Ho
	 7HcueY0YIEL5KzodtSNdh9s7lSxMVR4RLFDiLs71SE5Op6E5t85eVUtDKjpZjzdt4C
	 9yVuJjl1hhzJ7wBvfctumEliZpQzJjGP3wbRlirzIDm0uATkhrdcBF2Lr6blKPhZXo
	 q8161LGkuJCTIqQmVwvSHWJ/ePGd58lbYgqKHErT1UXxSObo1YUMBGs8qPLaP25C+Q
	 leD+M3+7SlMwA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so1320525a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwqcC0WT9TcWtascHXpnILsxBIKQG65cVUOLSAthDxBWZs4pz6HWaBL4MMmTTR9d+SpksMCRvKpYV1Bhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ICXNlecJSmW5EoXhJyp9TQ6xiCki2jHFcKrDlQititkNu1c12
	Xp+NdWMHMCRf8+4ZQ9eYeJcM0CgLUq6srp400zxi1SKlt6MvZw8Noxvq7hPfkuzXZfyACsjVms+
	AtxCP4G5H+Eq5Dnyefva0gFmmvpGlvOc=
X-Received: by 2002:a05:6402:42c2:b0:6b8:981e:9896 with SMTP id
 4fb4d7f45d1cf-6b8981e9a77mr1167842a12.15.1795003171385; Wed, 18 Nov 2026
 03:59:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118071444.10258-1-dongtai.guo@linux.dev>
In-Reply-To: <20261118071444.10258-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 19:59:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4TNuXk60LyzZhFwQTfNtdzLEFQTwS84u3ZMQ6b=8S0NA@mail.gmail.com>
X-Gm-Features: AclHuK9RMXtq8INuqJyxShDP1iB7lCD0ZsGtokFdu5T-DLvL7gz_akNiwodRTL0
Message-ID: <CAAhV-H4TNuXk60LyzZhFwQTfNtdzLEFQTwS84u3ZMQ6b=8S0NA@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: BPF: Fix the offset of stptr.w and stptr.d stores
To: George Guo <dongtai.guo@linux.dev>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, guodongtai@kylinos.cn, 
	bpf@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:15=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> When testing bpf selftests "jit_insns" and "jit_insns_blinded", the
> "ldst_offsets" subtest fails for word and doubleword stores:
>
>   $ sudo ./test_progs -t jit_insns/ldst_offsets | grep FAIL | head -1
>   store_offsets:FAIL:stx size=3D0 base=3Dr0 src=3Dr1: byte at offset -163=
84
>
> The JIT incorrectly treats the signed 14-bit immediate of stptr.w
> and stptr.d as a byte offset. For offsets outside the signed 12-bit
> range of st.w and st.d, it checks the byte offset with
> is_signed_imm14() and encodes it unchanged. However, the hardware
> scales the encoded immediate by 4 when calculating the memory
> address. For example, a store at offset -4096 writes at offset -16384
> instead, outside the memory range checked by the verifier.
>
> Pass the offset in units of 4 bytes when emitting stptr.w and stptr.d
> for both immediate and register stores. Use these instructions only
> for offsets that are multiples of 4 in the range [-32768, 32764], and
> keep the register-offset fallback for other offsets that do not fit
> the signed 12-bit immediate of st.w or st.d.
>
> Before:
>   $ sudo ./test_progs -t jit_insns/ldst_offsets | tail -1
>   Summary: 0/0 PASSED, 0 SKIPPED, 2/2 FAILED
>
> After:
>   $ sudo ./test_progs -t jit_insns/ldst_offsets | tail -1
>   Summary: 2/2 PASSED, 0 SKIPPED, 0/0 FAILED
>
> Cc: stable@vger.kernel.org
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> v2:
> - Rename is_ptr_off() to is_aligned_signed_imm16() and drop its comment (=
Tiezhu)
> - Remove the now unused is_signed_imm14() (Tiezhu)
> - Reword the commit message
> v1: https://lore.kernel.org/all/20261118030219.6230-1-dongtai.guo@linux.d=
ev/
>
>  arch/loongarch/net/bpf_jit.c | 16 ++++++++--------
>  arch/loongarch/net/bpf_jit.h |  6 +++++-
>  2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 15af1abb5cb6..906f34f420f1 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1400,8 +1400,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stw, t1, dst, off);
> -                       } else if (is_signed_imm14(off)) {
> -                               emit_insn(ctx, stptrw, t1, dst, off);
> +                       } else if (is_aligned_signed_imm16(off)) {
> +                               emit_insn(ctx, stptrw, t1, dst, off >> 2)=
;
>                         } else {
>                                 move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxw, t1, dst, t2);
> @@ -1411,8 +1411,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                         move_imm(ctx, t1, imm);
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, std, t1, dst, off);
> -                       } else if (is_signed_imm14(off)) {
> -                               emit_insn(ctx, stptrd, t1, dst, off);
> +                       } else if (is_aligned_signed_imm16(off)) {
> +                               emit_insn(ctx, stptrd, t1, dst, off >> 2)=
;
>                         } else {
>                                 move_imm(ctx, t2, off);
>                                 emit_insn(ctx, stxd, t1, dst, t2);
> @@ -1460,8 +1460,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                 case BPF_W:
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, stw, src, dst, off);
> -                       } else if (is_signed_imm14(off)) {
> -                               emit_insn(ctx, stptrw, src, dst, off);
> +                       } else if (is_aligned_signed_imm16(off)) {
> +                               emit_insn(ctx, stptrw, src, dst, off >> 2=
);
>                         } else {
>                                 move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxw, src, dst, t1);
> @@ -1470,8 +1470,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                 case BPF_DW:
>                         if (is_signed_imm12(off)) {
>                                 emit_insn(ctx, std, src, dst, off);
> -                       } else if (is_signed_imm14(off)) {
> -                               emit_insn(ctx, stptrd, src, dst, off);
> +                       } else if (is_aligned_signed_imm16(off)) {
> +                               emit_insn(ctx, stptrd, src, dst, off >> 2=
);
>                         } else {
>                                 move_imm(ctx, t1, off);
>                                 emit_insn(ctx, stxd, src, dst, t1);
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index 2bd0dc5b911c..777c76112d95 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -45,13 +45,17 @@ do {                                                 =
                               \
>  } while (0)
>
>  #define is_signed_imm12(val)   signed_imm_check(val, 12)
> -#define is_signed_imm14(val)   signed_imm_check(val, 14)
Is there instructions really take a 14bit imm (not something like
ldptr.d/stptr.d)?
If yes, I suggest keeping is_signed_imm14() because maybe we need it in fut=
ure.

Huacai

>  #define is_signed_imm16(val)   signed_imm_check(val, 16)
>  #define is_signed_imm26(val)   signed_imm_check(val, 26)
>  #define is_signed_imm32(val)   signed_imm_check(val, 32)
>  #define is_signed_imm52(val)   signed_imm_check(val, 52)
>  #define is_unsigned_imm12(val) unsigned_imm_check(val, 12)
>
> +static inline bool is_aligned_signed_imm16(int off)
> +{
> +       return !(off & 3) && is_signed_imm16(off);
> +}
> +
>  static inline int bpf2la_offset(int bpf_insn, int off, const struct jit_=
ctx *ctx)
>  {
>         /* BPF JMP offset is relative to the next instruction */
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --
> 2.53.0
>
