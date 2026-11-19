Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099696;
	b=uxshc7zi7Z3kfl6i7WYqalWRR3bObH7Qye2Xcd0QpI/iihcnF1wmjjPK1eLv+fLq3fra
	 JXNM39UWEr3cXrxDteW2KFLA6/pmWGY7/F78Ek4u8cOOgXIquT8BUwoUi9NusNXusZykl
	 VLoFLFGvkvbJHgNsxKSUrja/CnOaZSq6+qqviKGZezLKGVjvkxZBc043McplRiOJJZFpJ
	 dvPOBoQQFcucUeKoHOliPcNpBTGLZkyJFD1GZKF8uxWD3KQlL2o7XMef8g1+KOdMay7Fn
	 1iUk3EH1ICWIsWsX2+JtHvLvdVfm863EjLc2qn34d5IUdTuT95RRylD6k/Wk+OoSu4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=IjWdZXIg1W0QHOMjvZ83940GxcKbGWLs7Sg8ti09W8g=;
	b=l5wyvfwuL5CnTrwu3qnVImiI3qZuISaJ2Fzrnm/hQkYY2ZR6OYqJ1lbC+EkUBjf87RG2
	 D3m16tu4BmkZFA5xUxuT2jY76FwiuoLcitmlWv0sgEQpT0qjGjArbh1DXbZu2vBff4wNE
	 UgxRRKnOU2r2Jxku4Z1cO0sJiwYueXcJcoviQovyCh3GlAR7um0RhTEdTIQ2GGWfbNWLL
	 kZE817m1mMGr732HRTrhH+s0Hx2H1GpQ5WtLvZD1dwIxvwUvz+/MJv3uc38ycitXXH5u8
	 jAEmUd77xX3suMw/fiMUVQbCV1ZM+mgwClhwWPTRk0Wp7a/BebDmZlOFibFi//qo87A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=ggr6h9cF;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE4606C321
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AE4606C321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=ggr6h9cF
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJEldei018043
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099662; bh=IjWdZXIg1W0QHOMjvZ83940GxcKbGWLs7Sg8ti09W8g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ggr6h9cFeIau9KRBXmm9FVX40Jdr95UhLR10VrOi1+eXMeMWFDMtSt6sDZX8JAZcJ
	 Dsnv+Fb1IcnfsHHNNQGZzu9384fMyjsWfPh0/TEolCddcR0q7rAn84JRs4SSbxaRJb
	 +Dj3l7BQjn66NS5HXCoRgkkjllBewWkpn6r3VAOYM/kpzCP1UiQQ4MkuosOz2OVTua
	 2pFVnx+hMUEeoTV4GzB8X+uEG9w8Dtypm7Nt4id/wmq2aIt9UOCEImFTB9RGVS8brl
	 N7CXqzyOkTCT5ISv5uNnxixRrylmbwvnGOWET+kImCb4JjAiXMfCWTHeF5XJKktCmS
	 8/xs99QQumzMA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 2475D2E016B; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Hengyu Liang <hengyul@cs.unc.edu>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
        ritesh.list@gmail.com, yi.zhang@huawei.com, yi.zhang@huaweicloud.com,
        yizhang089@gmail.com, dave.hansen@linux.intel.com,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] ext4: do not advance i_size on a buffered write that copied nothing
Date: Thu, 19 Nov 2026 09:47:01 -0500
Message-ID: <179509948723.1938961.17110187157751787862.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030040520.4138904-1-hengyul@cs.unc.edu>
References: <20261030040520.4138904-1-hengyul@cs.unc.edu>
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


On Fri, 30 Oct 2026 00:05:20 -0400, Hengyu Liang wrote:
> Commit 665575cff098 ("filemap: move prefaulting out of hot write path")
> made generic_perform_write() call ->write_begin() and ->write_end()
> before it finds out that the source buffer cannot be read.  In that
> case ->write_end() is called with copied == 0.
> 
> However, ext4_write_end(), ext4_journalled_write_end() and
> ext4_da_do_write_end() set i_size to pos + copied without checking
> copied.  As of now, a buffered write() past EOF that fails with EFAULT
> grows the file to the write offset, and the new size can reach the
> disk.
> 
> [...]

Applied, thanks!

[1/1] ext4: do not advance i_size on a buffered write that copied nothing
      commit: 66998b3184cdfcb7fa0f28deb4c0c6ea1236b501

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
