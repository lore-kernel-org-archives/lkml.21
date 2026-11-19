Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055993;
	b=rWt8lmvWHpGLU288DuHxj8AocYmKVBeYseouF6HerDP4+tWZEgAH3vEuhh7c93p9ie0P
	 CuDWKN7Dckb25hi9dYbyIFqucKQy8yFJhH0JamBwLOx2C4xbeZfm0xjPDPuJ84x5ziY/9
	 JuFKcW44IHCif/as8tSsrbiTidbF5le2DDNaYzAOLChl5JxhhQYqO6cByf9TaXE0Bxb4G
	 CfQGdQ75Uozqnlc21Qp9abh3+fVzxQVQpwkOcqv2LJ10QVmTHcJZGhtEJbXc1kGGGB8Sy
	 3ygUY0d6upYA+D8lU9kim5aSLPcfE9vyXJoqSPhCZEKR6y26JMir01l+9n4KYWjkGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ghAsB1EQ6W9HushhTZukbQU7hgwIEOGHN/35nrQIsqA=;
	b=yRvL7i+SIp8Q+eTeHmJCVy6LkA1Kfg3/FrYYiUqDqChTrrvwY3jTw3sg9nil+2KcZfF1
	 9Dt0u6SNImlzZu00lu84IOcTrWXUgZtUz2Wmmh9W0LfYSMlgqjGlz5OCwssTruq3d61As
	 a1rnO16AvjLZUyMg8v2Xywt1wHSQ7ZmkH2BDDxpeuQkjZ+qLS9BZ0e3S+/13o0AaWK48e
	 sEs7WdPETi12k4UZJIePVnmDH0kXnHhvoV2J26+wmEboWKz9EzI3N1PITA2UwTL6U5Ni9
	 XKVGuRaRnIZ9DwBQGqM6ROCkcpVkgDG6WPeJyBYNLLV/LUyz00iU2jnn2kLlE6YRwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=g3u3VjCd;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=g3u3VjCd
Received: from macsyma.thunk.org (c-73-9-28-129.hsd1.il.comcast.net [73.9.28.129])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJ2csww000439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795055939; bh=ghAsB1EQ6W9HushhTZukbQU7hgwIEOGHN/35nrQIsqA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=g3u3VjCdMiZJz4n0JHeG8g3f/jKykOBr2a9lDRTEPTZL+qiUNHo0nIYlBe+93spl8
	 TNgr7qQtTM9dtfU1jtN8woOlcWL6spRjT9Z5PXsqq9KmThb+YjJwzCeuXGdFQXimmG
	 H6flsIb7JTeaODkz5G1kJGpJYXQP1ByJFz5NTR3lqMha4eE8WY+cE9XsTrhtD0inVn
	 S1F4JOo925pPcaIKpAlocXew0fVHrILeFZNsBvHFNBpMSY6ESFZqLBWSsnAp9nnDcK
	 J0wsGmpcIEsPox2HNjfPPNbgo/zvGkNLRqzSTDO4w9Dxk+BDvyZI2BMLsRQS3wlDha
	 CiZXmY90lN3wQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 900BE28441A0; Wed, 18 Nov 2026 21:38:54 -0500 (EST)
Date: Wed, 18 Nov 2026 21:38:54 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Andreas Dilger <adilger@dilger.ca>, linux-ext4@vger.kernel.org,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: reject impossible group free cluster counts
Message-ID: <av5hDZzzrKNxmDBy@mit.edu>
References: <20261102042428.65204-1-zhaogongyi@bytedance.com>
 <F238B62D-6BED-4D64-B099-B956B820BA44@dilger.ca>
 <2c1663e5-fac2-4346-ab2a-b35ae652373a@bytedance.com>
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
In-Reply-To: <2c1663e5-fac2-4346-ab2a-b35ae652373a@bytedance.com>

On Tue, Nov 03, 2026 at 10:58:38AM -0500, Zhao Gongyi wrote:
> 
> I will rework v2 so that only the checks needed to safely load the
> journal are done before recovery, followed by full superblock geometry
> and group descriptor validation after replay and before free-space
> accounting. I will also check which existing validation helpers can be
> safely rerun without duplicating initialization side effects.

Did you send out a rework of this patch series?  I don't see a v2
version of this patch in my inbox.

Thanks,

						- Ted
