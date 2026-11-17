Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937384;
	b=TyAEFW41xz/d2fcDSR/gb78r66VY0JK6WaZE6WtoTSZlmSjZMbTRZXh2eEaClpBbLCpt
	 IYJLoNPIXC45Ltpy4Sa5fgZ4FY8jlzncGw2+m84iWP70Hmz/S3XMlULO0IjXcFWUlGqrK
	 1Hit5KHxYn1HJKI6zuYLtxfsrVhjJuVHhhtAf2kfdOdBP/vRi7CsjJfYjC0vpJ+wKQk+z
	 JOhZ6tpuUxyxQ1HfdzBBe4mCKG6Pe9D4RaOPUW8gapGqNGoPWNuWtIjVoPvE/hafqu0y9
	 bm3ulbSnxjaOmWa/vDipn0p/uSAsVUp/NqxPi/M+dibrdHsVshdHIoanyn9PDojEnZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nvzZs1q5voEwvj1dbc4nqY6RN+HlKTD/o3FysXVRy+g=;
	b=3qCfgRUQ//3LnPB87k/XFXn5eex7HnMnXz0KBtuevmGUQkl+sW6dr0k46iTcLJ2IAol3
	 GJ3XIw1e+Sk9coSoH40SAWLATVPEMxvTPnsVMOMoMxUTPan6lin39ZtVHcV+13RFegJ8C
	 FIZHiG0dQEnpShkYcrsJf+EZPjNbZQk92DHlLU/BnjRlryKHKMH86ZcO1Q6/gIUI33qGH
	 mTmnKZpq55V1VT/oDpBuHZ+AnyUaoWJXHdunZp3jHdCBpKKMoKEW2a6wx4shlLDppmKQz
	 ++slryv/10KZhoQDgNTUN7QlobFROz2BJ9QVWqqsPuheCki9I6zglfJxoYdI4DZvxFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK78JQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D59606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D59606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK78JQH
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae3a5d440aso1376121fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937382; cv=none;
        d=google.com; s=arc-20260327;
        b=PVdyTa73RrrpjlyA2pJdMUZt4rPZg5+WanMb8uzt0QU9OeRmbxYsEYr5otXb2b5hUJ
         fZTt1QR47kX9mOysdbs/od6b4QqSL45WFo8xNcvebKiEPcugji3M+qEqLadXI06BPT/8
         3cx+tr7nYDL/0k2j+Cz5J3sbjBKzIQUp4ADF9RzlDXgiO47NK8KTADiCfWPfE6sTj1EV
         RXjGs5/Au40er+2nxp8gqtMFVU8n0oI1znFHrAPd2C8LIQmSx8CazidTYHmzq0J76Gv2
         zBFBKnNCmDFr8TZXI7BubuywHJThAuMQFyX8jwZEKuD3m803ETz8c9RNNduFkZXRH6lm
         +78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nvzZs1q5voEwvj1dbc4nqY6RN+HlKTD/o3FysXVRy+g=;
        fh=vDS4+X4JjF431JCcL3M4YgHHl3pleuShQ9UUhwThbsQ=;
        b=Q+eH/WW72UvUr0t5UsFXp1Hiql/L8Vrhedm3jWUFxWDPaHpnUVz72bD4Q8PTmayGsZ
         bv0Om5ImkaaOKZe6YYBrh6R88wc5+Rb9dYNRZHsR/dPUkLPRF6gRgylzpAbEH8QZ2rdJ
         sfwPN9vkLaH7O3EjDbRTAEvxnDjZx6fvLcEDw4iYuHe04qX3zmq0MTTmgwK59of2HfdO
         O8EnA+dE7JO8VlRAySrg830InqGm1gkvvyFuNGUYz/y8OsGFT8SiLke8ov8HVlBEB8qF
         B+Eunx6oYSUwSMe0seA+6GliahCbHtHxbpelI88TYSR9SWH9jzEDrY0gk/UcGv7H8ceu
         bSOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937382; x=1795542182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nvzZs1q5voEwvj1dbc4nqY6RN+HlKTD/o3FysXVRy+g=;
        b=pJK78JQHngzfVAOhh+bAZ18z9qClPx7EUlb+eUYv+l6UG0HetMaBj6Pa/X7B8I2XIZ
         eVFyqpPP45jn2eNemdddEz/STarrtyPopzZiezq3r0a/yWjyPZh8Yp5TbEpjakfM8Fk3
         iZVVaQREyoLyK0sBtNOIkecIuHoZq0492+2u3bOkVceYcFZbZAnRTmoL+R3C8UyTJfOP
         E1CWzxQVvrVLQ8D+t7iN4CsrrKAGo6knnTL8s3pxr7hviMpMGHKyVqr6mGwMCXUU2ldc
         JXLpSXUaL4rKva469YAlP6h7rOy3ciH0nHwsb0OnCFuOOfONesAGNh4PTDkrYAqKzZLg
         8MiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937382; x=1795542182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvzZs1q5voEwvj1dbc4nqY6RN+HlKTD/o3FysXVRy+g=;
        b=xMVEt445pT6nk0Si2prfpxJTo4bXAikyQVrkKJyYAl66Br1rDvvoslgBCtQ+LMAMgq
         /MVbBAJSm1HKMH7ybnak2dCICqVYMo2vJAhnhSThAAP8XQV1nANe9uqtgoGwEAmyEVB7
         +6tfVWKUZFAxYSbyvs4JEEbWhhyN+/B7nZUtV/Pcv3lZ7NHLmfWjDGdIkTomNsodUn5p
         MHZWxK8gzG5ayMhLwIcb0pjhyDhsb3qVqXdFob6mFGvizaK4OKPPSXD07HPf1heEYQ9J
         mT4dg/DM7JY9U/tSu1DBvGGHjxr8uTsxbN5aLtFRLaY726Tz+XEP8pp1iDrv8tyx7MrO
         SxzQ==
