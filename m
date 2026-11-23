Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421549;
	b=BnthYkMGLQCi24jCZPS+60CanmAS5fcTt6FA1IiMZg4m3kuTlSqbNmL/BicB9yPr5BQO
	 YcMWbD9qn1aqF5HCNj3mcRtR+avGbZ21WH015hZA/kmVp3rqWOUitf+Blg2v/NvMMC4Ge
	 mO3rg+5CxwjJH2hTthIl+rueIVDtoTDzCIWR1BOhqC2Qo47cFt2WoZQQ2VwTgKR7/YNrm
	 d1nW78laq5+END1SCsLYd3ih4hyiopUQ2af+hiKAOcfTG4V2aouvexpsiBsvsVYJyGCEF
	 WXmxvbwlw9a8gdDPpZZ9qoXJ7z4YMgPdxocYjrhj4anjQnT0YAQzF8P8VjNT6F0y6Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2szI1ZqQtgYM2qe1Z1F3aOmh0lr8LS1pFbMyBrHQw58=;
	b=Xx5UHjayOR8wMg7xVsExZt5GlgMBPdOnmgdpXhxsDCZzcKsP9UYFx6w4RwahmFDFhkFY
	 cfEC2cAPudofaVbwUROIGS4IsUmuZs3QRQoR3LTplEZmKbjLHkNx8J5GeMj57owrUDKKi
	 4CL1Q8sL3ZWlpPGtNfnO1olnihPQIo4haZW052eHNVQnEHcnd2KLDfY8FylJwT7hoSeo2
	 bzJX0bhYANk0WgztwA3NXvtcnYC01qE7WdYy+xTVOB5QB2TOfqOFoR5r59zSFNXgkYIop
	 W6Nos/TBVv6en3RI+Gn3LTFdr6FoKuYOGenLWerS5JzAskRcWncqIfwmSlc86l7NHHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="TYuAlc/U";
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AE606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TYuAlc/U
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-94960131b30so300707485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795421548; x=1796026348; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2szI1ZqQtgYM2qe1Z1F3aOmh0lr8LS1pFbMyBrHQw58=;
        b=TYuAlc/Uck7EToK7F8qMvGOp14+Y3Z9Lo2bo1rUhwf0BXJGtH/DG9/KyjSTwYgUHAw
         LQgslvJox3M6GBzEsjDqWUxJSbrlO8Lu1FPNG6yAquVXhkeB8t2RdzhYa1eZ2Xkk14Yi
         gu4GQ30Rx0Edf76fRKnZYFcB03FkhfRtiCdWSc+GKN/W7LDj10DA6PqozQ6UZvsv7o7F
         hxCoNkCWBDRQ58Tv6ve9iSyrQ2ORJHXiZbqvNk7ApWUfFAv2KdaKRoBTmd9KL+KxmLKA
         degB3wsknJY2pnMbbTSyG6xlQfv6x+AgfNL7FBuTz/ntTlMZvmqXeZGXCOgpL8HZaftR
         mT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421548; x=1796026348;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2szI1ZqQtgYM2qe1Z1F3aOmh0lr8LS1pFbMyBrHQw58=;
        b=bkGlW2Ddavf6gIfmDA58D06F+uKgY2VrbEuCMs8bvrIObd2LSmWBttFQ3WQrnIP2LH
         XnEpObBNGLo6AoMKRFD7usp8pwZU9Q6OLLPOLZMhUuGYTMFMgVKieCqxHMdRJbj8gNXr
         zqUnNyZ/3miW95TgjRjjioXsa3M6fElSkk2rz1xjWe1vQwCWdJ80fKPsKM6Pk+HPKlud
         fjtlgjw5RpGpMhMrmEP/+5OhPu07QEZ7M+6j0DrtTmmxyYa+vuj6rBr13vRkqSTFvMCW
         cXr3ZijBny8Ii0oQ0n21YuzJ+599trX/ESQdvHKaKJZ4xN5QFYsVbDYOgazZD/g8vbXD
         elBg==
