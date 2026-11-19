Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099689;
	b=1w8f5lvjEouqx9v2Ij7pLrpm/mWlo4HcndnquSXSmukNiQ5mM/sKrYZDhPbq2DwgYVtu
	 jl1WEwJ9EJ2ieScK7nnE6KnnC5ugy0HMmHKy2FG615xosmQfVn1vU/E/CFdCSwZnk3AfR
	 rdcJiq1PVZNa8lLfpnR8JsS181six8I4fWzcFMyHeMsa9c63Df0cw4ImWDOLvZBaeoISp
	 7zGGZXr+YKEV+hrf4a2OOAIuUcRC1CbM8ZQ8lsEHPcPJ2vKCKxdIPttF90VaDT4Oi7Jz9
	 EJaZXebugvxQM0sqP4LJlptnrAdnh/4A4ai60vi4vQNjV8qht9Na7nOpkjwhlbc2uNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=U7xMXKpYmwxbIwvkTRvYTgwPlA6kQUTTDj0AaTJZj9k=;
	b=3PREEtIJyD09LtyEdfVGwwpque8ZVyqxw/+OsK3FAKEVGbeSvZOJxBH18cb+XBc1Z7Gy
	 o572ZvpMd30+130iSe0nvQSTjfvbZCvzxFKmKTJniBJgReGjlyvQFJFtsc7hKohDFozDe
	 wz3j7ceQOAIKxJ84k3prZ9Y3uhzRnBFogKmJRX/U6l6TjoAZGVy5//9HvgLbzNB81rlbD
	 lhRGVA0LyLAUMYbgM2pTahn5MdXb9AX7w2PpYIYoYYrWeaZvkLHmY+6cQPQkO+PZ6MUH1
	 A9kh3WmsCn7xM9KCGNXBUXTFPY0JPnJhQSY9Td5VhG6cnUCf0vBhxSPdEbVWL/tXIrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jhdIAQsX;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C21606E88A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C21606E88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jhdIAQsX
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElWmk017789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099656; bh=U7xMXKpYmwxbIwvkTRvYTgwPlA6kQUTTDj0AaTJZj9k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jhdIAQsX94rLaiD1IT6odKdz8I376GHSfdNQCuXYYBc2Uc5jIPJl4Ks9J3VUV5mTr
	 J7/oMKLiVILdU3YGRUqvoT42+qRYe7VPbe25j3oPDtlzbFR91EBDQ0l7Sk8N0oLwbE
	 9nTxcf/xoyYCiTADAlUo1yd8Fg+oDdKKnJNKOK6TbFRddvMl4b1uZf2rW35pPrlM2Y
	 30oF1DpCcVn4QuUbCs26QKhskuxVksuZ5Tqp0mJ4DqjucIRNGF2z+4UZ86f990HYA8
	 LDr+Zlkd1XCXEdjFfTUQiQWX2TOFpyV568WwVdYt7sLrHOGD0K31zkWIU/fNn/Seqz
	 VGhTFKADmvLUw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id B80C42E013F; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>, 781735889@qq.com
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com,
        harshadshirwadkar@gmail.com, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ext4: propagate errors from fast commit create replay
Date: Thu, 19 Nov 2026 09:46:33 -0500
Message-ID: <179509948680.1938961.13543656454312438841.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_46A95D4281B70962D6EC1D523A85C448DC09@qq.com>
References: <tencent_46A95D4281B70962D6EC1D523A85C448DC09@qq.com>
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


On Thu, 17 Sep 2026 11:28:33 +0800, 781735889@qq.com wrote:
> During fast-commit replay, ext4_fc_replay_create() can fail while
> looking up the parent directory, initializing a new directory, or
> dirtying the replayed inode.  The parent lookup error jumps to the
> cleanup path while ret is still zero.  Errors from ext4_init_new_dir()
> are explicitly converted to zero, and the return value from
> ext4_mark_inode_dirty() is ignored.
> 
> [...]

Applied, thanks!

[1/1] ext4: propagate errors from fast commit create replay
      commit: b1c1d92b450f3d658beccef07e532638f5bcb57a

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
