Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546936;
	b=Wks4mdVCA2myEmfSWLZ8eOXZMvDahxzT2SQ2JgytI5mOVk+S88Y4ZgZ0BHimYBEOGkV2
	 xVzC0zcgm62X1fnDXVwkTbyqY2IfUtuxnLV/vyg2WgIJOc06/iNTHWbDv6VpGDSv4lLbo
	 Ywt/7XzDN1gDQ6QsIlLtyuped1PMYn8agGwjB9098MTHsE4rp5qRwaPVvht1BtC/Nkc3Q
	 F+AcugHSbGXzJVy2oeLMhI82QL5Mir83qavTkQ22QCrUPmn74gXR7ao/wQe245RSZEm9U
	 GnumG/cvPzsCagnm1ZNdh9mW2k1668wENYPsuqDaPx2gxo7snfsUgNlAxdyVR6yil+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=;
	b=Vg+x8aiKvruxXkR7NWxLvuCeWT78B+9KZ42MFi2QJMCewp0g1Ivapz8+tF1J1BtS93rO
	 /wEI/jfUSkIh85lT7l9gWEfGJZn2C3ZgVfa2/kNWMB3S1oxlYND/6wx9XDh0GDyvuvipf
	 m4/Tfua5YUYd31Izu5/e3eBHylVwEkYRR5+NSovQWwbb8tNvGJZvh3BdRsPN/xxBERm+3
	 dyj5s7CsHS+ai+hxrKUHb68Ib3ZR6B2P+WP6DGiaCRSY2PLre0mwP0lkcmAFfk2mGgNC5
	 XnJZZ2vkgrMhGVNi18ZARz3VnPqmS6OjLpCck8HRPJJ9b1sNk7hdmia/5o/rj+u5uyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W49HLn5R;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC6606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBC6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W49HLn5R
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd69954c755so3490310a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546935; x=1796151735; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=;
        b=W49HLn5RkMaC5OffA1iNYwWj3QcXjho4bBBEYyHJ80sMc/UPULZx0is/eDJpC2N3ib
         U5411fK9H7EvaHNUiAzyNcMRaRfWUePxiO5nF6dXRnWQcakCLoOcwBez1qwCR6R1oIfe
         q4c7EtVSFXNeliYrDeUDxIDrBA9ZIJuyG39lD2tcmw1MBgaf0y6E9eqLCYzDMbFPT8aQ
         T2II96TRsePidFGcPlSyAkLQbRIPL4z8RKR0PPlfzSoiEzHTM2cY+rkptgAAFD2Cwvml
         DpAfsAN2AKGhtv05DtjXMcA4gmT2Ub8TyWWHMBLSJzr10iAYvLD8v6nEW2UiNe6xEGzX
         AF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546935; x=1796151735;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=;
        b=dnZllYysH6SmciEps4ileD+P+9gKvpGWkLt+Hh9N2bBgFEnFxF49jXSgcf+4EwlFdj
         t2pMvgL6mbiWYIq1/+nlDzsGTerqWENkkZkZG04RPn8wGHpHdzouCqiwzq3H7pc2sjbw
         p7y4EqYDMByKTzy3XcFoORu9qOX/p6T2lxj4J3J+2fSbsXDNEtVTJ9LzD73iZi6wTrK8
         Tb+JU85V/dGIxqtLRVPuV8299Yuk0j2otD4iyoPdm5ptO/h/WfWUYC5U2ULAzyGWHPMq
         HJvvqi92aJ2cmoot458xAvlrR2oCa3HQs+yOiydQxLwTIxm+kdnoe9ZnoYcxKZKaOoOl
         sZEg==
X-Forwarded-Encrypted: i=1; AL+hErGzaZePzM9GnoPTcXKXwdBpJ8GOpnAqXPvdIDmcaFWW+ThX6+/jYRWfRL+nOHkiqJWVFpbmqGJjOhCAIKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OtbIhPMevnV0LvSxayw2aUyd8E9R+CXp1NKW/5BxTiWabI6tT
	HYKXKazAMaOUgAV453+YTj/6B6vcJ0Ae5Gc8/553yd22pJ5cL43ePF1v2VJkVAB2fg==
