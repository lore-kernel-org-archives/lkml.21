Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099695;
	b=D6L0fKaZP0CTpEhqSYziYSvZNukq7bqMB9mhK5SEUX48mohwA3b0ZYoq8nopIX0zXYMk
	 Z7b9hUFCvWccvZ1qtojL0IUnaqX/b3yqNHmH6TjyPYZM/UTVMyczbvaCob5LVTq0umno9
	 IStWrULRDWObL4CPmo3HnHwmu4Sg4unsP28dHhqb3fXOoWL1u+G9jTXbQOo/4z6evD7O4
	 4Lmp67bMKMLsCGRRk7xSfSUzPCzwtfxPZ+ATGgecGWga5GHOuyZhMDKTZnakoC2xEsVXD
	 wZol9qRUBj/sKhKQmJS3EBDtMHoOzn+8gHHtxfwBHoRl4iRLlXshvRFO5EoRJJsSfaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=G+tHk0pxR9GNS7pwuQbOnrBX1cCshVIGoTCYC4i8zAQ=;
	b=YHH/n7X8igUt4Y+c7Vjb5AF0vgceIyQ4eWG23PjTuf8aSKZ53dcW44+FwKexNj1EcM/t
	 RVI5dq34dv0OTwC1pvkS8WU9ocB8kefX6pbu6Vec046ViJxiVAVadijs6VSMNQaTVTCEd
	 mx9nnBvjtJl8m19CAuy2mdeTuwx/r50Tp0310w7MgQUtQQB/TR0cmQIxPCUKl+/SZQZWe
	 /gGl7uAuT5ilGgMk7EKoF7WuGYo1dwyzFsKgiMLOsazeKgy7b+QHJwE3j2WfNzKNUhHZ4
	 wU73nCvkda44ztBJQ6y8QA1wfNP/aHeKdjPxs4kSrRSlkPAzKu0Fru3FA4PrWimOyTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=bjr+3mdW;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71387606B053
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71387606B053
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=bjr+3mdW
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElfT5018199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=G+tHk0pxR9GNS7pwuQbOnrBX1cCshVIGoTCYC4i8zAQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bjr+3mdWAxEBaBRsIj81x41r++SNafjIBGmwxyk08ic+QRVXUInzTU0GPyFWn8Zl3
	 yp1g5SmJI8NkTYXoJqksU90yz1ePzAEtKWZazyVQbbDeVSKP1OiVwGIyHsY3k0wvAh
	 0TgoNNCYGOTFMbpe2EXfRWBL7aPvs2gQw4cSIctIxnDD+F+qfRPuviKs6VcjTHgh55
	 6ienHY1esOk9cAKKli/YGUT/41au0WUNUrqr1bBvCZS1fV53S1SAxaM9K3eoABXkrS
	 MxxREUtINc7/LVXG0MoXJtxnsp7yn2YASTjuHfo6NjcDlQmUHbGSURdkLhSeHtvsgK
	 B2o6zpjx6qWcw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 5F1B92E0195; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Ritesh Harjani <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, linux-kernel@vger.kernel.org,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ye Bin <yebin10@huawei.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] ext4: Fix sparse warning in extents kunit test when EXT4_KUNIT_TESTS=m
Date: Thu, 19 Nov 2026 09:47:18 -0500
Message-ID: <179509948686.1938961.3591960804929374794.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924073929.2594339-1-ojaswin@linux.ibm.com>
References: <20260924073929.2594339-1-ojaswin@linux.ibm.com>
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


On Thu, 24 Sep 2026 13:09:28 +0530, Ojaswin Mujoo wrote:
> When kunit tests are compiled as modules, the extents kunit test emits
> a sparse warning:
> 
> >> fs/ext4/extents-test.c:59:3: sparse: sparse: symbol 'k_ctx' was not
>    declared. Should it be static?
> 
> Fix this by declaring it as static.
> 
> [...]

Applied, thanks!

[1/1] ext4: Fix sparse warning in extents kunit test when EXT4_KUNIT_TESTS=m
      commit: 7d2ac21f7cc66c45fe7bc69d00aceb4fd1404629

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
