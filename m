Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541692;
	b=DeJXTwSp+bykWM0B3rn/FS19Q0rijy9Tr6ep2tuRqSXTrqPWCsmWvp1ptjnXZ2lM760L
	 1S0ZSSfbYnD3c0T3CxdX8Axx0q9twxG6KaY9nHcYya8E1bUUTaPNJDpU0S5DPuZ2a0++f
	 yMDiSMWhM8cF8j4khunlIvXv4t647glJ3aLVsoMrkuLFTbcn2EqZ0su5Jr/i++egMz/Gk
	 9AoXHdSIOd/cinDHcnI02R+FKxQ+eqSMN2txQ7qCmPKabzs139uC9msa/B7ChCBBintJ3
	 D3H0hcU0oq9T+8EKalBKXGAXydtu46AjYlzetO4zfm0FdKTmxQ1QqsfPGMuQV8J+d8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
	b=tsz2vkIrto5B+wBWLOqPLferElpAfkwkaSVT+J4BMX5dOAIfJeJpMsSeJ/SDaU7pJg/J
	 AnxODxca/fAou46F21vGGS2ULGXD5eLAFm3L9GlA6lAaiB+W+oe5a6kBIrq0arLnZtXRs
	 /zgqVGLTdK/tKKbQSrQQf0VnO/kHqrVNXi6h1C4MpWFl1PfIy4NltYYLcOFVUNv2N5OcQ
	 FrkezV1CkTgqd2HTshMxDYQPpmLfRZ94U9B7EuWmMbPrKY0OnpuSRVXOzWOdZ3+x6ivpo
	 Pum1oblo6AV0LWuFK6hiaK1ovIq9c9LTtcjbLWimTl+Z84QEfrYC/uTfsGy3thF5mYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HHrCeQgK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC8606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HHrCeQgK
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04ad2c46dso28653295ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541691; cv=none;
        d=google.com; s=arc-20260327;
        b=dEM+/T2hVoymxbkd83aJlTPjiTr8k1pN4Mrj+HRR3bbQbacsgFzHwFEFKVBA2sNrPP
         ZVrWK/0AZkJDLtV3JVs0nmGly/AkkYx2F0vP3mbdN/jDXHK+LimuwjlM3B41oQk+Lj4b
         9YPwiNMXWCTDk7wFq+vnbsv+T3JSgOMims827SSscKgnNLAmIMcNkPH3urPheNS0gCNr
         KfJen98JUpLHefltdHe1l8FyqiJUSAsgmivzp0VL8Ok3B0L1YmqcI0MbE3/5i5h1wb3P
         hnlU9CD2nWL2dXlQjIeqBfGqlgA66XpQD8mn9pygV7IszVEhiJ2+a2WsRE8qkjNsjZyl
         IJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        fh=sG03nxN7rcA9l/D//eI6y9Y83vAcu8i/D4Ft2/T0GX8=;
        b=ao6jDY66ySdnyNl8mAieA7rKGMEzUP4Iu3orp8vtAPyDySC/Pa2MEKqXAP5+s+scQJ
         nfb6/fKKGSqnFdlvGWn8QGEnrvagvlxRqnERPCj/aTQtmmQvT93VfeeHdxb6L8FEXhtZ
         VprsoJF3CkfPkh0o/F0dpWIOyZQ9Mwjy6ebNIMfB2DM6MmaCjgOhYNoon3Xo79RuV3M3
         NxK3WB9i5gGPiTvLMPPJtl6oA3NA1oM7SVlH50gfwlL9hUVCKgwlBdPun8RkTzrxLTfr
         lL99ClvrdLz6lctYvPe0hseGHVfhdJzZGT/5xK5NQ3Pp1reQzKqJq75EYn41mhXbHW5H
         4oqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795541691; x=1796146491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        b=HHrCeQgK/kBXJZ90aRHYJCoHRDaE82HsZ115cJLDYso+RPO71e0P2oCB3lgCU0MEgS
         vqh6phVdkz6ulUaoDB6e0l9qXvOSEIoCNR8KSiDiVRPP1eH/PJFHDDwfunnlA2EdZlpl
         IBc1H1MQCifglg++qUTABRftlRuR/pBz23mq1/edbPJ07HpWcQ/nQ99/W7hJb+mJamiF
         iS+HRsAVyYIlrP5fvIffCfiB9wn7spnsPetVxVjsy7/oH/YZVmk3MDTVudG9t+lq4Vov
         ZiT59zFmbR/7glqKQYhrwI/SlcgE56F6BJH34DFmhgVPkJwjU4EUv4gXctECwbp9F3xP
         kl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541691; x=1796146491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBmnC24W8AXYN+2O9rvqWHkGjrVBXCobhK+i3wuM79I=;
        b=Kdihg81MA3vqiAW3jrBC3t9/+QEnClVvRW5UY6DNqFqAe6gX91F7EXWp0TVNpireaz
         A4SUjC9myVjnEA6EdWkimJjJM9LuSFMDD/BHNpnkXr5khjV7f6/VRjaGcJL1rrweX0nf
         8BGEiCqz3By+MvmwuDItuqR6GqqvdQLVUSy+tQMq7xm4rmRPna8lDJKG+9FE5CntdKWf
         jJ/qOmLQ6FMz5BZnH2+4dPZlRcCtJpOUAKoX1alHtsJKv7Oiatlxt+9EF5aVaBossKKc
         5NmOH0GqK+jnOhuRxB4wiCh2VN13KsXnOh43erUdjRUf/S99aBKIkkVXDntNdQtPYTgl
         Gnng==
