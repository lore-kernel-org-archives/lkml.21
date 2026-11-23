Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412860;
	b=4zyZeNOm8azMqalKUWU4HTOYJjNJ4ftp/AtRwVYud7lM2K6VIeRIcu9TCTAqoctdPJy5
	 2GPRzmbFum1/1IC8Aj5a2+ZsnDpjyATFS2ZczkwbzTuULAH/dq2MejQjzYWWXsBq3buWL
	 9vymCUYLWS/6NZIjWv+mNzP6WU8XNSKf6qxcRrHp3lzsZH3pE8WqkSXrW94TPjn3oUIXz
	 ftSw87C5evxYaH51kqIDl6AZzeDx+RXz4LXDNLfa6sltAd0s30Fo4ll7ODSnRPfjrhZEf
	 qALt9VwUQRGtjv7atasYgEEVo56bofg2fyPj+XJnAl+42VkFLk4s1EgDoM7gtAuZIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
	b=MdIOahAKmaRog+eyL7vPGyCzDiQo7BW6iwlUCN5r82adukAW0XPolEqEMBdZjDC/UAjb
	 G8PXtUQ0XC0vfIK8qjHb5eApATGp+L8zuZn42jvtr56WDyKUD2kLgqEaep+naWxPsdirs
	 q1tEM2d8Cy3x2u2geYCTVFzVD+eeMWVin9muuwsIBc8mhHJd/QUG8uyqliE1BogTFOxOE
	 alD5T7a4h/Jhc4oDD7Ob7IK5eqCcE7XzbCj+u9uwIs916q3smzHU9w85hFcW8swtR8X+3
	 j6plFMH9mSx3++5CsunpxTIf+q81oXYjnBdqdSVATfwXvwBKb7BRLRGxK7GHCvxbQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCHY9AVq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D650606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D650606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCHY9AVq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380c28f9e35so3972449eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412860; x=1796017660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
        b=MCHY9AVqZC9aQpZildhbGqizSnpPzK97DMOOMOEBeFLWsjgKy74cwDx/5kroapgyQA
         jJsBv8IduBowoCEFmO+Za/sJL3lCTr3n3X8tt+ZdCTtFyOCJhqqRrBBNSObhPR8u0U7W
         82RBH0oO7DbUtS2A+XVRayPi1J1/FlvE9VMLjsSu//Rgvv7G5mZiUKr021wXeM6DAoOw
         5Ymf5BJjLgTMgVHejTuG4ZdJs7YffWRsE6foTx/4K8xn2Kx6V6AnnM+VArv9wngmg3jo
         Rf+xmPm2zbCmG/UQ7Zk+x5LS/FZ12BKWuAphi6fBF2/njhznksYHkZcBXTasnwp+MkG4
         iDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412860; x=1796017660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
        b=HwoMByx6TRFov52H+sBgFlOWFLmy1OxGu/Jp1ycMx0DeXedkEeUXhWGAAwenEvJIb5
         Q/fugHVG9Ie1Z2m3Q+a1BAVB5sNA4DZ1YhjaVmTcoa38++6R5dVErY+eleqrGjvoFptZ
         eal3HiGJNHPlI11wb2R9PgDZ/bYQnpm1sJxVEqJe8/kU7RiTFG3TZz17G8Vws5fp6RRE
         7jsVy3hW3aCqcZFEmavirTDA6yaCflB11Wj5XHIKK/9tiN8OvBA5dEk1aa9SIELrFL81
         9mCA2tTAEFws2NeaZNHoVgkskvKkr/ipbARC3oYKC+nUZiTcu2R83t9lQlp/Hsb6pkIW
         N95Q==
X-Forwarded-Encrypted: i=1; AL+hErEs2hH2qbjjyBJ/GVW3RmGkMFpE6v+7eoh439J/voRGzx0XLuPi6E3eGTAqEIya+lu54A5wadDDpk2FQHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dFv3d8eaF6mdTurKazzSTT8Pxh4vSYqXFZYUh7mhbpEXFcrrq
	2/rLOgUPSTj04NNxx9LIoEVdnqZ967n+fUZLI5coar8WXTl8P4sPpG8=
X-Gm-Gg: AZFdTZdPA8vMbyOmNKw44jTFUlyG8hLXeBGuCoNp4/9u1/HHdz0N2BBGTs7AZgqZim2
	fofWUK/88UX95hrnLA74O0sk77VOFbVgwZu+au4nl9eMYOGyKFiFEnWuxW4BhMY5dcYX+oNBOMs
	WL36YsC2mZHZw03YCqcq6jGnaTd4hdSluuB+Dvs4XjiBsJmajd1ttFkNItq0c9Kd05FOyO/5CBx
	6Z3eY/eoBLmh42xWxqB1R+1GBTuzJL4JmfqDFuWQWoHk9Ck4Q1gSykRp81JiAWkTlTudmAG+GQh
	x9biakKkhoBxYxJ5/nLoajRGenT8EfpF8ctrJoeTcO4tsw6+1pXYVs3h00rZmQuL+/cftNQ69bR
	SB40mQMeo9SeyJOP0VnX9XlUWn8/5y7CPAb/dfy7Y6RSTFoSU/EC6J9OsYvvp1SYmvAQ1AyEhji
	WVcJUJa7fb91hkd5qPZHsqXwd5N7bKIt3sxYUHcWBleUXjIHqUYPgRc262iK/Pya/ZHjXdPiTEk
	iJT/ZiYIGHJHnQGn3kh9mL9UWRpG7UCGoj0cWdcUJW48XcNvK9mZ6xp6ECHOabv24pQH2cm5+j9
	loAavFb3s9bndrEzgUxx/jsL1PyU1sOpxImSNgxZl8ARy+YcMqknN9zwPTE6hJmjQyAReTOe1FT
	/Gc1/hzCj
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr10412904eec.19.1795412859588;
        Sun, 22 Nov 2026 21:47:39 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28544419eec.13.2026.11.22.21.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:47:39 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [PATCH v3] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 23 Nov 2026 00:47:33 -0500
Message-ID: <20261123054733.11175-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112342-engorge-polymer-0717@gregkh>
References: <2026112342-engorge-polymer-0717@gregkh>
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

> That feels very wrong for all non-x86 systems to be forced to include.

I understand that it may feels wrong, but the file checks for CONFIG_X86 and if it is not true, then it sets
x86_apple_machine to false automatically

#ifndef PLATFORM_DATA_X86_APPLE_H
#define PLATFORM_DATA_X86_APPLE_H

#ifdef CONFIG_X86
/**
 * x86_apple_machine - whether the machine is an x86 Apple Macintosh
 */
extern bool x86_apple_machine;
#else
#define x86_apple_machine false
#endif

#endif

^ complete file

> and this still feels very platform specific, why must it be in generic
> xhci code?

Apple macs use the generic driver, and i figured it would be best to do this as a quirk in xhci-pci.c
If you have any other ideas, please provide them.

Thanks,

Atharva.
