Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795360130;
	b=FGgHHlIC4BjY8PJrEuzap0LCfxkvSZTJdThIvWg5BJe9yZV721bXWbb0Z5BaT8ZTshiC
	 0DTcC6HtH4QV1Jm5ith0wW/njvsmFL23VJVFu9094/m92lTNQrkukh1esRr/f1dNMLtGe
	 PFfxGsl0Ggf1KjntpjwuKtyppJUqvfWsJ41lo1Crs9tBKSAlfuyDxQrp1zSBnE+jCQhlb
	 3YPpdZpj9hx/EUuYojl5JoW5ifqZ+KXsqMNFKMUYhr5CaVxJrZmLgp8Kg3daTVzm8dVf0
	 Fa39QoCnRjQkHYUGE38jh0C6hEJQJnwSv4GES6xUuj8HjUAffFpnF81jc2LBx5S6Siw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=lw9MciUR8Dx6onWycZr6wFAVtwc7HkLdqIn8Buz0VwU=;
	b=AdMgV8Os0HBsRDDoVrZ3ODSjG4Bw03Vcn6zfyvEQA4HqVXdV+MXKE1RPvJWR1Pztnl+N
	 ONN6OhuxZuCi9MDbVspMoZkgyBQyjpo8aXV514wsZJhmOWjAbrrtJ4sEBqJ71Hxk0bjcP
	 1++WKAlTUtGEldWnKK88VPdh+lnmeNB2W+a4STqG5poC9NSMV8lIcnCcpknRr2ePti55C
	 BJlSYpSKv/+na9R9zUvJU8GLv9iIixg/9X6vj3wFEwnJdnhctIH/KlLDEAe2mPV7uuGL0
	 MZekGyNZYlbHjjH2z9thI8JXcfu6gk9NoXpoKNZEbcb9nesfd6Xd2EAFBe0EJ/pSlXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTJysER+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9ED606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTJysER+
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso847365e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795360128; cv=none;
        d=google.com; s=arc-20260327;
        b=jhfZ0Brn8ip+tsmp9nvXF+hfuH0V9+rcylgB3ejkY/+0Zi3eBcwQWZo8Pke19J2Qt8
         5zRtP+iRwSXLYxDnaWX/1pbOSVEbVlxNoUOThVZRMyBpZ1A0AqaTkWcCZhR2xVBqzk/W
         3jpu8CmaWjFKuuQGTEFJbIwf+R5lRQiLOTiL1/w8ujqIVvG1XNpOIUHQIPqvECjI2HgT
         XqZ/0JIqgiUcveRdx6vERhZrs/tI81Dd4SUW1xRfG0NP/Hurb/A3q/iyAuCivO+P3G/v
         L7Mk9tgUHDEQJHPqLrjMyLsjXvY7ws+RDNBfAtqRQsLGmb+0dHKG2V1Rs52ztxIMX2vd
         ujIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lw9MciUR8Dx6onWycZr6wFAVtwc7HkLdqIn8Buz0VwU=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=GSdejVo+tA+sUS9sh/290bILdrvjV3tMg2svK22MgFq20pYvvvyHMR/32qDr/PXrXW
         ca5QzwkNPatM+Bh7b/h8tOGJNFqY+CklTwow2vh4CztvCUytQWwKU/Vowu+lTEPzHG6S
         mD13Ck+8ENN8oUR4+g5QapqbPLJV9fscQx8NavNdILE6Nc2JnLrB/Qsy5PMHMrYeQjlq
         M/wF8ouYPWtKJaCWqyvnpGc9xmlj3QButqRim72epobcdVcDX7KRdK6feoDMekC6AOhU
         2xvCYo1IZG1E4OH+40nBJIxt/Mr3IzlTEfzMc28WYC7T9O5DlcoY8iEBwo2VEb56J70B
         hpHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795360128; x=1795964928; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lw9MciUR8Dx6onWycZr6wFAVtwc7HkLdqIn8Buz0VwU=;
        b=TTJysER+Lw3trHaduoAed4Jz3Ed2Pr6ghJkfLCoW0RsmurfBk+/urxhJv7cV/wGv0P
         IMRL3Lr94o/WrVpuSv1RsgujWIlHrIXp8niktT41yMKR/eLFAwSOj2vTPr1Ga7N353kA
         RlIrZBTUc0aUZMIVb6t2Ckga+CTV+WvkH40OTfE88YQbOnUHlh3NgexjnV1Do7Kfoh93
         BwMqTmS4UITjHq77y0bWnp8G1r3GRl6e5/Gydobn4glHhmBDcWKDdzgWyU4cQ76jQ3lK
         SyQMmN2RkNl5BPJXg3bYLXPZ0aLkT8rsW2UDA7aUQC30XzOV9NRmkpupHbmP12TxsH3k
         dAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360128; x=1795964928;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lw9MciUR8Dx6onWycZr6wFAVtwc7HkLdqIn8Buz0VwU=;
        b=JDhabkpqZf0BSTaTxfOYal2x7GzFaCtFbd6gzwuYCL/tQVhL06SSwGBOIYPKFBdsdW
         6PF6vPBq94R5YscZQ0Llg+4l4GP9j4ueEQf0U5t5y4cIjN6Eyg+FGx0PDIKufpx6dNEv
         d/D2QxDMvg2t6+NkjXkcz3hxdB8iHTUgoYvCMaofD0wkSRCUJhzVqqm6auRzxpBMqWNt
         tZGgJPWZX824zeH5TkeSqVE+tgRXtv7zS0znCwlTaJJ4Z7y1VpnetI4AxPFrX2RdQEJP
         EGyxbXoeJJFhO0rP6CuRCQmWQgDGAtlryyn7518sQL416uP9OgLZaQrs9xvTh4k6pyCT
         LWOw==
