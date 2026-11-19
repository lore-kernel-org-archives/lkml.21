Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099711;
	b=wnjB246lUWOkOpLygC/cOugKAqG+k+ic0g7xiMZx9tOybtvNqj/Ph5+/y/XBjEOF5lxE
	 8nM3bOyLiBKDN3kZflFPNV4AfycP/SBFuLGcisQVVEGv4qXPh8irTZTxJY9qGE5wsjUAw
	 zknol8ldmC+d12KIW37zttDTZ1z1ZBt7YIAqc0n9a2eiJovh4VQhI3TVYrBYUQLHuiPAV
	 P5gKOnrRTtWqqfCP/awJhO7qqn9W0Zgf26LomSggyV2gTyEDQv9e8Nc56+gkZYBwRLleR
	 LgH2J81ed2icss82nA3ZKPKUqr+OUZxf1w5S22qx6E7CjRh+s14juKxwKJeV7WAdk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=po+thSK/7EuCP3cIF4sMBnblW/trAVgNir0jZ4rQz8s=;
	b=TmOljU5/RxcHl41Q6G/Y5RBs4zwywqL4+nuv2DLllRIsXl6XwtwZWXi3oH5VVVmhlJl4
	 BMyWWtvXhBoiHP2PMniGbd3h0Rc8Lfb/F72kcf4gLYbv8EyHsMayV01enK0LKv5RqGHjU
	 NFv2scDm0OehqR2PqOszBlmDSMsAmIoBNB0VPIC9GHvK6zSwFzTV5yF/PRL5ys1Ph/rDG
	 fXtn9QCpvr5T7PAFacP00QX8aZrlH9G/hHMvJa9jRtojNTzcjGHbclu1RdFdIXafe7aa7
	 6+qRZAbujHw0Dv+1EgZf2Jd6QXEwHevRWsK87r4DX7hNL0HXQX9UNGfpbMzBHQIB6aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=V7Fj7H3s;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890CF60A260D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890CF60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=V7Fj7H3s
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElWEK017784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099656; bh=po+thSK/7EuCP3cIF4sMBnblW/trAVgNir0jZ4rQz8s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V7Fj7H3shqWTPF1KLUZA2uKtwkJRBubXS4NRb7XycdtC1XU39T1qvBC6H1rfcQ6VY
	 dCTjMIV+LTTD+Vid61cWXe8WziDhtBKcbskqv7WzHAistcSZbpsTCDI7bF+6P/BydE
	 TPKPCaSQBvBVqrNJK1GuCutWBec16LojrqqItOVTDfhf7FQ/6JErrpsK8vtwN0aZrD
	 gNk2mNN9IMBRDpVHSbjzvdNNna/PYPbJoyUItROV+vQ1k23c/v1+RcjrXCwrXXi8Ht
	 y1TZnbwbJJsHy/4U0on/g2fvS3J4sCaz9TTgx1Vd+Zs2wPoJ43vGf3I4lonTg9xaEj
	 UosxkIA2x4iyg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id B47802E013B; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>, lty <781735889@qq.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ext4: propagate errors from fast commit bitmap rebuild
Date: Thu, 19 Nov 2026 09:46:32 -0500
Message-ID: <179509948676.1938961.9554359615132836257.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_B320F7091730E06C02BAB57D87B0CE363107@qq.com>
References: <tencent_B320F7091730E06C02BAB57D87B0CE363107@qq.com>
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


On Tue, 15 Sep 2026 18:29:22 +0800, lty wrote:
> ext4_fc_set_bitmaps_and_counters() rebuilds block bitmaps for modified
> inodes during fast-commit replay. When ext4_map_blocks() fails, the helper
> stops scanning but previously returned success. Errors from
> ext4_find_extent() were also discarded, so replay continued after an
> incomplete bitmap rebuild.
> 
> Return errors from the helper and propagate them through both replay call
> sites so journal recovery aborts when bitmap reconstruction fails.
> 
> [...]

Applied, thanks!

[1/1] ext4: propagate errors from fast commit bitmap rebuild
      commit: 283e0c44a7256634921afa9689597c4ebd99677a

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
