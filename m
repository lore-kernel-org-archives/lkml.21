Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642605;
	b=KgmsYfx4+mbLX2RZEiPij+IOwPxfC0Nm5m0faJTDojO5KSovlmABCqBW9SS60FkGKDxq
	 w/PlVCYTzlcptQI+5xYfFHTjRlbbeRPcGDw3UXvg20AvGJrxQ4ihGU00+RQcjB9DwJeHi
	 qR4R6ltCd1B0r+ZOLcropbUjpkoSUR2w+AnpCoCnj8W7QrQhYximRxZp60fg9nxlSC3nq
	 qM96hmHcRLXb/m4KBXxeunYPOkblZjVZ6ZIGFcjKqwXFSA6JkbRV/vbKbOSr9qExPwFo9
	 CawpyPWZgRN4KBbNL/uZdrJKlmpGXcW0CzemFNL6YSmxwChuqGqXNR1SrCc6V0cXKkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642605;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2dPU/4VENb4UH2NkBPIaGJNfbU0IxL0xtXYqQqF6TFw=;
	b=ON1HzyMumP/5AaDWVDceJmMg+w243WZmWjSmBSK9WFcBNjEJjW1CLn5CD4redYj30mAB
	 +ayNJAXB/UvW4gI5f9YdzkiJeiffaLE/GSN/B4Yk/xLUK8py3EtxliocmEOHZ4h534sVn
	 rnc8pCEvoMXhAolXcYW6rzvsT39jxxZpylXzRXUbVfJKyUrHI7VbM4t0j9TzlLMrfpgpR
	 QtzPhPWhFB6h0WRcsh+f6fQmnFfOLR7k7bfsYAmmYM+EcFx4agE4E5Jpc1NWXGQ/ROYVf
	 zVLrmcn63wBVBNXaftO2Mb2YiZEcuJI3YfYZd2Qfye8PTk2GYJaTwwwfmGWgEWyavAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSuC0yk6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSuC0yk6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C051F000D2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795642605;
	bh=2dPU/4VENb4UH2NkBPIaGJNfbU0IxL0xtXYqQqF6TFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MSuC0yk6d4B9dssYIJRDhiCBQPmve6aXAkh+KTrEQsHYe/ZvXgh/a1IRqZ+NTEMNb
	 C6GGAwAUu6L2DqL2tdphwlWYsW4/tKPM7tIHzic6IS2Un2ytuF40nMEjhnG7jZVarV
	 LZtTuTU9Bn7NLGqfr1t105hslU9LcFstb6Vkk/0tfka5BkT0VEymt98BMaphRf0uiN
	 zkgUKBoJ8w8K4VWL/CDN3dH0QzpauL2N4WRM6poq+YthZN6OLNQxNXHyanvPBD8IjR
	 MKW1nPmjXYKXFwcrKcTI2fx3dWn3Pg8GdpfwGzlPMiCTVyEGnm5buzno5IpEmciFUd
	 ZWcGfTOzf7aXw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50e26763a4so85744066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:36:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF9R3yinCvt45SDXQ+GwVQRBnAHUXg2Le23AE8K7wFaaZiJ+wQPzowdwKawB+78vd/kOQXwq2+90U1hDmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kchx8OQNlRreqaDBviH/QVWHXVDm6006S48qqE6BlPCzv+7JQ
	OPnolEEHfhFHFTmosnKmfhz3VTLlvpqtNmP4CYk/qd8ySGQXYRwmIuGyMCBySSrcPNvOs2EPKO6
	zzrWUvuvMMMkBeeAUyDfmrlC+W7Fj8w4=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id
 a640c23a62f3a-c513a47e325mr1739009766b.4.1795642604189; Wed, 25 Nov 2026
 13:36:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117210934.7765-1-seanjc@google.com> <20261117210934.7765-4-seanjc@google.com>
In-Reply-To: <20261117210934.7765-4-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 25 Nov 2026 13:36:33 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMV1voAOxvfqubfGXZTCa_91f1WGUmPj1dco6ajMT5QTA@mail.gmail.com>
X-Gm-Features: Aa3M54pJ09MUsyLvZlQQj9fMTUexNyUPZe6tWxtprt4x4saZamYMS7AZU2TCN4g
Message-ID: <CAO9r8zMV1voAOxvfqubfGXZTCa_91f1WGUmPj1dco6ajMT5QTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: nSVM: Mark CR3 as dirty when loading CR3 on
 nested transitions
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:09=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Mark CR3 as dirty when loading CR3 on nested VMRUN and nested #VMEXIT, ev=
en
> though svm_load_mmu_pgd() unconditionally updates vmcb.save.CR3, i.e. nev=
er
> consumes the dirty bit.  This will allow deduplicating nearly-identical
> code between nVMX and nSVM with respect to loading CR3.
>
> Note, VMX consumes the dirty flag in kvm_mmu_new_pgd(), i.e. having nVMX
> mark CR3 after the fact isn't a viable option.  Marking CR3 dirty in nVMX
> code before invoking the to-be-common helper also isn't safe in general, =
as
> it's theoretically possible KVM could observe+consume the dirty flag befo=
re
> vcpu->arch.cr3 is updated (even though that's extremely unlikely to ever =
be
> the case).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
