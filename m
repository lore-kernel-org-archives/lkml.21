Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998487;
	b=ptk5DOXaV9os/fkZpJAMfaY1DuNfim7rc+u/4SF8sQHZ+FQ35BiPxPmvzJapAS0wQi0V
	 wYTVmHXYoQp80KC/mG3cD5RNMduza+Ae+LxA8JMvsKgj4GJJ2TqD7H2oTg8SHLXBT2GB4
	 2Mr7WW2b21uDzKzZ/MSKa2Jbqx6vX/OS7eJx7ocJN8rwmOxt3A7IKdriJyhBhlgiVbO3n
	 UaaR4A+kWBeu/BivaIZPUJGtnrI13ODooMQztJUOnVHnYtQd/7ya69dWKnB8n61OpZ7nK
	 WEmBefUNCNwyTLT8RaM+BG6X0nqdTFI3jv5I8bbeCYikavw0Mn+Df0M97CM4D7L9P0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=;
	b=eOdsww2c7EwFAC5AlnUAWJPUzCnp8xHAnhyQe3Fs/bZq9NShWMJY2G1bwEOz1mB7qn6M
	 hsZkXRso21ydq7B1lVoAKEpR0bajXptUKN+VY9KFHyBm3Dcn21rpd0Wab9+0Vvjn3c8k4
	 zF/TqVKOTwbsES/jqSHSq3lcEPLqrPvXKsTGTpZ0V5Hxy29RQT3+U30MfPgB4FDTVQ2Wq
	 ZuqyqgnHpvOdAtzxg19cMPyshTHBweHIwGdxKKoxqQCTTjYsyvolscaU2OFoKIfp1rMuH
	 rvE2j16v7uhi5kLw2M+n6xcMM11kIOQzjjoLmmF/iZOylDspQ4C4kF9Gz6bRnxmt7EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Xf8uSlRa;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E36A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Xf8uSlRa
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490f38e9688so472725f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794998486; x=1795603286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=;
        b=Xf8uSlRaFQFlv8Dor+hj1kyAeXZ7Uj9fUvn5XkvhtJfgVAt1Cxtk7BpWqbFG+FZjwH
         papRatzgHCPos8zf98m28UNHdmB505l1ujouSNA7jcboyn5y9hTOWb55rrcXx5aUOk/r
         vrxXaQOMWB76UfYenBZNUZ6TRiOru4IswmGBUsaCV/ib9lIlE+FhkoJ6CKKtI2wOQIDe
         CWaBRE3j05GcWG5rPUciQ5q8o268dsNAEAI5fFAo4d0R4SPfupSw2rKcMNodhH7K2IFY
         S4eNixs5ywstT5kbYsC/hXx2GqVMc5LYNJXRcn4bidTrp0n2JeDLpn1f6En0+xWdFHm/
         tt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998486; x=1795603286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DddB4BOu0Fwu4SIijc7HO6ywtYEmx0fPwUuOrXpjQw=;
        b=0NCoc50SPp4+ztSTlcjGVB7sFVoY0ZzChvP8N4oLx6v7iWomUyc54fDtl1m1eOgJXb
         noNT/1HEXNvvI7QhSmm59FDXi2/h2YWzBwAU/gPvcEPp1sZyS5iTaf00ljB5Ci1kp0j4
         hx1mqKnoYY9mBfBOaDq4By09bEr6fOmcqdvF0kBU/PbzpFaVIfwF/TfiiKxwLLOLQXlg
         Q5oWa9C+T+cFVlkk0OO2CYQRg70ODY0m1MT8ntjhD6kO5+ecjuklKGdbmRKKik6ogPfC
         aHJOBp8Hhs0hcBAhuOYB+f/D6ymCMm32cPMZqbiXGW2X0BETj3PQnIFcxsos+cP1Vz7U
         he+w==
