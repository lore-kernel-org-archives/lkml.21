Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099690;
	b=dxECwQ/gx5JWOIm8ZEbyr5hShoUlpPV8Eb3D0UMNmM7JtNNk5PCr0EBlB1UkclyjaCWR
	 ZMOrEPOdXz34MAqFLQJhqpZFJfOMWUDivSnzSG9kNSBLbd8/SaRTo2LLvOBzwEp0Lqfpf
	 cqoi2MJ+lUe9EWqwyDCEUgTEEIvK2qZBf/N8zwgF9/vMxwIiGkZdYsel/H9m54vxDffiq
	 uRk7IxSHmuFHTb3pH0uCeDUR1BnBXlYTnl4MTSC/kAlWsbh0iu4iEPk1cSjXKluaZwhJr
	 x5s8uyfiMGfMqtD8Z58CeJ7XoFhehvHxFKXR6gtuotsTSlIGS43ywr6ntmBKnCjOPAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rbl8wWRDy+a8gfvF0buAfFEU9vJQ67GXngCTnucEKZA=;
	b=aNzwLm75Jo8jw9f6KZTsE1bS3dyt6oJf4/EIEDqQabMi8cWl5+I4wxI48AyQtaGA5cbM
	 D3cCdlUQSf/5UhpkmsruT5811yRWdCDYbzuaVv3SlKxY/TsZk+DPAsDbXUEgTKc7QYFhD
	 bFoyWwo3bWOUhtL3ranIsvaXATIhJpehXqUWbfbURo8ivVreTuMCB7aO6xnkqEMBXVBEC
	 lKluTvtIZa1R3DzIgVvtf2/KCWE2EwzFZyDfX44/JoWAfeKxVxtpbeRHNerFRUqQzh+P0
	 ySfzRunX+KZjANQEU8vrCqtnmJsKnepINRV6+m7jpZ+JHcf5YMCpfgzxcoEB1/QhXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=G0y1gpQc;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804160A6F63
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8804160A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=G0y1gpQc
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElaCZ017893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099658; bh=rbl8wWRDy+a8gfvF0buAfFEU9vJQ67GXngCTnucEKZA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=G0y1gpQcSx7ySwZ/khf82QpMgg2kVS/13rDt2y6VvSegI3c4/JjPg4GVX3xxLQgDR
	 yUhCtExnUeLQRDRqanU/l+ZrEOHbi9WBDBGQRt24MXA2lKJZT7FmXd5nyiLv6VDGEP
	 Ajk/WvhIUlIfWaTTIu7xgQkrvIIKIraWSbJ7E168AwrWiYrUXW5cu7QCUEZCgIYs3E
	 mshVucEKFSLlhzerzDPq0oU8X4oj3TBgQ+fo3bD16Uuj303OcoxrxlU3otqZ1/8ME9
	 2JLq/nBrqDxaowySIJqIizXlblWvzbakTU/CTdf+lzl0mch8Pn7cIqYUfhd01OciEC
	 O5JBUkQnRl9UQ==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id D68FE2E0151; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Yichong Chen <chenyichong@uniontech.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ext4: drop tmp inode ownership before migration cleanup
Date: Thu, 19 Nov 2026 09:46:42 -0500
Message-ID: <179509948713.1938961.5186485390862003982.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022070235.17849-1-chenyichong@uniontech.com>
References: <20261022070235.17849-1-chenyichong@uniontech.com>
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


On Thu, 22 Oct 2026 15:02:35 +0800, Yichong Chen wrote:
> After the extent tree is transferred to the original inode,
> ext4_journal_ensure_credits() can fail before tmp_inode is cleared. The
> subsequent iput(tmp_inode) may then free the transferred tree.
> 
> Move the existing resets of tmp_inode's size, block count and checksum
> seed before ext4_journal_ensure_credits(). This leaves the temporary inode
> ready for eviction even if obtaining journal credits fails. Keep
> ext4_ext_tree_init(), which marks the inode dirty, after the credits check.
> 
> [...]

Applied, thanks!

[1/1] ext4: drop tmp inode ownership before migration cleanup
      commit: ed8c07b7692cef7e4794db915bf3b8d988e3b6da

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
