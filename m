Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184235;
	b=OC1I+WF5gZkOZWflmOLv6tlIp6J2wo9O9UEjEzf0oTR03SbNcJ098i/a9pIBDtfpxNH+
	 MuxCdr1F913AC3r3c/0xX23NSjfyv5ghxuaBZXuG80An+Ms0ylKLbkSS86jncXUiK6V8W
	 fY+dtFwatEgyrJu35M0E4IQWVHpEzz0mTkiq2yz+/WdWsf0sHylYQDnXuUmHqnxon+VX3
	 8g8HfZGTmn0/nYSgSNpTlRGQYa3SyWWVf0eB/pLAHAGxmxdGWZId97CgePlPc1Juk7ebr
	 Hvh3+bD2zUeJKaTiOi4lRQubsM7fZ/5IFLIWXvXrSW0UAt0yjOPdsSrScp6bGyftfpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
	b=2mFBu5iIc5JVpD06hD6sw591+prYTvpUie9UnFAvLCm/ybJpg+6BWLMqtEl+Kb8F2Wng
	 8f1L68nBZMuf/quN14oSumvskaWjCxG76+02M8m9p9qLxVhk6tQTc24Mf/DFkWdwtwfK/
	 Alid+YH1OUOCr6bIjjIa5u3damZtdM6KVzF/pQZn1FnWewMUgSd+7YQMfvgEiFa2lb/rq
	 IzX3WiVwbgaV2C1kGBbBPRk2oD0xz0zruEj4F8XU+THjgQIxQBuOoruT8O2frz91DZWab
	 qMllv12WitzKfu/B64G5kYLnt/azfb824VkR3uhwz6sE6o4KkMj30FuG5+zGKGMINdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YEK//hQ9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A01606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A01606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEK//hQ9
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da62357acso1525938d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184233; cv=none;
        d=google.com; s=arc-20260327;
        b=RVWVqkLudwY9ZO/31/EHKSZZBDumWp5BwknsDX0p/IWZvk1AKNlv5Y+ZLxcAMXsTph
         DqrX8K7sy2sLsVxEEfUFRALWgzlyI9rMD5eRqBFqGXvrvL3hrja/SWx1jO4l7esW0UMR
         6A80zDtzV5TF+zVrD5KMVl86KZW58VJugQIrb0LzxVXbf8pYt2MI0NT50laHHDdVrXnl
         eMO4jR3OV4/fyqbNrgjJbDlJ0sCUcllltUcFTycwMlY+xGLB9Sv/RF0YGW8f30jVI+3b
         mDz0PkQHEVXw6AyKo4RMbg2muIcTEYKPV4MlR+q6J4C+oBHTbJMdJMUOiUT7BNIMOb0+
         wfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        fh=I2oimyxZ4nM74iAI35BY6n3TXPAZIOqdIRUk45xjh54=;
        b=sR3J7/a6G6whckdxHoDKVo6TPbDTnBansKB3l3Vmtsjnc2hZHON01fkJvUuM6mBSA+
         V+8EMx/42uKM0Jo7Q3cwIJlV642325rn38IiM4sddvNhsR3YaCaK4vTL35OBAKHE9Xjg
         gssjSPOyjtStX7nm/mZQLjNRIKkbKe9zgr7yAPD4ahb9OVmoF/pXU61NidzrFmOxqg7L
         FaPDZr6kGQvzqPAg2qQO49ZG2TxSpDWTpuQIXd5EdJVHFTirZ9iBGZqPF43r1aOeGt21
         MXyC53dCqOx60Zm/GRZ6Ll3A7FDiSgQIk2+PTrNYHA3M4A8D4S0uWhtF8M4yoInjTkGs
         gx9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184233; x=1795789033; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        b=YEK//hQ92qCeZ5YrYBjb2Y0lt2w5g9sVAhL/Jj61VnRz3AJpV8PuQmEaJvbI77vLFw
         gpGszgrU+cXLj7Fn1XecdPJmCtbOpwDmEOAXKhnJrhfFagCVK+3FDXSAaWszoyjeQaR/
         IVCo4uQ0AOUchmGalWi45n/V810OBvQig/qq5GOVtgda5FM6dBYNUmOgihTtokLigO6e
         U678SjuuV8s449bwiw9o5SnXt5HlI1/34vBSdpoJxzQOWIRpeH5DHO6eSYwM4YUQir2t
         ju5DC3Nt0Kg3WXRMXg/V19NC0r6RB3Yh220Pc0Ml6+XfyUmUFCSHRqUnD0rK/xXppGCJ
         s1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184233; x=1795789033;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        b=ICCG0fCg8ggF5nSFUFz/P//ozK5t0UmO2fK2xSSlgDqUWSbWXo3KD/iZN5J8u1N15q
         nazS0iYcTOoAbl1CBywiMSsKMJ4v+Z3i2+Ev21HqVowtV9o+hTOS9Ei4EUiwCNwseUP3
         d/8XxP2Iv+qAbF+Ys7/VoXQBrRyLD4O7+buLNGkV9UmJIHJ8bxcyNoq2wq3Dk6yNOH3E
         Do4is2USBKSAHWO7OlPySRGLzyqPwmqE29wf6Mhl8aJtlgp/1jtIapaSK5nnIRdlYQVH
         KHT7AYZOztRzL9tLAwt57ZcVi/KpFuIpMw8WwyqBNKEumnWGgMRK8R7qtpC3a23zYqUw
         6Nhg==
