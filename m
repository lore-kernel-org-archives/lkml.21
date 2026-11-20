Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151705;
	b=valkWt5pOAypio1Kr8+yLwWRamqWBe94CheseQ0u8ipkrjg7+PZi4a2xBDkznvbwXLAe
	 i/QPZKa3iyupPqGtGpQZcykhBaaX03l2jGEwNWpaGGkEu/k7ZgzSUSE8a1LjlPqVq0tNR
	 qp06Rq3XkaS1lCUhmfLX36GI2Zjlqjn1227c0dwhP+SnwAJ3wyhBO4mh0VJRz0SfUtIop
	 6D6MfDvrL0t6YLrNOvt9P3lCxlWTF4I5pBpTq4O/sTPDa8lPBBt+eMqEnlapLB01M8RpG
	 AfIYXjjlmTq5xNJsr4YY8n8UtqJU2TIcHVkklH1756d+pfnW6Xl/8+IXM3kM/zB71Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=36ch6Rrd/XloF+NZze9bNn6r8ieYeK3dzXudnjNJzhY=;
	b=vtt2pk5wqS952o0XCVjCKVenxZJrAoZQv6G2pT8hFw/vrBPWltf3lqbJfUe3//KNsvfd
	 nd8Px1/8yj1diIDbW9Lp2uK1HxEa/iHcPf8/u2oNDemttZGo5Zs2Z25V+YpHyKZ0f4LQI
	 K451aGW1clM5W4v8xbVst1tWoLHuKiMrZzSOwTG2whdCS5J5yickk0yJaHa23FFmLwsmR
	 M4xIYFRgKjqRoZCwXZwZclVaqc8nife1mcjdkwm+k+rOl4viFcXX+/38wkNvXbyWAZxqs
	 2HAJ2/pqNpQVtWUhPhPREgJZcKhEpcHx+cjLT+LKPr2j1W8avtxtsPZECyzdkRhMabg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEEnlkjT;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A72606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A72606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEEnlkjT
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so509705a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795151704; x=1795756504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36ch6Rrd/XloF+NZze9bNn6r8ieYeK3dzXudnjNJzhY=;
        b=yEEnlkjTqdCuqD3DNcfYkcN+9CeNlfHPwaP0afFf5bFX0vth1CqIqxHLznZHBzirtG
         4QPlseyBQMtLU0c/nw6l3dLJQeuEAfVHpFspg4Xqtn2oH5UG/nDCTxu0FgCHp9wd/v7o
         0BITwf0vaT/2Cd2D1rslStVDQQM0aYmUkSaORZDgEDUl1E6mfzDEkMz77yKFqUvS+6HV
         WrjKINqo2sKxoHAem9wJOnssOCGMKmp0RIHBfpAsKap/MFzGnhd0FMBoPaulz3GhKV/H
         AW9Mu/Sjqm8CzZ/BF4rFKQQXeWOJSYto7wn2RJvqeEIWqztCsLGq7NTopfX5bFZnK5y0
         rsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151704; x=1795756504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36ch6Rrd/XloF+NZze9bNn6r8ieYeK3dzXudnjNJzhY=;
        b=OkErdbMAIIoIsoGuH30MqAUMgS4Ld4tEeQkWvNe5UXHfM/LBy2MsmZy8Jpr7rHj4vA
         CqXkiYxq6cPtYOLTMzSA2zbmJ3fEk1ucuwARh7sXGeEY8wXOVYbEX4bvamiBH5WxW2eM
         qCN+p25Wl8lRbnVCQe1KqMAQyokhSWRrcjrUSncPpDXRwtDHfh5J4lTQEOQaU2L+FBxq
         gUa2fHXv3nc/1kmJMW0kHcfna1ejKRleYLRqvDJOsDunT9d6RI1yFtQgbQSymvGcXcs3
         zBndmENadYzPLAWB9e3a6F+mDISgMDKve8Lr9zDWDv1bhOC6zEN5TqwS2hdaq+6x5YyI
         048A==
X-Forwarded-Encrypted: i=1; AL+hErH3PFbdgaCfQB1D81yKmitFm7baboPb021Yn/qvnVIiplLDmMITX+qqzWkaktEAe4dPOL+OXNT5xy7FvCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/njaR92v3dTEYHuFyCHqNm84iWlZaS+T2X4Crz0ueTB5I20MfK
	q+oy5FsHsa/c+LnABun3XZXwvmUSxk3e+2hM4Axsggq755HfM6GH75n7
X-Gm-Gg: AZFdTZcxP8ViVH2CGDJa5dBkN3j2/j8Jy7ks90v39FGr2EeTRaRPUqmYAg7dtmwQFtr
	7uZlTcoJFDjnREDAhKzYHT8v2B+NGaMCfEchBEYnKyXR2JQ26KgerH0CrFkFJnrwnNqBeGqaDkP
	si4reGRT9nm1gu+eaJSDMDFVPK1Pwi0oj7XM+cIsbXfXWSbuDL8bYAIwpG4uScn1TPXU85NLODU
	EsAXXjn2KyKyeZIGUzO76mmQWq48KanexV9ltfIGFR99TB4Og6ztJZDqLKgtNZVwrQV1KLMMo/Z
	8ghHbjowS9aRc6++CXFGjCjYOmXQTk3WDOwErNcmQs1Ua5Oc3B1795iTrtFrb8ezEf5fx/u6YCQ
	pPnMjNLzN4g2JINIywA8Lchbp9O4SZXDgvIrVVqnYGq1strSjTmTEI1JzHeTrR6FMXISSuNdwvD
	02QC9qZTcqs7WK8Bakrc808miyQbhqHOU09V+Dys/t7DV9CTrr6l462yud+UTGR2J/5KREfJrQv
	WV/cjtCkG9EOhCJaLR8LTyfAoQzDpvZ2ouZ+w+bk9xCSka0GMD4GBPLHwWAfnov4erqzKbI/kRK
	yhwdcamV1BZ5EXrgSY7byVzhrtDGBqiawtbdSOKllJB4KZiugw==
X-Received: by 2002:a17:90b:1802:b0:3b4:1359:45e8 with SMTP id 98e67ed59e1d1-3b41c92c55emr1663704a91.44.1795151704228;
        Thu, 19 Nov 2026 21:15:04 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm5934541a91.0.2026.11.19.21.15.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 21:15:03 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Matteo Croce <technoboy85@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: fix overflow check in rw_verify_area()
Date: Fri, 20 Nov 2026 13:14:57 +0800
Message-ID: <20261120051457.47753-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAFnufp1LcTCLtCrd=iLxD7DPaOouov=BW=Scj_yXJ+Pn96RKLQ@mail.gmail.com>
References: <CAFnufp1LcTCLtCrd=iLxD7DPaOouov=BW=Scj_yXJ+Pn96RKLQ@mail.gmail.com>
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

Hi Matteo,

On Wed, 24 Dec 2025 at 00:28, Matteo Croce wrote:
> Following a discussion on the coreutils mailing list[1] I think that
> this should be fixed differently.
> I'll be back with a v2.

This is still present in v7.4-rc3 (65e4fd942). On a 100-byte tmpfs
file, a read that starts below LLONG_MAX but would end past it fails
instead of returning 0 at end of file:

  preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
  preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0

sendfile() with *offset near LLONG_MAX fails the same way.

Are you still planning a v2?

Thanks,
Ding Feng