X-Forwarded-Encrypted: i=1; AL+hErGetAvXhUSC3munkXM/T0IW3WE5WFdwMeBzjY9RkguYjzHgnN+8He9sB5tr9T3JsY748x5VF7IAjDLoK/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z857U3EcLR6MYQd3gfPz0bOL0VuqrdvsVqeOsXg52JNvykQnkvz
	1kplCKBAc7/Z/kuVsheKT25mhhViB2cavFxPOpcBQE3tWpcksrQ1ObdDCWiQyTmn7CY=
X-Gm-Gg: AZFdTZeUvErGSi/hOtN13O5ZNNAxlbyHEngN0mKkihX8i8E+qfuHlDb4T4S6uEIylOz
	Zg1ufKBvWUaOt5s5Fi9Tjbv2D3VN7hVl/hk+T6UXk2ic+ehHZUQeGqYYmediUI7B46sUgDiQq1+
	2UDLRrYAB9qU5aA3EmrlICSuAcMpZJPnvIi6K92wWUpPo2/JJISJUTJzIns3t4FNW7+MTe/F8iC
	ttULCEI/tsvKzbaFZPcrBDjRNFD5et39La76Dkx1p5W0o8fXiDv91sCiMl56BWPLQ+MusAm0EnN
	Gi6LEhj+adbWqxHMmxD+7DwDZWGzC+x8IrmZgfETS1wBH9ixm5nU9/elgWGyI+E8XoioFB2KOsr
	mzA4q13b4fyrsfXcXTy9DByDLrn1u9rB2s8ypWxiK9JgXKJn9OXhUbM4x+jRQY4V0nbdlBbZR48
	vaH7vq1F1PnAauvkQ+J0h6DpC86/VfpbGtdNxu/uW/v8aKehKbZC3J0AbmntXCzCY6O862lfNFL
	GBtk35ttI/zG6Yvu4Sp8kzMjeiGn130OsWm/8YW357MdxcZavQOFZGUh3B2FghJBe0k1i351Cum
	jww+p1n2rbt0Y2XOv3jtYiOS8o2qahD2oRBBTObEadR9DQ/j3oJmFOxT1pcTceby85QfSWlXBP6
	/46pG2bA=
X-Received: by 2002:a05:620a:2956:b0:949:70ec:7e76 with SMTP id af79cd13be357-949ba80f78dmr1737529485a.1.1795421547930;
        Mon, 23 Nov 2026 00:12:27 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm752293485a.37.2026.11.23.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:12:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] mm/huge_memory: use NOFS when allocating while
 splitting folios
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Barry Song <baohua@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 William Kucharski <william.kucharski@oracle.com>, 
 Heiko Carstens <hca@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, stable@vger.kernel.org, 
 Chris Mason <mason@kernel.org>
In-Reply-To: <CAGsJ_4yEeORJw8dQEH0U-JjWih3+3ZVx=1Va5F_9qsVbPzCLvQ@mail.gmail.com>
References: <20261122-migrate_reclaim_deadlock-v1-0-83c56185b0fb@kernel.org>
 <20261122-migrate_reclaim_deadlock-v1-1-83c56185b0fb@kernel.org>
 <179537313704.412063.6683001223228002260.b4-reply@b4>
 <CAGsJ_4yEeORJw8dQEH0U-JjWih3+3ZVx=1Va5F_9qsVbPzCLvQ@mail.gmail.com>
Date: Mon, 23 Nov 2026 03:12:26 -0500
Message-Id: <179542154647.412063.5153407036844671374.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-23 09:14 +0800, Barry Song wrote:
> On Mon, Nov 23, 2026 at 2:46 AM Gregory Price (Meta) <gourry@gourry.net> wrote:
> > Reproduced the hang determnistically.
> > Base deadlocked.
> > With patch 1: -ENOMEM (safe)
> 
> Hi Gregory,
> 
> Just curious how those -ENOMEM failures occur. With GFP_NOFS, we
> should still be able to reclaim anonymous folios (except in
> SWAP_OPS_F_REQUIRE_NOFS cases) and clean page cache folios, right?
> 

Ah this is a little dumb, but i set memory.max=0 to force charge
failures.  The -ENOMEM is basically expected in this scenario.

Not really something you have to address.

-- 
~Gregory

