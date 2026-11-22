Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385050;
	b=3A3gSTJpns74uDsUB68QBNyWhDu5yl0jvMe72AZjRFO7QOkinlMB9UPWUAkmkojAVSww
	 gnZoJZ1uhVfT63fYyGy/dmFP+MWs26eF2BdsAJdW3vhvR54V5p9sNqd6ppFa5X8+G4k7s
	 1RBs+blVLQP312l+86c11bd+PbpBfKScTIpBn//g+bxIYZs4urMLPLE19FawCReDTDLyI
	 J44jE98/YkhjiANwWIQi6ieji/DintYXjz2+6fD/wKz9X8rzpmKlOgxlkxHneStMbBuU3
	 b2fSsEZtaoCeo5PW09fInCtvEJEwl/72obk3xY5CxeKAb81ENvF/g8OBp/TzkbtXODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
	b=S8Rr7tVGUThwZjNGiFlfuoMD4UB3DNRDtE771k24GCwqKURhWX+Ja0oRHycGZqmGnTSo
	 mOLP3V6Xer2P69CpayoSXwQsuA5KH449NSdDDDMp8nuFFfQXpf0Xatxo+YRgKDigKmGRP
	 OlL1FQwugXcge0s2XW5d0tdURMrywYXUhSs6eIpTbIDUsHk+I8D05W3Sr0pRdukY1RNxn
	 S2HrHAksnB4NNaVDDU/OPD/B00K+RUgEU8/VjIV3ku2m4nFCuKqMwPjk48xrVt+YNdSgi
	 Sf+JPluFN1qbPYrzZMTQjCEn4He8EpGJxMxEojqyVnvl27iIT2cMN9Fd6ayV3nBXT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zb6i+C64;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70293606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70293606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Zb6i+C64
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c48582654so32669391cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795385048; x=1795989848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
        b=Zb6i+C64CASN2ndqPIkyqfK6CNP07EzVS4CJfCyAslD3l9TVj2ktcjdJKiATYHCa4d
         nFzVDD4e7Fb967Zmek2vssQc1g2uGyVD924kVnth7iDDsi9vf73VQ8fDaOquRrq3yu8r
         1dlGsXvToefm0ERzK/AMbRuwle4p0pqB4q5QhtuRDBdd641tDYrgYAfSQ2/ZWtmORlT6
         EAojqrwI3sg1ialRkcqFhaHNXGMzGKS96TyGaKJzbtu95+9y6ofCZGt57p53iw6If4N/
         HS1xpGwWTuqR/vTy8cHVy92eMMwVgBa9yVwksjvyvSLVPniauCMo8Ehb6zWb1wxd1oty
         yP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385048; x=1795989848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1UeqpHopmbaPkusoHxAs650nxIkw9JTuQGwP/8OHlk=;
        b=j9ZFMs1heQJbylqeFsVrh/seq+2NsUMjfIdah52JsScPIsKYyWKq4vUAEbdRketVFC
         C8vowJWHRS/6Uot9fNBtZ2bY8WgWJjG8FgO8Fq1A1CVwfONS8/Qomo9VL/1P4am+DwL9
         j1WNB2AafSa7cNq61BkrHAukqD9l7IrjYM4ztoUMmU+HHzJnqLf8LRVJRAlMDW4am8Oo
         5Rjf3Yok67QDPTp542RqTVXOtC46u3tdMNyYZ6BWFr9Ifn0Jwd8JhJGf5m3z4DK2tCyJ
         cXf1vfH+LfhVxRTKJrqgpmE5jcXqFDeg5oAMJ/UVsEnM9mR46P/9vEA0iykz6hTiNSbR
         H3Sw==
X-Forwarded-Encrypted: i=1; AL+hErEZMMAP3NcfM8k2Ukh2uOrZW0tT5JEKQKqktwThZtgVcBZtci4I4Veo5VrJsX9bqvsQ+6Kmm3Bc7JorJVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iww1HyrVFAZFN8iTdVJeoRpDJFRZ7rp1gjK6onL7eELvrWbBX
	jpdl4wjoGua4myflbEwaaFBsIq9ZKBef37x9kRd487i459OJfToUuvvsGu4PP5PSuw==
