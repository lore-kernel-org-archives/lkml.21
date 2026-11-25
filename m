Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628450;
	b=ktGmTytr56+eQxkpH9wACVFlDoGkznyljlzdn68m8cpW74VY647s+87MxoSL2wS70nou
	 NACJpEMXjcUsEI5Ufa71jKyEV1mfm+3GkDWiI/AqBElVffU1SSCr3PcmCqZKX0L+9UnSy
	 ySLG0N001GUS4ncAKnMap7yHHQjCmq+8BwCZMpLd+nsj1zCf8UIA6NKrccuaTRmiVQOOu
	 BJVx1zM0ev6ReWRPsZahjPJaPSu4m12iQJjGVYASVX7pPHyga51DHQG85LOtDsmU8R2fX
	 HVstpxtPl6HYQx2sWjOYb2ny5aQZJPztJtEzFIXByhLiwF/+QOY3h70B794W7bkVarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=;
	b=Rd3GS5TjC5Hib/uP0t+GgFVrI5WSkwnKf2tld9M5qjkv9A5fWg9+gYPOGiQ6cwcWmdiQ
	 izhYg/2qdB/KHw/OSSYrq4+wS7fznnHS9QNK4O67WvfxGW6PZzekK7FiNVHUTEwe1xgxk
	 nBi+K9Snk5kRvcikR2eColwwMGZafzrKK5VfHW15FTe1MoRGZLUUZ823nrsVTulKTCIou
	 sKDLckgBAHdqE5YDbYjbKLQX8293jFO0TxbXfXWWUyjfPAOX7zAMaUZ/kZCzloPxmjGsR
	 aUlU6ywa04SGP9g80XZ2B+WRG5SC9ZwPmIZaSllFtiebTGl+BzZG8CwevHWLRFY6TSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qe1hh7b8;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9E606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F9E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qe1hh7b8
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so3070812a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795628450; x=1796233250; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=;
        b=Qe1hh7b8uf6iB26Wxe+AiFw3fDV+UQAJ12OvNs/mNAH7+h6iofbGLEeNl7P1CP50zc
         Sb6+t3AeoAWvHdO9y4mQGCEcdMDJJFLT2+mfP5YsospXuYzobceDKaTh08CHKZWXppMU
         YVxpxSYKI1JfSZPYlqCxKtUFNl4Qy4akFIBTpFsHkCxMqc9fz1NaEwcZtXWc3fMSqzRO
         LxcISCRSwcd/Y5+5fTvghS/d7q8R7Zh/2byrrb/C+nzQMojIWHgGPTYXIXnUn0Vje3Q8
         dK/2R1PfcKMqeKVy+rrAE8289LNyf6jcbjSYgljBbOB67evq+FzFZjUgx51u9o7IRqaM
         ZKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795628450; x=1796233250;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYycouvr6zOSJsdG8B1rvzwHCG0khxitcfoXgjaouMs=;
        b=crd+Ze9hDy/ZYYGYtIuIucruH7z1sfY3ArSy7DCOQ3H2ZvlH1i5/GlT4PpHEbGX9xs
         JBec8lrtz+owS4b5p+omcbXmn376rFtacB0Nh2ccg5cKY3vppYoARFl4wyCzWZgYhtVN
         QxIx+j/ndw7AurD7KVzhEta9TL46TMwhfpbCQs9sIFrfSLPTnQJGHEtJTk6aYLCxsbam
         KKDEbffyStZ8XbY1KBpI/OjnggLWXbdjCJ3CJzIQvv4LF0JOuGxCvF7cAvdZhpA+sq/4
         /IQHDIuzaEYtIh+6zl+19R7NF4Z7DuW4Cy9vCVPdbO7akvqeOQncaboV5oTT8ChNyS1C
         1x/Q==
