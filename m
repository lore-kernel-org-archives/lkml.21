Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597893;
	b=X8KoDEknT+6lZA2KGN4P6qIp3dwBgGBytP7mdjknIUjENL6BIvoYcjP4VqlMuQnMyQHV
	 TSfWI48HMzZP2QDTt16EHV+e0ePK04xH7J0b/bGK7Dbcg4Mktzp0BMVROUY2cij50gmVf
	 jQH8Yx7BT16uz5ExRsapW+ddrgEeL44CEolXNdHZ8EyeCyeAQfzeCIVmu48qoxcCNxxZi
	 QTcdrGicLJTFf4e07lNnU2MtRh0LSmDshNjHa3ROZ9sDzuMnNtUSAOgvlp8yjbVB+GBZS
	 EI6sFYEETD/rB86E39+gN0CFO/0RB/CSWA3iqpLubudm1UX62fUP32bz4Mk7wlbKQWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597893;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/4Fc/qYpZBM1SqcroLRed+1NsBQqR3SYLdF5r+q5zq8=;
	b=l9QSvpMep6uogppOzQ/dLlGgS4UTjurcVC3+ThGtor9FnuQRa+im2TF54KOZ5L/FocTv
	 Txqi9mdBBTRfydMDVHmloaqCzeHlR30wOalB7X64t5QVEwIkgXIeY9uQjTjIMmNwkbO7b
	 vCsxd1Lfhq3TmJxD1F0ERFoz4QyMpGxryKIs3yhLXcHUb5TxFw86YRgPbx8nTA9c17Pkp
	 5TrT7BJryclT/vd61HWzccOqsSNDDT+zNj8pbRMFCfPjVlvblECTzfxBa8ze2XDMaQZvF
	 buUD7LlNvpezoaiPQnHaeEaAvv4ILIeZ+cleSCIw2M4Fmy+glm5dmTzSVUXJGxhdclg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DETyO4fo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DB606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DETyO4fo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AA01F000C0;
	Wed, 25 Nov 2026 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597893;
	bh=/4Fc/qYpZBM1SqcroLRed+1NsBQqR3SYLdF5r+q5zq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DETyO4fo1hCypme8HL7zGtsfAXiIb/CM8iOzA7fI6pGw6OjqPcRuBKRssYOSdBtVx
	 /8rtcv7wLt7CpsQwvoBQX1utw/qfx98ZUmODXhO9DdWH56CSrkTCPMCHtQ5Z1gRYMn
	 RDbwjw0BWtpHuf57PigWuSL4KP4sTzZ//d3NTMSeKGO+CcGVqkHR79OlL2nuPKZh9Q
	 j8WEZlcYH5Wy598u7SBqL35aFA4foGjIGPCYvUSpb44IP9bvgTAoC3992epbeRICyP
	 CizFaDrviuL5wxmkUMZ0pX4usVWH7z6A3/QivoDVYRWSfF4HbdOaQh7DOED3mXuYOv
	 ikK1rmqt8OTpw==
Date: Wed, 25 Nov 2026 11:11:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Message-ID: <awamPtNjztFml17Z@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
 <4edee4db91a92b3231644688afbc950bb880ff8c.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4edee4db91a92b3231644688afbc950bb880ff8c.camel@intel.com>

On Tue, Nov 24, 2026 at 10:57:39PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-11-12 at 18:31 +0200, Mike Rapoport (Microsoft) wrote:
> > If a step of __change_page_attr_set_clr() covers more pages than remain
> > in the range, or no pages at all, that's a bug in CPA, but it does not
> > justify crashing the kernel.
> 
> Agreed, but does it also justify special handling to try to return an error to
> the caller about the bug in CPA? Why not just change the BUG_ON() to WARN?

If we only replace BUG_ON() with WARN_ON(), either rempages wraps around
and we keep changing pages past the end, or we loop forever.

In any case we must break the loop and returning -EINVAL seems the most
appropriate action there.
 
> > Warn and fail the request instead.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/pat/set_memory.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index aa7052d247e60..a1bea16a3c3bb 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -2101,7 +2101,10 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
> >  		 * CPA operation. Either a large page has been
> >  		 * preserved or a single page update happened.
> >  		 */
> > -		BUG_ON(cpa->numpages > rempages || !cpa->numpages);
> > +		if (WARN_ON_ONCE(cpa->numpages > rempages || !cpa->numpages)) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> >  		rempages -= cpa->numpages;
> >  		cpa->curpage += cpa->numpages;
> >  	}
> > 
> > --
> 

-- 
Sincerely yours,
Mike.
