Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625958;
	b=qEbjaqjoxkCXEA+bIYWzqZN/orSlDJkr0J9+vHJid1flr1jlZMrn64utCsLP8stOY3/X
	 bog6UfaRp0a811W1rGZMWyEtralR2McKpwyguNLJRkRSlOdmlOGBrnh63/Ymn6p6dpmo+
	 uKUOqZBr3+mfNh39/xKGBx7iSjJjB10O/XIO5MoRfYNjadfuGTUVcEP5GsBy87I/0NO2Z
	 xIdrolU8CJrjcjp2DeUviygMZrWabVyZxvFmskd9VoJnKQtfEUNYsq4LAx1W7irEpVE/U
	 VhebAJR/zZw7yMdDeULgDt9QKxRM3VncSTMtiAijJAY0RRrbJGYAdlahrRsEo/3hNWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SQQncmT/Wl6HjAYO86rxtIdewDLZRTGF1ImjCznbro0=;
	b=0xVQon0eI1IuujIlpdmKlpkNukQIAotrt4i+8WeUbIF22ts+/s2AaM5z+/zlCR1tYWfz
	 a91wi4rSC+uI4xxSOOoz+iCbrxHi6qstjAWIUUHfGZxWWxAspS7S4Q92mthytsE/uQ95j
	 rRdAbP3eFLjrKlx/xnpEUPSfcFbPdJQ29uyNax6cPIITZMUEtazhebXE7kUeI+F3OWKzZ
	 GTbylidCAff57tFclrAPpVk5dcin+5sifMl8bMiovn978wTEkDyx5+ocnxykNgAOwOZ22
	 VivAihGehTdj7YbZR+NJX+08p+2uw23+PPYCYJW5MtTcOs9fy6PQT62Q4DxLVQM691Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVme2v5e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC21606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVme2v5e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8781F000CF;
	Wed, 25 Nov 2026 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625958;
	bh=SQQncmT/Wl6HjAYO86rxtIdewDLZRTGF1ImjCznbro0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVme2v5eVWqiLG0XGEngRTj1/NVlH0UMgFocxlSeVjVX2ycDVpQAifztQ15Vq10Z5
	 U8xROKTCan77H2WbJFVeTgociB03xuPMESscTC9KZ3zvET4zsNw/cPWxuz3bkjeYZ4
	 NItB50dhzTZLjf9Asc+cxUQbsBcZpFCU9qrKIFLXR7hqdpCar5sF1M9kZXpLL4XKtr
	 C0hWaq5rt13hbQy+zdChaHdxiiJ2Q7luPsJ/3b3S1soL62j8ZiTznhixvNZEedvygh
	 mIe7FgvX+xQAVN5eGLOQ7s4CxuCzIvZfYCnE9WXt8V638MeR1b/LAaDFP19o4QSL0E
	 nk2IMpW1gGFcA==
Date: Wed, 25 Nov 2026 22:21:38 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Pedro Falcato <pfalcato@suse.de>, Dave Hansen <dave.hansen@intel.com>, 
	x86@kernel.org, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <awcMnXKDWjTvxumG@blrnaveerao1>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
 <8500860b-d2ff-45c1-8604-28a2b3d66382@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8500860b-d2ff-45c1-8604-28a2b3d66382@suse.com>

On Tue, Nov 24, 2026 at 07:57:05PM +0200, Nikolay Borisov wrote:
> On 24.11.26 г. 19:10 ч., Pedro Falcato wrote:
> > On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
> > > On 11/24/26 08:00, Nikolay Borisov wrote:
> 
> > 2) open-codes random CC checks in mm, which is kind-of regrettable
> > 
> > OTOH, it's unclear to me why that CC check is needed. If configs select
> > STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
> > in iomem_is_exclusive, etc. If not, could the CC awareness sit there
> > instead?
> 
> Well, you are right that if we retain just the select
> STRICT_DEVMEM/IO_STRICT_DEVMEM it might fix the immediate issue. I don't
> know why eventually Dan decided to also add this check, I guess it's an
> instance of "fail fast".

Actually no? On x86, devmem_is_allowed() allows access to the first 1 MB 
area, so STRICT_DEVMEM alone isn't sufficient.


- Naveen

