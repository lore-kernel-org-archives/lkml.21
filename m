Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795565382;
	b=4N4iqcCGoQ9ip79IBBzItvkfFSKkq+cxcvhYwt2mkp5uP5GWNWBy9+cEiQeXQJXrlWE7
	 ROyaE77ToEVNi8qVaYXtBouvHeFUZmgXBmE3JdgSRvYWL5tqbkEqp/I/nxwLnNLi7QVbW
	 R7RnQ4KvskVTss5D+lriGlwT8GyXr3ssdaYP6VWjpHpP0mG3d6/EvmR0lR+rOla3M31oE
	 1XW4cUfewOwTiHjsCXSK4ixQL8AoEj7ic+u6a26Ag+O6BR3D+11p1cmUAWiyAZY2mmv0t
	 FANMrGKo4VI9C6Z98BS6ne1x5cB6YtjfR/wkLyVt3Suxv4WF4sUmw2rCKRdDzijxD+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
	b=5a/tgR3QeHJLCUlzWsG76S2AIQCf880Wz8wp82WrLGJsp7Jec9CyflemnpN44hpyKray
	 foLTV/gPd2QmY7u4D/IqhrXMpNIMlhopLspbZiVMjbw2KfZqBEGp6Qr9/bwyCO/M9RiXG
	 WiMlDrMumqo0/bWDT06CvBetxZC8Uf88h/NEVtLV0j+McrCZ7aGOJU/AfjWlSKAhz6OXN
	 LJ0Q7NBPodK4hOfVwnblf5zCpCS/bwtVhAjOUO7GeDWby2DB2PICIpgLzcp35A2vf/n/F
	 Ccj+p54lFcfDZY7rKaAwPBwkMJ4BHIlLAGNURPyU39AkMiDjd53NFbX9PEVHjmgmfZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoozwYOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoozwYOo
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-92107df3f13so49877266d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795565380; cv=none;
        d=google.com; s=arc-20260327;
        b=Gk1AlnmGoAf5tdUduArklZoD/Ht7vWZfvO77Whs18KJl9tsDkBxsuE22rChV4o2XF9
         b5WGg0yeoC5XrQXsWn2ijO5k2b3m7zWvBURUW8uF/4psMBTNR5WxgTnYNBlKSWvM9lxe
         F61C7Totsu+K9YXY0BH9jJn+GKe17TfOtG3D6rQTYuHKj9sE265hQPrl4zNQxY/AmdNT
         3sBXuvUC4+a7zYDM6O4tPgDK0W835P+OL/Cp5VhMXB9SaFgVQhLw7cCurvEZuUwE5Prt
         4HQ+5BqSBHIwFUk4KhB27JkA3529YFD3pPTKnjiv4Ev5fUpvalkpuFzEsKO/At/E2XTM
         7iAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        fh=Z5goLFOEgi3hLFK0S3MS3YTyp3AqjIILA56XdU7rGMQ=;
        b=Oqj6pXYzWzCL9Ma0BWWdWFS+YKwPsW2DnyuBSK6UeJRH6JKyMJrsCYTMAb7/8Yn5rt
         adFkvdRhinGrjH5OYn0EeAgV/cdAyUnI69TQUxJTzecxtbhM3PGg6xFODlVWG1HNNNfn
         JEsosCHIARr1wJuheXqlVfe8bm+PhjdnOEnOMIXQmxlWFKCY6cq3UqvPkc0IIm8GVOX/
         PXGQ35W50JLFHEjvysvowX8Vi4zw8xpvJhJ7KBUM1idLSEWAym8fQQOWdg2JCybD0Gcr
         t8UtoBtG1xBx0OO2kwbgSPcDvZAeIZzZ4H8eDu3l0LwwmFYMiy/BZyHis4UQezHbjRui
         pqbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795565380; x=1796170180; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=EoozwYOo2VCUVVRapq5PS7IaIBR4fcvD5QRF3ydamDfYc7rVeOovvIWGEc8cHi4pt3
         7iXgwXk46n6iZUsztTjdfdbNEEYYrvjuXYfN8BNAKXBHKde2LWKtTO2CXvJ4opCiVt61
         NgycPBdTTeDrXByUNhUhleu8ejvFbSvfXtsbnVQJekCSqBHUoOdD+vLpWoXKQAePrWSa
         2vAOpZPqnabHSvCLXF/vzzV3dkMUiHgTNnApg+h+Wvb6rm6152Fgc8TkHnmhQt8LcphF
         aNO2TcAF4uXgc52R6D/c108OKYGFaWzw7K9ISf01ognjwLvowVVf6feiychAtg0nbpQe
         HubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565380; x=1796170180;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=oGR4EaGLwhhBUMxPj23QAANIPfDg78qgsmO7/UEkPw3ykdDHIS3fgn1jTEeJeIW4J7
         I17CIIVh8M9ZvMWGSSDKpRl1sm/ZtzvcPHLXu6PheLLqs411A5pFYcvIXWYQnhhyaBdR
         32quykMTibTe/I3B9jvxpPsIg7UPeLgj9Pth0Re0UsyifD8WzI4pyaFKK6Fsoojl8J/L
         m+On4Gw6idrwWMD5aC6E9eTPB8+HvEAXczbkszwjDuMg2PSIfcn7cB6nxiA64IyDWLLc
         2Kmq0nH2iHUb+6sZgSL07UStFbWU4i9Z5GonYnw4Sq2m0VR9y8v9e/cxFXkvY8ne6pQc
         qUnQ==
