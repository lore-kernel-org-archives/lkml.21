Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795041564;
	b=DV4Drl1Zcezr6dQkIZxwsrTpFtSDoQ4D4THilIBBuFY9uRriRZ9DAJShuj8VJGxMiBn1
	 qAJr8zYI0GUL+wGZKjAOPQl+xz6SbLmCoXuhBo1DYQhyBXf2PyZjtn09iizbtLSpEFD6D
	 jXrCCBbbKhD6xqBv3Gc6RpU5LXLMCbTQ5lVrvzBwpR58sR+tcdU1LRuhA1GkmFNN8Zvuu
	 TIdUsjAxF6rGvP19pLdPflRynunFa0sHHSNCP2AELxn1A8CdS34ximgVSY941qODa5SNa
	 b7a1BG9aNopS4kxzjW76jnOhUI6Se5JKzwcXa35cfwpbX6zXducPZLx/2wjb4eOy2Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Cqoa4dXqZaAiS8aE3G3lsewapMXlB21+rBhXzkkWJw=;
	b=ohoLX7mr3GyVnErOpnFH9xFd2LdoIg5DKX1rJ1ZG6/J6aicM+AbfylSRGNVJAVPcfcQM
	 hcC3Ak8X0ohIzcOwkfoUYvqDWu8J08g2oOjjjjsGBG8EM6td5MGiyYpaxCNJ4q7iC/c2z
	 1BOXKKbR7eRLFUErVYD++P6M0ymD5H0NBb6mhn9aDLBv5ZzrqQiKu6RjaAFRrP7PRMpPI
	 OrjPtaZ36bHMzV062ztQ+DuhGStall7P3QmJPomWoKakoITa9/LvYeOuwHbz/IDcD2y/P
	 4G/9Eo6HqL1r4XhkcDg9fnaOkvXUcBAhP6vMX005b+W/kuAvSRAfC+o1wP8ZRteTS0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lz1EDrTy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647BA606B60D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647BA606B60D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lz1EDrTy
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1662a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:39:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795041563; cv=none;
        d=google.com; s=arc-20260327;
        b=MCNQf5WQ4bQOXjFKGcnscqWFhAmI+g3n+yYqynLuhfPZX3g2A36ZVIB5QxSj/gKS9f
         /b1MyfXHMzGgCTyR3Cp5fZiUVmQLD+qqvgrOHeh+dlOub2K4tQm391RCcadkU+f8qu8M
         XLyQNb4MTyHvT0ozHUc9TZJV2xOzHjC+ZdrJNpkD9YmP6/TNsAOa0vbBzk29ygbH5agD
         FxtvrL8DNFUd5x8XndDpob7VdozJZJ7LhHwYWunIo/3s50oDPFsFQmPpPQLFQ2mg48uT
         XC5/DsovG6TMM9EJAgpXQdaQsV2z0N0L7A5ilFMTMOpVEZKS8lr+Vr/EQx90nCh83wZH
         +gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Cqoa4dXqZaAiS8aE3G3lsewapMXlB21+rBhXzkkWJw=;
        fh=PybAICj36jvhOBwh2EmKvmGM70ByFumwmaKpeZRNykU=;
        b=W4QtZLnD4wSpld+esvrSP9vxqUU0iBL+4nz7qmWtfYEvjW0rCWJRAzd8kB5cMr/5pv
         ceQSJO2Fyu+P6pZJZyudFcnruB4icZHco0gLrcnqA7fM36ZzhgH1EMR5dopshnnPo8bb
         y2kYxfaS8Su3hZ8I2CC52FZcv23N69kZm9IpqDgXGavsnKlCSUc4qiT0vCYOvjT3bSsq
         S+8auyOj9Tw9wbDqpGJ/ZG6rNJxqzeBWuA+DlM2mu9d9K54ps5rNRR4RCRdSQxV1HgLE
         kpAFwDPV9Q5i76swzSUKCKVqk+8DizKXWdnydCYBPy9pvx86uZPFjczmwGP4LvgA9Snf
         X+vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041563; x=1795646363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Cqoa4dXqZaAiS8aE3G3lsewapMXlB21+rBhXzkkWJw=;
        b=lz1EDrTyj31KliJAr+PKfNyfjGnRXeaanIf/XEWQ+VBkdKslFrXPb5W5vzYRB0SGOs
         0hNna0LZ9+AT7BqrU/qf+Z7tVEHupXiVqKQXfrO9Q4VT3KTtaDNT5/ca7SQG+KE/TLPo
         IHwuyxZdbruhaCoBwa5zCMh8I2KrUy1wJg3f/FKE9VyUD/a28wpK1T4NsLGTuRqZYGDK
         Nwq/3MqIIRtdG7EUVqwyLgDKjuQQJV/agqJOb4YgoZMRdpzEGjIaSMHdI90v4q5FQ+Sv
         Hge7975rEq74XfHxH9g36sERI07lpLv5nw+phw79GVP4M4vuKF/xyxdMBRe5CKiKfHIU
         FCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041563; x=1795646363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Cqoa4dXqZaAiS8aE3G3lsewapMXlB21+rBhXzkkWJw=;
        b=fKDs9iGqKVMqAQc/NwIiKgtLQvt++EQzvJQy+x12bSkoNAjSg4rB4EZxmYonrAXYNR
         6AKMAxr7CQxqgJghpFVdpvHajkJPgRQIJQjHigQv68KrXK23qrJYNpj3AyCgEb6vtMCE
         BGCpEF9XMX+2r3qn5gKdQICpZ7vWsmKSdjWoFzxk/p9OduxHWb7dSFyoJ/9WnBVu9Bti
         fn8FLaWN41PfQaOeI3Pmlux2vVlmsFa5Q8+s6+0hPHKIzEl/7MNmP+gulTE+IU4xw/F0
         wJE5RerfkZQN3aohnmVEvDePrJInEN84MBJBRh1jyZtygHXhAfCT+dLMEoZx6FUDUV7R
         pgbg==
