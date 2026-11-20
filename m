Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.202.70.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141442;
	b=lyL06ujpdcvD5fS4r+UgOfRfKL/xeg3KmFuQygFGgwIDwC6Hfpj0Vci4lK/LDhGqj5Kq
	 xcu9RWGYI1ERBabMcNCXvPSioCNhKmsc2w4CKRP2arneo6/reMy85ItqEJ6gf7xgS1Cyd
	 eUciHtSxnZVR4OJsIGSmL8ITTa25ayEN5pCUxFUhtylK4YPFk+qsPayHepn1VRty8XwlS
	 MJAm3dJWPJ1mcKp9E1qFrrIm6dQa4Y+Nz+4eKH3JE7GGWMsj29iXZ4M1GV3ivYkOXKHMZ
	 oxT44/3hcYKtlJa4D9evfFooHSO9LBabBomS9wBFx3Qvs/FZPwcu77JXg8rizXgGAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141442;
	h=DMARC-Filter:Received:Received:Received:Date:X-MD-Sfrom:X-MD-SrcIP:
	 From:To:CC:Subject:Message-ID:Mail-Followup-To:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature;
	bh=BxPM0GoS+3d23HxtcIoWyp1oqestr/tiJ9Eswggqs1Y=;
	b=kpSR7Vm+U9kB3ggUbW05TQsMXsk7KJRmGMWjJ2IAUfwXpUG103VQBOdYUxzqT8iSATqd
	 L0UWm21GWim+n377VW1vjEpCft+heb6MbqxpN0ZDZNtYKI3Kzl8YF5xS71FRdn2WanRq9
	 WnoB/kgIQlvLH/HrV+YP7EQ5renyG3Z7bUpTlY+q4SCbgHik5YJOaoVYWgdCU9omWBVgm
	 pI2zSUiK3TLGoH1XM6nSA2N7BPhEKXrNzD5EYmpyFPwFxWMb/OBWmeAtAuxhW+l6/0JHG
	 Wbu5CC0c+4jSg/H8NZGhCbTwdotHG4GIK10u2sVhQgtiZw/rm3sNzH8H9tqmEVkBx3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=didiglobal.com;
	spf=pass smtp.mailfrom=didiglobal.com;
	dkim=pass header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=AQBudL2S;
	arc=none smtp.remote-ip=111.202.70.124
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0EDFE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EDFE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=AQBudL2S
Received: from mail.didiglobal.com (unknown [10.79.65.20])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id C2F01182F9C2CC;
	Fri, 20 Nov 2026 10:23:44 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ02-ACTMBX-02.didichuxing.com (10.79.65.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 20 Nov 2026 10:23:44 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 20 Nov 2026 10:23:44 +0800
Date: Fri, 20 Nov 2026 10:23:35 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.65.20
From: Jinke Han <jinkehan@didiglobal.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <linux-kernel@vger.kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <nik.borisov@suse.com>, <rppt@kernel.org>,
	<peterz@infradead.org>, <mhiramat@redhat.com>
Subject: Re: [PATCH] x86/kprobes: Fix boundary check in insn_jump_into_range()
Message-ID: <20261120022335.GA1970@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: Dave Hansen <dave.hansen@intel.com>,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, nik.borisov@suse.com, rppt@kernel.org,
	peterz@infradead.org, mhiramat@redhat.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b136b9da-7089-4232-ad96-6174a48844d9@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2026; t=1795141425;
	bh=BxPM0GoS+3d23HxtcIoWyp1oqestr/tiJ9Eswggqs1Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=AQBudL2SS/inTWC/tahe++QB4x/voFAo+2F1mwyAZCfp3J4KBADak6TDLiqVWlNUI
	 qHvvlX5BKnBh1S2tOQy4rIrtt3s4292i2bgsrs2PtSNhAVvmKsVwtb4X4107Flbv6A
	 OfVzaKO51KNDkGoFeVWtzO2r+uLdP1IAFcArkiKg=

> On Thu, Nov 19, 2026 at 04:41:04PM -0800, Dave Hansen wrote:
> > On 11/19/26 16:36, Jinke Han wrote:
> >> Since there is no reported failure, I'm fine with dropping the Fixes:
> >> tag if you'd prefer to treat this as a cleanup. I can also post a
> >> separate change that makes the check use the actual optimized length
> >> instead of the open-coded DISP32_SIZE, if you think that's the better
> >> direction, and add a regression case under
> >> tools/testing/selftests/kprobes.
> > 
> > The Fixes: is fine, but it would be nice to have a better changelog
> > about what's going on.
> > 
> > Not voluminous, just better, please.

I'll send a v2 to improve the changelog.

Thanks,
Jinke Han
