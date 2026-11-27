Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804610;
	b=KPrQWhtvPFryiJONzRS30H1hfFU8vBjgQwkuN0wpEbbI/OCFF8LqxOuJWnu5kntvBCjz
	 i3TNg/UlKsCffgLCEIAemZA5GhpuRJYIvr5E4ts0HJ8RNL31j+zo3jpwefesNvK8djPmF
	 DILclLrBy+r65bGsTn4ZOSwQgybORFs63sbPhAzSHMumXD1FZ3hmNsrpxh3yFZttROZWd
	 R4I1vMphgmFlMZu4bJNG/YtCKoVeoDLuS1GK2ZuFt4g/isx4R+zrnL3+zwLV26ic9/DrF
	 Sz2jdhTwfjohfoDa+BXHKAjlVmc9cD6Jl06vedvCEkC3P+mo9spadppnLEYAd+9AsPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
	b=Kv253p4oVwvB63zzS/DK0yMMeNuEkfwjpcfbfsPVr9hQrc4R3/cPGZLAk+322GoeaK37
	 h/x3ACFQGhrtpFAP3oaSmOzspUWYWO9+W98RnUDVc0GJ6yKpZHwnEgK8/y8dqjuGvG+9O
	 WjGy+EM4YUY5MeV3QnKitLSN+WIjWl/hqz1VON+R1gJmFe5lI9wNmf0B4Ksye8JvGgJKo
	 tRxsJlfwcWqYE69nvDegpT5QClPdNoPXqntOQuFlF15Z3LOO7HQarKDh+6jKWJQ3bBW30
	 y3fXbajPWg3NLLRjBNjFz84GffwyevB4jQq/1tSoW0HbHi3GKQjvBZay1/L4+UJQCjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FQqDBy6J;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868BF606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868BF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FQqDBy6J
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c1f548f87so109316796d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804609; x=1796409409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=FQqDBy6Js8XrvXmyD8SL/u+yExsfiOIjX+3Qv8PFjqWbEOS/J/sDfstl24lcNicd6M
         PkL4KLFLOjm+xuNYdQwqUcHAIrXcJ//DNqWVnzEugXxJV52uk6eRNVvaVxXJbY5Bl7ou
         7rubMrQs8EdQfsO5xRzjEsGHJQpkeR1g0nRGIcWUrMhQ+w2TgK1gza7wJaMgYVAeHUVG
         ges3+956+qMurZGsh19qeYrM1aQmOnZrNaBhNPYHVU0VuU1IhVr1vVlTiL1tqNFxWPhg
         YdOIvlBcF3YHxrQhupM7z96IFAXcMGRFNkKk+1lOeoAkMMQd+mWGr1YNQMt75thCP0QE
         XNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804609; x=1796409409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9Dw/wen6g6fWY32jCYKXg0uC2F+6Oaru/Dn4CTkyZM=;
        b=IiOCZt49/LpQVA6/6MCB+e0usT6mnAjZi6E2vSTLXKexYqFFWrEArjJMeBL0poyDwv
         vT0WkHZPXWUicQTF0FVwhBrPPVJOPQ3Gp1ZriV+AYY4lXVolRqQRbHCdEFJ40VYWPI30
         xJgLKEHG3h0j3esZs/66JfwXW2CzkAtkP2GHJUrfIScL8NpIEkYO8dh8RZ6BQazFts/W
         ttiAEqayrMPbcFOBQL2GGdf56A4aFONRtuJu8VKwK3k41Aic8FIXQZ0CQc3o6H8sZUpB
         WoueJ1KOwDRuZu324SpAbH9VC+3v3Zs7dswgsYNIfX8g9vUgvxElrYvLa37ux/jacwkB
         FSrw==
X-Forwarded-Encrypted: i=1; AL+hErFuOqypyb23rM4wlt70/+j756JYtIOae+gi644zryMae7PEhgwIr+e3es63Hi6P8q3okd/+dahoUKX9M3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lYV2PwNvkPxCptRi/ZZ35UmGchi0JK9QVb//WmFOppFKH5gqj
	5dHPlHVRO98XVsaOkPneZFYl35SG6qvn5wvpZlWO7o92y5kYsTgSFbhiyR6Hk+cESdU=
X-Gm-Gg: AZFdTZeUOK73LKjjjH22UDhtLH5nJwV+04tetAkJN6NTPzfWe8QOCXnhY+G90OyFa/O
	X4icpfPGBuivx0n1Jz4b5CrHu1FbO2Xk0+vAXAowDXATZVTmlPHwLJx+kiXVILa0nPpX44uSuje
	rKqR/k+msJAIxGERzlB8wJ/et/W1TEcqTK+So03ZbDx48PyFLFNg0PVGO0JNKSm/fLjY4x7xeh8
	CXFSEoHQ1a/NlSCYlOObigqZVPLq6R26wLARqwTsgGXVK3aLN0ijBTh29qkh0QfcvlarBURPuOQ
	i1vsFsDKyYoW8wxYllHrUlLc4LQpt+EVtSs5OKOznLm7newiYr4KBMX4Rbj77kvnr4sPhBjoswR
	XZsb+K0jUCkgOiHshaf6CnogRLucb271HikFP3gJz+1ZS8Z7we81N7b1rGrjwZX1uxI4PjNcXI4
	RENQ0fr9Z0ENXtzqqBLJCNJf+R2wjGgwHEluBgNsztOYeA7AoPR7fC4zaHRxIBPuBXNM9lcGCPH
	+oznJ227UxWUQfpFFD2Q002yWlSipLB+N91bTWQFhXoc9hAJA3XChpchSrxIj4YilzM51naeEaT
	H0Nmr3U=
X-Received: by 2002:a05:6214:4686:b0:921:1ac1:34e2 with SMTP id 6a1803df08f44-921653a9042mr254285806d6.24.1795804609400;
        Fri, 27 Nov 2026 10:36:49 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm225559716d6.15.2026.11.27.10.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:36:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0oS-00000007aS6-1aU4;
	Fri, 27 Nov 2026 14:36:48 -0400
Date: Fri, 27 Nov 2026 14:36:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127183648.GW246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnLgFZIhRZENiE4@e129823.arm.com>
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
In-Reply-To: <awnLgFZIhRZENiE4@e129823.arm.com>

On Fri, Nov 27, 2026 at 06:27:12PM +0000, Yeoreum Yun wrote:
> [...]
> > 
> > > +static enum hash_algo cca_guest_attestation_algorithms[] = {
> > > +	HASH_ALGO_SHA512,
> > > +};
> > 
> > static const
> 
> No. it's a scaling issue since the attestion algorithms could be not
> only SHA512 but also SHA256 and SHA384....

Then don't init it here and do it entirely when you query the RSI to
learn the right value

Jason
