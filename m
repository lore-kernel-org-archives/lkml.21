Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066378;
	b=2o+Zhu4zstUf/NXa5+B7jzYcZjn5JByUnJpBjHxz9EO8N2Lk45WYdl1IQQ5noLCBqVbt
	 OnHA97avniSWkNxDMpuygV03zQWdTNTy6YjZFGnMHOuuEhvYWaTUNod8dp+nBJpQzgGui
	 c9Chm+SgLQubGHMP4xTVJ+xl0z7BVzWHtRIK4I05LGjpBYG+UQdvZb/T21TWDnNXH4/1b
	 Nuz9G9DxVZ5fDElqPDQDL6D42/zHjrk9bYqn6zQ4hBDVbvMUdGnQ6cD0gS6lQf+UnyDNf
	 bVeCxMABkefYBO798JTmHAqTzkTpgJ68066ax7am7KcvEke41uLtXnq6HVEVsqKOaYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
	b=nbAc9Q1LfJVH6d4EmbrTdI9XhQF+Ww7hMyyG9k0+n1ujTeousSucl0kRyYKCa97O+G9W
	 TDHrgeqakWCCT3znLx7PcAtRN2ij25+76PC6SBm3MNpq3GC7/y2lQZ9MeiOLTa2fr9Bi2
	 Fhxz/ZNi32EuGsQ4GX+BTAy2WcL+k7kEL904aEYDzYIa4hIukjBo8A6OFhT4SwfxsPjAx
	 n/N5tt9Wd/PGCVz1tr0f+BVnJktyqdJdUhln5lDZ8lo8zpkdvEjAoqjkZxdOdhzNETTzx
	 v0hE72rv9au4umVNZxs/gvlL8oHwxN1DkAruaaI7LNC0ZChS4wb4XdQekqy3kQ4YDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4bHvQfM;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3D606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB3D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4bHvQfM
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1601761a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066378; x=1795671178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
        b=m4bHvQfMo1pkxMoHcCCQNr9n7SfiTmpc1LKr7p9qJ4PxkkegxRvXssI19ZGfs/LFAV
         6kk7mSHQfCoAfQRNqOwJcXLuSondiZK9weZ+hi/CK2xPoJB3MtYTAo+2ZKze7eJfvoxa
         gpP1jqivfqclIsEO9pG/s9O/AqSNReHJHtacW/79zulct+/9VOGREHxJ8da2foaOaR4j
         tr3XAXJIVGEj5cDtPosGO8jyNuDsq/Hm5y9mLYH68UfwD/l9mVquywByiXrcbvSJ20c5
         UTVr99bCNOSVUQww0oc3T9o9uZWSge1hpp3DyldseonyBO1PyMHkT0mXXIukGbwt2d7C
         cnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066378; x=1795671178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
        b=EExevKpOSlJ2rNN8urFJJMUsIzgcbV4hKz8aGWo4Jojd8CDG3URH0BbWfobj9HKYr/
         vDY+zScfxzLThKisjjMul9jHsBQuRkoguIWI/yJTcIbJPdfTBjd5Xl7nvUbEqcNo9nLc
         SzDtNFYRd/6Jr177/njFDuHUPzgJjVUbwax6uMusrw5zbQLtOembS6m/W03rjwJrDVkz
         GahCILsy9T8/svgtiJa6ki4cBzPFpG6//7BLiVq3wt/h0Yqjw3HrwtJtlJd6z+WFR3YZ
         wrpJIB7cS3JFWYRA0bNhchOmYyhYzEtEhKJgSjVdKT2XMD4aEISyCdmFBhrwPEzSluGL
         +nnA==
X-Forwarded-Encrypted: i=1; AL+hErHMmKxEoIr1BvhsVUVcZPJdehBn4k4mu5/3RZtzobBKjj9+8J5kiTm3ggtdFtEJGwzG3ntuK6+9tGXCDmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92drKb6tmkRHoxDumLKWcLIm46/eODdvqHqOW9rQ9gDFbv/wOO
	X9ume4AuKL+8GFX4j1t/nc0tnM6ui1C1qq3hSJdugXuWBbsVMWwpYDmy
X-Gm-Gg: AZFdTZcy9zN5FThzATLa7X5QmA0j3DKmorPTe1R0rGAwRE6V52uTKyxEsDhNKxmBI8y
	wMSR2cBQS1pXN7txXEGO0fDTksQtE5Cv0fkWJSx/7O2L32JHcouTq/kXT4zFDwTH8LynU5M2NfF
	wgLgn+OO17+xG3fYy5Z+oIKW6X+/PfHOcE4ghUWyTzx8wfg4UnBcpTsLdKSTZGguv1kMJZHjFn2
	bCWLe7TMgvaz0Jm5xOtm2Re1sACA7puP27TwZNOhsxRmoFDk5G532m+Em4f/BOyghAt8xZaMa7B
	5RP5AWRT+z3YlGe5mRuAZtS6//pj24cZHrb2pWv2Kqv4YF6w1u0B2LfEzCaV3pUMd8UuT/NJTw6
	QyGytUxY8E8sP5qj4uBVTjfZ3mwlJoRz1j4qKO8m4YUWRTPc1c9dx2ndzMUZqQYN7AAzQWNwLZM
	HIjSJiaWzd4Bq+fWdZDim1GaoVnh0ptQOjZirOjDyUL1Z/mNJWFzbELlhM9QpT+p6AqWmY1bhJF
	bS7xO5Nf3d+cxDdowWP9XPwt537yOv1/w/CEprkrvl00JB4GN2dOrEZ+NvyjCyaycAwdhe8wxni
	zKdic1XQNYRVr3TZINORwRMpRNu+5Bnahg==
X-Received: by 2002:a17:90b:28c8:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b3d075979emr5015646a91.17.1795066377601;
        Wed, 18 Nov 2026 21:32:57 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534aec9bsm1047080a12.22.2026.11.18.21.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:32:57 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(), fls() and ffz()
Date: Thu, 19 Nov 2026 13:32:49 +0800
Message-Id: <20261119053249.2098578-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av3-Nf01tdGw62lh@yury>
References: <20261117054939.2126980-1-shingekinocore@gmail.com> <av3-Nf01tdGw62lh@yury>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 02:36:21PM -0500, Yury Norov wrote:
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>
> Would you like me to move it with the other bitops material, or leave
> it to Brian?

Thanks for the review.

Either way is fine with me. If Brian has no objection, please take it
with the other bitops patches.

Brian, would that be OK with you?

Thanks,
Tzu-Ching
