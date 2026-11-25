Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795619208;
	b=u+7QpQgnnj0qDfKVWaYFIw0vN10IB27FtIt5oUj04gc8EAMYm/vFsTqdbWKGFzxFpGky
	 zIjJ/+0kqGd2Nobavc/2rzDhfSp7bW/ePzQfSNHVLLLAwyVY3LlmYHpJXzBBrGO8N+vvC
	 aZJFi7UMFcvKEGa5kSXJdngH5SlK96LFd/KQu7oFgNRplPe1TGDldo/u53WOlJKyLceai
	 GZS32Lic0hkWYIxRqJMR/8ozGc/angCuXMP6ga6DcHAYgYDoDyh8vZ6uq9HdXpHYjjxnT
	 YaF0vRXhEdQC2Fv2N7ynhyaiWXsqRLyMYYfjp2HKyTBWaIR4HMu/OZEcRjbF0lpDiug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
	b=efj9StFwFT48zLjlAOCuUPyNXz/M3XEhNIK6gN87+FoVU3+sNgFviVHfYZeJ6HfObvDj
	 Uebfqk+Le/wpnd8ZMbBPndnZXhhU+Arq8S7iNmh/rNHSDbLLAOhUW9rJVSBuoZaoh+txu
	 R87hltLZtCVHzrlTitOVeldIKQBsiYqwiyS6LwiI6gbdQbAhIwAY1qwDRmfEq7B8fPgOf
	 dK1ZCYo53pVJds3WgLyCizInfDEqiF8ExGUbTEjvSiXVUpstnIJyXOTjSwSaEftLRud+T
	 QBiiLkdYxOMZNOHskICbyTjC7nS5eLV4U5aWl03P8RatpCLBQexESIJFG0DHfN80HNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=pemRuMXy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B38606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B38606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=pemRuMXy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so47211705e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795619206; cv=none;
        d=google.com; s=arc-20260327;
        b=q6yEQWcyAjqCuRBcb2RxD9uoZ8c5talwmE8Y/ZUOwXr14qv/rhVPY7EYGA5sWQCWHn
         uhzZRnSpcFmi17EoURLBdaFVxwLBoFdBWG9PA78F8ys0YYNmi9FAE7p6qsEDzMsT5Vl9
         1vNwxPo/0LkUX82iJsnsb+JTmP+S7UvIPDUTbiUPSwjrfQvWGdxgqnBmbi3Me331qPHY
         Rz2bzJQS/gjS0wx9ajc1t3vcsqgg3UtUFUo9cm8SEDU+zuMRb2F3p65nxam4tbqrkc0o
         /jZ/UMYeNt0jm+CoY9sqtnCKONfciGMnULC63aMQYSbpI8AOS2JUQJYI3LKHvY/SX+x0
         K8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        fh=OLfXTmrcT8vrfwNGHa4ZQrQyaRfT8vzSAkUr5WNwtxo=;
        b=hp0SbhSYSdMf0n8wX6LXiOwFqjizbqPL82ezIbhqQJMUBsRaZbJJswsToL8wKu1EY7
         8hJRVA8WBWblljnP3o7fTcwcHdhJDUXI7lLbMuIW69NjOLfBEJYvY7vYI3R2niOIuyPg
         VIPvwYMhlaPK9lAti+UZbanApnxQmm/Bif5slHx1HkgRrQWax25A+jJG09HvTcp73QhG
         W3/txBZQ/qRr53N+cZn//W+LWOY9rfxhD8Rlhl1//D6wU0BoKwOAjtYfeKnDyeNItQJx
         bKQjDvjwgul4FP7qdiYd0WuszmW/wysmTFGSLcJZ1NNyICMzW9liqCYIUtsLPbv6Aa01
         dDZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795619206; x=1796224006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=pemRuMXyr4I+c1uAftwjHSHymoYH7Onl2IbwGetE3XAtmQX8HIt3kHduM3rqqvWGiD
         Yjl8YW0mB+xKtyLsZKIY7eOvw7Yl3jukaCT8DQGlnCi9GLJTA3QQJDxinJjDAjZP4Moc
         UZ1YaNLJ7/cuVMJbNeHhLmmdME4JYLSWFxZ/IpUKSqna2UDG//Vh4PgosVBNdOELJIPO
         rPsmtKcRuGP8+z1MGP7eQp7LBCL7EWumiDgyz8ssXhTj2sA9U+1doNI+08N+6qnz6jxG
         P86ATgyMpc20XFtOnmiOQVQaBQoqeaVY0j0erX/fJAT8YsM1FWNTT1nrorwU+gghnTfJ
         jzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619206; x=1796224006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=a6T4GC2JDMpqbRiKMeUPpROt+XYXTP5Sn8k3LW1wPS04vxSOg4oTksy/tTjbdmrDqz
         +uuCwGe0cn5/jcP8eJtS4kNaBli29XjoVWGlBBLDcfiFN6H4ax8tAMU5tp7dBtByj2JU
         ARwHV52JInvDaS0sulXOxdBcS5KX96+lfoJebvDzxus6UFvozBaTHz5hufSngarY6px4
         zb1qwNnkXPmMU5ToK13GO5oP/L7Ms6GMcUWIbRWayAbY4oIvXczbOhmgWYsICq2T9JKl
         RyZtogIqrB8JuRMruvQEVEzILz+NCOnUjcor6Mc/oFzmgDlKPbVBFMl82AkjwWzp+Krn
         pgsw==
