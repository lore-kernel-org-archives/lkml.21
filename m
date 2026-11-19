Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099686;
	b=s0cZHfUWDoK6gqlmxbXPNCIXkS5zcIihdL/YzWBZsopL3Xcu6kL/4cxnNAs6KhiX1Gba
	 Zs9aWHjYwHc1hwJDlq3DE5xnoZT7Ajf49ZPj76ZQkgo36BwfTDXUGSO0T5I9k59VSO56a
	 eWsfxCkgPO/2awY+44DQ9E67YUgIRJ7AhRg10IEozhTLd5QnwBbdGbCZkbxs/VJeDvZAI
	 geK7JFvIviVunpWEIdSXmSIBPB4bNkoxh4/aZfKx2oy9KyjQ5Cik9GJAxNnCSzNoM+bR5
	 O5uyMMOid61iqTopQ+AUgCESxmN8nDxyd3kQ6ro4G0heCrOYx1hAitcpNNUhNJwsq0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uFNilhi1NLfS6/hm6wa2uwYUWlPi+dq3tJzE5dITlv8=;
	b=Nr06m1BhxzoqXg8VWvAJPmPENVLEk0zEcfmlJ0wY4b/d86ZZC99ZuZmQaeBNmpX1Mc8L
	 Wb21U3Ue8ALC/5ziB2u8dIxb3C8OmPYZk9BwPLvMCNLs7YFesWn1LQ37jf6B2dJx/m2+q
	 6UoRS/XPYuBXBp5zJRgL3uNLPl0pBZNm/uzki3S6AmLo9k0N+e14Njb67lqp+pOjS9wOn
	 sss5myQEWnUjLRQ/LUfOAgSijg4Ac9eTkmlUf9nTrUi1xHHOdsMImWx5BAqWX7GcNmejF
	 xnUJ2Ct2xJAqofkCEO9FtTUvBWhKyyTpi5cRb9AqEyIEd2DN9h1GtsU9/rTrtdxohjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=AFgqgqXH;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535D60A5BCD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B535D60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=AFgqgqXH
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElf95018167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=uFNilhi1NLfS6/hm6wa2uwYUWlPi+dq3tJzE5dITlv8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AFgqgqXHcmpGTWdW84xXOhbWB8pua95CvJN97irLsjYbHlBicvAD8DTdJE8OxRYTM
	 p0LegE5ApdkCwi3cuoTVE7p6Zlb3OD1Z/SAu8YGkBDy1NB7GL60TE8EhRp2UDQZ1fK
	 NfbMZ/OfCri1JCd4EHOrlQUJMn0vpCHOHcuydHX3+zup/8TulrOv4toV7Qa8BIoXpA
	 sLrgdoWh4qbqJzdWYqQZKY/4wnp4+Y4p35+o5kO6KN1hSXUVPp8fAFs+RWHOKozl8Z
	 vrgZHh/XRwOfJmGFLtr9io7RUucYt6NC4lDU7CxUwfikvhoHJlA2IqTcXr6Inc419o
	 bgCA2/1UeKKQA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 518DA2E0191; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        ThangNN99 <ngocthang2710.1999@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>,
        adilger.kernel@dilger.ca, libaokun@linux.alibaba.com,
        ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com,
        linux-kernel@vger.kernel.org,
        syzbot+03afbb29537f0336b7ad@syzkaller.appspotmail.com
Subject: Re: [PATCH v2 v2] ext4: avoid buffer/folio lock inversion in __ext4_get_inode_loc()
Date: Thu, 19 Nov 2026 09:47:14 -0500
Message-ID: <179509948662.1938961.13152169215572537924.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907155017.75543-1-ngocthang2710.1999@gmail.com>
References: <20260907155017.75543-1-ngocthang2710.1999@gmail.com>
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


On Mon, 07 Sep 2026 22:50:17 +0700, ThangNN99 wrote:
> __ext4_get_inode_loc() looks up the inode bitmap bh while holding the
> lock on the inode table bh:
> 
>   __ext4_get_inode_loc()
>     lock_buffer(itable block)
>     sb_getblk(inode bitmap block)
>       __find_get_block_nonatomic()
>         folio_lock(bdev folio for bitmap block)
> 
> [...]

Applied, thanks!

[1/1] ext4: avoid buffer/folio lock inversion in __ext4_get_inode_loc()
      commit: bb94c7a5d31b9a5ea2237ef53d050ddd29e2cf74

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
