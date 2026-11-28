Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795830680;
	b=3YNN85F8X0mLKEt7TTIh+zuNpqcjGrRTxZpL4f1ZEAgiUKomrrVT8/jEKPrLruluxewM
	 25U1TlotjySzjoYgSN5flpwhXAMM5MJRVhfLXyIXtvD5cTdrSexNSilWX8woHMPfJq3u7
	 hTujM4YZiPlu8dmMPTlI+5JUzl6//6mlljQPtuBgAX1A4K21YdIgUbDXioHOsM9gXarDE
	 QmwnzGXMj+AayTEfo6hsvseqTkZSJWDIni8wpioveVqJLYclQ7h93PT1scm4DYuWOGk0D
	 hy5qzwSdPUIsxQJBfbQHESKF4sCuL7pDvFdF92wieuqlWR7Pz749OOOniLOQs+jgN9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
	b=I5K/d1I0OruWpBohxY7/7Y8Aa1Cb6KNxKnehuRy7yjZsjKvb6O3PcTindoNu02MzBOkB
	 rqa26Zaf4krYFe6akAE8G5Bbpe3ZVqBuWuMZDRbsgtEI7S/81PmrSxUD/3XgHCcpc4sHY
	 pPw7KfbbWndyvbZylk5MOQdBl/joohY4jMQVLT9mIVL2oHAYhdQvmjd4q5Mk6ZT2dy+Cn
	 JU8iShqzAHXE70w8V54dcLJbhjMO2o58S7msD5KJNw8vO8XrNtE2K3oIiekMf4q0gLQrC
	 m3fIex1gP6PmOQcE7obsAWnGTkJ4Wzf94MOR80BOK+Lv/3MYkxdQdCVFjFwuxCPZF3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A0606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833A0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so1088801866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795830679; cv=none;
        d=google.com; s=arc-20260327;
        b=clIx5Yd6H3gpC4J0TAZHn+KdnPIFYWTD78OG8STEuvaxAxmF4KmDaP+C6htnrVD9co
         WTFSqk6OejNjrMuqQJgSKewcssZrhFpk85UPI/9Da4MXNnnukKjI1rSAXhWDNNH1d897
         mZdKZdHNIGZ0hT3J7nAy7GGv/JC+YX0Oa2/eMS4q8PDAwWyBRaGXRySzULI7jj62dP3S
         +xJ1Srv4gWW7GJPgrq3Weks5LyYxNWTOdYc3DpDK2XhnfSYirOtHg3jyI6xqMRgGXw8S
         IdKGddsWH6y9l1NnfztoCrTMPPYCT5eybSnkXJ2JIjRGfkKknSLnl4ztDLo6/c0WCDJ4
         LxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        fh=gmdVhh8NcH5SIrZFbduX6DNIWCUi5Uf/oP32CgSPJY8=;
        b=Pugd9jsv60Xjo9HKD9YKNHlvVcQsuv3SoGnCpl73DxOO3ctzni1GUJ8Oh/jLmyD+E8
         G65xGKUBg19HuvqaNjircdi6/sN7R0xO1VYPPiswp7vh+aJrd8wBSx7q6AwY3ZOJ/yvA
         UwHEPlJCNpYKghG0evon53bCrhmQqZMSy5EvHUz1GGlvRUTXw+WplN6EGSAX5v7uhSdG
         pIRYZmcEunhMvC/eORs/3v1XXo4/ATvtEvLR3vrq4aLBeFvtB5xQvE+betrlNHkKoleU
         MTPiupxbSNJzoFd14n8q6SepX0+14vKCNxmbOEuSVSWjzDqw0CT90ImovJQoDuRJQXwn
         F5kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830679; x=1796435479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=XLosXPN4XY1X7SNdxkqBL+OmW6RyoS3KUKiJGN6VkhP3L0yhHIWAe9gfCGB7c23JLd
         lHNLLgTgGaPV+ANwny7auVJWhylTPy7tn8Qbd1QmlxO7gDNExEWgSGEhy30NAozJQ+8+
         +xKv07hbVc2PMmC0nQwONM+Snu/fB4CVx2Zu1RVG2ABrNV3bydSS40OT+TsJEZK+JELi
         MFuPTs18dGi6k3X7RKL9C6rS6PY4lyASR9cQGoX1ApSJvF/sCt8fWc54v5qN8Mgd+424
         mRGAbRe9QyqlYYy8UZHrD36MAiba/qdVjAz2hG+uSVag6rBQPtZrBpUV+D6X33j1iq7k
         51pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830679; x=1796435479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=G0zVCqJurPu8QsegvdCF5V8YJvnezPyZsmXK7hsAKiYhWX2IV0ixO0EBDdYj+wxPJR
         cPxWeDWQ2x6l8vkiTLwWs2ioioFUlHj9IHBSWZpuKRiOBWYv9pbK2pmcJiqto/2egVOJ
         MYyuj3n4sc1CXf5TTjg2/l+5MJJjfauvnvJXUJLz/iYKEKsSW27ekuuX/q5dXWDf0zuQ
         tur9rluMHUefAQ68LsYfMTF5wEXgEDi/+SgRiqGTgUyC7TENYd3sUOAdsI68l4h8OQ4I
         P3VnthDUxb2thnnoIdI9tnlV4h/ZyEGyBH/ZXt9HFzXdZZQHQdedmNqqFv77MU6p5LhC
         ukqQ==
