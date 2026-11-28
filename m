Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868373;
	b=PeaxWmeR84/wMtFK1T6gjPz4KQ/xdv++5Oyot/R39/RqnM7oN/XJfqDofPibq6VRuAS/
	 TsiwnqYY2vCB8WSaC7/uu4DGZqj4my0KdpEON4XwCIP9WKXXRSzaFT4uSsigi+XzqZc1p
	 1ZscaXdUXi90TwOGrOaAfTo9KMDU0rePyR2xIKWhjbdkOmfHjSKVHRagQeidlSiWJj5AL
	 wkDqObClbj877OpW9eVf7KLctzcVoyGoM+GlsXl60T3kng/nTyQsNhDCFTDWGhHl24Pnp
	 0oLxNKO3sEnLcNWtaWED/1YTcgiwTHjoeCXbhZlYUsifi8OaM9jvmOhvMqTbaKp00ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868373;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PaiZ5W930vk37DsHxt8WEVy+OCInpgFJDXz+FZkTAZU=;
	b=LdsdTlB72+2UM42xtfHABB+ICdd6ZQiNnQME+tVUJkQqPC6zg6c2DP2DPmOYndaWNUE1
	 /oLgTsnIeU88LsC10kp0eWMp69mYL032oErP4HKOaditUpbIgSngJhpTqbFofqi7dym32
	 Tf2HlsK5NCBuO5QZQgJYlAa7xAisM/8ZEa9TeNqFr1ybbu2gFkFf4zpGG87t84yUMzpHZ
	 cTmcrWuFaehQtv3SRMsh/rHJ6yw3gfI+rEaI6YIHEkU/vK1aDABcx2muIRetyEvPgbszR
	 f53KAaT/dVyJA1Z2QTh5wz3xl8dGHPFzHd1cD0zyfRahQiWGe+VUgh0EZQfgf2J65CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWdbag6Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6F606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWdbag6Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC35D1F00893;
	Sat, 28 Nov 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795868373;
	bh=PaiZ5W930vk37DsHxt8WEVy+OCInpgFJDXz+FZkTAZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWdbag6Yk+H0gTkdgXUG2WMSTFQJPUfKbA2nrVw8gYhQBZ/WUt1VOtUyFO3mGo4Pl
	 cqWH9vGQHYpXI4d6GOUW3ev3aoZFAnlzO065+Sh2TdxCmawFYpzSj/qVLemeO+HofF
	 xWb8nPNZl542f6wk3viVRvGJp42M0h7WO5HF+lwKX7TymgivtqZNgcsTCYweaVgSD+
	 hQIcnPB95VoHTja1HBOF5zsLUOLY+Gle9TRX1pUOW+hGhfRyfyOmOYk898SDDRB/DY
	 NIMPwxsBaCdkPMsdIVqm8A3s0gcbGc3FbyuLDYo5RB8PKPDMs+IWD5d2dNmhIsdRWi
	 6HGo+dCxtD+YQ==
Date: Sat, 28 Nov 2026 04:19:31 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
Message-ID: <awrG09RyWMAhJ_KC@thelio>
References: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
 <awpKGGPVJawHTK5E@thelio>
 <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>

On Sat, Nov 28, 2026 at 02:54:59PM +0800, Icenowy Zheng wrote:
> 在 2026-11-27五的 19:27 -0800，Drew Fustini写道：
> > On Thu, Nov 26, 2026 at 05:53:32PM +0800, Icenowy Zheng wrote:
> > > As more and more device binding / drivers are coming for TH1520,
> > > indivudal filenames now bloats this MAINTAINERS entry.
> > > 
> > > Use N: to match th1520 in filenames instead of listing them.
> > 
> > Good idea, nothing drops out, and thead,th1520-dw-hdmi.yaml is now
> > covered, too.
> > 
> > [..]
> > > -F:	drivers/clk/thead/clk-th1520-ap.c
> > 
> > for clk I think it would be better to list the directory like the entry already does for pmdomain:
> > 
> >    F:	drivers/clk/thead/
> 
> I agree with this.
> 
> Thanks,
> Icenowy

Okay, I have applied it to thead-dt-for-next:
     
  [1/1] MAINTAINERS: matches th1520 in filenames for RISC-V THEAD SoC
        https://git.kernel.org/fustini/c/7d750d5e30d6

Thanks,
Drew
