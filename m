Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106208;
	b=GsQHo6l9Qb6J52YNFyJBfVQuczs7ejcDALcqRrxw9e7fotTaJIXvRJSI4hueQfMyP19X
	 iZDF6NPKKyLViDe9YJJm6PWFXRF1Rt/w5bbAW1zxbcZtDsiQpdaNqQqtpB9BTxf1ix4me
	 PLhkr8tRU777FZxUqQT1NlL5jAYpUf+vBCHJTw78a0//GLymnCnlNeK9YFJSj8W1HNrUw
	 LW0SzLi6LI7bksiF4S/oidx/Fy/MbayhU3+V1Eh2HR4R18wdZD46x0wuj7Pgf7L0kgVRx
	 Q1YKvyihI0I6n9RH56b9sR+RGJTKn6FNH6YzihTSX1NlWYsWRRz8CmR2MPLmmvonZVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
	b=rehorYWJtijV9M/wKS9IL1A+3Uw4H8XNJ/ziE/SQFpm59Aqh2YeoaTOg6rkaYfgVfn9y
	 4Bg2Ljad79war4/siduwGnJ/6CdbzS1a7AVN+EwrEDhRlBSHI3W5I+s/c9fJ2f6scfDYQ
	 Hqa4Jk+JGBW+017AFNxyeXTyTgIICEH2A+8lCRe4kVmJpkE77i4tI7A5NNhqABKPiOXjt
	 /kEiZh4MCTYEfVtf14Sv+cGeCpblXSsNaJ88iddhKWtCeGGATAUQt2vuIv3B1G1R+enjY
	 IFxt6nkt7wLgxWDIC+VuLci4WFBWtpBlk1roVNTtzgme3KXkDXNR3ajBsGv+H2IieFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lTB+Mdf5;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC0606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCC0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lTB+Mdf5
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c38cdd5b7so30298781cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795106207; x=1795711007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=lTB+Mdf5G+dkkh81cAzRgipAhlC33Dp9DjIi0zLkYyfkdbtaTEOW/on9aDpCbCstD8
         FGdRYGkcGPHpIpu5YMZ8IiOMrzgfLwHXCmbRe7bgWEiR899Ftaev5X3Ut1C/HnBArExR
         a2sk6F3+C/ENMjPL7h7/0IGYS8HfzFoTioBlJDIi05rrfuwuJIH4z/iVW8sFLVBVf7cl
         K/FINze0hKhuEAMR5D9hGYly+PL+s9BAIdVm6NoTwgWrXZ5CSiz3PW8BTODNfIGW1Po9
         fyXXpyX/ejiFBAJijaIaSbiDVfWnRbUkXkLFCAVl/8PpynXYRW0HERjpLjYpDk+3cxSu
         J29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106207; x=1795711007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=FODqgo/GBY0cOcnH5idhgFQPYbylG4ypSPhDLbKe+UEkjJAG/Lnaqeu8OoHSttm0yZ
         1L4lHqFJ899QEWxrYC8jrqEJgYbrjDcEPR5ZBQqZpeSkaBwF+O3SkRYFsBv70OuwvdD4
         YpOgpElYeUZczPMXrMvnhgEW72sxrFwOj3gQPHXdc2IctS23qPchv6z87SkdQtKxhRR/
         SQCTzlkGilv+sHh/uvjp54i65QgEvrwO/M3TKaqcbm2B9V+0fTw7M9w8UGDYJR2aXKWf
         A+MOi7E4tC6EoDQv4CVOSjxKc9ybg+O+4dYgFNn9/oAjDcysn3CsjgYs5ahkdjGS2XJA
         XXtw==
X-Forwarded-Encrypted: i=1; AL+hErEq6k7kadwzFadwbt1Z38uXLL9EhlQs1bMnZZFxpJiTbSrnw0e9fWWTaTNvODQLpdQzgR591qJP6XDl0Q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z99GDwcWf/wlBtSDV11hsJJIB09v0OloqCCVe1n9I1I0rXXx3rb
	mwhWPUBNpLJmZ8ku0D+uq6b6IjcJOjD5vvjWyW2vHuMJHN8sgM2HXAiFCA+Zwt6M/kA=