X-Forwarded-Encrypted: i=1; AL+hErGcbVX5i21HCHHGh4zbHLTD+L+k9ugR3w6hekM36UvXyw/fbNpCLjWJvAxrOYJIYK+WhzqiHeuIVxNCGyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K2sfr8JKgRyucp55jIIWM40LhR4oUS6yKoRa8/oTPY+Hha/26
	pwREW/7Wp6xoevHganjYVImnkLkmnTIfvZ2ZFoDL33YiXg+TfP1Jy0gylrQWcO7Qk8yjiIiq9mA
	AthxSOeDS8b107tv4cu+cCKr8IJCEr6w=
X-Gm-Gg: AZFdTZdGcCzDkHAbMQ1eVX5lvzozHyDtgtfJ3iW1bvMENw1oyQXJ7pMrJ0RerWUEvaq
	j5UgGtVv2/SC9hBSbp+XWFNc9lFRWEUorfmFUuV30OvkHKYTIuNdB0wyAuafhYfUM/AA6jmmhfl
	4RJSa8nOdRodz612ZArvfElt6EYVRt91XwT4k6GnFwgxnSsDNEQ9iqrIJWUEeCSsEjAD/05mun8
	7D00eQLqEDZZoiG9+MadGIRZY3IOdvhq41RDhn8P65tA9TxHTZi/RwU4i1IvQRxY63wHn3A1lwj
	6dvHthsD25xd6/hfeX+E+RjLs2anfiDLJqVbkr4coCtyEv0nm3I32viFtJQLhu+QW9xgVjCf94b
	5frKQJEnczh1tPe/sreH4A41nCPlwct2NKlms
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr1724212966b.15.1795830678877; Fri, 27 Nov 2026
 17:51:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awOQDOel_72Xwjm7@kernel.org> <20261127214103.542291-1-safinaskar@gmail.com>
 <awn-ioAuksHNV-Rc@kernel.org> <awn_Y7oI4ckfsjSv@kernel.org>
 <awoHex4LVst2JwkO@kernel.org> <awoO9R7YF_5_6dHA@kernel.org>
In-Reply-To: <awoO9R7YF_5_6dHA@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 28 Nov 2026 04:50:42 +0300
X-Gm-Features: Aa3M54pCi2p8qLdocdLXd3OCMkn8g_j_UUSVEEax8LAEOxwj1oFmxFAoHI8_4lc
Message-ID: <CAPnZJGBnFyrmr88OsYkMwtLiR93z4g0NAuoMurcnhcYFXz51jg@mail.gmail.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: aleksa@amutable.com, alex@amutable.com, alexei.starovoitov@gmail.com, 
	arnd@arndb.de, bpf@vger.kernel.org, brauner@kernel.org, 
	containers@lists.linux.dev, corbet@lwn.net, dhowells@redhat.com, 
	ebiggers@kernel.org, giuseppe@scrivano.org, hughd@google.com, jack@suse.cz, 
	jlayton@kernel.org, josef@toxicpanda.com, kees@kernel.org, kpsingh@kernel.org, 
	lennart@poettering.net, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	luto@amacapital.net, neal@gompa.dev, oleg@redhat.com, paul@paul-moore.com, 
	ptikhomirov@virtuozzo.com, sergeh@kernel.org, skhan@linuxfoundation.org, 
	viro@zeniv.linux.org.uk, zygmunt.krynicki@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 2:15=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> thinking more sequencing than data structures. I.e. I have a game where
> I need to end up to process creation without embryonic state, and add
> just enough weight to kernel to support that outcome, and that leads
> to ~2K'ish LOC of extra kernel complexity.

So you don't have embryonic state? I don't like this.

Let's assume the following situation. Userland's PID 1 is already running.
Our container manager attempts to spawn yet another process into userland.
As well as I understand, it should do clone3 with CLONE_INTO_USERLAND,
and then execve.
This creates time hole when there is process, which already runs inside
userland (i. e. its PID namespace and other namespaces), but runs
container manager's binary and have container manager's mm.
This invites for bugs. Other processes, which already run inside userland,
may somehow take advantage of this.
For example, see section "CVE-2019-5736 Is a Very Very Very Bad
Privilege Escalation to Host Root"
of https://brauner.io/2019/02/12/privileged-containers.html .
So, here I like embryos.

--=20
Askar Safin
