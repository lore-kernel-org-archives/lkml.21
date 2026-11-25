Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642862;
	b=30s2UnSLS3qPF2+p6XveKgpxiWwzBNBUkVMVOvIMjjm3nIR9I+Jy46DuevYYXJF8QK3B
	 oAysaFuHxnTcKjt0G/IXBXXPYBFFsSGvaq3vJp/bXJE/HsEuRoTrOs4lTEPKoXEGRa4v/
	 1PwEfXrVRasLD64u53FFHItFdTLvl71tKXb3qQZWuQ8q52QwZGflyqL7zcyQE967hVMkj
	 zkj4jFmJXzQGwIs9jYe+wS3ATAog1/ti7tir9eBiWONC0mH6tPiVBKcoEeI3whtMIK6eO
	 k3jb5h5CwrBHLZRchnl4GkcUspSJMgKXDa5ojuRG+QJKPFcbmBQxprDoJXQrliuOx3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642862;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NcWgHvdLtb/0W3sgf0a6rdFoC0yfIF4KP6bkd69RC+g=;
	b=mj0f+2+HNWqHeDlWIx77w6EE7AQMvnMBxvvrNfJKgZRzYO2yVJmc2CEa9rqtNFSpQZaG
	 hm27zgu5Kvrijr+HSEn5OdTsWTkPqowo0FJQ91Iyf8MI9qlKTYMMXHykwmDsZkgiXz73j
	 Wsg11+534tBmi6CMDRKT5e5o3RrMgqLId17XC3VV4/Ch73CW9JjfhYWJsxRcUmy1Skmhw
	 5n2Nnlv8ymKcVc87o5MgLjA3UVECqhQUy1uMxb2IkvkrIXQolWLN3kWfdcpEdge/7F11a
	 wDZchGp2W7WYXmZVdDnPiEAM1EVIIlNtlAq1VNVfIYTpFI3n5F9xI1C7M3xnE+fyNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bxn3fdK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bxn3fdK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8341F000D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795642862;
	bh=NcWgHvdLtb/0W3sgf0a6rdFoC0yfIF4KP6bkd69RC+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bxn3fdK8BeAsKBbUp6bHWh84ijkXnE0sLLkf2Te5MGFith1Drsb1uhwAl7kOdQ9sd
	 RNbu/Mb8yhd4+uQO4RogIAD2mW4S3kO8YSmvLePhnWoHaWcZoQFlEXhlKUMT0AcL1A
	 0F8O5QN97NwPphccQyAEEkHUfSoXlCwZGJSMZsUf5lyRrW0vxDT8z8dt9AQWL+sIGR
	 RSLgA+t+huzMPzTZ+g9XTClpEsHZcrBlIad7HQ6L6JyAIf1UqaEp4EeOOqK8BbRmJk
	 6AbQnFJhSBjma5d2pXR1HuI3RXtlT5Osw77P273TgZdacw7nHP37gsmkVIXIkqMtjC
	 DTT+bZ1ShJGQA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso176320866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFTa88EQgwUX8dpGiiPUFe4tVgGxJrxps6myMR7q8+4dzz5C3OgaX/MlAK/GfHC1VgQJYzWLRb43WPm1aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wV5n4cDln57ErxRiu3EAzzQXlsPGa5PfEwHAXb3xlHahy83A8
	kOxmH3qIZraFLtQ3OlzLiVqA92UDgJd6JbaAgPNTKaYTXiPK2q5+h1V8mcajihFlGAJp7mNX424
	6+RyvxPMlfVrrasMBu/fVuuP7CQnQKzo=
X-Received: by 2002:a17:907:9d1a:b0:c51:3b58:b99b with SMTP id
 a640c23a62f3a-c513b58bc59mr1582831066b.19.1795642860883; Wed, 25 Nov 2026
 13:41:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117210934.7765-1-seanjc@google.com> <20261117210934.7765-5-seanjc@google.com>
In-Reply-To: <20261117210934.7765-5-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 25 Nov 2026 13:40:49 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMTVS+8SroFTemKR4V35zCE6HumtyBdpk_E5WDdHDKKfw@mail.gmail.com>
X-Gm-Features: Aa3M54oF-_4v1lLITcpl34IaUJcHbkhnUHduorV4iD_-VChitIN-7SEzfJqk0NY
Message-ID: <CAO9r8zMTVS+8SroFTemKR4V35zCE6HumtyBdpk_E5WDdHDKKfw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] KVM: x86: Consolidate nVMX vs. nSVM logic for
 loading CR3 on nested xfer
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:09=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Dedup nested_{svm,vmx}_load_cr3() into kvm_nested_load_cr3(), and drop
> several MMU exports that existed purely to support the related vendor cod=
e.
> Except for slight differences around PDPTRs, the logic and reasoning for
> handling CR3 and PDPTRs on nested transitions is identical between Intel
> and AMD.
>
> Add a KVM_BUG_ON() in nested_vmx_load_cr3() to ensure that the new helper
> doesn't unexpectedly fail when PDPTRs aren't being reloaded.
>
> No functional change intended (the new KVM_BUG_ON() is unreachable).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Code looks good, a couple of nits below:

Reviewed-by: Yosry Ahmed <yosry@kernel.org>

[..]
> -/*
> - * Load guest's/host's cr3 on nested vmentry or vmexit. @nested_npt is t=
rue
> - * if we are emulating VM-Entry into a guest with NPT enabled.
> - */
>  static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
>                                bool nested_npt, bool reload_pdptrs)
>  {
> -       if (reload_pdptrs && is_pae_paging(vcpu)) {
> -               if (nested_npt)
> -                       kvm_register_mark_for_reload(vcpu, VCPU_REG_PDPTR=
);
> -               else if (CC(!load_pdptrs(vcpu, cr3)))
> -                       return -EINVAL;
> -       }
> +       if (reload_pdptrs && is_pae_paging(vcpu) && nested_npt)

Check nested_npt first like kvm_nested_load_cr3()?

> +               kvm_register_mark_for_reload(vcpu, VCPU_REG_PDPTR);
>
> -       vcpu->arch.cr3 =3D cr3;
> -       kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
> -
> -       /* Re-initialize the MMU, e.g. to pick up CR4 MMU role changes. *=
/
> -       kvm_init_mmu(vcpu);
> -
> -       if (!nested_npt)
> -               kvm_mmu_new_pgd(vcpu, cr3);
> -
> -       return 0;
> +       return kvm_nested_load_cr3(vcpu, cr3, nested_npt, reload_pdptrs);

We dropped CC() here. Do we also want KVM_BUG_ON(!reload_pdptrs) here?
