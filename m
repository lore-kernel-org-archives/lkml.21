Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049187;
	b=Jze10ZeKRsuhdMmztCFYgo454P7BHw+KpdoQqOryjYk1Gt5HdxdJp56fnM74cm+Apt8j
	 qD+MWjH+DUlEf7c+aDv6gHiyMjNR/rd0HQdMNj4dcjfv2fQ6J4Eh4CJfoSXdKaFIA9x/q
	 vQIETW82NIiNxcNu/h9oEVLqqCbD/mU7PONo7sUXQueVNzHKu8FnrODHQtoZrDLH2Et88
	 a3N1yvLc895zOXL4jKc+l6XxH/dlSHMd7T29A5rEgw9UUcHGFydJGzyfu3WkujM2ATshT
	 0mpIt7pqCgvgf9Gwh9H1hocVZ3kgU0h706x/NmPs85Mt0lW0gv26LFgW9BWGnlOCw9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049187;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IfhwqaF7+iW4cCJBtgl/0OGUjYTUt3FIdGpK101SenM=;
	b=ZS+BK+VzEJRTOiOsBE2eaECZFMHumW47j605D7qb8qrhjKQb4OuAAKkXyoXUf3+DLYt2
	 bf9W7GemGDYHKTMFODfE4iX9zM6gPl13l7H7YfvgFheXZ/WCFUYRW7QHTD4KMO4QWZ2Wh
	 Eu4mAAhtTfMqb+D9aEIdTPuLOM+NCde8KMC/6sY//UWlGaOpzjIKSgrDFmMwkpeIgs2bS
	 FLq0iEvpeDtIZzUqOya5MCFXHXaOJ157xjUAagiDbD5HCJs+goJFtVqlRotDx+u5PuWRH
	 K5izj0kVctvtL7bJ3E3Nd41XH/0JfXZCwlFzSKY2G8wmLU6LcmnELxi36VL9EgM7gTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p4OpSs4X;
	arc=none smtp.remote-ip=91.218.175.84
Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A3606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p4OpSs4X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UQR/BvlTNyh+wNwjaGXLOtJyi24YEEcs4huJuS8bFW4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049179; v=1; x=1795653979;
 b=p4OpSs4XBeWzwu6FI6rwpeTRPFx0aMTS5WKhupmbRy5rZLKbf42QVruExYo4SBTF2Po+D3/g
 eRrnIHMNo6maZ9bzhGOZZMGfquYD3PKs2pXfng0VuYawTEM1BKJvU2rJ2FmSvh6Z9LYBvN6MHfX
 CcOeCb9pdyJ+rkXYacS7XPv4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 934774b0320c646f;
	Thu, 19 Nov 2026 00:46:19 +0000
X-Mizu-Trace-ID: 934774b0320c646f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 08:46:09 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Saphal Poudyal <mail@saphal.me>
Cc: Minhong He <heminhong@kylinos.cn>, andrea.mayer@uniroma2.it,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org, horms@kernel.org,
	linux-kernel@vger.kernel.org, Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next 0/3] seg6_local: add USP and USD flavors support
 (RFC 8986)
Message-ID: <av5G0UmlURQt65uW@fedora>
References: <3dd85ab7-2270-422d-9595-c7f1d9612e82@saphal.me>
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
In-Reply-To: <3dd85ab7-2270-422d-9595-c7f1d9612e82@saphal.me>

Hi Saphal,
On Thu, Nov 19, 2026 at 12:25:14AM +0000, Saphal Poudyal wrote:
> On 11/4/26 01:22, Hangbin Liu wrote:
> 
> > Kernel changes alone are not sufficient, we also need selftest updates for
> > this new feature. So I’ve begun adding PSP support for End.X, along with the
> > corresponding selftests. The USP/USD kernel updates are already in my local
> > tree.
> Hi Hangbin,
> 
> Good to hear that work has been started on this. For USD, this series
> only defines USD for decapsulating behaviors (End.DX4, End.DT6 etc.). I
> wanted to confirm if your USD work covers End, End.X and End.T as
> specified in RFC 8986 section 4.16.3.

Yes, the USD flavor should work with End, End.X, and End.T as RFC defines.
> 
> It's a piece I need to make SRv6 TI-LFA work (terminate the repair
> tunnels). I'm working through FRR's SRv6 TI-LFA and it leaves out the
> decapsulation part on the Q-node.
> 
> I'd be glad to test your series with FRR once it's posted.

Good to know there’s a use case. I’ll post the series and Cc you once the
PSP series work is finished.

Thanks
Hangbin