X-Gm-Message-State: APuU4Z85sShml3bZcp/gN+eS6QYFauMv8o7I5xHpuAlPoER1hngZFWGk
	c4cgVuDVsIICG7F4r5bmNIA35ujGG/yDgl2v89P3U+ucbez9+cx5d7I2/QsGo3daBccwmlxzBzU
	zd17MWslK2Mc4115MbL9s/c2KMTVCucbpixxpxTV3Fw==
X-Gm-Gg: AZFdTZeTzXlm2MKPTkmHntlO11l3His9eCkZJ27cxZraCkSSIipJfP2CmzndcqMtOmX
	cC0GMhdRycGNQU4A/TN8yMX2aeStgJEeGFBkzxfReWE6pSvp4Sm9+TRzJh+rYPmpdk5BaL39pOM
	XuI2BZm6HpXc2RhLF2SyTzr4u8GZJKdJkFM4S3yDGfAILGpbn2PZxFHn47hkq6nTwcyjapWQc8v
	PSU/Lf3/pFcvF0uWGky1nko0iRLZ4g2obTIgqnmmrYS4DiOo/YjROwVUXSKtuKlKEHAqUaLUnTE
	hp2f7WrD+YHJqt8JNkThjqnXw7uYSv15XFTfyG7vGr0rpAe/1BihU7NlPlQnMELbsT9Jpz4nIdR
	dbQMf8Qj64/qa7FqCAXT1r7BHDyLBqPl64SHkSD24utWLRTbEn8Tjqe9Q6GJDRHG2qICtlTRCSC
	mGHlXHHJYsYdAK9wLsx5vRnIWt7f8RfmrN7oQah3dTt+DiFW9XWcYxVlsMuG+pHSK0KJs+qhPG5
	GnA8bhQj/iCQ+lSEmq16KlSw64KkQq1Z/a4O/PX9s1B+0sZx5TeWD5nnSIriWBIwmo=
X-Received: by 2002:a05:6122:1d8e:b0:5ea:e7aa:acb9 with SMTP id
 71dfb90a1353d-5ee8aeaa9aamr3826549e0c.6.1795360128517; Sun, 22 Nov 2026
 07:08:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Francisco B <chicao.estudos.12@gmail.com>
Date: Sun, 22 Nov 2026 12:08:37 -0300
X-Gm-Features: Aa3M54qGEjVOXLYlyqnSSlFmm4C0s6VszkOFK6kWUbERMuhFi6x43nF_pJUZO5s
Message-ID: <CA+KC=zfk4Gx3y2dw2St34RHcej9fPYNk1AaYXqgADipBEwfgUQ@mail.gmail.com>
Subject: Request for 100% Post-Quantum Cryptography Adoption Across the Linux Kernel
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux Kernel Crypto and Hardening Developers,

I formally request that the Linux kernel transition 100% of its
cryptographic protection mechanisms to Post-Quantum Cryptography
(PQC). Since we cannot predict when quantum computers capable of
breaking current asymmetric cryptography will exist, proactive
migration is essential against "Harvest Now, Decrypt Later" and future
forgery risks.

Standardized PQC techniques already run efficiently on everyday
consumer hardware, for example, hybrid key exchange like
X25519MLKEM768 (X25519 + ML-KEM-768), alongside ML-DSA, SLH-DSA,
and/or AES-256, etc., across kernel subsystems, module signing,
WireGuard/IPsec, and dm-crypt/LUKS.

Complete PQC coverage across the kernel will safeguard users ahead of
future quantum threats. Thank you for your time and dedication.

Sincerely,
Francisco Barros de Aguiar Pereira