X-Forwarded-Encrypted: i=1; AL+hErE8xO/oJ/KZitX7YF4CxJ0L7wQdv/TGsEiuxwVpPnzlTKdpc+/g0dtxPUt4UypN/hTuJqlEKTTvIOuEV8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7VVx9+fXZj5xJwxg61VEYQsNQKtTrQuwKGWF0Y0Zf7aBmckcK
	LH6kQs5MywRAldeXLiyEyZtaZxMELQnJMgCEaGru36a0uxR39BI2rQjIM/IHagU4Y+ohIcdQywj
	rOJRE/aoYx/vJJjUZC2+nJzDfHIRVCQdznPkZMm3z
X-Gm-Gg: AZFdTZd1bRb6XScduTCKArxGN6A2vHSZKrK6OxqsQX3qKUEb1sOyA0TMPSxIEyNN5kq
	wp04YZPtNoi0+6oQddvPRGHYkA7UX9kNd0P/BK2lyGxLVlSUibjAnNoos6EvbjaYwjXtBOj8rpM
	oUbnOrkHsx7dqjYW1LJq8vzyxh5/RAoAiExm1LJ9akw/NzpINRo3suLDdWPbsGeN8D2PqXlirJ2
	pQyg5n+jZVp3PIQTpVI7c26Ki2vKD8YOAI5KdM6lXN4sGs3zqUM32zSWhn1gQ8PcT3evYBRsDfw
	3oH5BtWElrmXydf4+jwy5d8hLw6nmVmlp4G5EPce+Fq6fuvFmv6w0B/XJ4dn9C8dVeKYHaci+gv
	to3M6YznqAC03+Pl69dUHbqePKMoGOhOpc6P4Jh96a00o9hmJQisbOL8w4niTvd2KSWWG
X-Received: by 2002:a17:902:dacc:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2f03ef5a25amr159510795ad.5.1795541691316; Tue, 24 Nov 2026
 09:34:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-x25-v1-1-4432d3892f8b@gmail.com> <c70bad57add6ff8cd52125c698f3f54a@dev.tdt.de>
 <CAHC9VhTLg2FLNf3sLe3+A=q5Mo4gKs+gB7zi5sQT1jizsOPuNQ@mail.gmail.com> <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
In-Reply-To: <CA+X8SdjoyJT1i1Rf08psCsLQyPQ+yU_tAH0rCQPXpkm4DF_=Nw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Nov 2026 12:34:38 -0500
X-Gm-Features: Aa3M54qCAAAH8qnzn7NrvXOlemcU2WyGsLTrIJLHcpwId-DXnie5s0o5cb3103Q
Message-ID: <CAHC9VhSY5_NLka8n-yDVwv2FmXj9DF9PWWxomGv1_-mFzZ3Pmw@mail.gmail.com>
Subject: Re: [PATCH net] net/x25: inherit the listening socket's security
 label on accept
To: Wong Steve <shyckless@gmail.com>
Cc: Martin Schiller <ms@dev.tdt.de>, davem@davemloft.net, kuba@kernel.org, 
	edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-x25@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, stevewong@hust.edu.cn, 
	kaixuan.li@ntu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 12:19=E2=80=AFPM Wong Steve <shyckless@gmail.com> w=
rote:
> > the x25_make_new() function is called by
> > x25_rx_call_request(), which as far as I can tell is on pretty
> > analogous to an accept() operation, is that correct?
>
> Yes. x25_rx_call_request() runs in the receive path
> (x25_lapb_receive_frame() -> x25_receive_data()) when a Call Request
> arrives for a listening socket. It is the X.25 counterpart of TCP
> creating the child socket for an incoming connection:
>
> - x25_find_listener() finds the listening socket,
> - x25_make_new() creates the new socket and copies the listener's
>   settings,
> - the new socket is queued on the listener's receive queue, and
> - x25_accept() later takes it off the queue and grafts it onto the
>   socket that accept() returns.

Great, thanks.

Reviewed-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
