Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=136.175.108.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143179;
	b=S06VsZtEeg79+juX5zPrYxu5cxD5pBSuVm/vatpgEgx2qxWLOyN/+Oc3o7yWmpM6iQdz
	 j+GklNX1XEZjFyRDu2304sYzpymrGrAXIkzESmRVdR9at2C6VoAuPToL/b/mY+PGRWXff
	 p7z9YMl+eRsEYxbX7ZekiUHy85RRMJMeZ45v1GPzWQEgYQc/SHC4RAhVxbAyrl0IPkmUo
	 iGsb+7uuE15uYLiwhylP4lBdDl128TVPV4cwj7pi1ZLVXPn9EAmwqiPuHESYmLdR0ld4q
	 Uj3nTDqZ7WviCRW5zyBn4nmXiW4txb2yxE0LgZJL9utimVE9hjhTsTUEAwWIJYePfdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143179;
	h=DMARC-Filter:Received:X-Zone-Loop:X-Originating-IP:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authenticated-Id;
	bh=msYeIQlcLBBah1ScNLjcrzC4Z7h2py1hSnX94ae5ztU=;
	b=4p4h3brvqpL91BkO61Jtbc3XL96PXtOARpCs4+j5Jta8YYhIulI206EW+OYLCsYdiJs4
	 lWmnLXBhLX5MEjj37rgA0VmgHWERoMJjZi37UiuFUsQoibOQayJ45QLThcKGlLA932fF2
	 kIg1FH75CO118j1Jft80uBVzvTO/mSIsSJSdaSZvT6dQGpxWvE1hpNj/4ZNxd8O2G5DMy
	 qP6NVYTeQBP2r7d6Gt+oaiWRFqzLMZgQwegC0XEY7/dHwTQRKYr58jOnopmO9Qx5GUCQP
	 O1hRCnle2JGGJGOkmSz3w3L5P4gLe2ktxaDM+A+jIKn1E1eLnDmTXvwVDnf52S56PrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tylorstech.com;
	spf=pass smtp.mailfrom=tylorstech.com;
	dkim=pass header.d=tylorstech.com header.i=@tylorstech.com header.a=rsa-sha256 header.s=x header.b=1fih5ECV;
	arc=none smtp.remote-ip=136.175.108.97
Received: from mail-108-mta97.mxroute.com (mail-108-mta97.mxroute.com [136.175.108.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tylorstech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tylorstech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tylorstech.com header.i=@tylorstech.com header.a=rsa-sha256 header.s=x header.b=1fih5ECV
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta97.mxroute.com (ZoneMTA) with ESMTPSA id 1a1f6def3f1000d084.005
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 02:52:49 +0000
X-Zone-Loop: 70343a7895a823a07324f90f6484f35ff64e976cedfc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tylorstech.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:Subject:References:Cc:To:MIME-Version:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=msYeIQlcLBBah1ScNLjcrzC4Z7h2py1hSnX94ae5ztU=; b=1fih5E
	CVYF0iI3fiNq76L3wCq5alYWwCu9aEv7YdZr2Gbwn1WDQXDXZm5S5ieHT27fSt8c7QplB/Et39Vfr
	Pbv+j3n8EEHDinI5kme6ZB2TEFtKzdr4bCI9OIXRpTVvldQ0qKS1mUrKrW38xO59pE0bjS6yoaz0M
	KSDHmBHSK0MbUJMFGiunmYYGs35mUvRilNjleH0je3GNbNiut2/Tjlgfq4JIf1tlRSAkSavxCvqQy
	aEgEa0S+fkUMBkG8BtIggUt5evk1FzIcj0EX5Iltj/r1BHhfxl8nvtafzbgJqt7zLZuaoZ955APou
	pJOIwaLDEBEWsCpkMxVqCrvn/l8g==;
Message-ID: <088fad53-fb61-4513-80da-d0067da5c217@tylorstech.com>
Date: Thu, 19 Nov 2026 20:52:39 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: regressions@leemhuis.info
Cc: alexander-zorn@gmx.net, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <3b5586d0-b973-4984-9fbc-43c9ab960d76@leemhuis.info>
Subject: Re: [REGRESSION] Black screen after splash with Linux 7.0 on MSI
 Creator A16 AI+ (AMD Strix Point + NVIDIA)
Content-Language: en-US
From: Tylor Pater <tylor@tylorstech.com>
In-Reply-To: <3b5586d0-b973-4984-9fbc-43c9ab960d76@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: tylor@tylorstech.com

Hi,

I'm seeing what looks like the same issue on an ASUS ProArt P16 (Strix 
Point 890M + RTX 5060, Samsung ATNA60HR07-0 OLED eDP panel). Panel 
frozen on the boot splash on every boot with 7.3.4/7.3.5; 6.18.60 works. 
System is otherwise up (SSH, compositor running)...

On the failing kernel eDP-1 replay_state is 48 and psr_state is 0; on 
6.18 replay_state is 0 and psr_state is 6. Booting 7.3.5 with 
amdgpu.dcdebugmask=0x400 (disable Panel Replay only) fixes it and the 
driver falls back to PSR. DMCUB firmware is 0x09005700 on both.

Might be worth trying amdgpu.dcdebugmask=0x400 on the MSI to see if it's 
the same Replay issue?

Full details, logs and dtn_log dumps: 
https://gitlab.freedesktop.org/drm/amd/-/work_items/6174

And I saw this issue across multiple distros as well.

Thanks,
Tylor Pater

