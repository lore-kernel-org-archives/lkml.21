Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795836442;
	b=v2/39m+YiN/MB3SP1l4tliDkPNo+nkFa6f8L2letWYTAyaBgTLAVU021fLz5VeVhr9in
	 0O/BncbqPMujAYtlIYSlHKKeAVpOWnM4JQZ3mWwmanLAELNp6ZzVZLrcXqciMoYP2V5DX
	 Rz1z7a0/i6chEvFq9kC/2XMxZYFRBoyvhZRIK7iI1Cd5lHPBcJ/aIDoGN7Pu75wHryiYd
	 mr05ZZ1a4Cxf6STWS2caaCxcdjeHY3GfoBIEWsMP6QUzbTuhkob1pEyiffFVrlDv2H3oQ
	 QFUBUHVewtf65768ae+nj0GJfYx0UIr+NnmhluSV9fJxq0D+TlZpvE7T07x5fqjl6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836442;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nR1K8tu58+gvV+YrFMkIazxdzdFlb7lyRHlnMbvGTr4=;
	b=Yul7LgfitcyMFPnCLKdN0diJdOIkxXGuh0BKfgpn1IhsPKk1m24rPhCeAE6ZQbg5wwbR
	 g+re2lO+2zXoCRmfuLIwhMnl9tKzne4Rb4fPcj9GS4LP9morIZxcQESyVBfbNpLJtMgv1
	 INUaCIEkvA3VgXOzHQEjxmv7OeyGztUb/rGZUzCAsldOB2aUC7/l6mEv6ogUnq5epMzHU
	 tXnj/aTCR1m0rPOFdd5ziK4ixGuS5tz1A1j5muUJIoH7IeXUcrsGF2mHlsaHJf31e8A3K
	 RFC9lgh35aCGfk82dKTxKRpRKNWJ++bH7dhC3Brjx0SmCP9NoinXw5yvKyZyTSYFK2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVW7ywo1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99909606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVW7ywo1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365611F00897;
	Sat, 28 Nov 2026 03:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795836442;
	bh=nR1K8tu58+gvV+YrFMkIazxdzdFlb7lyRHlnMbvGTr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVW7ywo1pvif7WLAcfA7+VoCJZ6s6PF4EpzHaIHrFkZGFLwHKSAnt6gT6ftypL/yU
	 yVwTy4MXGv58lyKret/8z2NBk2jkREB2+8sQA9fk6dF8zETPDBAejkfuUA6jovuBPK
	 1m2dNriEgk7S5EWKaQlijcTJKFT3yeoq7rHevP+bN2uAWinPTLiHMULUH7sGbr9TRw
	 Isp9nHykFvg5U09kulEBwE1DvmoHqYK8xwZevzF2geme8CygFWCw/HkglvEB+eKafT
	 A2WM3TYSCK6J2Vubn5WdUMeDciG5644n4Ic0UUnZdfX4OW1/h7mGM4mKDQ43sosh8v
	 kUZ2GeocSr9RQ==
Date: Fri, 27 Nov 2026 19:27:20 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
Message-ID: <awpKGGPVJawHTK5E@thelio>
References: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
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
In-Reply-To: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>

On Thu, Nov 26, 2026 at 05:53:32PM +0800, Icenowy Zheng wrote:
> As more and more device binding / drivers are coming for TH1520,
> indivudal filenames now bloats this MAINTAINERS entry.
> 
> Use N: to match th1520 in filenames instead of listing them.

Good idea, nothing drops out, and thead,th1520-dw-hdmi.yaml is now
covered, too.

[..]
> -F:	drivers/clk/thead/clk-th1520-ap.c

for clk I think it would be better to list the directory like the entry already does for pmdomain:

   F:	drivers/clk/thead/

I can do those fixups when applying if you agree.

Thanks,
Drew
