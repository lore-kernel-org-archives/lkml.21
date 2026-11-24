Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522399;
	b=0akKm/DBs3Cr1YssGIe1jh3OCbIQgEaixy76bRH7Y9638c4O3T4DSDkQKWTpqobKGitA
	 8FxI41ZmmvNZUJn/UtPXBMtSkltCnVPj5/EovYnOlC3hpwTKctnxEKyZazrbyNeamLjra
	 76F0hDPLpsDD7tpaPjmNmy7xEV2WzDslcgwYdqQsLxB3Z4MX9fL4z7aqgYmRUejwcywPY
	 nZunD85r/EzkAlAsUYq5r/9ds4ioqDi7DTokOI2XitvUlJYAL1AcSQUhstwnMIhT0Ni1F
	 gV95T3LMG10X0hqT+giHXVBePtWFqBPfhYLVob4adBrorfnnKkkCbOQNV9pwaHwVqkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
	b=pewPWGAh0qnXASrzlv5OhRCsCqCSsSdg3L7C0ViQZi7HuLSvT5OCPJXGYSAEBkU16ghM
	 UeedE8J2aUMzOxEHezUCdhyC+NW/D/lwf5DjD+0Se0qVURrvYs14e8u8dJE/8lU//b5sC
	 e7Vs6nHcambeGx/9ZynbUB6rEfeBrT/quon1j4fj/z673cvABiU2di3aq5IYsnYTLbPsg
	 SjQVI9T5Z8f6JWdj/lEb4IjFg+7rMlMmaG2h1LohPquorGDHA8vL3OTfKaCuv3CKea7n+
	 5NayYVGc3SaSoB2COqqa7jj5KFme+0ntJjMwOZIvhfHDmutPn0vcHQy++v9glk0a+gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b="viTi3/8K";
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC906606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC906606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=viTi3/8K
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso3736443e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795522396; x=1796127196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=viTi3/8KeIE8uhX56JlXlP6/VB/uifLp1YNde/hFxWBVL09rfHt1AgzNSQ1xTLYKYW
         TxNBy5Mj7sV0GRKJ160Si2rkUSAgJn33iwqUin2swB01y6Ut9G2oo/NtD6GwmuBWsdGK
         pBscQJ//hVMyPypXQMgFo5oJH1vUFdJ5blh4dTSbHXAdAibs/3F+XbUA3jS5gh2JSVOJ
         LN2T2nENIFcXoTm0K25ZjYzgf6wvRTivXcZG6y1mBdXRA/xDPzAu9oc8mACnMdnRVp8I
         5SJUX/xIX1KhwdTHpI3kikeVNii6iesD7pV4JscgeRxDpEqmN+UfwGtYVMRPotk3OsIE
         2nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522396; x=1796127196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0NcUv7mJCJjaicOw4k1YXtQeAzhuGY2ockZsxXegU=;
        b=Fb5LF3Eml1KhAeHynBzEDu263djSLdXk+mUCql3SpQ5GZXePRohLVigb/po5PAk6fO
         8DB3s01qgr2cGEQc3R005T0/1HM4mr+VwDpm7vggyEpxkZrZ5ntrLdlemtrn16FKCK98
         k332+bQHNhUkjJbdFm03az4t+hT20mxmY6l80hkTPtTZO4vrmm/VtYC5SYQRNxSmell4
         PBxjGh5IPzB8IAn9knP6GxEq203NHUjMAnthmI2kGz3eG3RdIAAZLv4N/QIQPAw4c+ju
         caDxPItPZ5i9K4/7nN6Tn+3yM/pjgt6Cqpv8tqsykNvnx2FOt4OSMr6vsTIczcNHC/Xh
         V/XA==
X-Forwarded-Encrypted: i=1; AL+hErG1lyowET4QbW+LpD5fO6naYMfpfoIW7oclrgyLYxx6NLHJIZJx6fj/Y+dUxEgeabvo4BDgp4RV22NpPUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CnSZqjCP82041rtDGO17+MKG1RraKsjKQmazwkH8w93Fl5CgB
	ofVEWE5Rhnzj/0a1KFeaaqHkU1t6knORg8azf80gRG3BzGNR5gclZbRp+o5rspz1JD74gCmmywt
	kaOYm
