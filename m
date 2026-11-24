Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484263;
	b=K25DcP0aKZVyAF8AqboOz9chUm9lwhVxwnqRwfFSzhAHUG23u9pSc71nTkcQogf9OCOh
	 C1uSkvnrLooqEcO/hpydQRZt23ZkLCYOVYFz5Y8lECjLgu0N4a/sdbKmzFfvelUM9y+MB
	 /9aGFw/8pYOkHfJ/KZK66GbmulMJ2L/cNJApPWSMivBt/+p42x3vk/cSK3EIYRLCXaqLc
	 Bnk/l+KWuTeQ70Y7oRMx6IPFthxOAhxhy0EoOdPdXyGqL64ojx8RpTIIVacrJnN+9q2sJ
	 IwHAiYTAPOAd5iL1W5EXmHmahZK0ijWmTXuvnuW/YNBOE/u/yG7rpu8GX5gJHOH0omA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vbV0FpLnVDem8kc+KhRgKSxbkxjFXS6P0ZcqGLrdAOI=;
	b=YEysI2uB1BTeBL/3tNcvdas3Q8USuyMmivClVpNa3ZhemwnoFOVJl3F88WMWyIhrSWWX
	 QqGXSLu8fbnvzzzJzX6YNGhkDnf/uXNytgRTuJZDZOcQqbjdX6MPPZQptBWUqXKM88aH7
	 2aggZ++BPk00ntFQ6wKO9CYKxEVoF4QuM1GV7fVHH4Qf6pnN3bfZ62Wv0v9c4n4CkAUaA
	 i3Kfz+jSopEt1cewouWuo+mafFQ6MBbGCax6tVU+UhWNre48nXBT7y7Y4HmwEA3e6NSPK
	 k377f2JpOc3nsQssPrtaNTZKxnVXJDmoEjn9Nv5zkh+VvxIWfw4ZzFlWYzNnCvrp20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BB3rjcwz;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A92D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BB3rjcwz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386ab9ab619so3594090eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795484262; x=1796089062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbV0FpLnVDem8kc+KhRgKSxbkxjFXS6P0ZcqGLrdAOI=;
        b=BB3rjcwzTeTydd05Z2ugRZe0xbkIrxB5fxHGYHaNOscwnu4/blfaOFF4/U5y+T+1RL
         yNPSMJOXSDJczxf1E3OGkBKWiNUQtQP6yli1a9Vghue3+jrKEHNIZdZAxbfKjYZUE8Dd
         pJxC8qAE5s9b0PZoEAGJixc9d2fL5CtdBOGIJ92trVfDPYNG4nrzafSnnjgQBolJk85l
         0DFrg4cvqsApIJC0tPf371hQ9a/cFmYasrR43oPG5GCKgTvNyNkNxWZi5f+f5EelojH4
         /84jbpjwWPQhUH4RENmFDBBuvI9PsjFX4KqdyV+mbWsOS8JOjRIKkb1YQQ63Wq68SvIr
         CkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795484262; x=1796089062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbV0FpLnVDem8kc+KhRgKSxbkxjFXS6P0ZcqGLrdAOI=;
        b=ZBprOinz9EH+XswOFDM9qJ4XvexYAD5R8urljzQpqYQcV0jCsheyuKP9WNcwwBEbB5
         uL12Gef2hyAklATZXD0KHz+SKA6zI6jIeTw1CuDczJuHKMOB6OYeRfOVh2fapGROR8pj
         M7D2F3HzHAjNHrFFomVu0SFQwSOxlqUPOH1wqJU5NGU6XNEfIyr5qG1VheZa0ah7yd1l
         vHD2xiPQohVSwLntjF1Z3menx/avxxbm90BqZyTJSlqHwiVLG5Pq8gSfBxWFKnROeJgc
         C5Z85xtgK0vDWQ1Q+Hv9qwFRd83p8umD7oG73CQnrx5c6z+fY/IqBIKatxwjswIXwZjz
         Rrwg==
X-Forwarded-Encrypted: i=1; AL+hErE8gxvJFIletEid7bg6Zce0qxKhgaO+CP37MsixyKaEZuyGpL2IKpDJH4CcXVN8+CMyF+Zc+KniLUviEHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G21Az9aaAKUjiLKxR49CWB6QANQatwAyfUGIUgPneGqo7PWxL
	gtERtaWLK5dpz8DC0zzuS/kxsJqYNfrytTkedkUdz+MgNmTWMfUs1ssp
X-Gm-Gg: AZFdTZceJxzL/DWkeuDzARyfX0/w7KlfL5T/jPwjuMeBjexOSLP6f+g/e+Fmk4YmQ7h
	VoLrCGDx8icJCKgiaeLbwDs7AmurmLAtr+zAY4I9x+D5e7exC2Wu4IpazgwzLw584PrFskUAuLy
	uVe52HYo8F0mCLj5Fa7iutIW9t5wARVmcxOB8K/Kj3mTZIJmFhiFnRDAvFtGhiCE/+UTHhWhvtj
	oY75DU270DVGeXdgVMIc3cG92/a6meVto86WynJe+4ahT+u3qLE7n/EmuJjSPjejOd1ntx5a49a
	RbomyDv9w4Cke6IJFD3Sqdr04SRAJscGDpq+QkZLRRo8V7ZKXC6+r1lJBd6ZjDQchdIa23g+/DW
	rbhFMZyRoq2JVwlz9hWFPZVeAwtyOzvyP75UJQM0tIrYMxDfCm4sZKrWL5q4pYb4ahsG8LY1les
	tg4UvcO298iFFHQGDruqZD+HGJweR4LrBymF/HmYSy4hpHjYuXhq5DJe/+nkT3jh21Nysl+azPU
	ae0HNKSUthpgOxtxgoFX6JAZlod+ybrKdxOzRE4xe+6bnol7cyUBR18ma1zIAfXJSJbRArbyuPf
	3jlwEO7BvbJw7R5apRlwufBbeJwdqTDIY3GOWVk/IQ0ZruoVcadfGQwjFIGW9yqyEvS1r0k=
X-Received: by 2002:a05:7301:46a3:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3856f65ada3mr14784970eec.8.1795484262241;
        Mon, 23 Nov 2026 17:37:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm11760696eec.27.2026.11.23.17.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:37:41 -0800 (PST)
Date: Mon, 23 Nov 2026 17:37:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Igor Sousa <contato@igorsousa.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3
 15IWC11 (83WA)
Message-ID: <awTqX8YvJ-4WsIsu@google.com>
References: <20261118013902.10467-1-contato@igorsousa.com>
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
In-Reply-To: <20261118013902.10467-1-contato@igorsousa.com>

On Tue, Nov 17, 2026 at 10:39:02PM -0300, Igor Sousa wrote:
> The Lenovo IdeaPad Slim 3 15IWC11 (DMI code 83WA) requires skipping
> keyboard deactivation in atkbd, similar to the existing "83RR" variant,
> otherwise the internal keyboard won't work unless the
> i8042.dumbkbd=1 option is passed.
> 
> Added a DMI quirk for the "83WA" variant using atkbd_deactivate_fixup.
> Tested on the hardware without i8042.dumbkbd=1.
> Fixes typing and keyboard LEDs even after suspend/resume.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Igor Sousa <contato@igorsousa.com>

Applied, thank you.

-- 
Dmitry