X-Forwarded-Encrypted: i=1; AL+hErGhXopK0gIoGqa9iQffTOUpz3SU3LpmRzYSubT4zVLI6jnIC9ls79KzA6rBQj49zTZfgcmSD0qkmV9gjb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kVJ/cWwnMAWk/ZZV9SaOmR1yMQb1zfOMFHTOK4Q54i1uTo3pI
	yK24wcRDNmV30jcQPCcBzgTvy6pwii5LMWRxRx3rJkYtxHRIXlI0kpF1zXe5WtPvV13SgZyFFpx
	jqOC3BtqlOZIjfrJlnrs85a1g/wFHMGaPxfodea5F
X-Gm-Gg: AZFdTZdN2Ys0+sBQk/eVhxwTL5gtMLRb7MP7upyAa7aPS+gpaZYngng1P+tbRN9ElsM
	YaRBKW8b197yTN1AoAK/t2LeqKoDaRTgutF6m1m7zLNeceXNSx2/+nccK37IJei4owct+u5BPbc
	sc5so7x0iurbKYv5gLLI3qglqpu1SwVaEE74FCvo/QJL5itz8/UnbIybue111crKnuvuVe3waO9
	0urv1eFVgX+aoOArgnrXMxMViO5oOJDQua+4lF9SZDQrjjHkZb2m7pGUmNypc9cLgPndDIVgqJR
	LRjo0gIkePthUotsIHfodQxnnE/m2aXEjEkMtE1PtMbHokV8OOr5Dm8QQuZuTKR1VldUBIR2q27
	FFogvriMhHzyBqXTYUu8J0W3Pi49QOVHi34YzOAwxT6EFm8TI6cQhP5voKSuLo0TVB3sLkRDcAM
	2SSZ/SiYv99B/ac2gucy5GegM=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr275174306d6.54.1795565379417; Tue, 24 Nov 2026
 16:09:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 16:09:38 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261123104233.95710-10-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com> <20261123104233.95710-10-steven.price@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 16:09:38 -0800
X-Gm-Features: Aa3M54oNKjHnmwhcyDiHaoxz_zNMiDJBoB2YChnt0u_TPYjP0NAb6dZlL994CUs
Message-ID: <CAEvNRgFQ5BXqU3KfPFT8bfZTW=RyvBw25z3GZtr3JA=Wv3Yqfw@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Steven Price <steven.price@arm.com> writes:

> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Once the Realm is created, prevent changes to guest_memfd backed
> memslots, which can provide private memory. Validate these changes
> before KVM invalidates the old memslot, so a rejected deletion leaves
> its stage-2 mappings intact. Realm stage-2 faults will also validate
> the private memory backing in a later commit.
>
> Require Realm memslots to lie in the lower half of the IPA space, as the
> upper, shared half aliases the lower, protected half.
>
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory. Defining the macro also makes
> gmem_in_place_conversion true for every arm64 VM, so guest_memfd
> memslots are marked gmem-only even for non-Realm VMs. A well-formed
> KVM_SET_MEMORY_ATTRIBUTES2 request on a non-Realm guest_memfd now
> reaches the VM check and returns -EINVAL instead of -ENOTTY.
>
> Additionally, similar to pKVM, do not support dirty logging or
> read-only memslots.
>

Imo this could be split into a few patches

1. Add the constraints wrt realm memslots and being in the lower half of
   the IPA space
2. Defining arm's support for private mem
3. Imposing rules on memslot changes
4. Maybe some others, maybe I'm misunderstanding the patch

> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
>
> ---
> Changes since v3:
> - Explain the arm64-wide in-place conversion effect and keep the
>   general IPA limit comment.
>
> Changes since v1:
> - Preserve private mappings if KVM invalidates a Realm guest_memfd
>   slot before the prepare hook rejects its deletion.
> ---
>  arch/arm64/include/asm/kvm_host.h |  2 ++
>  arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3ddeddfacd06..55673d08e3eb 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1607,6 +1607,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
> +
>  #define kvm_has_mte(kvm)					\
>  	(system_supports_mte() &&				\
>  	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 800333a345cd..9af5fe6d87f0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2861,17 +2861,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
>  {
>  	lockdep_assert_held(&kvm->slots_lock);
>
> -	if (kvm_vm_is_protected(kvm)) {
> +	if (kvm_vm_is_protected(kvm) && new &&
> +	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
> +		return -EPERM;

gmem is already generically mutually exclusive with
KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY, so before this change,
pKVM is saying no to KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY for
all memslots, gmem or not, so this check makes sense.

> +
> +	switch (kvm->arch.vm_flavor) {
> +	case VM_PROTECTED_PKVM:
>  		/* Cannot modify memslots once a pVM has run. */
>  		if (pkvm_hyp_vm_is_created(kvm) &&
> -		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
> +		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
>  			return -EPERM;
> -		}
> +		break;

Not sure why pKVM doesn't allow deleting a memslot after the vm is
created, but this is no change from before this patch, the removal of {}
here is mixed in with the other changes in this patch.

> +	case VM_REALM:
> +		/*
> +		 * Once the Realm is created, we cannot modify any slots that
> +		 * could be providing private memory. i.e., guest_memfd backed
> +		 * slots.
> +		 * TODO: Handle trusted device private memory slots
> +		 */
> +		if (!kvm_realm_is_created(kvm))
> +			break;
>
> -		if (new &&
> -		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
> +		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
>  			return -EPERM;
> -		}
> +		break;

Imo this should be written the same way as the pKVM branch for clarity,
like

if (kvm_realm_is_created() &&
    (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new)))
        return -EPERM;

but that aside,

1. Why block creating memslots after realm is created?

Does ARM CCA have no way to add pages after a VM starts? This isn't
blocked for TDX and SNP so I think this constraint seems unnecessary.

2. Why block deleting memslots after realm is created?

This also seems like an artificial constraint, and it constrains the way
the userspace VMM operates when stopping a VM, like the memslots can't
be removed ever, the VM just has to be closed? (something like that)

> +	default:
> +		break;
>  	}
>
>  	return 0;
> @@ -2883,6 +2898,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	hva_t hva, reg_end;
> +	gfn_t ipa_limit;
>  	int ret = 0;
>
>  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
> @@ -2891,9 +2907,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>
>  	/*
>  	 * Prevent userspace from creating a memory region outside of the IPA
> -	 * space addressable by the KVM guest IPA space.
> +	 * space addressable by the KVM guest IPA space. Realm shared IPAs alias
> +	 * the corresponding private IPAs, so Realm memslots must reside entirely
> +	 * in the lower half of that space.
>  	 */
> -	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +	ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +	if (kvm_vm_is_realm(kvm))
> +		ipa_limit >>= 1;
> +	if (new->base_gfn + new->npages > ipa_limit)
>  		return -EFAULT;
>
>  	/*
> --
> 2.43.0
