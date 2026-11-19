Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099563;
	b=TLOdbOmI7jWUbnljbYH24W1b5Gsy8c2+lcubWtq0pWzYanCjnRxgrQQF1BUBx1qVYyQ8
	 L24VtEoo73/RGGudXMz+Wx9qkgo9AVufAHFzyYuZRs14ogPk6QVxcV/QpwcegtpIrNNyt
	 KGjlWKTTWcEwc5jFBKjfk7FOWUGyKEYTUF1GgegzuZwRYJGr7tivUdLKOVvL5mdb0hVPo
	 tXPRmVz6tQW9pbkIemo5q0GrM6IprOEH6CWhICogxs1uYFigv1ZfD9NX2wtZwIt+phP5A
	 hEu7m72K/azJUFooQ7r7DpVzm39u1s+cYZ31PfzEBXdnsaG+4VKyrSHTPT3MGbD414g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Fi6Yc5JpDZ57kOsVtX7b4eqrliKH0uv1div0woJH6Dw=;
	b=sB6EvHJenzYZRZuN6DszPYfGkOeMiZuKibDJxMtO6w+dEqt1oWv/i7FXC7O4sexJBQb2
	 /FE2mkxRA8cdRpmHgiqDanQXX0dykNGUu0qgVXDt/UtE9bxosuUbiBgL1TuP9/Hl6O7uw
	 NSn1RBHferKgFANcdnCahBSBVId7N63Oe8q19Uf2AqBs7ILBBDTYjsrjFJ9+t7gHxnBRE
	 K0F2TdCOmZaQDnVLdRacy/7U4ndxi4H9nYgjRCHVYg+59TnjQCbfhQNswi+UEzMZPVvaY
	 dS9Y2m9SknYjWjeSe39X/tYJ6gq7Qhk5juMeG3pWEi0ketgDfaTnequxlUz+ecc+cNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RDtnbuQa;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC0A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RDtnbuQa
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso3181998b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795099562; x=1795704362; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fi6Yc5JpDZ57kOsVtX7b4eqrliKH0uv1div0woJH6Dw=;
        b=RDtnbuQa5B+IA0YvCwouz6UbdHA5FwFU+ULJgtJYP/z2FBlQckRKbfQ0EK4ggS0Gk0
         VmQ52TIa5MgCtz4vloZY94g61hVaIHujk3MX88UhEURt776d6QNCF59dI3l04yErpVBn
         he7kaoQEwUApP1KcPk9a16A4YbqzfNs/jlYD7kEwbV3wi2YtMsA4CPfYDoprfFkWiCAz
         Z4Ivl4YjUffnUplTxI6Slj8B+v0dVtMMRU+zZHWKG96B3UmEOAjDgTWbgVGXR7kjV7Mv
         EJUQ2z1l+8IWHrG+Zaotp8gfHajNsVeiE4wGmZJIAWLiBrzJvijqIx88qqjSU8oEDxoZ
         OClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099562; x=1795704362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fi6Yc5JpDZ57kOsVtX7b4eqrliKH0uv1div0woJH6Dw=;
        b=H2QdP9/LEwMaRJd68lkVr37NxmXnnjwF3oikKrHSNJ1jpn7AJFJegUJyQx0R5YCOkb
         OIno6PdOUrJdTUBprdQCxU1kcOcI4MzxHpp+WgQic0jt4acBNNFtZAchfEIX8e7XGi/a
         XNGjO2vUkwYetnhexRqQKe/2irJ3JP47Con25KS5weBHjBQvhyzTCFGKyw0bq2DmeAqe
         xswecECaiH+nwXtITC8uyV50MsQlypPqEYYAutysWfn96loDf44KWr4hlZuhoc/pWICm
         zVHzZVKGN+qhaNNN/Ir8gePeFsyN4GgdqPluIlhpuHOre0epSMN8j+k82Exw5v+1VKzd
         yxZg==
X-Forwarded-Encrypted: i=1; AL+hErH2UO2mu1uEHfiMu0cGYWNmFcaiZYJd7VBkIrpElk9lHvliBZ/P3Xva5kso92ouJMH9PBjN1pF07JEMPq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7nl87NQdtu4hsEBweU+pa94Wy8tLDJiPhCiA4Wl36+lYwjQE3
	U6NFEHIi6hJIzb/GiWkRL15nEBvOD4H9KlO9Mmi/YH+PYm7UK29kSF5gNboDKwk4XSol2rkBzTV
	Olg2u+w==
X-Received: from pflc22.prod.google.com ([2002:a05:6a00:ad6:b0:89f:41ff:99c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:908b:b0:89f:9da8:1b66
 with SMTP id d2e1a72fcca58-8c5d3e0e288mr5302336b3a.33.1795099562225; Thu, 19
 Nov 2026 06:46:02 -0800 (PST)
Date: Thu, 19 Nov 2026 06:46:01 -0800
In-Reply-To: <CAKSQd8Wcw-DUR_JO9YFw17u691gjNyvySwfhPW_P5P3ik=_tBQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CAKSQd8Wcw-DUR_JO9YFw17u691gjNyvySwfhPW_P5P3ik=_tBQ@mail.gmail.com>
Message-ID: <av8LqXyAklPZ2-rD@seanjc-mac.roam.internal>
Subject: Re: [PATCH v9 20/20] KVM: selftests: Add APX state handling and XCR0
 sanity checks
From: Sean Christopherson <seanjc@google.com>
To: Christian Ludloff <ludloff@gmail.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, jmattson@google.com, pbonzini@redhat.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	zhao1.liu@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 18, 2026, Christian Ludloff wrote:
> > Since APX repurposes the XSAVE area previously used by MPX in the
> > non-compacted format, add a check to ensure that MPX state is not set
> > when APX is enabled.
> 
> For the sake of completeness...

For the sake of my sanity, fix your mail client to set In-Reply-To properly.
It's not a gmail problem.  I don't see this issue with mails from anyone else,
and I just tested that sending a mail through the gmail web interface sets the
header as expected.

> EVO processors do support simultaneously
> enabled MPX and APX, with state that does
> not overlap. (And several MSR control bits.)

Until EVO processors are officially supported in KVM selftests, I don't care.  I
am a-ok supporting EVO processors, but if you want upstream to care about them,
then someone needs to take the time to enable support.
