Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745461;
	b=AOE3TpPTJ1nxYzcBjwg0hk6tRr8y9bng8K4kxDEYaQrc87ZX1T40ozeYYaYSQzRGPwja
	 595Y+C8Li+2i0IHZ6IAwM2UfTOa4i5PiBYS37YyPTCgk0Am57pkLDGSJ/uOt2d+4v09XH
	 xCU8WSA9s7EcNBdeKAY/N7FnLotwzEdoVemCbhofEKJfM+9CxwhXUSPnYlMpUuzInnvfh
	 moKRVSrLWxqf9Nf7DR8IoerEMTr5mHK7z6bcwYzOOuuz44aZB9I7JcICEne4fv5Ke35vq
	 yV38+T7fq5hR9ACDGXjnQCTclg0S0RPiaBHwad43UwewPCeifJXg4zjNcMlL63NhVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BHCahoKy2PJzUedVB7T1cTYvXickwh+vDtpwXOtC6wA=;
	b=LOySzj1isqKkuIpTlwMaJU2f2ly8g+lUy29a3kyeUTyuBOfzeZAcjFN1m30Y7rz+3ZTC
	 BS6km+9R+XC51qkeJ00vP6e9qdpTv8V2VM6yPzCQzn38qYaFHj+aG0S7K8JLjYWTPFCFE
	 HxXpgkAnUadKP3gpkzce/M35N6129TQTPNVe+5ShNLFYKmXgvcA/Yhs0rg3XI33RJKwpF
	 P3lrF8sZyLoc7c0hwCShVLTcS8LwVoBzBGbJeS/pxc9tLxYXh3pAsigX3Dja1ZLTJMik0
	 ZinF+oFNZymPSkG2ZT11rH3HTgr06Qh8lyLQQxRR/E/LTLRQa0le8WVdGzmuFctYEcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="E7NhiTW/";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA0606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E7NhiTW/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f052ae3c86so41062175ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795745460; x=1796350260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHCahoKy2PJzUedVB7T1cTYvXickwh+vDtpwXOtC6wA=;
        b=E7NhiTW/ePZcJTVjS9gCw0DveB6YX2Lh9H5t3MqtptrNPMx1MvFpK/Ol+p59LcWWGi
         lko2I2G9D30i58Ps5lhPPG7ywL3139h/z7HuMDUoExqJqc/e3aKwi7SBP3G8gGbID/8d
         uj81oS5dBFuC5ctOWpMpoi5QF7/tu8uPq/aNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745460; x=1796350260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BHCahoKy2PJzUedVB7T1cTYvXickwh+vDtpwXOtC6wA=;
        b=Cy6Ezjw0L3z09Ii5hay2AeuwWNg1+l990GoniJViOpy2oO/oOGdFS19y0ZHNjpT+g4
         Fryh4oAbsY3cOp7GQiy1Invu30gdjls3A5GiEc21PgCodjgqEu7CUu+lCW6+/QdZa30j
         cAhigQYDuTy8Ij4SVhKAQF+hVa5HDgycsqdKWPBx0C1/hoWsMosgdbFI+n7ehUqq8fv5
         Xyglq61t5cFd3YDNPwSyTdO2pGqCCdNOrTu6H23LUFBPePOadIJ2E18tMFSfMcBmGW1v
         lHcCr/V/1KeF049qQIYapryz7DAy2cfnQAglAvhRbcQCo39lLYLxyp1c4w8hJg94Ive3
         2PcA==
X-Forwarded-Encrypted: i=1; AL+hErHg9qDokkEc3vLtQ0DRs/FBdJETDSTrV6CLpxX8xJUIZDfOmZR9NEuuUE+AJ4/BtI2GSe1OmQnSPZBItFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AyN6VR23VO0aOTiSQExsnYdMKmdADkNgIiji0JYKpxT2SR+na
	jI+s1CL548+40Nc6gg3Sv2hWKaa5aWGpwsfFG+gCYn3Ha9Nd3d3rJu7BRXcZYjlLzA==
X-Gm-Gg: AZFdTZeYXQVHYtZehYwKalSbrrw5fjaFbOU5XDRHK22rB4mFFfib0bMnQkZwNFuqLgC
	WUkEaABSoeGKUYq6Ccvycz9PuKijasIi2CysA+b2lf6MqpGdkNv/aVcyyj9nznRPFE2p7gbSVqN
	lI2iWwoV/l+nD6LcKKc5XtI/T0vp+y9W4wK7CIWul4PdrqdV8vQK4hMKeIvxTnlxLyOYsxtMw4L
	2DmBzK6CRho89ZN5UqRXH1adFsPFoTszbgg9EHmHX4Kh/YWYLbmAJYChwq6o3urAQOpjPrm0rYG
	Gb15ERIfHaUwQmHzVQK1se5mxcaa0NLpfrYxbjB06OR1bJ135lPyMdMpg+RdGDTAFDzeK9qTXFj
	9AQ4eymn2P3PkrkVgRRSkqbjBaO/mGHPbYhR1/dtQtZhuNPgboNE4wIG0QdGeonEgM+2OSK3D9A
	cLdtrTDBrJaxZ1jN9/ktphrrY2BwBVZJMoMk+cmARETMMclCeRM0/U3l+6N7AY7DyDRTuRrfuIz
	p5dCP7KiUKR9vNIKoMZHjINR8clzE4NJSD7JDsryHOJ+2rzmu9HJ4sMzWb8tXRkgl7DFePculB4
	Ukbt+sScOOhhCXJ3Fv3qa0AIdL5HGDHzRfGP9sMySezfp/tBNdD8jkFUApu2AhEak+U0Ng==
X-Received: by 2002:a17:902:f645:b0:2ef:dc42:10a9 with SMTP id d9443c01a7336-2f03ef3d32dmr240566145ad.7.1795745460078;
        Thu, 26 Nov 2026 18:11:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:5bf8:984e:5bb:e51d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm110269495ad.17.2026.11.26.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:10:58 -0800 (PST)
Date: Fri, 27 Nov 2026 11:10:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, minchan@kernel.org, 
	axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: validate decompressed page size
Message-ID: <awjlpLnyVmKRqhmQ@google.com>
References: <20261127004411.109585-1-artem122novak@gmail.com>
 <awjaHB2ugCG_F3Io@google.com>
 <CAPufuhb9txcosy48VXtfxwnC7Ct448J=_HbR00JnZR1QG-NfHg@mail.gmail.com>
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
In-Reply-To: <CAPufuhb9txcosy48VXtfxwnC7Ct448J=_HbR00JnZR1QG-NfHg@mail.gmail.com>

Hi Artem,

On (26/11/26 19:34), Artem Novak wrote:
> Hey Sergey,
> 
> On Thu, Nov 26, 2026 at 7:19 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> > Yeah, I don't think we should do this.  We only ever compress PAGE_SIZE
> > buffers, if some backend decompresses it to a something that is not
> > PAGE_SIZE and doesn't signal an error via "ret" then it's a bug in the
> > backend and zram should not cover it up.
> 
> I see.
> 
> I thought it might be worth having a defensive check here,
> since allowing an incorrectly sized result to propagate seems a bit sloppy.
> 
> Do you consider this useful, or should I rely completely on the
> backend contract?

I would probably prefer to do nothing about it, IOW rely on the
backend contract.  Most of those compression libraries are used
in other places in the kernel (f2fs, squashfs, etc. etc.), zram
is not the only one to rely on them.
