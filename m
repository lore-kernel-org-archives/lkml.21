Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790808;
	b=m78H35uK/bolVAjI4VMKH24RYk+nVgOil1ZPltc6YhLnXue+93qZYXPSA0EIlxOp6YQn
	 LGFygwlkkso7Dii1KkASL1bInjnk2InMpF3t6wZUoafZgkrv6a6QG0K/IpBzshhF1BGF6
	 14Hs22GRYOjLRAlnjkYQRgZc1UFx0jUA/y9v6HPFjH0kA6zdc5DNhqHThAI/LstnSWemL
	 0SROs7e8VAEcOrosXyNerjKwTW+vS3ncAIXBw9fHXPUVL6aH7qTCZV+aNj9EjBgOj5M34
	 rYWLifiyEBIsfWL3rQzLLVgI4AOv326AbH3FNbDTFwaF10eMxwaXkKUONmdi85q7D6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790808;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vpOeS1zLysQBqy4y0tcCfJ4mFvl/Hm26T1odAFXU41I=;
	b=SkCxQ202zeguPTQaCg+Xlig7dJD2lXCd3AQthBGMXP0RQyTb9+mVazfQb9ezelCyo9c6
	 xyztG8AsXDCOFE8OgwXas99N3InllV6lh06Fuugdgb5gH66RuI2NCW9wrIG++CED8OP81
	 IFWOVcTJ9Y6tKB84NU9ppGfwUG2uj7BqWabktZUlv/AiLHE5R43bGtl/sNAbmOELcPi0H
	 xU4r5KekQ82HfyJ+R3U9DeAXVbtJmabDew0NnuaywMvwl+B7Pmvj01AbTorZb6rpuRGHg
	 DfAv8/mLvcApp2iMN4yGWZxJryKjALPunowipawR3h9K34GWcbNYMABs/tYXQoBeubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="tKvkIX/q";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07750606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07750606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tKvkIX/q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vpOeS1zLysQBqy4y0tcCfJ4mFvl/Hm26T1odAFXU41I=; b=tKvkIX/qsR5EQqZ3xxnvhOkD+k
	/nkpp39lr0Wjt9OKV2nxffpt6gNnSxZU4YS8fyCXgBLDIRwfn4RhdrkMoFQBfdQqpcnBcbT1R88vT
	CbNyxDFx/SffB5N+cjbshjruiXTHCI8ux9FOn50wFXzHX/93uA15JxE4BC2InTABEiOc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWxDm-001oS0-Dn; Fri, 27 Nov 2026 15:46:42 +0100
Date: Fri, 27 Nov 2026 15:46:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: zhaofeng2@cmss.chinamobile.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: dove: fix OF node leak in dove_init_pmu()
Message-ID: <0c93419e-11d4-473a-a01b-689e7c33ab3e@lunn.ch>
References: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>
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
In-Reply-To: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>

> @@ -451,5 +454,7 @@
>  			pr_err("dove_init_pmu_irq() failed: %d\n", ret);
>  	}
>  
> -	return 0;
> -}
> +	of_node_put(domains_node);
> +
> +	return 0;
> +}

The logic of the change looks O.K. But this hunk looks odd. I would
expect it to be:

+
+	of_node_put(domains_node);
+
 	return 0;
 }

i.e. insert the put. Why did it replace the return 0;. Is there a
space/tab issue here?

	  Andrew
