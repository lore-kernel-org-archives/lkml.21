Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099670;
	b=SAfhFQFE0pMH02/U2/pE4n2qULUCfbjfAbWdWKdYPPExCe0LNFClVMIJRgj1lCwHK2Wq
	 r7twaXEaLZMgbjVO6NFQCyOmw2imQlZyAaY/P1VhSNt7MP3p6egLrM7drpHDIoPxVlPcc
	 LcBKyWJGO8ObUlmq81YtW9kL+U+4jZvcMDdlXqhufAWhVXjcLLUs5uHIM2V7N/aialYz1
	 3l5+i7aPokVj+kWGkuw5pYD7rLVYLmxan3VE4gA3M0rR0YG75+lr+YNc0Ce8WVUx21LHc
	 7FLei1OXRAmKbLRu7jJ9FLwuAz8ikGKnvHMHMmmSOvzxsO8C5wsbGJS2uyLNgSGZoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=d8EBdlImVgBJU0PmynZr1iOr4f1EEZ0n/u69z0QsnNQ=;
	b=f+3KXl6xHmkRu/ugDVINHYTjvkDFnG2QGdsqv75dVkjVXnJr72ZasF9QNXLDpvVxDBna
	 w0l+RgbuTbFthYTeEEy+SMGHJcpXWAqQxeMiZRkEDbS4U80fSfsLie+lK0Fx1pSOFN7VL
	 FlX3vVLJNtTK8tM7y2spYTrlpfGlOvPjY3/kbgkdHpfxYTuDH5LdJJ6zTuZ27r+sI4jxs
	 Rlxpi5PQ2C1BDJqG4GXBS8bRdnmNemzf4TExvnEUf8WUBBb/Z6l+1SWmqTwDkV5kNoayF
	 IM3lltdUZvLxzK5yamHBZ2UA890AjYlGs+G/cC5Sfyjn/bjHSMABPfKcjhb2+LpK7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=g3Xh0CGo;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789760A262D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9789760A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=g3Xh0CGo
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElfaU018127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099663; bh=d8EBdlImVgBJU0PmynZr1iOr4f1EEZ0n/u69z0QsnNQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g3Xh0CGobNJTZznGcKOlwkRrkB5AtWsGx1PiKmvAFdzyMK8FOTlZ8CtbLRqN9RzsP
	 4+7jsyYpGMKcX9mEq3kN2PcMOs0M3ijgzfUQ1l4bDN2VG06MKJ16WoOmX6daZdnOMz
	 8YcqY3IK1Z49l38YYy56Weha2Y6dFqsWk3/tTEIAU0n16z97AYTqndFQ4ITvvR7ujd
	 mXrFV75zQ/jH+sIoen3x+tJHF/yJ/BVdPmAuyTOJHDKjuv2gwef8fLRTYjdevp6T9X
	 s9deiZ9/VsANX/kDJgAGiP29vMoII4tF0GOrjWVMLtHGliEbvOFWTtiK2jruwxuT+d
	 +T+UBgljnFskA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 367992E0189; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Kaixuan Li <kaixuanli0131@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger@dilger.ca>,
        Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ext4: don't read past the UAPI struct in GROUP_ADD
Date: Thu, 19 Nov 2026 09:47:06 -0500
Message-ID: <179509948711.1938961.5060156671980824305.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019131655.2583227-1-kaixuanli0131@gmail.com>
References: <20261019131655.2583227-1-kaixuanli0131@gmail.com>
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


On Mon, 19 Oct 2026 21:16:55 +0800, Kaixuan Li wrote:
> EXT4_IOC_GROUP_ADD casts the user pointer to struct ext4_new_group_input,
> its UAPI type, but sizes the copy by struct ext4_new_group_data, the
> internal type:
> 
> 	struct ext4_new_group_data input;
> 
> 	if (copy_from_user(&input, (struct ext4_new_group_input __user *)arg,
> 			sizeof(input)))
> 
> [...]

Applied, thanks!

[1/1] ext4: don't read past the UAPI struct in GROUP_ADD
      commit: 24be37b56c51dd26c92a9a825f84746e1078d277

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