X-Gm-Gg: AZFdTZcQ0yiYBgmqj3vpdD1Rb/kc9S2iGPUK2pMcLJPwrjys1dzih0VwQnQqHxoMZPV
	XaJboa31IUNX20bihbCGGKXVQBA46KgkTP20YZDnzpNZ2gUrUhyT2CKBvKnbbkCj9L9qDDIH8xc
	7999JH6rBP/S6T35LMmdZUF0Tqr1JiodBB00l8WWfj+vJC4ev8C1HYUpohg2gozyDlvDI+19xTB
	aP18Y6iMgrGrea9dqa7DjzBoyMFcvh2p/OrlcvajyG5VraTtzrULJtKwQqB9GqVRpliFQSG21fT
	weI+2FcQDgTMU7RUSp5im8Y1ZTq76d1ZG9c9HZd/inrkubJ0xAow3sZTIoUMPvzX5xKB+MeUBxZ
	jGe/PwBlYccrLMqJxz8NLRrqbpTNImZH0dOnXnrPFXs+N9qvHjNkdtJVh0diScAD/nCaJRhzzOP
	TU7i8Qe9qdPO8FWO4F5lket6sF2LbkSNLdWUOIX9eS+QJYDe6ERAcDaFEhlJmjCOrQUFlxjmYPa
	fp/++inT/aUh6UHULjHpCpjCK5/z9zRbr/08jSNWD9iofy/cbyYksMF99Qcv7lIZ7y4b1/8rU2X
	TaDlqSho8PMUV9YP1OffLMIIy5vairVBwBBBjIPehtk07Eu5Ldrfpj5ONrXJDnD/Fg==
X-Received: by 2002:a05:6a20:a11f:b0:3e9:f2d:d556 with SMTP id adf61e73a8af0-4014ca44d17mr16159174637.55.1795546934090;
        Tue, 24 Nov 2026 11:02:14 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm2247135a12.26.2026.11.24.11.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:02:13 -0800 (PST)
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
Date: Tue, 24 Nov 2026 11:02:12 -0800
Message-Id: <DN3O9LHR4XNH.1EYLA6D1F0J2P@google.com>
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
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
 compatibility
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-6-tarunsahu@google.com>
 <2vxzse0rzjdn.fsf@kernel.org> <DN2RQ7LGX224.3W3PSQ2PBHTJZ@google.com>
 <2vxz33sqz1xj.fsf@kernel.org>
In-Reply-To: <2vxz33sqz1xj.fsf@kernel.org>

On Tue Nov 24, 2026 at 7:25 AM PST, Pratyush Yadav wrote:
> I don't think it buys us any functionality. It just hides the problem in
> some lucky cases.

Following up on our offline discussion: I think it's worth keeping
support for optional features, both before and after the spec changes
land.

Before the spec lands, optional features are the only way to enable new
features at all. For example, the PCI follow-up series [1] preserves
BARs and bridge windows using an optional flag. It's purely additive: a
kernel that doesn't understand it keeps behaving the way it does today.
With optional features it can be enabled as soon as it lands, and Live
Update keeps working in both directions, including rollback. If every
feature is required, there is no way to enable it until the outgoing
kernel can learn what its target supports.

After the spec lands, optional features are still useful, and at worst
harmless:

 - Kernels that predate the spec mechanism can't provide a spec. As long
   as one of them is a possible target (e.g. for rollback), optional
   features are still the only features the outgoing kernel can use.

 - The outgoing kernel doesn't need to consult the spec for optional
   features at all (less complexity), since by definition the target can
   ignore them. It can always produce the same payload, and only
   required features need to be gated on what the target supports.

 - Nothing prevents an outgoing kernel that has a spec from choosing not
   to set optional bits its target doesn't understand, if we ever want
   that.

The cost of keeping them is negligible in the current design: the same
number of bits in the header, and one range check on the incoming side.

The one rule we need is that optional really means safe to ignore, e.g.
optional data must not reference preserved memory or carry restrictions
that the next kernel has to act on. Anything like that must be a
required feature.

[1] https://lore.kernel.org/linux-pci/20261019213054.3157159-5-dmatlack@goo=
gle.com/

