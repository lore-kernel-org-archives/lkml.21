Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556955;
	b=xnDNOYbhHvMlYSgacccWTMd/sIvCWqQQHGJBFFH2IqE4FKN6rRE8ZJDri4Xo9aJYR1FF
	 Z9Bfu73mvB1Cov7Bp6RIAIF9wzWFP7eCSYxERK5NmItsDUgU8oYRMd3+8hm/1VLiyNszR
	 0eAY9SHnrQF//QnS686x84CzSAFQrMkebkRyZ6EXJLWbdoS6Sr5CocuTtd97n153+xdVq
	 5BlgwgLMPelYT2ADS33TzUA39tQTESHZLgJxubaplaSQfl4XEHy/gK7yx87MjeeFaleOE
	 8slkysOFzUveXxXHsL6qCnwRa7O3gS2gt88+RzLxRB+7tSeCcQUGm0s/6Rd+ZfKUVTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
	b=bz/mvIuvt/6+MYM3EiCiEQ9ZZ2QX2uOsMcejbwL0Ne5nDEtHTXY8PSbJIUfp1yPetQYn
	 X/WjGrUkvac9A2A9IP3sD60beukfRCG0+Gwdw+uQEzECVeKkZ6zoWxT4sSzjJN8lraJei
	 9gnEC3gkuKiExkWzHND6Vy/bI6ldh0TzRdaKu5/PiwgrnuKIMS+oVSVgIOiSO5ysJI8Ti
	 iAl7Vx6CBxKC2/ENypH+S2XyOFdZz+0OjjN2oaBVwhk2Gm/sEj1jM2sQncvm9E6dgqy+m
	 I6rF8tbI+jbqvIQIctBP53iJhN7Xkz7e4uH4sFxIm7lRPQQaaK/w8pdhSTw0NoWEXwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJTIKoyD;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE8F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJTIKoyD
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38699cf08dfso5693780eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556954; x=1796161754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
        b=OJTIKoyDTh0xoECF8o/vUC1ui7eVopIU6IV2xs5cys14vM7XyM5bp8puUtQ6lynF+b
         09rz9OqdNICQwIGXZKJNo3MkOtZxDUTEfIlvjFiBV9q79YwIiGeZCAjUdMGCqOGLJyA+
         n3a4klZOOE5KGc+rMvW6zyKp/DdV8tiE/PdMjhYO/HZG6/+SA9HN66QjQQ2bI96MaZHc
         kXmiUBEX0Ll3E+JSDcpiUX2gFt7luPsKi98/Qf3wiUY0zDRG7cn7mT/krWNElnH1AMzV
         8j49FoZQj6iYcnkae1tvLsKQdk0IeVUKygh6YXG2d49+SKEyb3y1z3LgaRGomOzWPIyH
         QKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556954; x=1796161754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
        b=I3jDJk+nGhw/Cqs1GEWz9V4zHeDOUwoJZpWLA44D4D9Xm81x9FFecOhrefQIGEgdte
         ohzosNqR47o2aYZH5CmK20QnYK2OxTmoM78SvCKLJJ+dJLpOi1+/IOGpGLoX8G0J+G44
         IRD6vaK4MZVODlPti69c3mI8YV5zf+5oiDoY4SN5CU0Q7K/13oR6nemBwszUJVT5+QaC
         VXB71pkNEYJjuaiKauOBZJIn5jbB5PRidzpPaIw605Jrq9ofGugr2/AegOTGh86aHnbn
         JsRYcVCGG80U7fuag1dqqdqqdkNMbXttIfATHnGaxMHgum8sck5iO52cBSXoDDG8eiJR
         xLLw==
X-Forwarded-Encrypted: i=1; AL+hErGKvZWgkyj/LXGNaWi9eJpT9QTp/JTGBnYEZ4i1ApJIUDyQIgRZq1mncTJCPy2UJs7XbcAPJLMY68+3gRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c7/Ylp2VYATR5nHZbWKvvk5Py9/2WWvlr9w93Oa3EGEbHSDeC
	sWqC/HjdikHTtGR+UZoh2vaLc5KOz7J+iIQvgwi1XyoDxPRref7u3VQN4sLPow==
X-Gm-Gg: AZFdTZeZ7og/l59feS3bY9xWyu/FdNQEi+hHqcGqyVT+Q0fSJsDGzsQCkGywoHmw/HV
	hFKRKptAXKqJSd0HOMCjiqHI702jcAUcX91TpPidRiDScu8IcVhO75fBkQpkZC8Iwo+3WfuM977
	YqT0VLXj6hse1fbEl2B2WcdDOT1yXq6TwGmEh4ugFHQe3E30NJ/n0pwZi5ynN8tWwkT4NrPMyg2
	0r/UmbS8n3rasOOIXe1aN5wfCJm2UP0sDs94eWPqDoNG5ZPyzVL0xDV3voOz2p0OYqemfHsAABC
	U1AqyMp2T3i/SmJ2A4s+xrr+9GXFG7T8MNYr7BqarZ+WUG0OaGg4Xt4GUWY9ySIkZ60EX38BbR+
	3sn6JRqa9L7mR6U6EMxy37SxyI4lFS8Iklc65ZMT17dmNgoCo9H0Eupszswi58PBDJs9UN6AN6F
	XhERLtvuLMLQwAt7bsdQ6FRSmxU/G8je/QnOzkGCX2KoO/9DY4iEG/1uTFga35HKRRhWWEXlrc6
	xqm2APlOmITr55CQvpfKwe3URo4rw/2qUk5ZjltHZEZ78HcyArPpFNtIX5XIAlWb7SzRQ2IKNHg
	zJtQgFrxgJK1UCwsAAyOPwJ/s84De9JYQfRYcDNbRMSBVfOAPC8=
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr11150271eec.4.1795556954067;
        Tue, 24 Nov 2026 13:49:14 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm49593038eec.28.2026.11.24.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:49:13 -0800 (PST)
Date: Tue, 24 Nov 2026 13:48:30 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, Jakub Kicinski <kuba@kernel.org>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <awYGLh6WtnvZTGJe@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
 <av/RAwaDfiQnPmbF@gmail.com>
 <20261120154835.0f56c410@kernel.org>
 <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>
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
In-Reply-To: <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>

On Tue, Nov 24, 2026 at 12:34:31PM -0800, Joe Damato wrote:
> I think HW USO can hit it. A small gso_size with UDP_SEGMENT can fit under the
> push threshold and that skbw ould go out unsegmented. I think this would
> affect Thor2 devices that have HW USO.
> 
> I don't think SW USO is affected, though, since it segments before the push
> path.
> 
> I'm gonna update uso.py to test a small MSS which should trigger this on a
> thor2 nic.
> 
> Narcisa were you planning to send a fix for this bug? If not, I can, but I
> didn't want to step on your toes if you were about to send something :)

Thank you, Joe! Please feel free to send the fix.
