Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447479;
	b=rPfiOe7HxpfHuMi0n78NCrMxM+drwSAFKN5ZObc7E0uW8c7XsGFRR4pYxkLGO8A+gmVW
	 /qSin4F/3TzwexhpO0QaleW/rSTjJIwwS/YhGHh6R+YbqzFitlnRApR4uloZKXEKnJi8N
	 8CwG60UNtkUsVjbHknzXb8g8oKYkoEKAfKxerRd0igsFZ4EB6NlAPBTd14lYkREbKl+IY
	 3AKYJ993Ozeo+VR6U5H28DYcYMXfdKlGcDM0FoGxAIOwqPRm6eg6ue+3KVgSMuQZJ6aUu
	 KNa2cb4bltMpRfrIidQ509qg5cjH5NJlNd+fQ8tmxfO8AqYhVwILM7SEkws/LdKuT6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447479;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Hh8fRu5vFtpaCjWKRWOVh0V8299B/cNlEtDS6Intpqo=;
	b=4afECXBd2AWb0KcT50xcCjVckUFFTK/syOWqJMvnwEKnuDuzybCs92K6gzxJ1cB/76vx
	 WslIWuB53kaR56wumMkadyawWITZSxUQZQAsbg08VFT4E1MKk2XBcxLkjIAfBhwvGFsxd
	 8HqLsMi2bP7rY8qW0/OzAn3T07SY9wVEp4lY5LXww1bgsuwgkNh7iam28OSm0QOqK00J2
	 bXsSxCe1zebQy9g4zVIkxtASHtY5BLwdym+clMOSnA/b3fOmHfJwnKBpleZTw1sKrulNT
	 AIlmulQKpk6hvGFkxSdr0yw5pVFyYuCmDmRLwHhfO23fSUO2lujU1jgj68qNGyu2ZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ZnRu5R/j";
	arc=none smtp.remote-ip=95.215.58.34
Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA35606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA35606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZnRu5R/j
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gnvbL4VdHXSgoWEMo9YirAKMsnzbccETpFKUkQOB1eY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447475; v=1; x=1796052275;
 b=ZnRu5R/jegKRQwGIblsnoG3qnjDNS+9TNClqycIO5QPuw57xpruKPDqbY5vMK/m3JBrzEg0x
 qnBIUSyyBgB8Kp2nZmLvqWKV27rKrrVA/O8Hk5tDxMDV1ieZRhlV0c3GM6lZBp9A32hxpq4zy2+
 mD21572Prb3rBmui16/+2HsI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6fb23a07bc46bbf3;
	Mon, 23 Nov 2026 15:24:35 +0000
X-Mizu-Trace-ID: 6fb23a07bc46bbf3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12486e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:24:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEg9an/es0byTT56ID87lXyi8eEztsuoUEBRPAD2nrHbCx4U26EegCsXODMc2EzvaYszyOK2L7bZTXHP7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WuhmOXTgQoaJ5dW1WiHn8raoI2kzZQy1URLsXjtxhN07KisNg
	prY677F/xERyz/5izuxMJAAAK7/qniGw2F8deBi+O0+d47gGE3MWovcW4IPomuDFQH4Wxi+kw9A
	SnOhg5NedmGGOmQ3KoZJS9hF+QE2sQf8VypWSijX3
X-Received: by 2002:a05:6512:1591:b0:5c1:4cc8:2f22 with SMTP id
 2adb3069b0e04-5c21a249d31mr226456e87.8.1795447474671; Mon, 23 Nov 2026
 07:24:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
 <20261123113435.1170711-3-fuad.tabba@linux.dev> <awRKhCne0gG1gKZN@gremlin>
In-Reply-To: <awRKhCne0gG1gKZN@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 15:23:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
X-Gm-Features: Aa3M54ohqjfMpFnSPURFY6Wicp7yckb5JMX6NA8ywvncNdbk8_vZnEW0TzRhLu0
Message-ID: <CA+EHjTyM4_P5v0cHEiarq5XAb2A0Esshb762BLuuKnyBvH=y+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] KVM: Warn userspace against ioctls while an exit
 is pending
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 15:09, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
[...]
> Very much agree with Sean's take here that we should instil sufficient fear in
> users at doing silly things (also in general not only KVM :).
>
> I wonder if we could add some specific examples or broad description of why it's
> unwise for better effect, though? Comments below.
>
> In general though:
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

> > ---
> >  Documentation/virt/kvm/api.rst | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 89eb6be9bc6e3..980ef0cdc1c91 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6974,10 +6974,13 @@ to the byte array.
> >
> >        The pending state of the operation is not preserved in state which is
> >        visible to userspace, thus userspace should ensure that the operation is
> > -      completed before performing a live migration.  Userspace can re-enter the
> > -      guest with an unmasked signal pending or with the immediate_exit field set
> > -      to complete pending operations without allowing any further instructions
> > -      to be executed.
> > +      completed before performing a live migration.  In general, userspace should
> > +      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
> > +      completing the original operation.
>
> Perhaps worth saying why? E.g. (as I understand it) that for these exits the
> operation is only completed on the next KVM_RUN, and that KVM relies on state
> left over from the exit (including parts of struct kvm_run such as exit_reason)
> to do so, so any ioctl invoked in between might clobber that state?
>
> I see you intentionally avoided documenting the pre-fault case on its own, but
> with the above stated I think a concrete example might be example here, like
> e.g.:
>
> "For example, if you were to ... that would result in ... which would absolutely
> ruin your day because ..."
>
> Kinda thing :)

:)

I'm not sure it would help, tbh. I think a reason or an example would
have the effect Sean wanted to avoid [1], where a reader takes an
ioctl that doesn't match it to be safe.

Cheers,
/fuad

[1] https://lore.kernel.org/all/av5CBjbeidUUWiLq@seanjc-mac.roam.internal/