X-Forwarded-Encrypted: i=1; AL+hErF9Y2ncP7qt5djXh+6onLA/p4mpi0mNs4Ga9z3uhi2dXC++4ZTASAOF9I4Hli0PXBE+EMTVPcPFDGhYPH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X0sYOTW7ND8v0Qk+0ICd4zG6qRLoWSDynMmqcqtXkm9K0nE+w
	YbdXKIX+CU/95sGUwsMEI51zKogr5rVmURh9e+9qIl0lRMVNOAxpjInvHHqLkoi5Hzk1fUmpolG
	fzGiTwMp/zFOn8EBT9EmuffPI/VfD0Ck=
X-Gm-Gg: AYBFou0HEH5m8Zzc0PcKm9gAPTouHsFYxdfHfKLG8fsAagvZ5eqbg2n05M3sdN3WeR/
	I5/LoVGuAOmBSZsGje4uyb5eWZ+5lpmONkVhLHRx04rTW8Vm32hAdOaRn0+I/zv3Z3DNcH+TOfK
	pxBxJO7ybyuHztRHEl2j0Am7X1lt4UDethPVV9TaqpFoYO0/kfFpQmCdVzvDCm5tsQ7deQzpUVU
	fJc0O2Y3cmVAoLaB7YgKtTASqLLgZ5iT2AVp5IbZKseUE67GFup4uFBfkBzg/LW8CLF0wl/QzA+
	N7lC8k7WR1vkkCnb78020IQ/ptD7JEl1NtyHCN7oNp3D5vnrSCoiUYE6llZODgDu1/l8F/HwAiB
	NKFqBClcUwAnRezybVGvl8eyEZwYpVNKzmlDzSiRkdAe3DyCGqTD1X7WfbCpUx3lqNBj6wFGcLA
	zXHmrnuKwnei5aAxWeDrHJh9XoCWljuS4aI0s0lGU9tbjKa8gp+/4UdMr3XW1QBBowoEBO
X-Received: by 2002:a05:651c:a171:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3ae2b52e925mr48966131fa.22.1794937382329; Tue, 17 Nov 2026
 09:43:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
 <20261109-ppc32-perf-v1-7-a6e8a55b3b48@gmail.com> <3950cc84-93bf-4830-8a37-57f9739a84b0@linux.ibm.com>
In-Reply-To: <3950cc84-93bf-4830-8a37-57f9739a84b0@linux.ibm.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:42:50 -0500
X-Gm-Features: AclHuK9QUI3yDbyT2B0UUj_KZN-ImAYjLn5ew9el98OjTN6HFOxuPodteoFnxMI
Message-ID: <CAEdQ38Hr-pdXs2XYyFr0ryFsdeQ4xC5W9yG_xfDBhN068cDtBg@mail.gmail.com>
Subject: Re: [PATCH 7/8] powerpc/perf: Use SIAR for sample addresses on 32-bit
To: Tanushree Shah <tshah@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:11=E2=80=AFAM Tanushree Shah <tshah@linux.ibm.co=
m>
wrote:> One question: the callchain still walks from regs (gpr[1],
link), but
> its first entry now comes from SIAR. Can SIAR and the interrupted PC
> end up on opposite sides of user/kernel? If so, would the callchain
> be affected? Something like perf record -g on a workload that switches
> between user and kernel often might show it.

Yes, it happens. I ran perf record -g -e cycles -c 1000000 on a loop
that does a little work in user space and then calls getppid(). Of
16953 samples, 3022 had SIAR and the interrupted PC in different
modes.

2193 had SIAR in the syscall exit path (__kuep_unlock,
ret_from_syscall, syscall_exit_finish, syscall_exit_prepare) and the
interrupted PC in user space. The exception is held off while MSR[EE]
is clear, so it's taken just after the rfi. The sample is marked as a
kernel sample, but the callchain is a user callchain that starts with
a kernel address, so perf can't resolve that entry, and the actual
user PC (in libc's syscall()) is missing.

801 had SIAR in the system call vector at 0xc00. That code runs with
translation off, so SIAR holds a real address. The interrupted PC was
in the kernel, but these were marked as user samples at a bogus
address.

The other 28 had SIAR in user space and the interrupted PC in the
kernel.

In v2 I'll use SIAR only when it's in the same mode as the
interrupted context and fall back to regs->nip otherwise, which is
what the code did before this patch:

static inline void perf_read_regs(struct pt_regs *regs)
{
        unsigned long siar =3D mfspr(SPRN_SIAR);

        regs->result =3D siar && is_kernel_addr(siar) =3D=3D !user_mode(reg=
s);
}

A real-mode vector address isn't a kernel address, so this covers the
0xc00 case too, and perf_get_misc_flags() no longer needs to look at
SIAR. With that change the same test had no mismatched samples out
of 18069. The share of samples in the kernel went from 44% to 46%
(perf stat puts it at 57% of cycles), so falling back to regs->nip
near the transitions doesn't lose anything.

Good catch, thanks.