X-Forwarded-Encrypted: i=1; AL+hErFuRK1rRq1eGNBuJUxrvRLQRgTqIf45UvjL4Rn1tZL22k4bEV3WDx+Dhnzs9a8cOb1eBLanV88ZMZqjU4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+br2y480yERfTylYkNpJx7ZymHfwf6ECl+nSvt0QP8/gtJPgoq
	WuljB507D5aGROL0RzsxS3RbpcUWMCPXCI9IOi+ndEGTc1HXZM4Xo0QGu9fgZNOWS0DptE3wfW7
	NTvf1ZBkx8Qzk4AFjcXXBwjA4JCeNrQE=
X-Gm-Gg: AZFdTZfWPoNMTVxrdtXcx3ufxawaNOY1djW/u4lTAGHhYzVs8rj+/RHiZXwAXqdmI9X
	0LncLGC3EJ2d9yVT6PagyWKO7seMeSZKjgQNlgCa+8FAWEpg76++trg5rbnZAnoU8sr8RR3qgUK
	1B4i7jA8jNkhjmeizk1sy0Rpc+MEHe6qDTHJuvJSiVr44D4hZSvmiln0UAf8lRhr96iuyus+USa
	qjpjSHec69mTz1YqW45elLCm1tu6N/1zs5z8z4XWL+aFWW4gpQnjy6Zj1F0/qegbRHvRTMxUckB
	4rxNDPt1zHRmhIMnOPM32cY5YRrDWTzb6ufhtX/AIv7eiXKVAys022EcmnDDdTA6V1pN0Ie2ex1
	ZkKpDxtmo1SfTmv/zatFiuHv+Q7fe3b1HXXpYBzDcxWP9msM4AiNE7oJpFwV9FSbElhIF72MUlS
	X1nob7ydFSmqpN4bhBL7U=
X-Received: by 2002:a05:690e:4810:b0:67b:e603:55d with SMTP id
 956f58d0204a3-67df45070bbmr813282d50.105.1795184232919; Fri, 20 Nov 2026
 06:17:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
In-Reply-To: <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:17:02 -0300
X-Gm-Features: AclHuK_REKXiiGr1SmhEs4lE_lDxFUI6ludk8ibvCaBmHbvU5wmVfxm8YkH9nNQ
Message-ID: <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

On a TP-Link EX511 v2 (RTL8367S-VB, CPU port 6 over 1G SGMII to an
IPQ5018), on 6.18.44 with the rtl8365mb DCB QoS series from net-next and
v12 applied as is (the same code as v12-pre5 in OpenWrt PR #19644):

- Live vlan_filtering toggle on a bridge with a VLAN in use: IVL/SVL
  changes at once in both directions. After 1 -> 0 the hosts are learned
  without a VID, and static and group entries with VID 0 steer, drop and
  restrict as expected; after 0 -> 1 they are learned with the VID again,
  and entries with the VID behave as expected. Each toggle that flips the
  switch-wide state took 20 to 30 ms.
- The rollback added in v12 is an error path I could not provoke here.

The rest of the series passes my regression test on this board as with
v11: VLAN-aware and VLAN-unaware bridges, PVIDs, isolation, FDB and MDB
entries, flooding flags, load, no driver warnings and no port errors. The
QoS baseline programmed at setup did not change any of it; QoS itself was
not tested (CONFIG_DCB is not set in this build).

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
