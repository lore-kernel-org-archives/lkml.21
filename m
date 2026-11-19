Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099690;
	b=2SK6IL8E58XcUWTvJKgzlEIQSibG2yYqji5P57NwF1Itsw6a6s2r+IbMWUKe2GSn0I6h
	 4mjABS+WanUYxHL4J+I7QvEp0tRssxi3FWySvq7+hTsaSy/0sOqT6403/Matdk0bSNZHs
	 fSWGVZwIovh5SrN0UzRBDSrEstSCzGCG8qZokO2cK3ZhJnKkHgtLTd/YuN31VsY6Cx1Ny
	 Rl+gR+WlORva+fi+qMYFTOY7GS0VHOza+dHW23NzA/MpAt4Cc811pGVg0isQz6k5bS/Ac
	 /hRGSuYkNaONVaerWfvZQm/1yiXXmv3BlOcF5ISXz5p0kGqGveuZ07JJpDYmW5BPQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=HKTq6oEJXodtoVTDdvuzIjZLLb0UI0cfbVYXccf1Neg=;
	b=3Kz5IdDgTQM6Qe6L2U5wcN6WIoHGb1X2cvNgoqz69fZR06KZDrstbFL1eKWWSyKWzWQZ
	 3AK5x4KPN+JvdRSL4moRoqRWD16YYvdixOq8KhDiYHUngY42pyHHuq70EfbAPhODqro8h
	 76OYGueWfyV6k8YztnaLiBVaf6Ok8zCDoubVq9BwQYPmEyE7CSN8IijpRLI0yGL4wniQ0
	 Nr1V51zJWwak6JQfB5YdIJ7A1wo5hxbsd4/an3V19hffqDs65HUycLwA4DFELks6+9S4m
	 kyx8u6WsSwnRSM/4oqwHJw3+a0mfAvMNueB4yX3VWsRcnKytm9n4a3uy0Vh7YyQ7gsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=XEMjRUqR;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C573606A830
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C573606A830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=XEMjRUqR
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElc5N018033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099661; bh=HKTq6oEJXodtoVTDdvuzIjZLLb0UI0cfbVYXccf1Neg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XEMjRUqRBVJqBuwIGgOor9qH3S0f64xzE3j0M8YoUnEY8dnuBcucNt3cFfJfYhHo3
	 WbSU/WTMeMJuqc0EFUS3XRv8Llj5EH0tl15wzTWI62F6hje/Hk1HX1dk1YLpItWMeD
	 MqgFUF3vFa2qg16wM1vCjS8mHzlglqmfGTvN40+Pcv8QDjjxfiG2ql4mjKzf/16xsL
	 MKUZyLij1ocABFkGjT2FKIu6AJiVuy7AdtO/9itObpWm5lMh4xw0w7qb//rNJj2RNn
	 bcXtsm9HHbiWDPpp2zD33wHTnMlVvmW5ruPcHiG8fejMaHJhEalZ64LYlJ88DYLtA+
	 iVSmTEAtZYecw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 1A0142E0161; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>,
        Hemanth Selam <hemanth.selam@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: fix typos in comments
Date: Thu, 19 Nov 2026 09:46:58 -0500
Message-ID: <179509948660.1938961.3323542812574739512.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907064046.36515-1-hemanth.selam@gmail.com>
References: <20260907064046.36515-1-hemanth.selam@gmail.com>
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


On Mon, 07 Sep 2026 12:10:46 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

Applied, thanks!

[1/1] ext4: fix typos in comments
      commit: ef7ad718020c6af4c5f62015e0d02407e5faf8a5

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