X-Forwarded-Encrypted: i=1; AL+hErGFOLYi2h88Srj/Uwq9LYHKVHp1mC0cRLmmSNmerQw5ZRDTi8A5dBBDbp1YNiwhkdtGeP90q5S9LvuNCi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b8B4fqKcm4tJipmf1vACAESuttnjqX4RjHKX7TTLuYQRZAsJO
	iuwpiR/a+IMdv4hgnN5L1Z7dXjtEbAKPm7d5haGCABu3YH2EHn5vhTRxvksTHX347A==
X-Gm-Gg: AZFdTZe+mm66JJoHn2lRGfcKMrAxOruXRnej0xIJa1nzvrBdImwbKTZ+WAVPzLq1TQ8
	eM+2qvK8mrWWqJi02P5p7dj3M4dUTWiF3IfKnSBoDWLXA8aL3Blx/Ff2Yy7RsgweKDn7uhjRfp9
	IFwIlYCaKWl0mCxar5DEV25bECdxwYbx/M2N3ozOUAES6mzs9KiKUBYjDIJxmeHIqfuN/FBWZEL
	e9jYY/X1RU1wD81+SZGAPo9fFdp6faDdGM+cey0cR6wrmBhAUclsa76tpWVtIH5vYXF7H2EaBJh
	6DxCf9IiyzbvqVnlCcgGOgSmCbDArz/8obZ9kv3Wgw49h79zNtZ50Y6Z15Nd9C6QW+U+NDcAO1X
	sjGg1GxFsXSEPd/DhlX3Ac4KwmqdVSeKSuSojkxmWnepi7wye7X0ALfVb6iNs71a5mJeVokKntl
	S2dNXx+zsnubomll72GkM40dNRjfN1yspqLxyG6tPfSYHowq/hpWTpVCnEhf3uLY0uP4phZstfR
	8KMeteIye+CnXza0AvGjBxnhDqap13I82x4YzBMmyqrizLSllUV9vKoBmnq+9QSb4plCmiZV8wA
	TT7GFdlPZf3HyxrJJQBBPk7wEvX2+FyjFNAikTEUUFpispqGkssaDns039Dp2U+9
X-Received: by 2002:a17:90b:390b:b0:3b3:fe22:2745 with SMTP id 98e67ed59e1d1-3b41c933edamr18216503a91.45.1795628448898;
        Wed, 25 Nov 2026 09:40:48 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm31676002a91.15.2026.11.25.09.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:40:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 09:40:47 -0800
Message-Id: <DN4H5ST3X9L1.3IUEC1CA5QI8H@google.com>
Cc: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "Alexander
 Graf" <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
 <loganodell@google.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <oupton@kernel.org>, <alex@shazbot.org>, <gle.com@google.com>,
 <pbonzini@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <kevin.tian@intel.com>, <joro@8bytes.org>, <kvmarm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <kexec@lists.infradead.org>,
 <kvm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <skhawaja@google.com>,
 <sagis@google.com>, <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 03/19] kho, memfd_luo: Reference struct kho_vmalloc
 via serialized pointer
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-4-tarunsahu@google.com>
 <2vxz4idb1i2w.fsf@kernel.org> <DN3VG4JCILOO.YN40XHHSWRPH@google.com>
 <2vxzld6hx97g.fsf@kernel.org>
In-Reply-To: <2vxzld6hx97g.fsf@kernel.org>

On Wed Nov 25, 2026 at 6:43 AM PST, Pratyush Yadav wrote:
[...]

> So I wouldn't want to support slab until we have file handlers that
> churn through a lot of preserved objects.

Makes sense. If KHO slab isn't coming, then I'm fine with the arena.

One thing I realized is that the choice between the two is visible to
the incoming kernel. With separate allocations, the incoming kernel has
to free struct kho_vmalloc and struct memfd_luo_ser separately. With
the arena, it must only free the top-level allocation. So we should
pick one now (while memfd is bumping its compatible string anyway)
rather than switching later.

Separate allocations leaves the door open to KHO slab but wastes memory
in the short term. It's not obvious to me which direction to go :)