X-Gm-Gg: AYBFou1Z39tOZYL3kKDIUzWN0u1SAkzFmFgMkXEyRU/oZsI0ivHqKf36nbbh17MNYQ4
	lTFVWoTjPWsl5YC/yD72JNUmEEPFKuVyHcJrFTr1C6sOuJAXYJC6U4APHACzIe+o8dVDmSGPFeR
	HL8xFi54R4aGstRqrN+1iN+ooAaWggZyoYB2LWNuXggXUZyzIXSixCos8eWD8MIzpDL4IYgid4e
	PTbghhHi5wtNvxte/es5bIOESuCAKx+vFxCr54GrqayEuIJlXn1LvVOPhxh4PLRQBTLK3HNEYx+
	XlgrQDUqd8u2hQZWRNd8NIjElKjNBWrp5ARQs2Rk7o38mf++l9CydtHG4K//D8NAHocCcQGpK2c
	nOAvEqb18oVueoVf3M+zIZp3GIYO65aCWUatuKCRY8uMUBXAgjSrUCJKbixUAzFJaPrcH3H33M+
	VvOZz6wPGV4XmvvBIGFRI2bAaK3J1+ro7lbzv/pMvJJTCvFcEhAbZBK9QNzMfoJ5pzyrIWYK4Pd
	BwhZrvavHc85P2GIOEiEIxNcsyyfQlcCebUgdgF6JmW3adZwUUsWbJ6EW4i1jPw8yZ/XDYMPHzy
	Py8/ig==
X-Received: by 2002:a05:622a:988:b0:55d:5ba6:bf25 with SMTP id d75a77b69052e-55d767ab475mr9697321cf.0.1795106206697;
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm27455131cf.29.2026.11.19.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU57t-00000001A8R-0Ufm;
	Thu, 19 Nov 2026 12:36:45 -0400
Date: Thu, 19 Nov 2026 12:36:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119163645.GL3115493@ziepe.ca>
References: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
 <20261119150857.GK3115493@ziepe.ca>
 <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>
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
In-Reply-To: <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>

On Thu, Nov 19, 2026 at 10:47:01AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 11:08 -0400, Jason Gunthorpe a écrit :
> > On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > > > With the additional twist that alot of embedded HW has apparently
> > > > choosen to not implement SSID but instead has a pool of SIDs that one
> > > > device can use, functionally similar to SSID.
> > > > 
> > > > We'd need also API support for unbundling the DT iommus=[] SID list
> > > > into something that the SIDs can be attached more like a PASID.  That
> > > > need, I think, has become clear with all the DT tricks and fake busses
> > > > to try to work around this issue. :|
> > > 
> > > The word "fake" never flies with the DT maintainers. On that subject, I still
> > > don't know what you mean with iommus=[].
> > 
> > When you write your DT you can list all the iommu streams in one
> > iommus property. Like this randomly picked out of the DT files:
> > 
> >         iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
> > 
> > If you do that then Linux sets the struct device containing it to
> > put the same paging domain on all of those iommus.
> > 
> > It doesn't make any sense to open code this in drivers when you can
> > just have the core code do it by writing your DT to match how the
> > driver wants to work...
> 
> The will be rejected, as it does not map the hardware. If you check multi-core
> codecs, each pair of core+iommu are independent from each other, at least enough
> that they could be driven by different device drivers. And so they have been
> described separately in the DTs. I don't see a fault here.

All these multi-stream things have a choice how you model them in DT,
both ways are "describing the HW". Fully seperate HW blocks with
multiple struct devices or a single struct device with a list of
sub-engines. IMHO neither is obviously more correctly "describing the
HW" than the other.

However, the DT choice strongly influences how Linux works and drives
certain behaviors inside the kernel. So it is not just describing the
HW, it is very strongly describing the SW model too :(

Choosing the opposite DT model to what the kernel driver wants and
then undoing it with a bunch of code in Linux is not nice. We have run
into trouble when people go down this path and start asking for new
APIs we don't want to give them. :(

We had this chat with the DT maintiners too, I think everyone agrees
things are imperfect here. So far the direction has been to change the
DT to match the desired kernel SW model rather than hack the kernel to
accomodate the DT.

If you truely have HW with frozen DT in firmware then maybe that is a
strong argument to push back in this case.

I recognize this is all imperfect/problematic :|

Jason