X-Forwarded-Encrypted: i=1; AL+hErEUvZNPGQ3Qud4PopJsz5ivj4A3gpr7OS92IouUN/FXGAM8efuzATEcQ1KaCC4jlXvHZJwIneAWki6WmP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+61oRB42v2GXpoNcZZCBsp7hJaGh32w46ER1ybLCPc+dNaHWIf
	kYAhPPPVGtZibURjg62RRs4+O/5cq+aOLLW1folR3t6NmVKHAv3myPoDLdLBWwVqU763o1ZMPoU
	/Xk+pqDMqxiMk7bKRpXvPCtK5ZyudKfZV0nUHdQVH
X-Gm-Gg: AYBFou1+H/jElFwBwFhfwjvoM+k93oQyBZYmSFFwtaVw5mATdKMv4sV65kYHJeh3NM5
	FRFdvmCwQ4Xgouu6bsWagO1pX91c+vezRX2p2Ze1W8h2ipc8EYajhb3ql7Zh9CwXTPE3ywj7zuq
	/abZatrJcyysi8P+Vx3FMUe1RtlLCEXJhMH1AIs22rBtjcG3ZEDeye1Nia13Jays1/Z15/ybHVV
	6dcF+hCG7IViPRZhHpbSljr3KpcFh6qMLBrOarHMp8uHUh6eA8L0t9+Jt/QQvkdrVevoVsc1X8j
	YNX/qnRYyJGg6lUiDIEpc8YwNUNmhdByL7eSCWfTWyUeY4lUzR3susy2EiAVn0NF44/+Sll25kr
	+V4JoxXOSLHvVgLSDexGDL8qtBQLesqR23eaMpg4nTPdK5VeOH34DYBmDAaJm5vZoxKmpexHCz5
	Sg747Z+9zQ7AmYwy0HEb3DAt5ox0PLVgHyAlRLH4sYVa+9WWgUXjhDCQ==
X-Received: by 2002:a05:6402:446:b0:6b9:de8f:cb86 with SMTP id
 4fb4d7f45d1cf-6ba11bd2370mr12316a12.16.1795041562272; Wed, 18 Nov 2026
 14:39:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-5-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-5-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 18 Nov 2026 14:39:10 -0800
X-Gm-Features: AclHuK_mZOQNLAW_jVpbBx4gG_MzABTDZgOD2t-o1slK_xleWXPR03CJnChaVWc
Message-ID: <CALMp9eQABxnk2EV64xXXeH+V03LWrnK8qWOcWcDeX3tiY_N3zQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] KVM: x86: Support APX state for XSAVE ABI
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:31=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Introduce a facility to copy APX state between the VCPU cache and the
> userspace buffer as the VCPU cache is the single source of truth.
>
> The existing fpstate copy functions historically sync all XSTATEs in
> between userspace and kernel buffers [1]. In this regard, any additional
> state handling logic should be consistent with them -- i.e. validation of
> XSTATE_BV against the supported XCR0 mask.
>
> Now the two copy paths requires to take care of these facts:

 s/requires to take care of/must account for/

>
>   * When exporting to userspace, copy fpstate first, since it zeros the
>     area of any component that is absent or inactive. Then copy the APX
>     state from the VCPU cache.
>
>   * When importing from userspace, the APX state is copied to both
>     fpstate and the VCPU cache. Avoiding the duplicate copy would need
>     special care in the common code or in XSTATE_BV/XCR0 which isn't
>     worth that much for a slow path, so keep it simple.
>
> [1] Except for PKRU state, as stored in struct thread_struct.
>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
> V8 -> V9:
>  * Fix XSTATE_BV[APX]=3D0 behavior (Jim Mattson)
>  * On the way to the kernel buffer, switch the copy ordering (Jim Mattson=
)
> ---

[ ... ]

> +#ifdef CONFIG_KVM_APX
> +static void kvm_copy_vcpu_regs_to_uabi(struct kvm_vcpu *vcpu, void *buf,=
 u64 supported_xcr0)
> +{
> +       union fpregs_state *xstate =3D (union fpregs_state *)buf;
> +
> +       BUILD_BUG_ON(NR_VCPU_GENERAL_PURPOSE_REGS <=3D VCPU_REGS_R31);
> +
> +       if (!(supported_xcr0 & XFEATURE_MASK_APX))
> +               return;

Now that this is called only after fpu_copy_uabi_to_guest_fpstate()
succeeds, this condition cannot be true. fpu_copy_uabi_to_guest_fpstate()
has already rejected any XSTATE_BV bits that aren't in
kvm_caps.supported_xcr0. (That was the second half of my comment on v8.)

[ ... ]

> +       /*
> +        * The APX state was also copied into fpstate above, but the VCPU=
 cache
> +        * is the single source of truth. Skipping the redundant copy ten=
ds to
> +        * introduce special-case handling. Since this lies in a slow pat=
h, keep
> +        * the implementation simple.
> +        */

With vcpu->arch.regs[] being the single source of truth, how hard would it
be to keep the APX state out of guest_fpu altogether? It seems like that
would be cleaner.
