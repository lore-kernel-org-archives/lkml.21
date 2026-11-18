Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015005;
	b=xfPmDLq6NA7kvQOLmuYMBXIdOUfdICi9RQvFtB1Kpituh0pzLLnp8+wTblUfvwXSphQZ
	 vdOBP0EsRMRi0ugc+hwYE/lZa61+jZ+emoFeMT1HNAnT/xEZ97+BrI3WypFg6l3qD/k5J
	 gKKIDHsgxpzkaajjJUZLDqmYLOhKXcDbOMRt8jBFnT7GVRINm2X1xY/eE7MMY3X1y4Y7D
	 rSMS3mkk1Pwj8PKj/GdH7+xUJuSX8sa7T4bnqOc3ofaG7Yt4vAZ3df8P3JoB6goyfw8Ra
	 b+aIgBa9CDtaqRpWAIcAUz6VUNqvAUrCm1kEtYqeeNa4/ikLbL5wig3+o1ndWdGKsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015005;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=k5VQE3knwQrnmwo+9jJf7WpJcK1ieoPOD0FVY0qZ3L4=;
	b=4DeQDoCv4vQE9oci1Tlh0gNFYe70bjcaAZTSCFPlJT3eWXVX7k7RnvGeZPl/KOQ7n4e6
	 UodQB+FPvFSDYvetKBhaXry5SRJZWuFFbK8hHfvsPUaLHKFY6H+6jajjB/uNxzJaIs5oa
	 zcWGRhnmQ41fR6luo5H/nYf4StcVxz4hBVYBy+iK5G3qlcOX5AFhUN0a3OA+PAaChjH0+
	 dXoSLLmjvavIoOfDYVkK492zPxZYDGVbXl3ZRWiq9VbQEexY9d430A7/OG71UY6YqfYl2
	 RO5jbAuYYMxA39iBSTYomp/X3KhpEt/ZbmbOhaK17iVPAFcyTqD7m7rsGpMCRy383LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="md4tj/mq";
	arc=none smtp.remote-ip=91.218.175.212
Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=md4tj/mq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k5VQE3knwQrnmwo+9jJf7WpJcK1ieoPOD0FVY0qZ3L4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015002; v=1; x=1795619802;
 b=md4tj/mqstB1cQECov39e9j92RxNmjOIKsjr3NZBW0dx41F2cO3ecQkUCGEbAmqcEMpOpkyR
 r+NHhQ40/J/J9qDAWFqTtSartaTyUqWEaiqj4bXs385HiQC6hxUDzJyJPxD1nzJnLFl6np7gi6o
 nHUSXnirVFJyKx15bdhqPXcY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1f8844d2fbce481b;
	Wed, 18 Nov 2026 15:16:42 +0000
X-Mizu-Trace-ID: 1f8844d2fbce481b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso7294e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHdF7tXk/gUFduBilxiq05fkjyS2YTQnycw2qNL3ENOYGlK6WbAhJ4bJjib+z3kXu/LyOaacKYYVX8GnOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uRd9tGUT65gZEVZbrK4nxhX45kYJD6/QF7B20kAsxjBF6bCvZ
	PTRkxIiHYdU/tOpEGtXgEh0raCMUKQcqrZumIyw2tK8oEYmf9TB6KgQYV5iNvPo0UNTk1vTQaup
	tWPqVxz+MvQb5mkQaLAGnMPThnrncx/DGyVI974Yb
X-Received: by 2002:a05:6512:ba9:b0:5c1:26d6:ef64 with SMTP id
 2adb3069b0e04-5c1aac83c11mr178614e87.13.1795014997643; Wed, 18 Nov 2026
 07:16:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon> <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
In-Reply-To: <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 18 Nov 2026 15:16:01 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
X-Gm-Features: AclHuK-LwFI0bEYoy4wIHT2mQsw-X3kab-SBMiVRWf5BC3IdE6u4b5Ur5BWr4jw
Message-ID: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver issues
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sascha, Lorenzo,

On Wed, 18 Nov 2026 at 14:59, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
[...]
> I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device
> table before making it valid" in v3!

Thanks.

> >>>
> >>> The latter, though freeing memory on timeout wasn't a good idea given
> >>> that there is no way to cancel the respective, pending, mapping.
> >>
> >> Thanks, that answers it. If you'd like a patch that doesn't free the
> >> memory on a timeout, let me know and I'll send one.
> >
> > Thanks. Again, if that timeout expires I think we have more serious
> > problems than the IST mapping but I do agree that freeing memory
> > is not the answer; not urgent - please send a patch given that
> > you spotted it, can obviously do it too.
>
> I've got some patches addressing the ITT and IST mapping issues in the
> host driver, which I can include in v3 if you haven't already started
> working on these. I'll make sure to include the appropriate Reported-by
> tags, of course!
>
> I'll post a fix for the VMT separately as it doesn't belong in this series.

I haven't started on anything, so I'll leave this with you then.

Cheers,
/fuad
