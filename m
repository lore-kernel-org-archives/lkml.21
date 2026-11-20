Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147224;
	b=I2pF2o4RTvapw5V+tmc66bC9v64HKxxG3wXwEgwo2tiPjbEKqZcBNI85CEnF2TkSePl+
	 Wl9qJTerUzPOxp1QAYEjj8+3ea6doNNHqIFnMhHKiObVvPr7HTlHL7udRCcz7Ece3/VJV
	 mWC8t/XV2jqOjAyV3MYFexNtf+OSX+YnX1L+XBxwNRgclw7ko/oNEnD1+sYOiKT00TccP
	 D6+95RAbvfws+zRQOXfanpuKhSM4vnhqDyUvjTLwQo9XqMThDtA4Ymkivizu8OVsteUOF
	 pi3dOJHRIin7mIvaNSgAt4DMLvqgMcU8WyKfD70QYgydnOuk5/9gaVBa6E79+50na/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=K98FROqv30LP4AMm6nG2V0NGt/4i9m8U/QmIKGR/nHA=;
	b=HKbwDSn5KwQ85YdnBPIht1ZA9uivpycXtBNaSvTgyCIkLFVYbNP0jnIBRmyDfEGQ5QgX
	 sKCvCTEy8wZps7t2vvkJ1TEPHblZJRNL+QtDp+ME0S7sB8d9DpRaL8r+gwqz01O+tBOAE
	 GCBwrrcLmjXyVO8Ri5EKOsUIV6b3EKhKQc24qRjUmuVClnqE3oqDufru2P5iJOKLcyy5W
	 ePL8v42AAwob3FKx3UIBX+s8NrEA/d3DemKcSTBTrUuSWVPxqRfPtj1PrmQljhSo/8tnL
	 sw4PmL1JMakAPjr/nhcLr+t8lqTuE+B3joWg33IkKf2S6q1krR6c89LvMOB1q+XM+BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5criCdm;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F54F606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F54F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B5criCdm
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c505ee610feso35810666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795147223; x=1795752023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K98FROqv30LP4AMm6nG2V0NGt/4i9m8U/QmIKGR/nHA=;
        b=B5criCdmTHpf648AOYOoTrsp7d3NtGQaXhm0wMw1FXI3k3qw+457SKF80eC5qUcEr9
         R5Jarg3tinhS/KE9BrIkFy3cbmSnVIChYpPMlyDW9+lZKO0ID9Z2fsL+JRhl6dfnl5wS
         u/0lzw3QyLg0SUhXq9kg7PJNK37zkAVLcXZFEgnPtuPAnpD+fadgjVq1GtCPSrfhUFiY
         BIgOo1wmzaloGacQItCbAPgBfbEoVgkdAr0aWujuWDehTSM49+mnRV62CDO+hXm9kMUQ
         YSTirgHtY4c5Xa8FG4gJ7p1jPWSue5VrdAxaaoO89BsEeROyX55jHwuC8zlqUq2NyrgT
         HlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147223; x=1795752023;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K98FROqv30LP4AMm6nG2V0NGt/4i9m8U/QmIKGR/nHA=;
        b=Y6SNKswHlJj0k6WyOGT5ciB5Awn2oHTRqQuTmYfaSkjNSSAjN+diKJ5bpungAJy+yR
         sIDT3fXI5HhYwDrasrtNhRdoejp8SPBA1f+6CIPqO7aay+L0gA0pdJegsezQJokQ03WY
         gNXo1JxiI9lb7aZoJIGWGmsYTV/UK/0v7KFDBoDM1D+Hzq/gmqFcoQjclwrcVTGZlS0y
         no75dJQcL2S7CC1galEjnZvyxS/VyTyge6dP/M/jN/P0lLOBo8tJA8WzIc6Qh0dggVJ5
         APKVw/nfhCXjg4t6yl3Yo3oqxGmS07IyDEAvnlYjydsmEByEau44Zrnqvsn23+MVlAJE
         H7LQ==
X-Forwarded-Encrypted: i=1; AL+hErHLgTlI7Dw5Ouk060/U+CEpS9kYR3D0yRFgpqv+mi2jBP3GoqsexMs2NTWJhqgbIwXZWfkz3kRUvtuhjNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a+9+oaJR7BgFq/OU/ggKjC6RtJDcTkoZqvvOR20/BmNfZCWNQ
	3Xp1kvh3Ih04vOfH59J+MoatacjIhVvI0jyyj0Cs2c5j/zZ6fFOEDmBn/K75vMojuV+YH0gqP0v
	jC6ezWp5/hzXQmydgrg==
X-Received: from edeg3.prod.google.com ([2002:a05:6402:5643:b0:6b8:a08a:8bad])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:501c:b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6ba37edaf1cmr1021371a12.42.1795147222675;
 Thu, 19 Nov 2026 20:00:22 -0800 (PST)
Date: Fri, 20 Nov 2026 04:00:21 +0000
In-Reply-To: <20261115203421.38c206b35f5b12e6@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-6-tarunsahu@google.com>
 <DMRMLZSZ0LAZ.D4P70QWX0IHB@soleen.com> <9huz5wy4tufo.fsf@tarunix.c.googlers.com>
 <20261115203421.38c206b35f5b12e6@chrisdown.name>
Message-ID: <9huzmrr4f8yy.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI compatibility
From: tarunsahu@google.com
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org, 
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Chris Down <chris@chrisdown.name> writes:

> Hi Tarun,
>
> tarunsahu@google.com writes:
>>Techinically this is just for readability.
>>
>>WDYT?
>
> It doesn't help readability in the generated docs, though. kernel-doc
> splits the parameter list on the comma inside the macro, so
> kho_preserve_vmalloc() comes out as
>
>      int kho_preserve_vmalloc (void *ptr, DECLARE_KHO_SER_HDR(kho_vmalloc# *fhdr))
>
> and the struct memfd_luo_ser and struct luo_session_ser definitions in the
> ABI docs end up with a member like
>
>      DECLARE_KHO_SER_HDR(kho_vmalloc folios_fhdr;
>
> I'd go with Pasha's suggestion and use struct kho_ser_hdr directly. The
> pointer can then say which payload follows it with a comment.

Okay that works. Thanks Chris, I will update it.

~Tarun

>
> Chris
