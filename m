Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099690;
	b=MG0TFPv3A5LwkhpOBVUBWiWt4dfXxeKbUUvN13AOCnyfhQ2AeAgd6+1D3SbekeIfnOGn
	 D/uCHW3WOTcuqNfhafT/7+fjJ5bLoHI2hEoyuiRkiWusYalzBZHS32CXmaG9EBLWN7I10
	 ym4gg+H8ZaEJXhKMaHZCgtn1TlPyZ4IRz/nJ0m5rmEOmH2Ta6hGy1zsie94GWRHD/7usZ
	 Rw/KkjiFYqF4QxZ3DpUjowfj/0hOORdAjfAXEyKBq21sZCpyXMcWeUFmYxiyGXM0rhpMC
	 L6zYKCOVr9160QcLoaWQ2l6HWMjCZncxGIJrWdXE/dFUNZeLfBKJj51Jwm46U/fHR+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OpcGvDoFlNe5dcjk3sc9IGaBPoWOIEAD16fJdpGdxpk=;
	b=ROok264w8fDtVCnePQMG0AMYpIuhHjg/kYTPFuGllZGCUZYYhuI/VTb6DeGMYY1kZro+
	 9LFHyQRuk5a26ND1kUg4BfG+zPWerLUTF7iupakVaJA3xPHTpaoAJgepPxb0/bhwGeW2h
	 XMVhAT5kKtYTyFWlues9kJqD+AvR6DT3+8knA88VW/YTRewZoODkUws4FF2g2udpQ4UWO
	 yV17a2kGB7UwE8CXOy/mvwkISqnN6+F0Xdf+9YJ5k4IiNN6py4ND1mp53hluQFj2noZ/z
	 O2EFsmdpjSXfqNT6EcwFaIbuZC6jhdvpQb1d2VHUH6WhY8m4Nt+TbZA4HJzYvsHf+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jNjuvYmV;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD135606A817
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD135606A817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jNjuvYmV
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElaMG017891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099658; bh=OpcGvDoFlNe5dcjk3sc9IGaBPoWOIEAD16fJdpGdxpk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jNjuvYmVWwD2oldyoLfRlOk68hpSOJiqz7Sn2LGPrbX2QFLP1olU3JvbWG//D5YBN
	 W2pg4VWlP17OKTsoT00iHjqnR7S0eEcXPiLSv6o20pA+ktjQ4YnCLPq5k/3UlKGYBf
	 kfnEutOSmXW12NbIZdmoUTvBh/3wWND1X35SziGeYQIxMFbmxLEU8oG5e7eMQcyUQV
	 ib3VWyMhB6nXcruGitKAnuJBFXQhWSVotei8o57J4oNdiPSdtAx1mt0Ln9v4kvzesX
	 HY2fjImlJTs7unO8eEx3wFNimG4xN9AvBuxfBqnFISBw52lovkeqwzhh7DlabDzKWl
	 HjKlMdJGV7QDg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id D337C2E0150; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Yichong Chen <chenyichong@uniontech.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [PATCH] ext4: don't free the tmp_inode tree after a partial migration swap
Date: Thu, 19 Nov 2026 09:46:41 -0500
Message-ID: <179509948683.1938961.10131985605245497317.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918101240.3721805-1-chenyichong@uniontech.com>
References: <20260918101240.3721805-1-chenyichong@uniontech.com>
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


On Fri, 18 Sep 2026 18:12:40 +0800, Yichong Chen wrote:
> ext4_ext_migrate() cleans up the temporary inode when
> ext4_ext_swap_inode_data() fails:
> 
> 	retval = ext4_ext_swap_inode_data(handle, inode, tmp_inode);
> 	if (retval)
> 		free_ext_block(handle, tmp_inode);
> 
> [...]

Applied, thanks!

[1/1] ext4: don't free the tmp_inode tree after a partial migration swap
      commit: 047061e6a6daac0fe2d647aa40d2f0783654f4c4

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
