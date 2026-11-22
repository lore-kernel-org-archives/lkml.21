Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320368;
	b=Q9PRdTYyMnkGMs8zuVVtyBworZFHUamEX2PZjtdD+9tFSL9DoU+80qmfL321xr1Ywhbb
	 CU2SI+8zTmmXGr9tU888OPbE2YbLr7wQGm5WI3vByOkzTZqQXx+MSjl2S6IxLi+izIyt9
	 AzxgZCNbkELHtIZ6JizCvBBtXgVvmxVswY32jbKYGvlX2EjaYujneGKdrGi9CN1mKFg4p
	 QGGTBbPdB9rHZ+a7ZYauXKCHf6c62+rawGU/dtLMK+sRtZcR9RlfTG3wqSqvX0cQnFQYL
	 Nv2h0VNN5IBZgv4PhsECqjPjmutBLUsdoyqqWhWoFGcqxEyrF+lSfyEya+DZHiWKFqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
	b=zQNi+p2f73xV7sX6R8nbULBpRN7OUerqfSuCCgn57CSJhUpjZI3xJUV85pUxPa7i03DS
	 PhIhTeK0qaZWSVNEb6/cWUWs/DdMmvv+AZYGkeUXVWBsWzhHnqhpYT1dZ8fyCV3R6RNhB
	 NSycG8a+SHdsrwliETUPje8lVQkJXc+c6xR8Zg/Q76vAW1JNKhDH4XjEiXQUVgLx/eztW
	 ISerB2nHxS/jnwDnbtD8XSbLyVDcM+6ggsedJNQStiYoXzPF9pHke8Jsk+yN034UW337+
	 g8/eFa/QrGr2zQVts3iyUG9jF4sRqx6OcJHeoynnEiFiN5iPCPYshNHH7u6c3HutTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evJm+oLs;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBAF606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBAF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evJm+oLs
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04ad2c46dso10317635ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795320368; x=1795925168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=evJm+oLsq+4kzc84VKAr4CtJzo3IfsCj/gVq3bR6b4/RunCaPdIAKKDRdB60FHOri/
         kXkXUd0mdLQsZD09OcorgB7ZMX+ElbW8SGM/rhASv2H/S4TvQ/n74BdpSG623qt//u5z
         j/uJNP4KhMU6uyWbwCttDb9FMO4E1+Q/ZvKCu+sot3am8SunnqGZPV5NgSDEKslxjHgm
         wiUGdjewEbxDdTxs2y/9gUKe2RNXOeRrSAiMr5oJT+4Z0P/P8FvOXQOm2AGNtYLiI9N4
         lSlvhzjKnZRdrISEPM0wO7qK2abATsVypk4L5e8RDNAkPgWRh158PSz+CsDiimAzaEyy
         EXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320368; x=1795925168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=TdXEZsxmw92+0AT2ff/luRLIGEqAQM0bAUf/mbrXc1zgZEwdMBV1tcdYUoZ2oBMPbK
         6GmWJYJPTTlk9uKoU+JAEqCBYIjkbIq7TGSsDTj7e9/em9AfyJM2PJLzA7sBNX96Zne0
         vUb03eX6P/rodduNOR8ZBDhdQ/WzHwcM7LpP19Vd0yI7RweNbL+e3MacFl7ZD1tpqJNi
         gHRZ4ks80z/dLryjUBXix+yPSzIOi3ahEQHGF5MLzjYKDqjYKSSSkfwzw/kGrjOPsDMB
         ozxClteZ1SwNPvmIvdj4i8ORrStUN2lTDhVT5o8jwcIrBMKUfOh6bo2LDi6ETx4nQE7Z
         XbkQ==
X-Forwarded-Encrypted: i=1; AL+hErHe+XFmNClg5bF5dEiv+esiUyQzXIHhQGPAkROm9sXfnlnQ5Eo68DtzXuv9vNz/+zR2Y/BJEOl5aT4BYN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pR9fqM61m41uTon0OA51kuInxJVlP2olhe0OMCQdxs6NxKhW2
	e6k4n3/rWKIz0BnW6vO8+FwefVbBoeD7Jbya3GR4s1QT1nGPRN5AqpM1
X-Gm-Gg: AZFdTZezJJOjJ3nC9r3q/mG9vhdFZAVO1+79yMs26EWQ3ufTVlEU4afEXEKnujcIkTr
	KEB4aMnZtVMX2tEpqHiD0M5avdAgBua6W8LC8Y5RUD529Y3pffL2Q6eXdpv3sK0WEJ/ZMRduh+n
	9FXk1zPj2/kR3+gCbRDcEgszwpIPhklwSpew1A7a9LKhF3n81YEQTHkXFpRK5fdAo9FkqaudpSo
	yxOBIrslE/A8t/LFD4KcAx+qchz31qhPuvZSBGGWBz+CDN46zgC2m5wAP1S8eCj1UPaUvfBGV5a
	6UfCwl5S9zECgpj5iDoD1zBPLemXmfCtKUjd8Vo5l9k3c0KzSp7sxzhIptj2Z02+AYsbpzMN7Bq
	zx2b3TlCF5UCBaFhgtjcoNsPmYpr46O5MOcGiq61tEcxUGK747H9xYyNWeVKn8jW7eAEHMnwmpI
	Ze/9OmxJSdc6ECVa7nzBfcjgwo5yozff324RjQTOOxGgwMlVkAT32DGDGymCzsDxBob8jTrN/St
	qYPe3ytvpZS02InQKWa2LcuZmMeIkOEkC2Yf7jLJ/wFDl8YLizw6xGiy1D2wl73WALu75qauk2h
	3DRHwxDHTfFFl84fptpIE5dXHEafEolTZA==
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr6039371a91.18.1795320367746;
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm10947018a91.13.2026.11.21.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix genex.S build with LLVM before 21
Date: Sun, 22 Nov 2026 12:05:59 +0800
Message-Id: <20261122040559.1120594-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
References: <20261104030147.3117325-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
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

Sorry for the late reply: your mail did not reach my mailbox, and I did
not check the list archive until now.

On Wed, 4 Nov 2026, Maciej W. Rozycki wrote:
>  Shouldn't this use:
>
> Cc: <stable@vger.kernel.org> # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer enqueue
> Cc: <stable@vger.kernel.org> # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace damage in r4k_wait from VS timer fix
> Cc: <stable@vger.kernel.org> # 6.6.x
>
> then to get this all picked up?

Yes, with one more prerequisite after 56651128e2fb: b713f27e32d8
("MIPS: Move r4k_wait() to .cpuidle.text section"). I will send v2
with it added to your tags.

56651128e2fb adds a .previous after END(r4k_wait), and the .section
that it pairs with only comes with b713f27e32d8. With only your three
tags, on 6.12.118 and 6.6.162, all the code after r4k_wait in genex.S,
handle_int and the other exception handlers included, is placed in
.init.text, and a malta kernel hangs under QEMU about when the init
memory is freed.

With the four tags, the cherry-picks and this patch apply cleanly on
both trees. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
and with LLVM 13.0.1, 17.0.1 and 21.1.8 (on 6.6.162 also 11.1.0), and
kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU. On 6.1.y
and older, 56651128e2fb conflicts in idle.c, so 6.6.x is as far back
as the cherry-picks apply cleanly.

> Or is it unsupported annotation syntax
> where a prerequisite matches a Fixes: tag?

It has worked before: the prerequisite named by 4409df5866b7 is
its Fixes: target, and 6.1.76 and 6.6.15 took both.

Thanks,
Tzu-Ching
