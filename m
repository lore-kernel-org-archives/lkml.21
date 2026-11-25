Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649101;
	b=CRpMyzbb6uanZ4Ln8hT1plJOM51F2s7Or+qo+rs5hvHJPKfdK7Tt3c7MAEMobwxlZSF+
	 yEwPqLBv2y/k9NZq3TXAYTKpftqlEWCcOhzEtCyRvEG9GNwl3TEvY1FMjyN9h9qrPd4/6
	 lNRnoKgwgnjT3Bp4gRn5hlILDaK+Y1e4jA4IpECRQAYy0Fgb8KqFxZ4I//kESr+BUSaOk
	 1wmLzjS3jwswg9c48FAbGIVOf6kNpOGFEGNKClvRj4W5oHcn80ZVMTm/0xiukr/nEUYEX
	 uEZPl1CeFtWX6fWxtpqwC8gg3m7pjCimcxBPLKwpUvlQSdXTuddScJbJziNs60djRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L6X4hxg9g2a4Kk54pYVDsh+6JPYXZP17k3uQAGcEC60=;
	b=lBeSNj+wdvZdhT84PGTOlYu1xNUBtoxNfetIYNGp4w0zA64OZWul2mFrkeBlPOaj1T3t
	 7LZgImnU6BhYC/0WtctjF0s2MK32WLiVGd3LqNfyWn+lIZxgDvCwZYbukQqzxWbtS6kHi
	 WVFMG00N68Ea4dzcgrBnhqHx1PEKtIspe1h8XUTZiSz8bbrIxx9cMhddfrrpOKDxd96ea
	 vBecBo2by9lR5VYioI7A//L2bobaMzmvzy2jQ5DbS9indbpt6/kJY5/xvnd98AkOK4nMD
	 R7Ps1f7nTpY1bWWtHZzu/fmD4z2q1sOeybBUQZBJ5SPhX18xYk3oYAsZ+DCb/qzGJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nU0bcAb9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B22606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nU0bcAb9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so43584645e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649099; x=1796253899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6X4hxg9g2a4Kk54pYVDsh+6JPYXZP17k3uQAGcEC60=;
        b=nU0bcAb9fsTujKO4firFKvcUAuPT8aUbcufiUqVA9gF9kqLjgdWOABKvoMX+ru2K1V
         3e8RwqIIWi61/pcvQhafPPco4CBat41WCNtkAuMYkxjEUdAjHBLNtzYUUVwpV/FUCnbh
         BHOIJuQBZsGZ/cIv+Vbxqaj+QQ9CFScpBX1ZT0nQgCB6WGVzTQpTsXRUGX/EdG+HGgwY
         4ODQb/aMG8QwSCAZMg8ZPqIVZvWzrJqs3CXk4O+BehrNOMqATQF2zXztMoJI93Ko1hK5
         V8P1t1xYvRVwKWo/aFeV+XyXkJTQ0BJglH9FO4F3l6U+pq+VyGfDiqZqZ/TUbQyQ6PrV
         ypMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649099; x=1796253899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6X4hxg9g2a4Kk54pYVDsh+6JPYXZP17k3uQAGcEC60=;
        b=ceqqKrozpSOMHOq0milCi2f01MS+Oer3+68/4tYrPq9Yv1+fmY/rSl9lR+C0o5/nFo
         pkESC23NYu2KUL0V2TatpcPZgoZMK3hsqHLbXDlvtYXqDtpZpngluK+yLxUhjUrWk+EC
         O8+LRv5VJ0KpyVz73YhkQLBekIG1Uip3FowCzngtpv4xP5GCo/0XHlydLpvODXdgpTsb
         72MrkpqSBUJ2vq7hGAzMn69jG5LVN4mgZmTO6B++UvE4PElEs60mSQmrJU4dEOHS3Xx+
         QYFp65DQt+Rqb4gZoNkfoO+5KIUsevjpErya5KRxzLu7p0iAyu9ODQf7C9B0STRsIRmH
         40kQ==
X-Forwarded-Encrypted: i=1; AL+hErFtbBmvxdHgLTifoPCsDnzp9QIHpECFKfBSesDp68eQu0cPR0EhBdxMRi0HGzztgieu2dH4KV7BXzB90oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C3t3mOMCFjd3m+Mu3a7efzS3Cfkzo0vpNk5FeadL/QhR8Ok+K
	T6J+8qGyXySDU1MBU3gXVkOdMbG5XlznGVQZfSQArYMGx0w156gGNrsXrhGMFlZV
X-Gm-Gg: AZFdTZdWv7W8JoJabYOzvL/18ClsmEcjO73LSLW/GI+L7Lnxn2Zlpvpki+8mu91Bx+J
	+I7ucg+v6ni1PjOoLjHvkIZ4cITEbmEfO3dIO/gMnzIJ/EFgJzEUwLyGU7N3u/DNmb3mzRmYD1S
	DHG6+FDSk4yVl9uKaPb9+BW6T7mJ+yJG4sGCawVOf641QT0nCy0a1AbHKYXozZDVH/VsStNPLnU
	sP2xYi0MCiQ8zeRrt2CKTBlOHMuMzDLkrngaQzyke6ZFfLWfO5tuuRbFu7Eco6OsCmecf5ut4jz
	GccoQw+3daTG2ddN6C+q3az7+ihAUQnVqLLOxzF37882/VYG9AA8+0brURSKKkIClRlcU2DgOzv
	qjUCu1JB0n5c7Yf73UsfiD+q/37CD95RuDAmoKCLualqX7+Coxp8KA26N/wIHR45G+xxcTDeDCR
	l51YIzXcDTboLo2angXx9yrzQGZPWk4g5RZhlK7sDTpXIXEWVypt0LPK3LcSJTX6w0jcnz3I9P5
	4tF0BpwQZYv6nE5Dzb+dBU+zNwgg5Zp7ox+k9oGQLJqdLlv+pAnGn3tY1cKY+vw/c+6jtaW6+jg
	dMP6eqgg7gEBqqMjIpRH0/Gc3VUTTy4R/YLVfDk99AEgcYA=
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr396837705e9.8.1795649099232;
        Wed, 25 Nov 2026 15:24:59 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4b34e9c3ffesm20957965f8f.19.2026.11.25.15.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 15:24:58 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jkoolstra@xs4all.nl
Cc: amir73il@gmail.com,
	brauner@kernel.org,
	cyphar@cyphar.com,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	jlayton@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	neil@brown.name,
	neilb@ownmail.net,
	safinaskar@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v8 07/12] vfs: short-circuit MAY_WRITE access for O_DIRECTORY opens
Date: Thu, 26 Nov 2026 02:24:43 +0300
Message-ID: <20261125232443.1897836-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1119017860.2578021.1795602566314@kpc.webmail.kpnmail.nl>
References: <1119017860.2578021.1795602566314@kpc.webmail.kpnmail.nl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jori Koolstra <jkoolstra@xs4all.nl>:
> > The problem is that "flags" contains an invalid value.  The correct
> > error for that (according to open.2 man page) is EINVAL.
> > 
> 
> This is best probably. The counter is that I wanted to change errnos as little
> as possible. Now you get at least something that could already happen when
> you did a normal open(O_DIRECTORY). Were this designed from the start -EINVAL
> is obviously what is needed here.
> 
> I dunno, not sure what other people think.

Now I think it should be changed to EINVAL, too.

-- 
Askar Safin
