Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098878;
	b=M7bqzG8PFidYTJLrQcjevG/AbW9jUAhdtFiq/qPDATlV4DBQqWNQ8htCo+Gw7PVJc0qE
	 5z7QsifJpo6KbS5vHVtP6fXxBtW+794fh+bkXDXsbuuGC1kNRs14Kl6zf0w/PWVLth0f5
	 WvpljIpM91HYhD5ehQY3Vdx1XhRIpEMEEPGTNJwxSPacx1fCh/8LAB4pgSs1R6ulD+w+q
	 WfazKh6qn++e5eIMGbxg7Opc4UvcXpGA3VdDqigY7jjwXC98eySFKDfh+HZfUL19+omce
	 gp8m3r0N6kQ3RqFI7Rlad3v/qQlk89nJPwWrD+QDpi7vcfn7BIZcPsveg6fHfoS6NCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
	b=CkvgVF3v9b/7PhjvPhroB8Kqt58yp+X73CLvN2Qkoi0WhggQvtXNk4BYN9ThOBVpqe8t
	 qONwO9oZbDzXj3ggUH8/C9YcbAxbkOwAjzqJmoHmz3j3uiKCc/DCxDeWPgom5giXQBtMb
	 01xauqG2fWNO7g8UL44X4Mua5GWq2Q62uSR3pnp7/aVxERUSxvcVgsc/+Izdqn1qOEVAo
	 Hw8Cq92UYzToF1zfMnTVCqW/MyJwHSIf69ND4Q8p5DwYU4iq2PbWWFlaoOxPEX/bQExf2
	 1t3gnVs3nhWZAprRO2iRA8umavEt21TubRHuHvmKL1/hr3VXMHh7t6jV/8s9VrFmYGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FGukqx6w;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648B60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6648B60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FGukqx6w
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91f0274f88cso29274616d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098877; x=1795703677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=FGukqx6wpPtbvicikKJnmpUnf77pjGIiA+jiE6X6JEBPZ+faYks8agiHmgED4yOEFr
         hdk5SgN6QNcNWmaHK5/CQtpC5QhKTZoM5HWEQTRaM/vYb+IJQjLb2La0SmEN3wEfL0hF
         OMakZTmOvmrpZRNpBtc6dHwRmpAjuFxpGXHT8Al4rh6BwTuRvC6/EXUViYToy7xAyFj/
         oDwkkkQxUHfaXizQzT6Kb+Yk5ee0gFFj7YN98vUO8Vhi0QnsdrEwMvuUQVWGGQekvDAF
         yGpI+/l/LKVEeshVccW+SC0KAiYIDNDc+yXOfGO1o3dEihCZj4T/qk65YFtn7czgXevJ
         fTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098877; x=1795703677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=ynvUToyXrWmW6uLJpjax+LyGvO5Kn6w2z+Z6baN5bF9YpwAnKkWfXojtpRcDc6w7zL
         TPN8A+3t3xpEp0xEaQVZmNLmah2PKtpR5KfIizQBdgUYES0NClcnEzW81VMspXvkEDe7
         9e+q8tVrkipDQY4ZQzrn3kn2fvH/BjzlFerc2CYA2CFumVifPkz+rkO2zTpYksDnHLE8
         t8UkhgEI1+SRXZpIKjpnvlRSHsIybARcz0lhjOPtcAN+yL/Fjjs3gNCIO4Ys2OGlRj4o
         hBOhquPWboZR/zGayd9iRULr0WkQ18YbYlheF+TgaRGkgYOGCCqku0+BBv9Um9hvgJvj
         7Vjw==
X-Forwarded-Encrypted: i=1; AL+hErFPpqilk3ZN7BEMXMjqA/f94uz+opO6OFtASPwEDRFOSXkTEd73XRgQsVcnaVo7tpb1Y69iaWT2TEzowvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0MAMF0qPtUU2yS776oPJZaZ8rjZRHsMuco9AwMEZEMQlip0tI
	J/bBuUr4OI9KJ3k3tsVLitecIZMlhBGGOOY3lr+2d6c6fq+z+OPdS4GVD76vvKSh56c=
X-Gm-Gg: AZFdTZf2MzJDOnyNdBhCNcI5PqUur897yQYQ3BJoxNkTzsMKlwBuPso5u8qz0slEAya
	2wUpDR+qhs6FzjLzsokUGImcJ4Recdh76eVa2asi1ArUXFoHqohZl2+Qtcp/vfLR4KaHo9Hzw7r
	vw7Ooxuk7qKo1wMMjTPiNollvGsC3EBcJ6CpPEr0Te4DIl4bmkSs3o2CdC49zl1TaMx/J+N8HsD
	46PDpRht95OvF3u5cIXC0DuWMfXgNDk0eZuJfTHR/2STqEdeYnd9ZDAfXxLJMTiYPgTId0sO5pQ
	SHFpQVyD6PRnvuTqc7VLLEGvLI/0BumqADomVKy4Rxl+MJz5ujEY6rvUUSOeATOkmvi1WmDTroh
	0KaRYvx/N66kQ23NEkXQuxdTMYm/s9CAnSmfyGR7jNxcq1HElmJYezSssZ874tn2Couo5vayWL/
	XiDAtZuUeRDeamiM0d5HkEbiCTVGvsVDfyPxHTyrlCIAqirS/L5ecSkJSmfZKewffM4+J3fGMU4
	ok0xq4b5eMejRkfaaUtye1/gz1O7Ylj4bGNMyoDubLD7f7j70XthdDkdKMsYxVSCFknTyGnrAtG
	C1ENUQ==
X-Received: by 2002:a05:6214:5e02:b0:921:16d1:7cb9 with SMTP id 6a1803df08f44-92116d17de5mr70719896d6.40.1795098877201;
        Thu, 19 Nov 2026 06:34:37 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92133fe4670sm339426d6.17.2026.11.19.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:34:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3Df-00000000tJC-0ytS;
	Thu, 19 Nov 2026 10:34:35 -0400
Date: Thu, 19 Nov 2026 10:34:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20261119143435.GI3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>

On Thu, Nov 19, 2026 at 12:24:50PM +0000, Robin Murphy wrote:

> There is a middle ground, where a kernel driver wants pages to appear at
> specific IOVAs under its own control. This is entirely legitimate to do by
> using the public IOMMU API "as intended" 

Yes, but, we never fully implemented this because we never gave a
cache flushing solution for these users. Which is a problem for safe
rust to expose an API without any way to do the mandatory flushing..

Jason
