Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801543;
	b=1VHxGamiZ80G9YHAuSG8FvePoiLKnX1dPCvOhg5qKPfPTD6XaXP9Ido0wF8wDwfunJ1I
	 CHX3+niPHMGhshnvCUwQgHYnNJ0TD9EcAqdHCgoKwA5gTLqL+nfAKvvr1rFkU89sUQAd5
	 H2yA7q/eiFpgqui5qsv5p2MSySn0l/8MdlGdybo/rWFeE7uTiuNTG5zIHu63x+0O74KOl
	 Vap29YvsLeuM0gaFBCv3RfKFbTRvjfyhBinWYqI98ETOAAJnyopEwMiqH5F0KBuEig8wM
	 ICY9NLmT+yFxa8tGMUUA0/g9H+/Kwpy2NfN53jOMW/rZyG0eIBzoQBLxnm09pbrW2mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3tIZGzZp9XED1eYsjC7AojoBXQ/Rujhkgy0uNyPbeEw=;
	b=zRq8hbgD10R7x8vuNY6JEMge1igXV4hpeXVBUW0BOwIJ1RWREXrqRTaVB3pqy9MBu0qZ
	 1mnkqZuWiIOv+xPIWaqRZymsZ9RTNgxKrMDH5WG1JqrvZ/droXFxJQbKZ/R0ki29gmC/H
	 J42EA9xke3S3a83rDLbICdoSa07zgzexECyBBe+TOIFKeVt5YLxP7vsst7yxoXvaJIGwl
	 TRznH6F+fG/J2Jglc8WRTquRPWPwdLdWFDt1/urVPxDgh5G/QhOFfZ6vVkZ/Y83YPHRc6
	 YVTqKxBtuxKqL6XBEtiTErAG4mmElGhaagWbV2XgB+CzqDmCfxymOgIOHB6d2ZuExUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uW6sUxPu;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD99606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uW6sUxPu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3tIZGzZp9XED1eYsjC7AojoBXQ/Rujhkgy0uNyPbeEw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795801540; v=1; x=1796406340;
 b=uW6sUxPusHYXxL1n7RbsyImfjuRZtOucfzvlLg2Au9CK+TtjL7RGU7uCv3AbGHlH+NFCBOBu
 r/qv++sQCU68oogFTLYxyLEnfysQCq58mtBLGZAiO95xDdMvMFqI80T2hg8CI9iV24jW5q+hoRN
 e3avGhDmoA66Vaskl+ueb3fw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c4796adf2f73c32f;
	Fri, 27 Nov 2026 17:45:39 +0000
X-Mizu-Trace-ID: c4796adf2f73c32f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 17:45:35 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Zhang Yi <yi.zhang@huaweicloud.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Baokun Li <libaokun@linux.alibaba.com>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	guolingxing <guolingxing@tju.edu.cn>, Josef Bacik <josef@toxicpanda.com>, 
	Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ext4: silent data loss when a split at I/O
 completion gets ENOSPC
Message-ID: <20261127-jf-ext4-enospc-reply-zhangyi-r4-3-59ba31e6e023@linux.dev>
References: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
 <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>
 <20261117-jf-ext4-enospc-reply-zhangyi-v9-b19eeb966ad0@linux.dev>
 <10712329-a587-496d-babf-620ebfd0e60e@huaweicloud.com>
 <20261118-jf-ext4-enospc-reply-zhangyi-v13-3886a3248c32@linux.dev>
 <9be1cb3e-4417-4609-bc0d-67dcfa24aa10@huaweicloud.com>
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
In-Reply-To: <9be1cb3e-4417-4609-bc0d-67dcfa24aa10@huaweicloud.com>

On Tue, Nov 24, 2026 Zhang Yi wrote:
> My idea is to make this a real reservation of currently allocatable
> clusters rather than just a counter check. We can subtract
> sbi->s_mb_free_pending from free_clusters in ext4_has_free_clusters().

This makes sense to me.

> However, the probability of returning ENOSPC for pure append writes
> increases by about 10%.

Our agents tried a close variant of it on mainline, with an exception
for EXT4_MB_USE_RESERVED. The reproducer lost 0 of 72 files instead of
32 of 72. But write() got ENOSPC on 54 of 540 delalloc files, against
none without it, with the filesystem at most about half full. The
writers ran as root. Is your 10% before or after
ext4_should_retry_alloc() gives up? Ours is after.

We can test the patch once it is posted.

- Jose