X-Gm-Gg: AZFdTZdS5KOC7FCcLVM1UE/j3PK87VJOU32iAq/P4iPiR6as5DBbeqetk6/gIvk1+Fp
	OUB0Z0o7+mabUt2kGDR/gjjXX9zwAgw3j0a1gfURzpSJIO847X+7sCyY8ElvrP5NDges8+3Y5fM
	K7HhGG+xAMykbUqjX3IVcZ6TRUQKOFFtldMVp+5eVplWU8ly5WotuOVRfeteBHoyPw/SOOKtf2+
	9q6thYl0kdunqanDZCTjVMn8tSANMKUe8c5RT7zH1Jeki+AcbvRD8XA4/1DB2LYr9RrBL14FFKA
	Ovzj+RhyPjWLBrPfc3Ee3ATfXbvjRZHjqYuXjTcJkgHcBVWLKrJk/OAL2QqnksKDSn2l234uOFP
	xB+COWTpADLOh1sE91KfOT3xYTwefQON6dmm93EPK3YjINJOaQ/NMAANlL532T7NBcMrXXUXDVl
	iwz91Pv26h0FQs2nUhdTi2JggtwvH2e00s4CP30P1WwPdqWOGXmQ8bYRJMT3jAv8rJUnWkq+RNE
	zSIvkGyVWDWVn7oKjl+Q9MeFIlHuRLqXRaYZg5EGJvyLtjH/Zicgr+4a6kcecPuQvIbfb9Ur7HY
	+bHM1uM8bEldKC84R+YpEtHpWKN00w==
X-Received: by 2002:a05:622a:2b49:b0:537:c478:70e6 with SMTP id d75a77b69052e-55d76ac210dmr174765381cf.36.1795385048312;
        Sun, 22 Nov 2026 14:04:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm81501311cf.29.2026.11.22.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:04:06 -0800 (PST)
Date: Sun, 22 Nov 2026 17:04:04 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Message-ID: <61e2f5db-8d78-4220-bb21-cedd9f579e8a@rowland.harvard.edu>
References: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
 <20261122175805.2955-2-arbabhaider649@gmail.com>
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
In-Reply-To: <20261122175805.2955-2-arbabhaider649@gmail.com>

On Sun, Nov 22, 2026 at 10:58:05PM +0500, Arbab Haider wrote:
> On Sun, Nov 22, 2026 at 09:53:25AM -0500, Alan Stern wrote:
> > I asked because when syzbot tests a patch successfully, it provides a
> > Tested-by: tag and asks to have the tag included in the final patch
> > submission -- but you didn't do this.  Did you run the reproducer
> > locally, without using the bot?
> 
> Yes, I ran the syzbot C reproducer locally in QEMU without using syzbot.
> I also just tried sending "#syz test" to syzbot, and it replied that
> patch testing via "#syz test" is currently disabled:
> 
>   Patch testing via #syz test is temporarily disabled.
>   See https://github.com/google/syzkaller/issues/8122 for details.
> 
> Also, while checking lore.kernel.org, I noticed that syzbot previously
> posted a similar AI-generated patch from Aleksandr Nogikh on 2026-08-28
> that never received a reply.

So it did -- I completely forgot about that.  For the sake of 
thoroughness, here's a link to the old patch:

https://lore.kernel.org/linux-usb/ea864031-b1e2-4b78-ab3a-58adf681efc6@mail.kernel.org/

BTW, the two patches aren't just similar.  Apart from minor differences 
in the descriptions they are identical.

>  Please let me know if you prefer taking
> that earlier patch instead, or if this submission looks good to you.

I'll leave that decision up to Greg; he can choose whichever he prefers.  
Regardless, for both patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