X-Forwarded-Encrypted: i=1; AL+hErEeJ1mYw3xm2yoBJ+nb/MQgQfIlfrmA3FVgtX47vT+eK5o9XCBu8vq+Xh5O9/XhmSyuOVmW8hx98E7KHKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j+89CEIcsHvLcVB0hrV2WzVtIy9vv9utacrGDC2How1x0W5mc
	s98yVD236YjNiFGM7QGx4Iz2GiFqCAwlYKLDmyZuJtCbJP2HWVYN6p93QWIOV6+piA8=
X-Gm-Gg: AZFdTZfRa12kdkQ3XamxjpXrAn4uxpiwCv2trjCNCYGbtyfZvkbLRw2xcrJzrK0Wqxu
	jR/hNei1fe7JMxc0Q8dXdXr2g7D74mpIBJegU/QU9LMAR65bYm6WJYhEV/SuLGpmEoFY9OE6yVp
	gopCAj1m9KhZ4Hf1ft6xP3QU/66H4PQQl4TwDXYQA8GLoEm+DL7CCPky+LnPHSOmGYHTs3pmZOO
	OkfZy7xF/eQxyv07O4eWTz4sG4ukIZgs6y6eBtWNYTtj542O73r+aE0vmnQvI4k7Rc1LU9Av7fe
	9QfDLaE7ebbP7Ct3VZpCkWXjvUp/T1CkMwjH3Dxy8cz5O+yqI5+9BhniMyFI4ktofCTpPe0Zt3R
	CfOtdkMZh+zifKF/vgoCQc+V32xatkfYt5j3XjjhTOc1wuCOZp0UsBGCeGEBugJPFybDYrGJ7Z3
	cJKN0pNuSEw+Avs3AxOWvoscHbp/bIBQUPS08UFkiOVVHfd/TM+lzO5NfIjuh82cuWf91Y01stj
	9a5M6ZvJxD53fn+/vA2hCikVAQfjb0SQVF1st8gZBx1IQwGCcwbzmJtJLCrDJ5eqE3LwRSOpREG
	izd8VGQ/97c5+DROPn280YrnL8D54c2BIHM5vHjH
X-Received: by 2002:a05:6000:2489:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4a62d6d71ebmr4953529f8f.0.1794998485425;
        Wed, 18 Nov 2026 02:41:25 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baa9fsm4323892f8f.57.2026.11.18.02.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:24 -0800 (PST)
Date: Wed, 18 Nov 2026 13:41:20 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix NULL dereference in
 kvm_inject_nested()
Message-ID: <av2A0FxSab9P3eMW@stanley.mountain>
References: <avsH0lxpLIF2Ug64@stanley.mountain>
 <86h5hg1wak.wl-maz@kernel.org>
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
In-Reply-To: <86h5hg1wak.wl-maz@kernel.org>

On Mon, Nov 16, 2026 at 06:11:15PM +0000, Marc Zyngier wrote:
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 5959bbbfa026f..21cd872ea394b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2007,7 +2007,7 @@ static int kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
>  static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>  				   struct kvm_vcpu_events *events)
>  {
> -	int i;
> +	int i, ret;
>  
>  	/* check whether the reserved field is zero */
>  	for (i = 0; i < ARRAY_SIZE(events->reserved); i++)
> @@ -2019,7 +2019,11 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>  		if (events->exception.pad[i])
>  			return -EINVAL;
>  
> -	return __kvm_arm_vcpu_set_events(vcpu, events);
> +	vcpu_load(vcpu);
> +	ret = __kvm_arm_vcpu_set_events(vcpu, events);
> +	vcpu_put(vcpu);
> +
> +	return ret;
>  }
>  
>  /*
> 
> and be done with it, avoiding the fast-path bloating altogether.
> Unless you can spot another path where the vcpu is not loaded, but
> still requires the injection of an exception?

I feel like this approach brings arm64 slightly more in line with
x86 so I like it.  I'll send that.

I'm still redoing the TCR2 changes so I won't send those today.

regards,
dan carpenter

