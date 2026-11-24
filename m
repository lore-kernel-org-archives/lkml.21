Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532196;
	b=OWZh+dmX+Na0mpj1LQUzlvyby1z0iPuwbHVe4NrTfJxqPnsbjrIRugu0HkojEpfQ4spy
	 hWzMJk+7dAappHiZXsaIZgUz+BtFqFQ59II891StWaHqUYwhOweQYPMCO5ihdTRTT5jzb
	 ui2vpOjP3b+wVu1kvOiw92n0k0EFVXgwecj3Td4UmALOiSv+JbKel3Q+mHBUiAOeutaiW
	 mBHaXGgjtIEl+87WWtXtvCutujD8Pbs5ZyNKeoKmoC6EGPaxQpDd9tI4B81OZufH3jLVu
	 QplkwiR1lGg+GdyO5jE2j9v6ewCvLeet9KoOBeKapOncQknvgdMPPTBJzRupBt9BZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/AUkC4hONDgD6ntHPObWNT7fhuOS0myZax3gE4i18kI=;
	b=wewcPdmUCb2QEQ4ZvnDtF/o691ZLF1Z1kjhYE8+YhInGs0WmUpLwwCKR/yUVGYn9yc8t
	 +115Yiu5I/7PFDA6He+uLgytXzxaGq6e7wnNymNoK+6mBXyfwvGnYGeZrzSE0PEEJUWEu
	 UBsdQfuGfGUvivdvRer91jxrhrz+oRqcicWa4H4lEDoDjj6c02iXU+uTA1BfbcJN/tfQq
	 42oSA9g4f6Tn6aLgP6qG+EUj+aSdssjdoQzWUXCGqkatXY7U4i0xtraFK4xvBMaPgETmG
	 enH7wUcDWlxNZE0UfzLu1YlDh3d5z/63FsSnP50puv191eTZIlLmQ4/WgxZ3Yqb9bsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=f5NvEFVA;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C8606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50C8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=f5NvEFVA
Received: from macsyma.thunk.org (pool-173-48-102-184.bstnma.fios.verizon.net [173.48.102.184])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AOEtUao020827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 09:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795532133; bh=/AUkC4hONDgD6ntHPObWNT7fhuOS0myZax3gE4i18kI=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=f5NvEFVAjHeAdRryr5U7XKmkGkpVYoTT/WlXHM0Fy46Z93JRUSYXcOFCwnsA61J/O
	 9LTrcIdsLdNGKroP4VpNk51XHjHqFZ/4HRUhJaFf/DP+25ryNvi7APAl2G2rTVGCkF
	 i9vXoJtp4CPdJeUEjFrhqT14XBXtZK1Oa0ntEqK697pe71AAbRzxBlZZnT1bEAKq4t
	 XCdfKDBRo2rOxiAemWhs1Iap021SQdPqzFYqlotsYxtMejzQxGPyyU4RuqkqYD9BLK
	 2rE4ae2JZS4DruNP574zt0dzQpew39/GA+j5H8bO1yubn5Mhs7IRTBVczPAJLb7nsy
	 uBATV51CE6e3w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 29EE4291FE50; Tue, 24 Nov 2026 09:55:30 -0500 (EST)
Date: Tue, 24 Nov 2026 09:55:30 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, jack@suse.cz,
        ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com
Subject: Re: [PATCH v4 0/2] ext4: reject impossible group free cluster counts
Message-ID: <awWhtXvIgTk1QzuY@mit.edu>
References: <20261124033900.76700-1-zhaogongyi@bytedance.com>
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
In-Reply-To: <20261124033900.76700-1-zhaogongyi@bytedance.com>

On Tue, Nov 24, 2026 at 11:38:58AM -0500, Zhao Gongyi wrote:
> ext4 initializes its free-space counters from the group descriptors. A
> corrupt descriptor can advertise more free clusters than its group can
> hold. Journal block replay can also replace the superblock and group
> descriptors that were examined when mounting.
> 
> This series adds an optional JBD2 recovery callback and uses it in ext4
> to validate the recovered geometry and group descriptors. It checks the
> metadata before fast commit replay and checks the descriptors again
> after fast commit replay. Both halves of the group free-cluster count
> are read under the group lock.

Note: in the future, could you send your patches so that each of the
patches are sent as a reply to the cover letter, so becomes easy to
find all of the patches associated with the patch series?  This makes
life much easier for patch reviews, and it also allows me to use the
"b4" command to gether up and apply all of the patches once the patch
review is complete.

The way I do that is to put in my ~/.gitconfig:

[sendemail]
	chainreplyto = no
	thread = yes

See the discussion of the --thread and --[no-]chain-reply-to options
in the man pages for git-send-mail and git-format-patch for more details.

Many thanks!

       	   	     		       - Ted