X-Forwarded-Encrypted: i=1; AL+hErFAqGUNsaqIDYRkxUlMxuxUEn6mqGu8OxnxQdfohqVI7x9HMpUfCskHLMAb+8m4t89F5E9RZ0wHfDmoYWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uf9o3EPeihx+5npWPPozhj+iJBglhob7oJ6UPwzTJhqOqC9Qg
	Xo+gRj9Wak7to68N9NxbgQTZDaB0qAMbQUt0xl/3SM6WVnG0aWdxtE149W2fph0dalzqTp9QP6x
	5niBLAmcpiCcoPg6kDnz8+pDNLA22aIdfRiK+fYwfNw==
X-Gm-Gg: AZFdTZdX8wo6QpIn+iYihBInfZ0sWZQI5EPOhUFueZVQzDtYxfSwGeyPzGUCimjmc6d
	oxig7p20A6c2kjbl1fulBmfEgsOfbN9LWkGclKeHRDS2yM5DOrFN7K5SIoqAyaZRjW2BkfZ2I70
	XS9rSr0cbr4UvgA1PIvhYOtBgaF1S89hBaL2Z+7NIwkGv6j8l7zxVbWObrAuR3Zkv7jprGav4wc
	ASgHlTekwsaB/IwWC1NJ2fTFXxpGsIEh0c4NiuTT0oRdxt8A5y9RBVcJnXygHXFZTK9hOTkPwnC
	mrb3xVUpb0O8YDJZSfKO+1eTb9GepDyyHvHeAB1FgPs+GzWIw2TsYf2x1ZJXJts1FgpTkJeIkY2
	qb/iPs66mMF6QmdUcoSBdK+VyweSnYujekXkWui6TpkPGFv2iSYfhwlXnWwnCPQtL3+WMKYIGYz
	hizZ+vxszsqtMlvkpfC1+y6XR3zOrkWBST5sUJmZoCK0eLULQMhYbo
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4bb88786ddemr337232595e9.0.1795619205644; Wed, 25 Nov 2026
 07:06:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914055936.3672758-1-wang.yechao255@zte.com.cn> <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 20:36:34 +0530
X-Gm-Features: Aa3M54rWb_qwV0lybeTg4v6ZPTlnIV7_ygoXoP0dqWuArNVCCcEttr1PQxaya24
Message-ID: <CAAhSdy2-HGNfbBCJeXPS0wyTaSt+C9rHw08K6dn5DcJCLWy+rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] RISC-V: KVM: add tracepoint for guest page faults
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:37=E2=80=AFAM Wang Yechao <wang.yechao255@zte.co=
m.cn> wrote:
>
> Add the kvm_page_fault event tracepoint to count the number of KVM
> guest page faults.
>
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---
>  arch/riscv/kvm/trace.h     | 22 ++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_exit.c |  2 ++
>  2 files changed, 24 insertions(+)
>
> diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
> index 23a5fd1b686e..07fcf5b6059b 100644
> --- a/arch/riscv/kvm/trace.h
> +++ b/arch/riscv/kvm/trace.h
> @@ -133,6 +133,28 @@ TRACE_EVENT(kvm_vcpu_irq,
>                   __entry->vcpu_id, __entry->irq, __entry->level)
>  );
>
> +TRACE_EVENT(kvm_page_fault,
> +       TP_PROTO(struct kvm_vcpu *vcpu, u64 fault_address, u64 error_code=
),
> +       TP_ARGS(vcpu, fault_address, error_code),
> +
> +       TP_STRUCT__entry(
> +               __field(unsigned int,   vcpu_id)
> +               __field(u64,            fault_address)
> +               __field(u64,            error_code)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->vcpu_id        =3D vcpu->vcpu_id;
> +               __entry->fault_address  =3D fault_address;
> +               __entry->error_code     =3D error_code;
> +       ),
> +
> +       TP_printk("vcpu %u address 0x%016llx error_code 0x%llx",
> +               __entry->vcpu_id,
> +               __entry->fault_address,
> +               __entry->error_code)
> +);
> +
>  #endif /* _TRACE_KVM_H */
>
>  #undef TRACE_INCLUDE_PATH
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 88e0c369b354..de0262d0fd95 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -29,6 +29,8 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, str=
uct kvm_run *run,
>         memslot =3D gfn_to_memslot(vcpu->kvm, gfn);
>         hva =3D gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>
> +       trace_kvm_page_fault(vcpu, fault_addr, trap->scause);
> +

The trace_kvm_vcpu_exit() in kvm_riscv_vcpu_exit() already covers
all traps so I don't think we need separate trace point for G-stage
page faults.

Regards,
Anup