X-Gm-Gg: AZFdTZf8/IfX3kNNI7JU7l0bnq3BSWcEM1srafqoAzAZzbh2GDMMof94A6lIZgrPEkU
	s5zRICY5JU+T8fJWlx/Ln18TPDctlqUEwHp4K7pNmE/qITCW+fuAZ8PlWXtBzqanqnTt8or7NTL
	S/jXiOWjABxAmwOZ1+C7xq8W5ol1f0yoi2m9Te4gfO8JeojncDgqm3LJtJhMoqBix7UKCNbdNTi
	vpGuvLjk3H47bOrFu1cZ1NZNw4lJQksBo543NT1I1uf2y27Tv94Y8kAZSL0rWjZ0DdL3APT5RW+
	7q/4BLY6N2iKgFoEqy3C48E8jZIFfloVjMB8HiM1ScqfDP7m1GLoJmHu4+p2dB8e/cdSZbi8Bqf
	2QsdPw3THXfjny8+9+ovu4PmI4EYF/E1EDc9FyD1yyLDHyMO9ShKIsXK7tQg2BCv92SHhHCAOMa
	VvPLM+gNFB8fevEv3funANiHnu9EbT0vb65+40jsldvTi+ZcsFzIxRNutePr948RuNiGxu8wxwL
	aPa8e+ViNNsZ0Ni5RICxt5UelkCbKp1PDuJk5TJSq9PYcqEuNurnahQhJBaWzFvN3oXiH50btjl
	4FpPFhwzPo3IEBG3Mc8+nWZC/qYIlLzU/fJIqw==
X-Received: by 2002:a05:6512:23a9:b0:5c1:6065:40d with SMTP id 2adb3069b0e04-5c1bc867b6dmr3406850e87.38.1795522395833;
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01c018sm3681005e87.44.2026.11.24.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Date: Tue, 24 Nov 2026 13:13:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, zohar@linux.ibm.com, 
	aneesh.kumar@kernel.org, dave.jiang@intel.com, nik.borisov@suse.com, 
	sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <awV_P5443pO4yJa5@FV6GYCPJ69>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
 <20261123151128.GD179082@ziepe.ca>
 <awRYr7yB8IWj7S3G@kernel.org>
 <awRan8ZELzpTwduV@kernel.org>
 <20261123154042.GI179082@ziepe.ca>
 <awRe-A_KeE_kXyPq@kernel.org>
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
In-Reply-To: <awRe-A_KeE_kXyPq@kernel.org>

Mon, Nov 23, 2026 at 04:42:48PM +0100, jarkko@kernel.org wrote:
>On Mon, Nov 23, 2026 at 11:40:42AM -0400, Jason Gunthorpe wrote:
>> On Mon, Nov 23, 2026 at 05:24:15PM +0200, Jarkko Sakkinen wrote:
>> > > > > As per the function, perhaps tpm2_calc_event_log_size() should be
>> > > > > relocated to lib and have non-TPM name like firmware_event_log_size()
>> > > > > or something.
>> > > > 
>> > > > Probably under drivers/attestation since that is where all the TCG
>> > > > formatted logs should end up. It should be 'tcg_event_log_size()' or
>> > > > something. Maybe a tiny module for it like we would have done in lib/
>> > > 
>> > > +1 for the name, as it is obviously more accurate prefix.
>> > 
>> > Location, I don't know. I was thinking something like "lib/tcg.c" with
>> > routines that are plain calculations based on TCG/TPM data.
>> 
>> I think we should not have new users outside attestation subsystem,
>> but the legacy onces will still exist obviously..
>> 
>> IDK either, but this is my guess..
>
>No strong opinions on this; just unpurging my thoughts.

Okay, will put have this in a helper lib.


>
>> 
>> > And perhaps for tpm_buf (both stack/heap allocatable), if Trenchboot
>> > ever moves forward.
>> 
>> DRTM users will route through attestation subsystem to do their
>> extends so the tpm_buf user would be the TPM driver inside
>> attestation. We definitely need this for ROT agility.
>> 
>> We should be able to build the attestation TPM driver without any
>> trenchboot stuff to motivate it.
>
>OK, this was my guess but did not know it by fact.
>
>> 
>> Jason
>
>
>Br, Jarkko
